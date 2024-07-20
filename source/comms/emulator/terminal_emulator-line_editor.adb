-------------------------------------------------------------------------------
--             This file is part of the Ada Terminal Emulator                --
--               (Terminal_Emulator, Term_IO and Redirect)                   --
--                               package                                     --
--                                                                           --
--                             Version 2.2                                   --
--                                                                           --
--                   Copyright (C) 2003 Ross Higson                          --
--                                                                           --
-- The Ada Terminal Emulator package is free software; you can redistribute  --
-- it and/or modify it under the terms of the GNU General Public License as  --
-- published by the Free Software Foundation; either version 2 of the        --
-- License, or (at your option) any later version.                           --
--                                                                           --
-- The Ada Terminal Emulator package is distributed in the hope that it will --
-- be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General --
-- Public License for more details.                                          --
--                                                                           --
-- You should have received a copy of the GNU General Public License along   --
-- with the Ada Terminal Emulator package - see file COPYING; if not, write  --
-- to the Free Software Foundation, Inc., 59 Temple Place - Suite 330,       --
-- Boston, MA  02111-1307, USA.                                              --
-------------------------------------------------------------------------------

with Ada.Unchecked_Deallocation;
with Filename_Completion;
with Win32;
with Win32.Winbase;
with Win32.Wincon;
with Interfaces.C;

package body Terminal_Emulator.Line_Editor is

   package IC renames Interfaces.C;

   procedure Free is
   new Ada.Unchecked_Deallocation (Editor_Record, Command_Line_Editor);

   procedure Free is
   new Ada.Unchecked_Deallocation (History_Buffer, History_Access);


   procedure New_Editor (
         Editor         : in out Command_Line_Editor;
         Term           : in     Terminal;
         ProcessID      : in     WS.Win32_ProcessID := 0;
         Insert         : in     Boolean            := True;
         EraseLineChar  : in     Character          := DEFAULT_ERASELINE_CHAR;
         Completion     : in     Boolean            := True;
         CompletionChar : in     Character          := DEFAULT_COMPLETION_CHAR;
         History        : in     Boolean            := True;
         HistMax        : in     Natural            := DEFAULT_HIST_SIZE)
   is
   begin
      if Editor /= null then
         Close_Editor (Editor);
      end if;
      Editor := new Editor_Record;
      Editor.Term           := Term;
      Editor.ProcessID      := ProcessID;
      Editor.Insert         := Insert;
      if EraseLineChar = ASCII.NUL then
         Editor.EraseLineChar  := DEFAULT_ERASELINE_CHAR;
      else
         Editor.EraseLineChar  := EraseLineChar;
      end if;
      Editor.Completion     := Completion;
      if CompletionChar = ASCII.NUL then
         Editor.CompletionChar := DEFAULT_COMPLETION_CHAR;
      else
         Editor.CompletionChar := CompletionChar;
      end if;
      Editor.History       := History;
      if History then
         Editor.HistMax    := HistMax;
         Editor.HistSize   := 0;
         Editor.HistTop    := 0;
         Editor.HistPos    := 0;
         Editor.Hist       := new History_Buffer (0 .. HistMax - 1);
      end if;
      GetScreenSize (Editor.Term, Editor.MaxCols, Editor.MaxRows);
      if Editor.Insert then
         SetCursorOptions (Editor.Term, Bar => Yes);
      end if;
   exception
      when others =>
         Close_Editor (Editor);
   end New_Editor;


   procedure GetHistory (
         Editor : in out Command_Line_Editor;
         Line   : in out String;
         Length : in out Natural;
         Number : in     Natural := 0)
   is
      HistLen : Integer := 0;
      HistNum : Natural := 0;
   begin
      if Editor /= null and then Editor.History and then Editor.Hist /= null then
         if Number < Editor.HistMax and Number < Editor.HistSize then
            HistNum := (Editor.HistTop - Number - 1) mod Editor.HistMax;
            if Editor.Hist (HistNum).Length > Line'Length then
               HistLen := Line'Length;
            else
               HistLen := Editor.Hist (HistNum).Length;
            end if;
            Line (Line'First .. Line'First + HistLen - 1)
               := Editor.Hist (HistNum).Line (1 .. HistLen);
            Length := HistLen;
         else
            Length := 0;
         end if;
      else
         Length := 0;
      end if;
   end GetHistory;


   procedure Edit (
         Editor   : in out Command_Line_Editor;
         Line     : in out String;
         Length   : in out Natural;
         TermChar : in out Character)
   is

      use Filename_Completion;
      use type Special_Key_Type;

      Buffer      : String (1 .. MAX_LINE_LEN)  := (others => ' ');
      BuffMax     : Natural                     := 0;
      BuffPos     : Natural                     := 1;
      OldBuffMax  : Natural                     := 0;
      Pushedstart : Boolean                     := False; -- line start pushed on stack
      CurrCol     : Natural                     := 0;
      CurrRow     : Natural                     := 0;
      Char        : Character;
      Special     : Special_Key_Type;
      Modifier    : Modifier_Key_Type;
      Completing  : Boolean                     := False;
      CompHandle  : Filename_Completion.Completion_Handle;
      PartStart   : Natural                     := 0;
      PartLen     : Natural                     := 0;
      CompName    : String (1 .. MAX_LINE_LEN);
      CompLen     : Natural                     := 0;
      PathList    : String (1 .. MAX_LINE_LEN);
      PathLen     : Natural                     := 0;
      Dir         : String (1 .. MAX_LINE_LEN);
      Dirlen      : Natural                     := 0;
      ExtnList    : String (1 .. MAX_LINE_LEN);
      ExtnLen     : Natural                     := 0;
      Success     : Boolean;
      Drive       : String (1 .. MAX_LINE_LEN);
      DriveLen    : Natural                     := 0;
      Root        : String (1 .. MAX_LINE_LEN);
      RootLen     : Natural                     := 0;
      File        : String (1 .. MAX_LINE_LEN);
      FileLen     : Natural                     := 0;
      PushedCS    : Boolean                     := False; -- Completion Start pushed on stack
      CSCol       : Natural                     := 0;
      CSRow       : Natural                     := 0;
      WithinQuote : Boolean                     := False;
      Result      : Win32.Bool;
      NewMaxCols  : Natural                     := 0;
      NewMaxRows  : Natural                     := 0;
      EraseLen    : Natural;
      Processed   : Boolean;

      -- AnalyseFileName : handles "X:\..." as well as "\\Server\Share\..."
      procedure Analysefilename (
            Fullname : in     String;
            Drive    : in out String;
            DriveLen : in out Natural;
            Root     : in out String;
            RootLen  : in out Natural;
            File     : in out String;
            FileLen  : in out Natural)
      is
         Count1 : Natural;
         Count2 : Natural;
      begin
         Count1 := Fullname'First;
         if Fullname'Length >= 2
         and then Fullname (Fullname'First + 1) = ':' then
            DriveLen := 2;
            Drive (Drive'First .. Drive'First + 1) 
               := Fullname (Fullname'First .. Fullname'First + 1);
            Count1 := Count1 + 2;
         elsif Fullname'Length >= 2
         and then Fullname (Fullname'First .. Fullname'First + 1) = "\\" then
            DriveLen := 2;
            Drive (Drive'First .. Drive'First + 1) 
               := Fullname (Fullname'First .. Fullname'First + 1);
            Count1 := Count1 + 2;
            DriveLen := 2;
            while Count1 <= Fullname'Last
            and then Fullname (Count1) /= '\' loop
               DriveLen := DriveLen + 1;
               Drive (DriveLen) := Fullname (Count1);
               Count1 := Count1 + 1;
            end loop;                   
            if Count1 <= Fullname'Last then
               DriveLen := DriveLen + 1;
               Drive (DriveLen) := '\';
               Count1 := Count1 + 1;
               while Count1 <= Fullname'Last
               and then Fullname (Count1) /= '\' loop
                  DriveLen := DriveLen + 1;
                  Drive (DriveLen) := Fullname (Count1);
                  Count1 := Count1 + 1;
               end loop;
               if Count1 <= Fullname'Last then
                  DriveLen := DriveLen + 1;
                  Drive (DriveLen) := '\';
                  Count1 := Count1 + 1;
               end if;
            end if;
         else
            DriveLen := 0;
         end if;
         Count2 := Fullname'Last;
         FileLen := 0;
         RootLen := Fullname'Last - Count1 + 1;
         while Count2 >= Count1 and then Fullname (Count2) /= '\' loop
            Count2 := Count2 - 1;
            FileLen := FileLen + 1;
            RootLen := RootLen - 1;
         end loop;
         if RootLen > 0 then
            Root(Root'First .. Root'First + RootLen - 1)
               := Fullname (Count1 .. Count1 + RootLen - 1);
         end if;
         if FileLen > 0 then
            File(File'First .. File'First + FileLen - 1)
               := Fullname (Fullname'Last - FileLen + 1 .. Fullname'Last);
         end if;
      end Analysefilename;

      procedure Clear is
      begin
         for I in 1 .. MAX_LINE_LEN loop
            Buffer (I) := ' ';
         end loop;
         PopInputPos (Editor.Term, Show => Yes, Force => No);
         PushInputPos (Editor.Term);
         Put (Editor.Term, Buffer (1 .. BuffMax), Move => No);
         PopInputPos (Editor.Term, Show => Yes, Force => No);
         PushInputPos (Editor.Term);
         BuffMax := 0;
         BuffPos := 1;
      end Clear;

      procedure CompletionTidyUp is
      begin
         if Completing then
            Finish_Completion (CompHandle);
            if PushedCS then
               PopInputPos (Editor.Term, Discard => Yes);
            end if;
            Completing := False;
         end if;
      end CompletionTidyUp;

   begin
      BuffMax  := 0;
      BuffPos  := 1;
      TermChar := ASCII.NUL;
      loop
         GetExtended (Editor.Term, Special, Modifier, Char);
         if not Pushedstart then
            PushInputPos (Editor.Term);
            Pushedstart := True;
         end if;
         -- in case user has resized screen
         GetScreenSize (Editor.Term, NewMaxCols, NewMaxRows);
         EraseLen := 0;
         if NewMaxCols > Editor.MaxCols then
            -- user has made screen bigger
            EraseLen := BuffMax
               + ((BuffMax / Editor.MaxCols) + 1) * (NewMaxCols - Editor.MaxCols);
         elsif NewMaxCols < Editor.MaxCols then
            -- user has made screen smaller
            EraseLen := BuffMax
               - ((BuffMax / Editor.MaxCols)) * (Editor.MaxCols - NewMaxCols);
         end if;
         if EraseLen > 0 then
            declare
               Erase : String (1 .. EraseLen) := (others => ' ');
            begin
               if Completing and PushedCS then
                  -- there will be a location on the stack for the
                  -- start of the completion, so get rid of it - this
                  -- will force the entire line to be rewritten
                  PopInputPos (Editor.Term, Discard => Yes);
                  PushedCS := False;
               end if;
               PopInputPos (Editor.Term, Show => Yes, Force => No);
               PushInputPos (Editor.Term);
               Put (Editor.Term, Erase (1 .. EraseLen), Move => No);
               PopInputPos (Editor.Term, Show => Yes, Force => No);
               PushInputPos (Editor.Term);
               Put (Editor.Term, Buffer (1 .. BuffMax));
            end;
         end if;
         Editor.MaxCols := NewMaxCols;
         Editor.MaxRows := NewMaxRows;
         if Special /= None then
            TermChar := ASCII.NUL;
            case Special is
               when Up_Key =>
                  CompletionTidyUp;
                  if Editor.History and Editor.HistSize > 0 then
                     if Editor.HistPos < Editor.HistSize
                     and Editor.HistPos > 0 and BuffMax = 0 then
                        -- empty line, so recall same command
                        Clear;
                        GetHistory (Editor, Buffer, BuffMax, Editor.HistPos - 1);
                        if BuffMax > 0 then
                           Put (Editor.Term, Buffer (1 .. BuffMax));
                           BuffPos := BuffMax + 1;
                        else
                           WS.Beep;
                        end if;
                     elsif Editor.HistPos = Editor.HistSize
                     and Editor.HistPos > 0 then
                        -- already at oldest command, so recall same command
                        Clear;
                        GetHistory (Editor, Buffer, BuffMax, Editor.HistPos - 1);
                        if BuffMax > 0 then
                           Put (Editor.Term, Buffer (1 .. BuffMax));
                           BuffPos := BuffMax + 1;
                           WS.Beep;
                        else
                           WS.Beep;
                        end if;
                     elsif Editor.HistPos < Editor.HistSize then
                        -- recall previous command
                        Clear;
                        GetHistory (Editor, Buffer, BuffMax, Editor.HistPos);
                        if BuffMax > 0 then
                           Put (Editor.Term, Buffer (1 .. BuffMax));
                           BuffPos := BuffMax + 1;
                           Editor.HistPos := Editor.HistPos + 1;
                        else
                           WS.Beep;
                        end if;
                     else
                        WS.Beep;
                     end if;
                  else
                     WS.Beep;
                  end if;
               when Down_Key =>
                  CompletionTidyUp;
                  if Editor.History and Editor.HistSize > 0 then
                     if Editor.HistPos > 1 then
                        Clear;
                        GetHistory (Editor, Buffer, BuffMax, Editor.HistPos - 2);
                        if BuffMax > 0 then
                           Put (Editor.Term, Buffer (1 .. BuffMax));
                           BuffPos := BuffMax + 1;
                           Editor.HistPos := Editor.HistPos - 1;
                        else
                           WS.Beep;
                        end if;
                     elsif Editor.HistPos = 1 then
                        Editor.HistPos := 0;
                        Clear;
                        WS.Beep;
                     else
                        Clear;
                        WS.Beep;
                     end if;
                  else
                     WS.Beep;
                  end if;
               when Left_Key =>
                  CompletionTidyUp;
                  if BuffPos <= 1 then
                     WS.Beep;
                  else
                     GetInputPos (Editor.Term, CurrCol, CurrRow, False);
                     loop
                        if CurrCol > 0 then
                           CurrCol := CurrCol - 1;
                           BuffPos := BuffPos - 1;
                        elsif CurrRow > 0 then
                           -- wrap to end of previous line
                           CurrCol := Editor.MaxCols - 1;
                           CurrRow := CurrRow - 1;
                           BuffPos := BuffPos - 1;
                        else
                           Scroll (Editor.Term, -1);
                           CurrCol := Editor.MaxCols - 1;
                           BuffPos := BuffPos - 1;
                        end if;
                        exit when Modifier /= Control
                        or else BuffPos = 1
                        or else (Buffer (BuffPos) /= ' '
                                 and Buffer (BuffPos - 1) = ' ');
                     end loop;
                     SetInputPos (Editor.Term, CurrCol, CurrRow);
                  end if;
               when Right_Key =>
                  CompletionTidyUp;
                  if BuffPos > BuffMax or BuffPos >= MAX_LINE_LEN  then
                     WS.Beep;
                  else
                     GetInputPos (Editor.Term, CurrCol, CurrRow, False);
                     loop
                        if CurrCol < Editor.MaxCols - 1 then
                           CurrCol := CurrCol + 1;
                           BuffPos := BuffPos + 1;
                        elsif CurrRow < Editor.MaxRows - 1 then
                           -- wrap to start of next line
                           CurrCol := 0;
                           CurrRow := CurrRow + 1;
                           BuffPos := BuffPos + 1;
                        else
                           Scroll (Editor.Term, 1);
                           CurrCol := 0;
                           BuffPos := BuffPos + 1;
                        end if;
                        exit when Modifier /= Control
                        or else BuffPos > BuffMax
                        or else (Buffer (BuffPos) /= ' '
                                 and Buffer (BuffPos - 1) = ' ');
                     end loop;
                     SetInputPos (Editor.Term, CurrCol, CurrRow);
                  end if;
               when Insert =>
                  Editor.Insert := not Editor.Insert;
                  if Editor.Insert then
                     SetCursorOptions (Editor.Term, Bar => Yes);
                  else
                     SetCursorOptions (Editor.Term, Bar => No);
                  end if;
               when Delete =>
                  CompletionTidyUp;
                  if BuffMax > 0 and BuffPos <= BuffMax then
                     for I in BuffPos .. BuffMax - 1 loop
                        Buffer (I) := Buffer (I + 1);
                     end loop;
                     Buffer (BuffMax) := ' ';
                     BuffMax := BuffMax - 1;
                     PushInputPos (Editor.Term);
                     Put (Editor.Term, Buffer (BuffPos .. BuffMax) & "  ", Move => No);
                     PopInputPos (Editor.Term, Show => Yes, Force => No);
                  else
                     WS.Beep;
                  end if;
               when Home_Key =>
                  CompletionTidyUp;
                  if BuffPos > 1 then
                     BuffPos := 1;
                     PopInputPos (Editor.Term, Show => Yes, Force => No);
                     PushInputPos (Editor.Term);
                  end if;
               when End_Key =>
                  CompletionTidyUp;
                  if BuffMax >= 1 then
                     BuffPos := BuffMax + 1;
                     PopInputPos (Editor.Term, Show => No, Force => No);
                     PushInputPos (Editor.Term);
                     Put (Editor.Term, Buffer (1 .. BuffMax));
                  end if;
               when others =>
                  WS.Beep;
            end case;
         else
            -- not a special key
            Processed := False;
            TermChar  := Char;
            if Editor.Completion and Char = Editor.CompletionChar then
               if not Completing and Modifier /= Shift then
                  Success     := False;
                  Withinquote := False;
                  GetInputPos (Editor.Term, CurrCol, CurrRow, False);
                  CSCol := CurrCol;
                  CSRow := CurrRow;
                  PartStart  := BuffPos;
                  PartLen := 0;
                  if PartStart = 0 then
                     PartStart := 1;
                     -- always rewrite the entire line
                     PushedCS := False;
                  else
                     -- only rewrite the completion itself
                     PushedCS := True;
                     while PartStart  > 1 loop
                        -- search back through buffer to find start of completion
                        if WithinQuote then
                           if Buffer (PartStart - 1) = '"' then
                              WithinQuote := False;
                           end if;
                        elsif Buffer (PartStart - 1) = '"' then
                           WithinQuote := True;
                        elsif Buffer (PartStart - 1) = ' ' then
                           exit;
                        end if;
                        PartStart := PartStart - 1;
                        if CSCol > 0 then
                           CSCol := CSCol - 1;
                        else
                           if CSRow > 0 then
                              CSRow := CSRow - 1;
                              CSCol := Editor.MaxCols - 1;
                           else
                              -- start of buffer is no longer on the screen, so we
                              -- cannot find the absolute position of the start of
                              -- the completion
                              PushedCS := False;
                           end if;
                        end if;
                     end loop;
                  end if;
                  if PushedCS then
                     -- push the absolute position where the completion
                     -- started onto the stack
                     SetInputPos (Editor.Term, CSCol, CSRow);
                     PushInputPos (Editor.Term);
                     SetInputPos (Editor.Term, CurrCol, CurrRow);
                  end if;
                  WithinQuote := False;
                  while PartStart + PartLen <= BuffMax loop
                     if WithinQuote then
                        if Buffer (PartStart + PartLen) = '"' then
                           WithinQuote := False;
                        end if;
                     elsif Buffer (PartStart + PartLen) = '"' then
                        WithinQuote := True;
                     elsif Buffer (PartStart + PartLen) = ' ' then
                        exit;
                     end if;
                     PartLen := PartLen + 1;
                  end loop;
                  Completing := True;
                  -- always get and set the current directory so relative
                  -- references (e.g. "." and "..") will work as expected
                  GetDir (Dir, Dirlen);
                  declare
                     ThisDir : aliased IC.Char_Array := IC.TO_C (Dir (1 .. DirLen));
                  begin
                     Result := Win32.Winbase.SetCurrentDirectory (
                        ThisDir (ThisDir'First)'Unchecked_Access);
                  end;
                  if PartStart = 1 and PartLen = 0 then
                     -- get the path, and look for commands (there is no partial)
                     GetPath (PathList, PathLen);
                     GetExtn (ExtnList, ExtnLen);
                     First_Completion (CompHandle,
                        ".;" & PathList (1 .. PathLen),
                        ExtnList (1 .. ExtnLen),
                        "",
                        CompName,
                        CompLen,
                        Success,
                        Includepath => True);
                  elsif PartStart = 1 and PartLen > 0 then
                     Analysefilename (Buffer (PartStart  .. PartStart + PartLen - 1),
                        Drive, DriveLen,
                        Root, RootLen,
                        File, FileLen);
                     if DriveLen + RootLen > 0 then
                        -- use the specified drive and directory root
                        Dirlen := DriveLen + RootLen;
                        Dir (1 .. Dirlen) := Drive (1 .. DriveLen) & Root (1 .. RootLen);
                        GetExtn (ExtnList, ExtnLen);
                        First_Completion (CompHandle,
                           Dir (1 .. Dirlen),
                           ExtnList (1 .. ExtnLen),
                           File (1 .. FileLen),
                           CompName,
                           CompLen,
                           Success,
                           Includepath => True,
                           Returndirs => True);
                     else
                        -- use the current path
                        GetPath (PathList, PathLen);
                        GetExtn (ExtnList, ExtnLen);
                        First_Completion (CompHandle,
                           ".;" & PathList (1 .. PathLen),
                           ExtnList (1 .. ExtnLen),
                           Buffer (PartStart  .. PartStart + PartLen - 1),
                           CompName,
                           CompLen,
                           Success,
                           Includepath => True);
                     end if;
                  elsif PartLen > 0 then
                     Analysefilename (Buffer (PartStart  .. PartStart + PartLen - 1),
                        Drive, DriveLen,
                        Root, RootLen,
                        File, FileLen);
                     if DriveLen > 0 or RootLen > 0 then
                        -- use the specified drive and directory root
                        Dirlen := DriveLen + RootLen;
                        Dir (1 .. Dirlen) := Drive (1 .. DriveLen) & Root (1 .. RootLen);
                        First_Completion (CompHandle,
                           Dir (1 .. Dirlen),
                           "",
                           File (1 .. FileLen),
                           CompName,
                           CompLen,
                           Success,
                           Includepath => True);
                     else
                        -- use the current directory
                        First_Completion (CompHandle,
                           Dir (1 .. Dirlen),
                           "",
                           Buffer (PartStart  .. PartStart + PartLen - 1),
                           CompName,
                           CompLen,
                           Success,
                           Includepath => False);
                     end if;
                  end if;
               else
                  if Modifier = Shift then
                     Prior_Completion (CompHandle, CompName, CompLen, Success);
                  else
                     Next_Completion (CompHandle, CompName, CompLen, Success);
                  end if;
               end if;
               if Success then
                  OldBuffMax := BuffMax;
                  declare
                     PostComp : String := Buffer (PartStart + PartLen .. BuffMax);
                  begin
                     Buffer (PartStart .. PartStart + CompLen - 1)
                        := CompName (1 .. CompLen);
                     Buffer (PartStart + CompLen .. BuffMax + CompLen - PartLen)
                        := PostComp;
                  end;
                  BuffMax := BuffMax + CompLen - PartLen;
                  PartLen := CompLen;
                  BuffPos := PartStart + PartLen;
                  Buffer (BuffPos) := ' ';
                  if PushedCS then
                     -- only rewrite completion
                     PopInputPos (Editor.Term, Show => Yes, Force => No);
                     PushInputPos (Editor.Term);
                     Put (Editor.Term, Buffer (PartStart .. PartStart + PartLen - 1));
                     PushInputPos (Editor.Term);
                     Put (Editor.Term, Buffer (PartStart + PartLen .. BuffMax));
                  else
                     -- rewrite entire line
                     PopInputPos (Editor.Term, Show => Yes, Force => No);
                     PushInputPos (Editor.Term);
                     Put (Editor.Term, Buffer (1 .. PartStart + PartLen - 1));
                     PushInputPos (Editor.Term);
                     Put (Editor.Term, Buffer (PartStart + PartLen .. BuffMax));
                  end if;
                  if OldBuffMax > BuffMax then
                     for I in BuffMax + 1 .. OldBuffMax loop
                        Buffer (I) := ' ';
                     end loop;
                     declare
                        Erase : String (BuffMax + 1 .. OldBuffMax)
                           := (others => ' ');
                     begin
                        Put (Editor.Term, Erase, Move => No);
                     end;
                  end if;
                  PopInputPos (Editor.Term, Show => Yes, Force => No);
               else
                  WS.Beep;
               end if;
               Processed := True;
            elsif Char = Editor.EraseLineChar then
               CompletionTidyUp;
               Clear;
               if Editor.History then
                  Editor.HistPos := 0;
               end if;
               Processed := True;
            else
               case Char is
                  when ASCII.ETX =>
                     if Integer (Editor.ProcessID) /= 0 then
                        CompletionTidyUp;
                        Put (Editor.Term, "^C" & ASCII.CR & ASCII.LF);
                        Result := Win32.Wincon.Generateconsolectrlevent
                           (Win32.Wincon.Ctrl_Break_Event, Editor.ProcessID);
                        BuffMax := 0;
                        BuffPos := 1;
                        Processed := True;
                        exit;
                     else
                        Processed := True;
                     end if;
                  when ASCII.CR =>
                     CompletionTidyUp;
                     Processed := True;
                     exit;
                  when ASCII.BS =>
                     CompletionTidyUp;
                     if BuffPos > 1 and BuffMax >= 1 and BuffPos <= BuffMax + 1 then
                        BuffPos := BuffPos - 1;
                        GetInputPos (Editor.Term, CurrCol, CurrRow, False);
                        if CurrCol > 0 then
                           -- new position is on screen, so just move cursor
                           CurrCol := CurrCol - 1;
                           SetInputPos (Editor.Term, CurrCol, CurrRow);
                        else
                           if CurrRow > 0 then
                              -- new position is on screen, so just move cursor
                              CurrRow := CurrRow - 1;
                              CurrCol := Editor.MaxCols - 1;
                              SetInputPos (Editor.Term, CurrCol, CurrRow);
                           else
                              -- scroll first, then move cursor
                              Scroll (Editor.Term, -1);
                              CurrCol := Editor.MaxCols - 1;
                              SetInputPos (Editor.Term, CurrCol, CurrRow);
                           end if;
                        end if;
                        for I in BuffPos .. BuffMax - 1 loop
                           Buffer (I) := Buffer (I + 1);
                        end loop;
                        Buffer (BuffMax) := ' ';
                        BuffMax := BuffMax - 1;
                        PushInputPos (Editor.Term);
                        Put (Editor.Term, Buffer (BuffPos .. BuffMax) & "  ", Move => No);
                        PopInputPos (Editor.Term, Show => Yes, Force => No);
                     else
                        WS.Beep;
                     end if;
                     Processed := True;
                  when ASCII.FF =>
                     -- process it, but don't put it in the buffer
                     CompletionTidyUp;
                     Put (Editor.Term, Char);
                     -- throw away old start position - it won't be valid
                     PopInputPos (Editor.Term, Discard => Yes);
                     Pushedstart := False;
                     Processed := True;
                  when ASCII.LF =>
                     -- process it, but don't put it in the buffer
                     CompletionTidyUp;
                     Put (Editor.Term, Char);
                     -- throw away old start position - it won't be valid
                     PopInputPos (Editor.Term, Discard => Yes);
                     Pushedstart := False;
                     Processed := True;
                  when others =>
                     null;
               end case;
            end if;
            if not Processed then
               -- put the character in the buffer
               if BuffPos <= MAX_LINE_LEN then
                  if Editor.Insert and BuffMax > 0 and BuffPos <= BuffMax then
                     if BuffMax < MAX_LINE_LEN then
                        for I in reverse BuffPos .. BuffMax loop
                           Buffer (I + 1) := Buffer (I);
                        end loop;
                        BuffMax := BuffMax + 1;
                        Buffer (BuffPos) := Char;
                        Put (Editor.Term, Char);
                        PushInputPos (Editor.Term);
                        Put (Editor.Term, Buffer (BuffPos + 1 .. BuffMax));
                        PopInputPos (Editor.Term, Show => Yes, Force => No);
                     end if;
                     if BuffPos > BuffMax then
                        BuffMax := BuffPos;
                     end if;
                     if BuffPos < MAX_LINE_LEN then
                        BuffPos := BuffPos + 1;
                     end if;
                  else
                     Buffer (BuffPos) := Char;
                     Put (Editor.Term, Char);
                     if BuffPos > BuffMax then
                        BuffMax := BuffPos;
                     end if;
                     BuffPos := BuffPos + 1;
                  end if;
               else
                  WS.Beep;
               end if;
               CompletionTidyUp;
            end if;
         end if;
      end loop;
      if BuffMax > Line'Length then
         Line := Buffer (1 .. Line'Length);
         Length := Line'Length;
      else
         if BuffMax > 0 then
            Line (Line'First .. Line'First + BuffMax - 1) := Buffer (1 .. BuffMax);
            Length := BuffMax;
         else
            Length := 0;
         end if;
      end if;
      if Editor.History then
         if Length > 0 then
            declare
               Histcmd    : String (1 .. MAX_LINE_LEN);
               Histcmdlen : Natural;
            begin
               Histcmdlen := 0;
               if Editor.HistSize > 0 then
                  if Editor.HistPos > 0 then
                     GetHistory (Editor, Histcmd, Histcmdlen, Editor.HistPos - 1);
                  else
                     GetHistory (Editor, Histcmd, Histcmdlen);
                  end if;
               end if;
               if Length /= Histcmdlen
               or else (Histcmd (1 .. Length) /= Buffer (1 .. Length)) then
                  -- new command, so add it to history
                  Editor.HistPos := 0;
                  Editor.Hist (Editor.HistTop).Length := Length;
                  Editor.Hist (Editor.HistTop).Line (1 .. Length)
                     := Line (Line'First .. Line'First + Length - 1);
                  Editor.HistTop := (Editor.HistTop + 1) mod Editor.HistMax;
                  if Editor.HistSize < Editor.HistMax then
                     Editor.HistSize := Editor.HistSize + 1;
                  end if;
               end if;
            end;
         end if;
      end if;
      PopInputPos (Editor.Term, Discard => Yes);
   end Edit;



   procedure Close_Editor (
         Editor : in out Command_Line_Editor) is
   begin
      if Editor /= null then
         if Editor.Hist /= null then
            Free (Editor.Hist);
         end if;
         Free (Editor);
      end if;
   end Close_Editor;


end Terminal_Emulator.Line_Editor;
