// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Cavena subtitle format saving functionality

// by Bedazzle 2007.05.13 start
unit FSave_CAVENA;

interface

uses
  SysUtils, USubtitleFile;

function SubtitlesToFile_CAVENA(Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1): Boolean;

implementation

uses
  USubtitlesSave, USubtitlesFunctions;

function SubtitlesToFile_CAVENA(Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1): Boolean;
var
  tmpSubFile : TSubtitleFile;
  i, Count   : Integer;
  z: String;

  InitialMSecs, FinalMSecs: String;
  Hour, Min, Sec, MSec, Fram : Integer;
begin
  Count  := 1;
  Result := True;
  tmpSubFile := TSubtitleFile.Create;
  try
    for i := From to UpTo do
    begin
      Hour := Trunc(Subtitles[i].InitialTime / 3600000);
      Min  := Trunc((Subtitles[i].InitialTime-(Hour*3600000)) / 60000);
      Sec  := Trunc((Subtitles[i].InitialTime-(Hour*3600000)-(Min*60000)) / 1000);
      MSec := Trunc((Subtitles[i].InitialTime-(Hour*3600000)-(Min*60000)-(Sec*1000)));
      InitialMSecs := Copy(Format('%.3d', [MSec]), 1, 2);

      Hour := Trunc(Subtitles[i].FinalTime / 3600000);
      Min  := Trunc((Subtitles[i].FinalTime-(Hour*3600000)) / 60000);
      Sec  := Trunc((Subtitles[i].FinalTime-(Hour*3600000)-(Min*60000)) / 1000);
      MSec := Trunc((Subtitles[i].FinalTime-(Hour*3600000)-(Min*60000)-(Sec*1000)));
      FinalMSecs := Copy(Format('%.3d', [MSec]), 1, 2);


      z := IntToStr(Count);
      z := copy('     ', 1, 5-length(z)) + z;
      tmpSubFile.Add(z + '       ' + TimeToString(Subtitles[i].InitialTime, 'hh:mm:ss:') + InitialMSecs +'   ' + TimeToString(Subtitles[i].FinalTime, 'hh:mm:ss:') + FinalMSecs, False);

      tmpSubFile.Add(RemoveSWTags(Subtitles[i].Text,True,True,True,True), False); //RemoveSWTags added by adenry 2013.04.12
      tmpSubFile.Add('', False);
      Inc(Count);
    end;

    try
      tmpSubFile.SaveToFile(FileName);
    except
      Result := False;
    end;
  finally
    tmpSubFile.Free;
  end;
end;
// by Bedazzle 2007.05.13 end
end.
