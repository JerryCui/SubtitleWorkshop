// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Karaoke Lyrics LRC subtitle format reading functionality

function FileToSubtitles_KARAOKELYRICSLRC(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
var
  i           : Integer;
  InitialTime : Integer;
  FinalTime   : Integer;
  Text        : String;
begin
  Result := False;
  try
    for i := 0 to tmpSubFile.Count-1 do
    begin
      InitialTime := StringToTime(Copy(tmpSubFile[i], 2, Pos(']', tmpSubFile[i]) - 2), True);
      if i+1 <= (tmpSubFile.Count-1) then
        FinalTime := StringToTime(Copy(tmpSubFile[i+1], 2, Pos(']', tmpSubFile[i+1]) - 2), True)
      else
        FinalTime := InitialTime + 2000;

      Text := Copy(tmpSubFile[i], Pos(']', tmpSubFile[i]) + 1, Length(tmpSubFile[i]));

      if (InitialTime > -1) and (FinalTime > -1) then
        if (MaxDuration > 0) and ((FinalTime + ExtraTime) > MaxDuration) Then
          Subtitles.Add(InitialTime + ExtraTime, InitialTime + ExtraTime + MaxDuration, Text)
        else
          Subtitles.Add(InitialTime + ExtraTime, FinalTime + ExtraTime, Text);
    end;
  finally
    if Subtitles.Count > 0 then Result := True;
  end;
end;
