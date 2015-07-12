// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Timed Text subtitle format reading functionality
unit FRead_TIMEDTEXT;

interface

uses
  System.SysUtils, USubtitleFile, OXMLSax, OTextReadWrite, Vcl.Dialogs;

type
  TXMLState = (xsNone, xsSubtitleHeader, xsSubtitleText);
  TXMLStates = set of TXMLState;

  TTimedTextSubtitle = class
    FTag: String;
    FInitialTime: Integer;
    FFinalTime: Integer;
    FState: TXMLStates;
    FSubtitles: TSubtitles;
    FExtraTime: Integer;
    function GetTimeValue(const ID: String): Integer;
    procedure StartElement(Sender: TSAXParser; const aName: String; const aAttributes: TSAXAttributes);
    procedure EndElement(aSaxParser: TSAXParser; const aName: String);
    procedure ProcessCharacters(aSaxParser: TSAXParser; const aText: String);
  public
    constructor Create;
    destructor Destroy; override;
    function Parse(SubtitleFile: TSubtitleFile; ExtraTime: Integer): Boolean;
    property Subtitles: TSubtitles read FSubtitles;
  end;

function FileToSubtitles_TIMEDTEXT(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;

implementation

uses
  USubtitlesFunctions, USubtitlesRead;

function FileToSubtitles_TIMEDTEXT(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
var
  TimedTextSubtitle: TTimedTextSubtitle;
  I: Integer;
begin
  Result := False;

  TimedTextSubtitle := TTimedTextSubtitle.Create;
  try
      TimedTextSubtitle.Parse(tmpSubFile, ExtraTime);
  finally
    if TimedTextSubtitle.Subtitles.Count > 0 then
    begin
      for I := 0 to TimedTextSubtitle.Subtitles.Count - 1  do
        Subtitles.Add(TimedTextSubtitle.Subtitles[i].InitialTime, TimedTextSubtitle.Subtitles[i].FinalTime, TimedTextSubtitle.Subtitles[i].Text);

      Result := True;
    end;

    TimedTextSubtitle.Free;
  end;

end;

{ TTimedTextSubtitle }

constructor TTimedTextSubtitle.Create;
begin
  inherited;
  FSubtitles := TSubtitles.Create;
end;

destructor TTimedTextSubtitle.Destroy;
begin
  FSubtitles.Free;
  inherited;
end;

procedure TTimedTextSubtitle.EndElement(aSaxParser: TSAXParser;
  const aName: String);
begin
  FTag := aName.ToLower;

  if FTag = 'p' then
    Exclude(FState, xsSubtitleText)
  else
    if FTag = 'div' then
      Exclude(FState, xsSubtitleHeader)
    else if FTag = 'body' then
      ;
end;

function TTimedTextSubtitle.GetTimeValue(const ID: String): Integer;
var
  FSettings: TFormatSettings;
begin
  try
    FSettings.DecimalSeparator := '.';
    Result := Trunc(StrToFloat(Copy(ID, 1, Length(ID)-1), FSettings) * 1000);
  except
    Result := 0;
  end;
end;

function TTimedTextSubtitle.Parse(SubtitleFile: TSubtitleFile; ExtraTime: Integer): Boolean;
var
  XmlParser: TSAXParser;
begin
  FExtraTime := ExtraTime;
  FSubtitles.Clear;

  XmlParser := TSAXParser.Create;
  XmlParser.ReaderSettings.ErrorHandling := ehRaise;
  XmlParser.OnStartElement := StartElement;
  XmlParser.OnEndElement := EndElement;
  XmlParser.OnCharacters := ProcessCharacters;
  try
    XmlParser.ParseXML(SubtitleFile.Text);
  finally
    XmlParser.Free;
  end;

end;

procedure TTimedTextSubtitle.ProcessCharacters(aSaxParser: TSAXParser;
  const aText: String);
var
  S: String;
begin
  if (xsSubtitleText in FState) then
  begin
    S := ReplaceString(aText, #17, #13#10); //'|' replaced with #17 by adenry 2013.04.13
    //moved in here by adenry: 2013.04.13
    if (FInitialTime > -1) and (FFinalTime > -1) then
    begin
      if (MaxDuration > 0) and ((FFinalTime + FExtraTime) > MaxDuration) Then
                            Subtitles.Add(FInitialTime + FExtraTime, FInitialTime + FExtraTime + MaxDuration, S)
                          else
                            Subtitles.Add(FInitialTime + FExtraTime, FFinalTime + FExtraTime, S);
                        end;
                        FInitialTime := -1; //added by adenry 2013.04.13
                        FFinalTime   := -1; //added by adenry 2013.04.13
                      end;
end;

procedure TTimedTextSubtitle.StartElement(Sender: TSAXParser; const aName: String;
  const aAttributes: TSAXAttributes);
begin
  FTag := aName.ToLower;
  if FTag = 'div' then
    Include(FState, xsSubtitleHeader)
  else
    if FTag = 'p' then //added by adenry 2013.04.13
      if (xsSubtitleHeader in FState) then //added by adenry 2013.04.13
      begin
        //Include(State, xsSubtitleHeader); //removed by adenry 2013.04.13
        FInitialTime := GetTimeValue(aAttributes.Get('begin'));
        FFinalTime   := GetTimeValue(aAttributes.Get('end'));
        Include(FState, xsSubtitleText); //added by adenry 2013.04.13
      end;
end;

end.
