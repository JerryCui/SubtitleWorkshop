// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Core classes

unit USubtitleFile;

// -----------------------------------------------------------------------------

interface

uses
  SysUtils, Classes, IOUtils, Vcl.Dialogs;

const
  MaxListSize = MaxInt Div 16;

type

  { TSubtitleFile }

  TSubtitleFile = class
  private
    FList: TStringList;
    function Get(Index: Integer): String;
    procedure Put(Index: Integer; const S: String);
    procedure SetCapacity(NewCapacity: Integer);
    procedure Grow;
    function GetTextStr: String;
    procedure SetTextStr(const Value: String);
    function GetCapacity: Integer;
    function GetCount: Integer;
  public
    constructor Create(FileName: String = ''; Trim: Boolean = True);
    destructor Destroy; override;
    procedure LoadFromFile(FileName: String; Trim: Boolean = True);
    // procedure SaveToFile(FileName: String);
    procedure SaveToFile(FileName: String; LineBreaks: TTextLineBreakStyle = tlbsCRLF);
    function Add(const S: String; Trim: Boolean = True): Integer;
    procedure Insert(Index: Integer; const S: String; Trim: Boolean = True);
    procedure Move(CurIndex, NewIndex: Integer);
    procedure Delete(Index: Integer);
    procedure Clear;
    property Capacity: Integer read GetCapacity write SetCapacity;
    property Count: Integer read GetCount;
    property Strings[Index: Integer]: String read Get write Put; default;
    property Text: String read GetTextStr write SetTextStr;
  end;

  { TSubtitles }

  TSubtitleItem = record
    Text: {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
    InitialTime, FinalTime: Integer;
  end;

  PSubtitleItemList = ^TSubtitleItemList;
  TSubtitleItemList = array[0..MaxListSize] of TSubtitleItem;

  TSubtitles = class
  private
    FList: PSubtitleItemList;
    FCount: Integer;
    FFormat: ShortInt;
    FCapacity: Integer;
    procedure SetFormat(Format: ShortInt);
    function GetItem(Index: Integer): TSubtitleItem;
    procedure PutItem(Index: Integer; const Item: TSubtitleItem);
    function GetText(Index: Integer): {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
    procedure PutText(Index: Integer; const S: {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF});
    function GetInitialTime(Index: Integer): Integer;
    procedure PutInitialTime(Index: Integer; const Time: Integer);
    function GetFinalTime(Index: Integer): Integer;
    procedure PutFinalTime(Index: Integer; const Time: Integer);
    procedure SetCapacity(NewCapacity: Integer);
    procedure Grow;
  public
    constructor Create;
    destructor Destroy; override;
    function Add(const StartTime, EndTime: Integer; const Caption: {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF}; CheckSub: Boolean = True): Integer; overload;
    function Add(const Item: TSubtitleItem; CheckSub: Boolean = True): Integer; overload;
    procedure Insert(Index: Integer; const StartTime, EndTime: Integer; const Caption: {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF}; CheckSub: Boolean = True); overload;
    procedure Insert(Index: Integer; const Item: TSubtitleItem; CheckSub: Boolean = True); overload;
    procedure Move(CurIndex, NewIndex: Integer);
    procedure Delete(Index: Integer);
    procedure Clear;
    property Count: Integer read FCount;
    property Capacity: Integer read FCapacity write SetCapacity;
    property Format: ShortInt read FFormat write SetFormat;
    property Items[Index: Integer]: TSubtitleItem read GetItem write PutItem; default;
    property Text[Index: Integer]: {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF} read GetText write PutText;
    property InitialTime[Index: Integer]: Integer read GetInitialTime write PutInitialTime;
    property FinalTime[Index: Integer]: Integer read GetFinalTime write PutFinalTime;
  end;

// -----------------------------------------------------------------------------

implementation

// -----------------------------------------------------------------------------

{ TSubtitleFile }

// -----------------------------------------------------------------------------

constructor TSubtitleFile.Create(FileName: String = ''; Trim: Boolean = True);
begin
  FList := TStringList.Create;

  If FileName <> '' Then
    LoadFromFile(FileName, Trim);
end;

// -----------------------------------------------------------------------------

destructor TSubtitleFile.Destroy;
begin
  FList.Free;

  inherited Destroy;
end;

// -----------------------------------------------------------------------------

procedure TSubtitleFile.LoadFromFile(FileName: String; Trim: Boolean = True);
begin
  Clear;

  if TPath.GetExtension(FileName).ToLower = '.xml' then
    FList.LoadFromFile(FileName, TEncoding.UTF8)
  else
    FList.LoadFromFile(FileName);
end;

// -----------------------------------------------------------------------------

procedure TSubtitleFile.SaveToFile(FileName: String; LineBreaks: TTextLineBreakStyle = tlbsCRLF);
begin
  If FList.Count = 0 Then Exit;

  FList.SaveToFile(FileName);
end;

// -----------------------------------------------------------------------------

function TSubtitleFile.Get(Index: Integer): String;
begin
  If (Index >= 0) or (Index < FList.Count) Then
    Result := FList[Index];
end;

function TSubtitleFile.GetCapacity: Integer;
begin
  Result := FList.Capacity;
end;

function TSubtitleFile.GetCount: Integer;
begin
  Result := FList.Count;
end;

// -----------------------------------------------------------------------------

procedure TSubtitleFile.Put(Index: Integer; const S: String);
begin
  If (Index >= 0) Or (Index < FList.Count) Then
    FList[Index] := S;
end;

// -----------------------------------------------------------------------------

function TSubtitleFile.Add(const S: String; Trim: Boolean = True): Integer;
begin
  Result := FList.Count;
  Insert(Result, S, Trim);
end;

// -----------------------------------------------------------------------------

procedure TSubtitleFile.Insert(Index: Integer; const S: String; Trim: Boolean = True);
var
  FLine: String;
begin
  If Trim = True Then
  Begin
    FLine := SysUtils.Trim(S);
    If FLine = '' Then Exit;
  End
  Else
    FLine := S;

  FList.Insert(Index, FLine);
end;

// -----------------------------------------------------------------------------

procedure TSubtitleFile.Move(CurIndex, NewIndex: Integer);
begin
  If (CurIndex >= 0) And (CurIndex < FList.Count) And (CurIndex <> NewIndex) Then
    FList.Move(CurIndex, NewIndex);
end;

// -----------------------------------------------------------------------------

procedure TSubtitleFile.Delete(Index: Integer);
begin
  If (Index < 0) Or (Index >= FList.Count) Then Exit;

  FList.Delete(Index);
end;

// -----------------------------------------------------------------------------

procedure TSubtitleFile.Clear;
begin
  FList.Clear;
end;

// -----------------------------------------------------------------------------

procedure TSubtitleFile.SetCapacity(NewCapacity: Integer);
begin
  FList.Capacity := NewCapacity;
end;

// -----------------------------------------------------------------------------

procedure TSubtitleFile.Grow;
begin
end;

// -----------------------------------------------------------------------------

function TSubtitleFile.GetTextStr: String;
begin
  Result := FList.Text;
end;

// -----------------------------------------------------------------------------

procedure TSubtitleFile.SetTextStr(const Value: String);
begin
  Clear;
  FList.Text := Value;
end;

// -----------------------------------------------------------------------------

{ TSubtitles }

// -----------------------------------------------------------------------------

constructor TSubtitles.Create;
begin
  FCount    := 0;
  FCapacity := 0;
  FFormat   := -1;
end;

// -----------------------------------------------------------------------------

destructor TSubtitles.Destroy;
begin
  If FCount <> 0 Then
    Finalize(FList^[0], FCount);

  FCount  := 0;
  FFormat := -1;
  SetCapacity(0);

  inherited Destroy;
end;

// -----------------------------------------------------------------------------

function TSubtitles.GetItem(Index: Integer): TSubtitleItem;
begin
  If (Index >= 0) Or (Index < FCount) Then
    With FList^[Index] Do
    Begin
      Result.Text        := Text;
      Result.InitialTime := InitialTime;
      Result.FinalTime   := FinalTime;
    End;
end;

// -----------------------------------------------------------------------------

procedure TSubtitles.PutItem(Index: Integer; const Item: TSubtitleItem);
begin
  If (Index >= 0) Or (Index < FCount) Then
    With FList^[Index] Do
    Begin
      Text        := Item.Text;
      InitialTime := Item.InitialTime;
      FinalTime   := Item.FinalTime;
    End;
end;

// -----------------------------------------------------------------------------

procedure TSubtitles.SetFormat(Format: ShortInt);
begin
  FFormat := Format;
end;

// -----------------------------------------------------------------------------

function TSubtitles.GetText(Index: Integer): {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
begin
  If (Index >= 0) Or (Index < FCount) Then
    Result := FList^[Index].Text;
end;

// -----------------------------------------------------------------------------

procedure TSubtitles.PutText(Index: Integer; const S: {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF});
begin
  If (Index >= 0) Or (Index < FCount) Then
    FList^[Index].Text := S;
end;

// -----------------------------------------------------------------------------

function TSubtitles.GetInitialTime(Index: Integer): Integer;
begin
  Result := 0;

  If (Index >= 0) Or (Index < FCount) Then
    Result := FList^[Index].InitialTime;
end;

// -----------------------------------------------------------------------------

procedure TSubtitles.PutInitialTime(Index: Integer; const Time: Integer);
begin
  If (Index >= 0) Or (Index < FCount) Then
    FList^[Index].InitialTime := Time;
end;

// -----------------------------------------------------------------------------

function TSubtitles.GetFinalTime(Index: Integer): Integer;
begin
  Result := 0;

  If (Index >= 0) Or (Index < FCount) Then
    Result := FList^[Index].FinalTime;
end;

// -----------------------------------------------------------------------------

procedure TSubtitles.PutFinalTime(Index: Integer; const Time: Integer);
begin
  If (Index >= 0) Or (Index < FCount) Then
    FList^[Index].FinalTime := Time;
end;

// -----------------------------------------------------------------------------

function TSubtitles.Add(const StartTime, EndTime: Integer; const Caption: {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF}; CheckSub: Boolean = True): Integer;
begin
  If CheckSub = True Then
//    If (Trim(Caption) = '') or (StartTime > EndTime) Then   // removed by BDZL 2007.10.02
    If Trim(Caption) = '' Then   // changed by BDZL 2007.10.02
    Begin
      Result := -1;
      Exit;
    End;
  Result := FCount;
  Insert(Result, StartTime, EndTime, Caption, False);
end;

// -----------------------------------------------------------------------------

function TSubtitles.Add(const Item: TSubtitleItem; CheckSub: Boolean = True): Integer;
begin
  If CheckSub = True Then
    If (Trim(Item.Text) = '') or (Item.InitialTime > Item.FinalTime) Then
    Begin
      Result := -1;
      Exit;
    End;
  Result := FCount;
  Insert(Result, Item.InitialTime, Item.FinalTime, Item.Text, CheckSub);
end;

// -----------------------------------------------------------------------------

procedure TSubtitles.Insert(Index: Integer; const StartTime, EndTime: Integer; const Caption: {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF}; CheckSub: Boolean = True);
begin
  If CheckSub = True Then
  Begin
    If (Trim(Caption) = '') or (StartTime > EndTime) or (StartTime = -1) Then
      Exit;
  End;

  If FCount = FCapacity Then
    Grow;

  If Index < FCount Then
    System.Move(FList^[Index], FList^[Index + 1], (FCount - Index) * SizeOf(TSubtitleItem));

  With FList^[Index] Do
  Begin
    Pointer(Text) := NIL;
    Text          := Caption;
    InitialTime   := StartTime;
    FinalTime     := EndTime;
  End;

  Inc(FCount);
end;

// -----------------------------------------------------------------------------

procedure TSubtitles.Insert(Index: Integer; const Item: TSubtitleItem; CheckSub: Boolean = True);
begin
  Insert(Index, Item.InitialTime, Item.FinalTime, Item.Text, CheckSub);
end;

// -----------------------------------------------------------------------------

procedure TSubtitles.Move(CurIndex, NewIndex: Integer);
var
  TempItem: TSubtitleItem;
begin
  If (CurIndex >= 0) And (CurIndex < FCount) And (CurIndex <> NewIndex) Then
  Begin
    TempItem := GetItem(CurIndex);
    Delete(CurIndex);
    Insert(NewIndex, TempItem.InitialTime, TempItem.FinalTime, TempItem.Text);
  End;
end;

// -----------------------------------------------------------------------------

procedure TSubtitles.Delete(Index: Integer);
begin
  If (Index < 0) Or (Index >= FCount) Then Exit;

  Finalize(FList^[Index]);
  Dec(FCount);

  If Index < FCount Then
    System.Move(FList^[Index + 1], FList^[Index], (FCount - Index) * SizeOf(TSubtitleItem));
end;

// -----------------------------------------------------------------------------

procedure TSubtitles.Clear;
begin
  If FCount <> 0 Then
  Begin
    Finalize(FList^[0], FCount);
    FCount := 0;
    SetCapacity(0);
  End;
end;

// -----------------------------------------------------------------------------

procedure TSubtitles.SetCapacity(NewCapacity: Integer);
begin
  ReallocMem(FList, NewCapacity * SizeOf(TSubtitleItem));
  FCapacity := NewCapacity;
end;

// -----------------------------------------------------------------------------

procedure TSubtitles.Grow;
var
  Delta: Integer;
begin
  If FCapacity > 64 Then
    Delta := FCapacity Div 4
  Else If FCapacity > 8 Then
    Delta := 16
  Else
    Delta := 4;

  SetCapacity(FCapacity + Delta);
end;

// -----------------------------------------------------------------------------

end.
