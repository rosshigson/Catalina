-------------------------------------------------------------------------------
--             This file is part of the Ada Terminal Emulator                --
--               (Terminal_Emulator, Term_IO and Redirect)                   --
--                               package                                     --
--                                                                           --
--                             Version 2.1                                   --
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

with Ada.Sequential_IO;
with Sizable_Panels;
with GWindows.Windows;
with GWindows.Drawing.Capabilities;
with GWindows.Message_Boxes;
with Terminal_Types;
with Terminal_Internal_Types;


package body Graphic_Buffer is

   use Terminal_Types;
   use Terminal_Internal_Types;
   use Interfaces.C;
   use Sizable_Panels;
   use GWindows.Drawing;
   use GWindows.Drawing.Capabilities;
   
   -- ProcessNonGraphic: Perform processing for non-graphic characters.
   --                    Accepts location so it can be used with Input
   --                    Cursor or Output Cursor (i.e either on echo or put).
   --                    Note that some non-graphics are processed by the
   --                    ANSI parser, and thus are not mentioned here.
   procedure ProcessNonGraphic (
         Buffer     : in out Graphic_Buffer;
         ScrnCol    : in out Scrn_Col;
         ScrnRow    : in out Scrn_Row;
         NonGraphic : in     Character;
         Style      : in out Real_Cell;
         Draw       : in     Boolean := True)
   is
   begin
      case NonGraphic is
         when ASCII.BS =>
            PerformBS (Buffer, ScrnCol, ScrnRow, Style, Draw);
         when ASCII.CR =>
            if not Buffer.IgnoreCR then
               PerformCR (Buffer, ScrnCol, ScrnRow, Style, Draw);
               if Buffer.LFonCR then
                  -- we received an CR, so perform implicit CR
                  PerformLF (Buffer, ScrnCol, ScrnRow, Style, Draw);
               end if;
            end if;
         when ASCII.LF =>
            if not Buffer.IgnoreLF then
               if Buffer.CRonLF then
                  -- we received an LF, so perform implicit CR
                  PerformCR (Buffer, ScrnCol, ScrnRow, Style, Draw);
               end if;
               PerformLF (Buffer, ScrnCol, ScrnRow, Style, Draw);
            end if;
         when ASCII.VT =>
            -- in all modes, same as LF
            PerformLF (Buffer, ScrnCol, ScrnRow, Style, Draw);
         when ASCII.BEL =>
            PerformBEL (Buffer, ScrnCol, ScrnRow, Style, Draw);
         when ASCII.FF =>
            if Buffer.FFisLF then
               -- FF same as LF
               PerformLF (Buffer, ScrnCol, ScrnRow, Style, Draw);
            else
               -- do a proper FF
               PerformFF (Buffer, ScrnCol, ScrnRow, Style, Draw);
            end if;
         when ASCII.HT =>
            PerformHT (Buffer, ScrnCol, ScrnRow, Style, Draw);
         when others =>
            null;
      end case;
   end ProcessNonGraphic;


   -- ProcessGraphic: Perform processing for graphic (displayable) character.
   --                 Accepts location so it can be used with Input
   --                 Cursor or Output Cursor (i.e either on echo or put),
   --                 and with Input style or Output Style. Note that
   --                 on exit, RealRow and RealCol indicate where the graphic
   --                 was actually put. You cannot rely on Col and Row to
   --                 identify this due to line wrap and scrolling. The
   --                 Dummy flag is used when we need to make sure the cursor
   --                 location is up to date (because of wrap), without actually
   --                 processing a character.
   procedure ProcessGraphic (
         Buffer   : in out Graphic_Buffer;
         ScrnCol  : in out Scrn_Col;
         ScrnRow  : in out Scrn_Row;
         WrapNext : in out Boolean;
         RealCol  : in out Real_Col;
         RealRow  : in out Real_Row;
         Graphic  : in     Character;
         Style    : in out Real_Cell;
         Draw     : in     Boolean := True;
         Dummy    : in     Boolean := False)
   is
      Selected : Boolean;
      Size     : Row_Size;
      LastCol  : Scrn_Col;
      LastRow  : Scrn_Row;
      RealCell : Real_Cell_Access;
   begin
      if Buffer.UseRegion and then InRegion (Buffer, ScrnCol, ScrnRow) then
         LastCol  := Scrn (Buffer, Buffer.Regn_Size.Col - 1);
         LastRow  := Scrn (Buffer, Buffer.Regn_Size.Row - 1);
      else
         LastCol  := Buffer.Scrn_Size.Col - 1;
         LastRow  := Buffer.Scrn_Size.Row - 1;
      end if;
      if DoubleWidth (Buffer, ScrnCol, ScrnRow) then
         -- double width characters, so make sure ScrnCol and LastCol
         -- are the first of each respective column pair
         if Real (Buffer, ScrnCol) mod 2 /= 0 then
            ScrnCol := ScrnCol - 1;
         end if;
         if Real (Buffer, LastCol) mod 2 /= 0 then
            LastCol := LastCol - 1;
         end if;
      end if;
      if Buffer.WrapOn and then WrapNext and then ScrnCol >= LastCol then
         if Buffer.PrintAuto then
            -- print the current line
            Print (
               Buffer,
               Rows => True,
               FirstRow => Virt (Buffer, ScrnRow),
               LastRow  => Virt (Buffer, ScrnRow),
               KeepOpen => True);
         end if;
         Home (Buffer, ScrnCol);
         ScrnRow := ScrnRow + 1;
         if ScrnRow > LastRow then
            -- Scroll screen down if we can
            UndrawCursor (Buffer);
            -- shift the data on display up
            declare
               FillStyle : Real_Cell := Buffer.BlankStyle;
            begin
               FillStyle.FgColor := Style.FgColor;
               FillStyle.BgColor := Style.BgColor;
               ShiftUp (
                  Buffer,
                  FillStyle,
                  Draw => Draw);
            end;
            ScrnRow := LastRow;
         end if;
      end if;
      WrapNext := False;
      if not Dummy then
         RealRow := Real (Buffer, ScrnRow);
         if Buffer.InsertOn then
            if DoubleWidth (Buffer, ScrnCol, ScrnRow) then
               -- for double width, we must unscramble the line
               -- to insert and then rescramble the line
               if LastCol > ScrnCol then
                  Size := Buffer.Real_Buffer (
                     Real (Buffer, ScrnCol), RealRow).Size;
                  SingleWidthLine (Buffer, ScrnCol, ScrnRow);
                  for RealCol
                  in reverse Real (Buffer, ScrnCol)
                          .. Real (Buffer, LastCol - 1)
                  loop
                     MoveRealCell (
                        Buffer,
                        RealCol,
                        RealRow,
                        RealCol + 1,
                        RealRow);
                  end loop;
                  DoubleWidthLine (Buffer, ScrnCol, ScrnRow, Size);
               end if;
            else
               -- for single width, we can just insert
               if LastCol > ScrnCol then
                  for RealCol
                  in reverse Real (Buffer, ScrnCol)
                          .. Real (Buffer, LastCol - 1)
                  loop
                     MoveRealCell (
                        Buffer,
                        RealCol,
                        RealRow,
                        RealCol + 1,
                        RealRow);
                  end loop;
               end if;
            end if;
         end if;
         RealCol := Real (Buffer, ScrnCol);
         RealCell := BufferCell (Buffer, RealCol, RealRow);
         -- special case : if changing the italicization or the boldness,
         -- then erase old character first (using the new background Color)
         if Style.Italic /= RealCell.Italic
         or Style.Bold   /= RealCell.Bold then
            if OnView (Buffer, RealCol, RealRow) and Draw then
               OutputBlank (
                  Buffer,
                  View (Buffer, RealCol),
                  View (Buffer, RealRow),
                  RealCell.Size,
                  RealCol mod 2 = 0,
                  Style.FgColor,
                  Style.BgColor,
                  RealCell.Inverse xor RealCell.Selected,
                  1,
                  Clip => True);
            end if;
         end if;
         -- preserve selection status and size
         Selected := RealCell.Selected;
         Size     := RealCell.Size;
         RealCell.all      := Style;
         RealCell.Selected := Selected;
         RealCell.Size     := Size;
         if Font_Maps.Bits (Graphic, Buffer.GLSet, Buffer.GRSet) then
            RealCell.Bits  := True;
            RealCell.Char  := Graphic;
         else
            RealCell.Bits  := False;
            RealCell.Char
               := Font_Maps.Char (
                  Graphic,
                  Buffer.GLSet,
                  Buffer.GRSet);
         end if;
         if ScrnCol >= LastCol then
            if Buffer.WrapOn then
               -- we don't actually wrap until a character is put
               -- in this position - this is to avoid wrapping to
               -- a new line when all we wanted to do was put a
               -- character in the last position
               WrapNext := True;
            end if;
            ScrnCol := LastCol;
         else
            ScrnCol := ScrnCol + Width (Buffer, ScrnCol, ScrnRow);
         end if;
      end if;
   end ProcessGraphic;


   -- ProcessChar : Process a character, which may be either a graphic
   --               or non-graphic character.
   procedure ProcessChar (
         Buffer   : in out Graphic_Buffer;
         ScrnCol  : in out Scrn_Col;
         ScrnRow  : in out Scrn_Row;
         WrapNext : in out Boolean;
         Char     : in     Character;
         Style    : in out Real_Cell;
         Input    : in     Boolean := True;
         Draw     : in     Boolean := True)
   is
      RealCol  : Real_Col := 0;
      RealRow  : Real_Row := 0;
      Scrolled : Integer;
      Updated  : Boolean;
   begin
      if NonGraphic (Char, Buffer.GLSet, Buffer.GRSet) then
         -- process a non-graphic (non-displayable) character
         ProcessNonGraphic (
            Buffer,
            ScrnCol,
            ScrnRow,
            Char,
            Style,
            Draw => Draw);
      else
         -- process a graphic (displayable) character
         ProcessGraphic (
            Buffer,
            ScrnCol,
            ScrnRow,
            WrapNext,
            RealCol,
            RealRow,
            Char,
            Style,
            Draw);
         if Draw then
            if Buffer.InsertOn then
               -- draw entire line
               if OnView (Buffer, RealRow) then
                  if OnView (Buffer, RealCol) then
                     DrawViewRow (
                        Buffer,
                        View (Buffer, RealCol),
                        View (Buffer, RealRow));
                  else
                     DrawViewRow (Buffer, 0, View (Buffer, RealRow));
                  end if;
               end if;
            else
               -- just draw one character
               if OnView (Buffer, RealCol, RealRow) then
                  DrawChar (
                     Buffer,
                     View (Buffer, RealCol),
                     View (Buffer, RealRow));
               end if;
            end if;
         end if;
         if Buffer.GLSet = DEC_CONTROL then
            -- special case - all characters are graphic,
            -- but we also perform CRLF in some cases
            if Char = ASCII.LF
            or Char = ASCII.FF
            or Char = ASCII.VT then
               PerformCR (Buffer, ScrnCol, ScrnRow, Style);
               PerformLF (Buffer, ScrnCol, ScrnRow, Style);
            end if;
         end if;
      end if;
      -- update current number of rows used in buffer
      UpdateUsedRows (Buffer, ScrnRow, Updated);
      if Updated then
         UpdateScrollRanges (Buffer);
      end if;
      if Draw then
         -- put the row on view if required
         if Buffer.ScrollOnPut then
            PutOnView (Buffer, Virt (Buffer, ScrnRow), Scrolled);
            if Scrolled /= 0 then
               UpdateScrollPositions (Buffer);
            end if;
         end if;
         Redraw (Buffer.Panel);
      end if;
   end ProcessChar;


   -- ForceWrap : This procedure can be used to force a cursor wrap.
   --             This is necessary if we need to force the cursor
   --             to the correct location, even though it would not
   --             normally wrap until the next character is processed.
   procedure ForceWrap (
         Buffer   : in out Graphic_Buffer;
         ScrnCol  : in out Scrn_Col;
         ScrnRow  : in out Scrn_Row;
         WrapNext : in out Boolean;
         Style    : in out Real_Cell)
   is
      RealCol : Real_Col := 0;
      RealRow : Real_Row := 0;
   begin
      ProcessGraphic (
         Buffer,
         ScrnCol,
         ScrnRow,
         WrapNext,
         RealCol,
         RealRow,
         ASCII.NUL,
         Style,
         Dummy => True);
   end ForceWrap;


   -- ProcessStr : Process a string, which may contain either graphic
   --              or non-graphic characters.
   procedure ProcessStr (
         Buffer   : in out Graphic_Buffer;
         ScrnCol  : in out Scrn_Col;
         ScrnRow  : in out Scrn_Row;
         WrapNext : in out Boolean;
         Str      : in     String;
         Style    : in out Real_Cell;
         Input    : in     Boolean := True;
         Draw     : in     Boolean := True)
   is

      RealCol   : Real_Col := 0;
      RealRow   : Real_Row := 0;
      StartCol  : Real_Col;
      StartRow  : Real_Row;
      EndRow    : Real_Row;
      CharIndex : Integer;
      CharCount : Integer;
      Scrolled  : Integer;
      Updated   : Boolean;

      procedure UpdateExtent (
            Buffer : in out Graphic_Buffer)
      is
      begin
         if Virt (Buffer, RealCol) < Virt (Buffer, StartCol) then
            StartCol := RealCol;
         end if;
         if Virt (Buffer, RealRow) < Virt (Buffer, StartRow) then
            StartRow := RealRow;
            StartCol := 0;
         end if;
         if Virt (Buffer, RealRow) > Virt (Buffer, EndRow) then
            EndRow := RealRow;
         end if;
      end UpdateExtent;

      procedure RedrawExtent (
            Buffer : in out Graphic_Buffer)
      is
         FirstRow : View_Row;
         LastRow  : View_Row;
      begin
         -- redraw all affected rows
         if OnView (Buffer, StartRow) then
            FirstRow := View (Buffer, StartRow);
         else
            FirstRow := 0;
            StartCol := 0;
         end if;
         if OnView (Buffer, EndRow) then
            LastRow := View (Buffer, EndRow);
         else
            LastRow := Buffer.View_Size.Row - 1;
         end if;
         -- redraw all affected view rows - on the first row start from
         -- the start column but on subsequent rows redraw the whole row
         for ViewRow in FirstRow .. LastRow loop
            if OnView (Buffer, StartCol) then
               DrawViewRow (Buffer, View (Buffer, StartCol), ViewRow);
            else
               DrawViewRow (Buffer, 0, ViewRow);
            end if;
            StartCol := 0;
         end loop;
         StartCol := RealCol;
         StartRow := RealRow;
         EndRow   := StartRow;
      end RedrawExtent;

   begin
      -- for maximum speed, try and process as many graphic
      -- characters as possible in each step, keeping track
      -- of how much of the view we will have to redraw.
      -- We redraw the view before each non-graphic, or if
      -- we are about to wrap.
      StartCol  := Real (Buffer, ScrnCol);
      StartRow  := Real (Buffer, ScrnRow);
      EndRow    := StartRow;
      CharIndex := Str'First;
      while CharIndex <= Str'Last loop
         CharCount := 0;
         while CharIndex + CharCount <= Str'Last
         and then not NonGraphic (
            Str (CharIndex + CharCount),
            Buffer.GLSet,
            Buffer.GRSet)
         loop
            -- found a graphic (displayable) char
            ProcessGraphic (
               Buffer,
               ScrnCol,
               ScrnRow,
               WrapNext,
               RealCol,
               RealRow,
               Str (CharIndex + CharCount),
               Style);
            if WrapNext and Buffer.UseRegion then
               RedrawExtent (Buffer);
            else
               UpdateExtent (Buffer);
            end if;
            if Buffer.GLSet = DEC_CONTROL then
               -- special case - all characters are graphic,
               -- but we also perform CRLF in some cases
               if Str (CharIndex + CharCount) = ASCII.LF
               or Str (CharIndex + CharCount) = ASCII.FF
               or Str (CharIndex + CharCount) = ASCII.VT then
                  if Buffer.UseRegion then
                     RedrawExtent (Buffer);
                  else
                     UpdateExtent (Buffer);
                  end if;
                  PerformCR (Buffer, ScrnCol, ScrnRow, Style);
                  PerformLF (Buffer, ScrnCol, ScrnRow, Style);
                  RealCol := Real (Buffer, ScrnCol);
                  RealRow := Real (Buffer, ScrnRow);
                  UpdateExtent (Buffer);
               end if;
            end if;
            CharCount := CharCount + 1;
         end loop;
         if CharCount = 0 then
            -- must have found a non-graphic (non-displayable)
            -- character, so process it (but just check ...)
            if NonGraphic (Str (CharIndex), Buffer.GLSet, Buffer.GRSet) then
               if Buffer.UseRegion then
                  RedrawExtent (Buffer);
               else
                  UpdateExtent (Buffer);
               end if;
               ProcessNonGraphic (
                  Buffer,
                  ScrnCol,
                  ScrnRow,
                  Str (CharIndex),
                  Style);
               RealCol := Real (Buffer, ScrnCol);
               RealRow := Real (Buffer, ScrnRow);
               UpdateExtent (Buffer);
            end if;
            CharCount := 1;
         end if;
         -- update current number of rows used in buffer
         UpdateUsedRows (Buffer, ScrnRow, Updated);
         if Updated then
            UpdateScrollRanges (Buffer);
         end if;
         CharIndex := CharIndex + CharCount;
      end loop;
      RedrawExtent (Buffer);
      if Buffer.ScrollOnPut then
         PutOnView (Buffer, Virt (Buffer, ScrnRow), Scrolled);
         if Scrolled /= 0 then
            UpdateScrollPositions (Buffer);
         end if;
      end if;
      Redraw (Buffer.Panel);
   end ProcessStr;


   -- CopySelection : make a copy of the current selection
   --                 in a new clipboard buffer. Note that
   --                 we end each line with a CRLF unless
   --                 the DEC_CONTROL font is in use.
   procedure Copyselection (
         Buffer : in out Graphic_Buffer;
         Clip   : in out WS.Clipboard_Data_Access;
         Length : in out Natural)
   is
      StartRow : Virt_Row;
      StartCol : Virt_Col;
      EndRow   : Virt_Row;
      EndCol   : Virt_Col;
      Row      : Virt_Row;
      Col      : Virt_Col;
      Index    : Natural;
   begin
      if Buffer.Sel_Valid then
         if not WS.NullClipboardData (Clip) then
            WS.FreeClipboardData (Clip);
         end if;
         if Buffer.Sel_Type = ByColumn then
            StartCol
               := Min (
                     Virt (Buffer, Buffer.Sel_Start.Col),
                     Virt (Buffer, Buffer.Sel_End.Col));
            StartRow
               := Min (
                     Virt (Buffer, Buffer.Sel_Start.Row),
                     Virt (Buffer, Buffer.Sel_End.Row));
            EndCol
               := Max (
                     Virt (Buffer, Buffer.Sel_Start.Col),
                     Virt (Buffer, Buffer.Sel_End.Col));
            EndRow
               := Max (
                     Virt (Buffer, Buffer.Sel_Start.Row),
                     Virt (Buffer, Buffer.Sel_End.Row));
            -- calculate length to include CR/LF after
            -- each line and terminating null
            Length
               := Natural (EndRow - StartRow + 1)
                     * Natural (EndCol - StartCol + 1 + 2)
                  + 1;
            Clip     := new WS.Clipboard_Data (1 .. Length);
            Index    := 1;
            for Row in StartRow .. EndRow loop
               for Col in StartCol .. EndCol loop
                  if not DoubleWidth (
                     Buffer,
                     Real (Buffer, Col),
                     Real (Buffer, Row))
                  or else Real (Buffer, Col) mod 2 = 0 then
                     Clip (Index)
                        := Buffer.Real_Buffer (
                              Real (Buffer, Col),
                              Real (Buffer, Row)).Char;
                     if Buffer.GLSet = DEC_CONTROL then
                        if Clip (Index) = ASCII.LF
                        or Clip (Index) = ASCII.FF
                        or Clip (Index) = ASCII.VT then
                           -- skip rest of row
                           Index := Index + 1;
                           exit;
                        end if;
                     end if;
                  else
                     Clip (Index) := ' ';
                  end if;
                  Index := Index + 1;
               end loop;
               if Buffer.GLSet /= DEC_CONTROL then
                  Clip (Index) := ASCII.CR;
                  Index := Index + 1;
                  Clip (Index) := ASCII.LF;
                  Index := Index + 1;
               end if;
            end loop;
            Clip (Index) := ASCII.NUL;
         else
            -- must be by row, word or line
            if Less_Than (Buffer, Buffer.Sel_Start, Buffer.Sel_End) then
               StartCol := Virt (Buffer, Buffer.Sel_Start.Col);
               StartRow := Virt (Buffer, Buffer.Sel_Start.Row);
               EndCol   := Virt (Buffer, Buffer.Sel_End.Col);
               EndRow   := Virt (Buffer, Buffer.Sel_End.Row);
            else
               StartCol := Virt (Buffer, Buffer.Sel_End.Col);
               StartRow := Virt (Buffer, Buffer.Sel_End.Row);
               EndCol   := Virt (Buffer, Buffer.Sel_Start.Col);
               EndRow   := Virt (Buffer, Buffer.Sel_Start.Row);
            end if;
            -- calculate length to include CR/LF after
            -- each line and terminating null
            if EndRow = StartRow then
               -- selection is within a single line
               Length := Natural (EndCol - StartCol) + 1 + 1;
            else
               -- selection spans multiple lines
               Length := Natural (Buffer.Virt_Used.Col)
                  - Natural (StartCol) + 2
                  + Natural (EndRow - StartRow - 1)
                     * Natural (Buffer.Scrn_Size.Col + 2)
                  + Natural (EndCol) + 1 + 1;
            end if;
            if EndRow /= StartRow
            and EndCol = Virt_Col (Buffer.Scrn_Size.Col) - 1 then
               -- add space for for CRLF on last row if the selection
               -- reaches the end of row
               Length := Length + 2;
            end if;
            Clip  := new WS.Clipboard_Data (1 .. Length);
            Index := 1;
            Row   := StartRow;
            Col   := StartCol;
            while (Row < EndRow) or (Row = EndRow and Col <= EndCol) loop
               if not DoubleWidth (
                  Buffer,
                  Real (Buffer, Col),
                  Real (Buffer, Row))
               or else Real (Buffer, Col) mod 2 = 0 then
                  Clip (Index)
                     := Buffer.Real_Buffer (
                           Real (Buffer, Col),
                           Real (Buffer, Row)).Char;
                  if Buffer.GLSet = DEC_CONTROL then
                     if Clip (Index) = ASCII.LF
                     or Clip (Index) = ASCII.FF
                     or Clip (Index) = ASCII.VT then
                        -- skip rest of row
                        Col := Buffer.Virt_Used.Col - 1;
                     end if;
                  end if;
               else
                  Clip (Index) := ' ';
               end if;
               Index := Index + 1;
               Col   := Col + 1;
               if Col = Buffer.Virt_Used.Col and EndRow /= StartRow then
                  if Buffer.GLSet /= DEC_CONTROL then
                     Clip (Index) := ASCII.CR;
                     Index := Index + 1;
                     Clip (Index) := ASCII.LF;
                     Index := Index + 1;
                  end if;
                  Col   := 0;
                  Row   := Row + 1;
               end if;
            end loop;
            Clip (Index) := ASCII.NUL;
         end if;
      else
         WS.Beep;
      end if;
   end Copyselection;


   -- PasteSelection : paste copy buffer at the current buffer position
   --                  (PasteToBuff) and/or to the keyboard (PasteToKybd).
   --                  Convert CRs into CR/LFs when writing to the buffer,
   --                  but not the keyboard. Turn AutoLF off while pasting.
   --                  Do not write CR or LF if we wrap on the write.
   --                  Accepts location so it can be used with input or
   --                  output cursor, and style so it can be used with
   --                  input or output style.
   procedure PasteSelection (
         Buffer   : in out Graphic_Buffer;
         Col      : in out Scrn_Col;
         Row      : in out Scrn_Row;
         WrapNext : in out Boolean;
         Style    : in out Real_Cell;
         From     : in     WS.Clipboard_Data_Access;
         Length   : in     Natural)
   is

      StartPos : Natural;
      Len      : Natural;
      AutoLF   : Boolean  := Buffer.LFonCR;
      NeedLF   : Boolean;
      -- RealCol  : Real_Col;
      -- RealRow  : Real_Row;
      Scrolled : Integer;
      Pasted   : Boolean;

      KeyBufferFull : exception;

      -- PasteChar : Paste the character in the key buffer
      procedure PasteChar (
            Buffer : in out Graphic_Buffer;
            Char   : in     Character;
            Pasted :    out Boolean)
      is
      begin
         if ((Buffer.KeyFinish + Buffer.KeySize + 1 - Buffer.KeyStart)
            mod (Buffer.KeySize + 1))
         < Buffer.KeySize then
            -- add the character to the Key buffer
            Buffer.KeyBuff (Buffer.KeyFinish).Special  := None;
            Buffer.KeyBuff (Buffer.KeyFinish).Modifier := No_Modifier;
            Buffer.KeyBuff (Buffer.KeyFinish).Char     := Char;
            Buffer.KeyFinish := (Buffer.KeyFinish + 1) mod (Buffer.KeySize + 1);
            Pasted := True;
         else
            Pasted := False;
         end if;
      end PasteChar;

      -- PasteStr : Paste the string in the key buffer
      procedure PasteStr (
            Buffer : in out Graphic_Buffer;
            Str    : in     String;
            Pasted :    out Boolean)
      is
         KeyPasted : Boolean := True;
      begin
         for I in Str'Range loop
            PasteChar (Buffer, Str (I), KeyPasted);
            exit when not KeyPasted;
         end loop;
         Pasted := KeyPasted;
      end PasteStr;

   begin
      -- turn autoLF off while pasting (restored later)
      Buffer.LFonCR := False;
      Buffer.Pasting := True;
      StartPos := From.all'First;
      while StartPos < From.all'First + Length
      and then From (StartPos) /= ASCII.NUL loop
         Len := 0;
         NeedLF := False;
         while StartPos + Len < From.all'First + Length loop
            if From (StartPos + Len) = ASCII.NUL then
               exit;
            elsif From (StartPos + Len) = ASCII.CR then
               if StartPos + Len + 1 < From.all'First + Length
               and then From (StartPos + Len + 1) = ASCII.LF then
                  Len := Len + 2;
                  exit;
               else
                  Len := Len + 1;
                  NeedLF := True;
                  exit;
               end if;
            else
               Len := Len + 1;
            end if;
         end loop;
         if Len > 0 then
            -- RealRow := Real (Buffer, Row);
            -- RealCol := Real (Buffer, Col);
            -- if DoubleWidth (Buffer, RealCol, RealRow) then
               -- -- must make all lines single width for paste to work
               -- SingleWidthLine (Buffer, RealCol, RealRow);
            -- end if;
            if Len > 1
            and then From (StartPos + Len - 2) = ASCII.CR
            and then From (StartPos + Len - 1) = ASCII.LF then
               -- try writing without CR or LF first and see if we wrap,
               -- which would make both the CR and LF redundant.
               if Len > 2 then
                  if Buffer.PasteToKybd and then Buffer.KeySize > 0 then
                     PasteStr (
                        Buffer,
                        From (StartPos .. StartPos + Len - 3),
                        Pasted);
                     if not Pasted then
                        raise KeyBufferFull;
                     end if;
                  end if;
                  if Buffer.PasteToBuff then
                     ProcessStr (
                        Graphic_Buffer'Class (Buffer),
                        Col,
                        Row,
                        WrapNext,
                        From (StartPos .. StartPos + Len - 3),
                        Style);
                  end if;
                  if WrapNext then
                     -- we do not need to write a CR or LF
                     NeedLF := False;
                  else
                     -- we didn't wrap, so write a CR and set LF flag
                     if Buffer.PasteToKybd and then Buffer.KeySize > 0 then
                        PasteChar (Buffer, ASCII.CR, Pasted);
                        if not Pasted then
                           raise KeyBufferFull;
                        end if;
                     end if;
                     if Buffer.PasteToBuff then
                        ProcessChar (
                           Graphic_Buffer'Class (Buffer),
                           Col,
                           Row,
                           WrapNext,
                           ASCII.CR,
                           Style);
                     end if;
                     NeedLF := True;
                  end if;
               else
                  -- nothing else to write, so write a CR and set LF flag
                  if Buffer.PasteToKybd and then Buffer.KeySize > 0 then
                     PasteChar (Buffer, ASCII.CR, Pasted);
                     if not Pasted then
                        raise KeyBufferFull;
                     end if;
                  end if;
                  if Buffer.PasteToBuff then
                     ProcessChar (
                        Graphic_Buffer'Class (Buffer),
                        Col,
                        Row,
                        WrapNext,
                        ASCII.CR,
                        Style);
                  end if;
                  NeedLF := True;
               end if;
            else
               -- just write the whole string
               if Buffer.PasteToKybd and then Buffer.KeySize > 0 then
                  PasteStr (
                     Buffer,
                     From (StartPos .. StartPos + Len - 1),
                     Pasted);
                  if not Pasted then
                     raise KeyBufferFull;
                  end if;
               end if;
               if Buffer.PasteToBuff then
                  ProcessStr (
                     Graphic_Buffer'Class (Buffer),
                     Col,
                     Row,
                     WrapNext,
                     From (StartPos .. StartPos + Len - 1),
                     Style);
               end if;
            end if;
            if Buffer.PasteToBuff then
               -- write LF if we need one
               if NeedLF then
                  ProcessChar (
                     Graphic_Buffer'Class (Buffer),
                     Col,
                     Row,
                     WrapNext,
                     ASCII.LF,
                     Style);
               end if;
               if Buffer.ScrollOnPut then
                  PutOnView (Buffer, Virt (Buffer, Row), Scrolled);
                  if Scrolled /= 0 then
                     UpdateScrollPositions (Buffer);
                  end if;
               end if;
            end if;
         end if;
         StartPos := StartPos + Len;
      end loop;
      Buffer.LFonCR := AutoLF;
      --Buffer.Pasting := False;
   exception
      when KeyBufferFull =>
         Buffer.LFonCR := AutoLF;
         --Buffer.Pasting := False;
         WS.Beep;
   end PasteSelection;


   -- LoadBufferFromFile : Load a file into the buffer. Accepts location
   --                      so it can be used with Input or Output Cursor,
   --                      and with Input or Output style.
   procedure LoadBufferFromFile (
         Buffer   : in out Graphic_Buffer;
         Col      : in out Scrn_Col;
         Row      : in out Scrn_Row;
         WrapNext : in out Boolean;
         Style    : in out Real_Cell;
         FileName : in     Unbounded_String)
   is
      package Char_IO is new Ada.Sequential_IO (Character);

      InputFile : Char_IO.File_Type;
      Char      : Character;
      AutoLF    : Boolean           := Buffer.LFonCR;
      -- RealCol   : Real_Col;
      -- RealRow   : Real_Row;
      SawCR     : Boolean           := False;
      SawCRLF   : Boolean           := False;
      Scrolled  : Integer           := 0;
   begin
      Char_IO.Open (
         File => InputFile,
         Mode => Char_IO.In_File,
         Name => To_String (FileName));
      -- turn autoLF off while reading file (restored later)
      Buffer.LFonCR := False;
      while not Char_IO.End_Of_File (InputFile) loop
         Char_IO.Read (InputFile, Char);
         if Char = ASCII.NUL then
            exit;
         end if;
         if Char = ASCII.CR then
            SawCR := True;
            if Char_IO.End_Of_File (InputFile) then
               -- just output the CR and exit
               ProcessChar (
                  Graphic_Buffer'Class (Buffer),
                  Col,
                  Row,
                  WrapNext,
                  Char,
                  Style,
                  Draw => False);
               exit;
            else
               Char_IO.Read (InputFile, Char);
               if Char = ASCII.LF then
                  SawCR := False;
                  SawCRLF := True;
               end if;
            end if;
         end if;
         if SawCRLF then
            if not WrapNext then
               -- must perform CRLF
               ProcessChar (
                  Graphic_Buffer'Class (Buffer),
                  Col,
                  Row,
                  WrapNext,
                  ASCII.CR,
                  Style,
                  Draw => False);
               ProcessChar (
                  Graphic_Buffer'Class (Buffer),
                  Col,
                  Row,
                  WrapNext,
                  ASCII.LF,
                  Style,
                  Draw => False);
            end if;
            SawCRLF := False;
         else
            -- RealRow := Real (Buffer, Row);
            -- RealCol := Real (Buffer, Col);
            -- if DoubleWidth (Buffer, RealCol, RealRow) then
               -- -- must make all lines single width for load to work
               -- SingleWidthLine (Buffer, RealCol, RealRow);
            -- end if;
            if SawCR then
               ProcessChar (
                  Graphic_Buffer'Class (Buffer),
                  Col,
                  Row,
                  WrapNext,
                  ASCII.CR,
                  Style,
                  Draw => False);
               SawCR := False;
            end if;
            if Char /= ASCII.NUL then
               ProcessChar (
                  Graphic_Buffer'Class (Buffer),
                  Col,
                  Row,
                  WrapNext,
                  Char,
                  Style,
                  Draw => False);
            else
               exit;
            end if;
         end if;
      end loop;
      if Buffer.ScrollOnPut then
         PutOnView (Buffer, Virt (Buffer, Row), Scrolled);
         if Scrolled /= 0 then
            UpdateScrollPositions (Buffer);
         end if;
      end if;
      Buffer.LFonCR := AutoLF;
      Char_IO.Close (InputFile);
      DrawView (Buffer);
   exception
      when others =>
         WS.Beep;
   end LoadBufferFromFile;


   -- OpenFile : Open the "Open File" dialog box to allow the
   --            uset to select a file, then load the buffer
   --            from that file.
   procedure OpenFile (
         Buffer       : in out Graphic_Buffer)
   is
      Dialog_Title : GWindows.GString           := "Open ...";
      File_Name    : Unbounded_String;
      Filters      : CD.Filter_Array               := (
         (To_Unbounded ("Text Files (*.txt)"),
          To_Unbounded ("*.txt")),
         (To_Unbounded ("All Files (*.*)"),
          To_Unbounded ("*.*")));
      Default_Extn : GWindows.GString           := ".txt";
      File_Title   : Unbounded_String;
      Success      : Boolean                    := False;

   begin
      CD.Open_File (
         Buffer.Panel,
         Dialog_Title,
         File_Name,
         Filters,
         Default_Extn,
         File_Title,
         Success);
      if Success then
         Buffer.FileName := File_Name;
         Initialize (Buffer, Buffer.BlankStyle);
         ResetOffsets (Buffer);
         Buffer.Regn_Base   := (0, 0);
         Buffer.Regn_Size
            := (Regn_Col (Buffer.Scrn_Size.Col),
                Regn_Row (Buffer.Scrn_Size.Row));
         Buffer.UseRegion   := False;
         DrawView (Buffer);
         if Buffer.VertScrollbar then
            Scroll_Range (Buffer.Panel, GWindows.Windows.Vertical, 0, 0);
            Scroll_Position (Buffer.Panel, GWindows.Windows.Vertical, 0);
         end if;
         if Buffer.HorzScrollbar then
            Scroll_Range (Buffer.Panel, GWindows.Windows.Horizontal, 0, 0);
            Scroll_Position (Buffer.Panel, GWindows.Windows.Horizontal, 0);
         end if;
         if Buffer.SingleCursor then
            -- use input cursor
            LoadBufferFromFile (
               Buffer,
               Buffer.Input_Curs.Col,
               Buffer.Input_Curs.Row,
               Buffer.WrapNextIn,
               Buffer.OutputStyle,
               Buffer.FileName);
         else
            -- use output cursor
            LoadBufferFromFile (
               Buffer,
               Buffer.Output_Curs.Col,
               Buffer.Output_Curs.Row,
               Buffer.WrapNextOut,
               Buffer.OutputStyle,
               Buffer.FileName);
         end if;
      end if;
   end OpenFile;


   -- SaveBufferToFile : Save the whole buffer to the specified file.
   --                    Note that each rows is terminated by a CRLF
   --                    unless the DEC_CONTROL font is in use.
   procedure SaveBufferToFile (
         Buffer       : in out Graphic_Buffer;
         FileName     : in     Unbounded_String;
         Check_Exists : in     Boolean           := False)
   is
      use GWindows.Message_Boxes;

      package Char_IO is new Ada.Sequential_IO (Character);

      Outputfile : Char_IO.File_Type;
      Row        : Virt_Row;
      Col        : Virt_Col;
      EndRow     : Virt_Row;
      EndCol     : Virt_Col;
      Exists     : Boolean           := False;
      Overwrite  : Boolean           := False;
      Char       : Character;

   begin
      if Check_Exists then
         begin
            Char_IO.Open (
               File => Outputfile,
               Mode => Char_IO.Out_File,
               Name => To_String (FileName));
            Exists := True;
            Char_IO.Close (Outputfile);
         exception
            when others =>
               null;
         end;
         if Exists then
            Overwrite := Message_Box (Buffer.Panel,
               "File Exists",
               "Do you want to overwrite the existing file ?",
               Yes_No_Box,
               Warning_Icon)
               = Yes;
         else
            Overwrite := True;
         end if;
      else
         Overwrite := True;
      end if;
      if Overwrite then
         Char_IO.Create (
            File => Outputfile,
            Mode => Char_IO.Out_File,
            Name => To_String (FileName));
         Col    := 0;
         Row    := 0;
         EndCol := Buffer.Virt_Used.Col - 1;
         EndRow := Buffer.Virt_Used.Row - 1;
         -- include CR/LF after each line
         while (Row < EndRow) or (Row = EndRow and Col <= EndCol) loop
            Char
               := Buffer.Real_Buffer (
                     Real (Buffer, Col),
                     Real (Buffer, Row)).Char;
            Char_IO.Write (Outputfile, Char);
            if Buffer.GLSet = DEC_CONTROL then
               if Char = ASCII.LF
               or Char = ASCII.FF
               or Char = ASCII.VT then
                  -- skip rest of row
                  Col := Buffer.Virt_Used.Col - 1;
               end if;
            end if;
            Col := Col + 1;
            if Col > Buffer.Virt_Used.Col - 1 then
               if Row < EndRow and Buffer.GLSet /= DEC_CONTROL then
                  Char_IO.Write (Outputfile, ASCII.CR);
                  Char_IO.Write (Outputfile, ASCII.LF);
               end if;
               Col := 0;
               Row := Row + 1;
            end if;
         end loop;
         -- Char_IO.Write (Outputfile, ASCII.NUL);
         Char_IO.Close (Outputfile);
      end if;
   exception
      when others =>
         WS.Beep;
   end SaveBufferToFile;


   -- SaveAsFile : Open the "Save As" dialog box to allow the user
   --              to specify a file name. Then save the buffer to
   --              that filename.
   procedure SaveAsFile (
         Buffer : in out Graphic_Buffer)
   is

      Dialog_Title : GWindows.GString           := "Save As ...";
      File_Name    : Unbounded_String           := Buffer.FileName;
      Filters      : CD.Filter_Array               :=
         ((To_Unbounded ("Text Files (*.txt)"),
           To_Unbounded ("*.txt")),
          (To_Unbounded ("All Files (*.*)"),
           To_Unbounded ("*.*")));
      Default_Extn : GWindows.GString           := ".txt";
      File_Title   : Unbounded_String;
      Success      : Boolean                    := False;

   begin
      CD.Open_File (
         Buffer.Panel,
         Dialog_Title,
         File_Name,
         Filters,
         Default_Extn,
         File_Title,
         Success);
      if Success then
         Buffer.FileName := File_Name;
         SaveBufferToFile (Buffer, Buffer.FileName, True);
      end if;
   end SaveAsFile;


   -- SaveFile : If a Filename is already known, save the buffer
   --            as a file. Otherwise open the "Save As" dialog
   --            box.
   procedure SaveFile (
         Buffer : in out Graphic_Buffer)
   is
   begin
      if Length (Buffer.FileName) = 0 then
         SaveAsFile (Buffer);
      else
         SaveBufferToFile (Buffer, Buffer.FileName, False);
      end if;
   end SaveFile;


   -- Print : Print specified Char (if not ASCII.NUL) or the
   --         specified rows (if Rows is True), or the current
   --         selection (if there is one) or the whole buffer.
   --         if KeepOpen is True, then do not close the print
   --         document - new prints will be added to the open
   --         document. If FormFeed is True, end the page after
   --         this print (always the case when KeepOpen is False).
   procedure Print (
         Buffer   : in out Graphic_Buffer;
         Char     : in     Character := ASCII.NUL;
         Rows     : in     Boolean   := False;
         FirstRow : in     Virt_Row  := 0;
         LastRow  : in     Virt_Row  := 0;
         FormFeed : in     Boolean   := False;
         KeepOpen : in     Boolean   := False)
   is

      XPPI       : Natural := 0;
      YPPI       : Natural := 0;
      StartCol   : Virt_Col := 0;
      EndCol     : Virt_Col := 0;
      StartRow   : Virt_Row := 0;
      EndRow     : Virt_Row := 0;
      BgColor    : Color_Type;
      FgColor    : Color_Type := Black;
      Row        : Virt_Row := 0;
      Col        : Virt_Col := 0;

      PrintName : Unbounded_String;

      -- CreatePrintFontsByType : Create a stock font.
      procedure CreatePrintFontsByType (
            Font : in     Font_Type;
            Size : in     Integer)
      is
      begin
         -- stock fonts don't print well, so instead of this ...
         -- GDO.Create_Stock_Font (
         --   Buffer.PrintStockFont, Buffer.FontType);
         -- ... we use the non-stock font specified by PrintFontName :
         CD.Create_Font_With_Charset (
            Buffer.PrintStockFont,
            To_GString (Buffer.PrintFontName),
            Point_Size (Buffer.PrintCanvas, Size),
            Buffer.FontCharSet);
         --
         Select_Object (Buffer.PrintCanvas, Buffer.PrintStockFont);
         Buffer.PrintCellSize := Text_Output_Size (Buffer.PrintCanvas, "W");
         Select_Object (Buffer.PrintCanvas, Buffer.DefaultFont);
      end CreatePrintFontsByType;

      -- CreatePrintFontsByName : Create named font (and all its variants).
      procedure CreatePrintFontsByName (
            Font    : in     GWindows.GString;
            Size    : in     Integer;
            CharSet : in     Charset_Type)
      is
         TestFont : GDO.Font_Type;
      begin
         CD.Create_Font_With_Charset (
            TestFont,
            Font,
            Point_Size (Buffer.PrintCanvas, Size),
            Italics => True,
            Character_Set => CharSet);
         Select_Object (Buffer.PrintCanvas, TestFont);
         Buffer.PrintCellSize := Text_Output_Size (Buffer.PrintCanvas, "W");
         Select_Object (Buffer.PrintCanvas, Buffer.DefaultFont);
         GDO.Delete (TestFont);
         for Italic in Standard.False .. True loop
            for Strike in Standard.False .. True loop
               for Under in Standard.False .. True loop
                  -- create not bold
                  CD.Create_Font_With_Charset (
                     Buffer.PrintFonts (False, Italic, Strike, Under),
                     Font,
                     Point_Size (Buffer.PrintCanvas, Size),
                     Italics => Italic,
                     Strike_Out => Strike,
                     Underline => Under,
                     Character_Set => CharSet);
                  -- create bold
                  CD.Create_Font_With_Charset (
                     Buffer.PrintFonts (True, Italic, Strike, Under),
                     Font,
                     Point_Size (Buffer.PrintCanvas, Size),
                     Weight => GDO.FW_BOLD,
                     Italics => Italic,
                     Strike_Out => Strike,
                     Underline => Under,
                     Character_Set => CharSet);
               end loop;
            end loop;
         end loop;
      end CreatePrintFontsByName;

      -- PrintBufferChar : Draw a character on the print canvas.
      procedure PrintBufferChar (
            Col : in     Virt_Col;
            Row : in     Virt_Row;
            X   : in     Natural;
            Y   : in     Natural)
      is
         RealCol   : Real_Col        := Real (Buffer, Col);
         RealRow   : Real_Row        := Real (Buffer, Row);
         Line      : String (1 .. 1);
         Bold      : Boolean         := False;
         Italic    : Boolean         := False;
         Strikeout : Boolean         := False;
         Underline : Boolean         := False;
      begin
         if not DoubleWidth (Buffer, RealCol, RealRow) or else RealCol mod 2 = 0
         then
            Line (1) := Buffer.Real_Buffer (RealCol, RealRow).Char;
            if Buffer.StockFont then
               Select_Object (Buffer.PrintCanvas, Buffer.PrintStockFont);
            else
               Bold      := Buffer.Real_Buffer (RealCol, RealRow).Bold;
               Italic    := Buffer.Real_Buffer (RealCol, RealRow).Italic;
               Strikeout := Buffer.Real_Buffer (RealCol, RealRow).Strikeout;
               Underline := Buffer.Real_Buffer (RealCol, RealRow).Underline;
               Select_Object (
                  Buffer.PrintCanvas,
                  Buffer.PrintFonts (Bold, Italic, Strikeout, Underline));
            end if;
            Put (Buffer.PrintCanvas, X, Y, To_GString (Line));
            Select_Object (Buffer.PrintCanvas, Buffer.DefaultFont);
         end if;
      end PrintBufferChar;

   begin -- Print
      if Buffer.PrintDocOpen and not KeepOpen then
         -- end the print document
         End_Page (Buffer.PrintCanvas);
         End_Document (Buffer.PrintCanvas);
         Buffer.PrintDocOpen := False;
      end if;
      if not Buffer.PrintDocOpen then
         -- set up for a new print document
         if not Buffer.PageSetupOk then
            -- page setup has not been done - set up default page settings
            Buffer.PageFlags := CD.PSD_INTHOUSANDTHSOFINCHES or CD.PSD_RETURNDEFAULT;
            CD.Page_Setup (
               Buffer.Panel,
               Buffer.PrintSettings,
               Buffer.PageFlags,
               Buffer.PageSize,
               Buffer.PageMargins,
               Buffer.PageSetupOk);
            -- force calculation of page geometry
            Buffer.PageGeometryOk := False;
         end if;
         if Buffer.PageSetupOk then
            if not Buffer.PrintChosenOk then
               if KeepOpen then
                  -- when keeping print document open,
                  -- use default printer when none chosen
                  CD.Choose_Default_Printer (
                     Buffer.PrintCanvas,
                     PrintName,
                     Buffer.PrintSettings,
                     Buffer.PrintChosenOk);
               else
                  -- when not keeping print document open,
                  -- choose printer when none chosen
                  Buffer.PrintFlags
                     := CD.PD_NOPAGENUMS
                        or CD.PD_USEDEVMODECOPIESANDCOLLATE;
                  if Buffer.Sel_Valid then
                     -- if there is a selection, set the default
                     -- to print only that
                     Buffer.PrintFlags := Buffer.PrintFlags or CD.PD_SELECTION;
                  end if;
                  CD.Choose_Printer (
                     Buffer.Panel,
                     Buffer.PrintCanvas,
                     Buffer.PrintSettings,
                     Buffer.PrintFlags,
                     Buffer.PrintFromPage,
                     Buffer.PrintToPage,
                     1,
                     1,
                     Buffer.PrintCopies,
                     Buffer.PrintChosenOk);
               end if;
               -- force calculation of page geometry
               Buffer.PageGeometryOk := False;
            end if;
         end if;
      end if;
      if Buffer.PageSetupOk and Buffer.PrintChosenOk then
         if not Buffer.PageGeometryOk then
            -- calculate geometry of printed page
            Buffer.PrintWidth
               := Natural (Get_Capability (Buffer.PrintCanvas, HORZRES));
            Buffer.PrintHeight
               := Natural (Get_Capability (Buffer.PrintCanvas, VERTRES));
            XPPI := X_Pixels_Per_Inch (Buffer.PrintCanvas);
            YPPI := X_Pixels_Per_Inch (Buffer.PrintCanvas);
            -- calculate printing area, based on margins
            if Buffer.PrintWidth > 0 then
               Buffer.PrintStartX := (Buffer.PageMargins.Left * XPPI) / 1000;
               Buffer.PrintStopX
                  := Buffer.PrintWidth
                     - (Buffer.PageMargins.Right * XPPI) / 1000;
            else
               WS.Beep;
            end if;
            if Buffer.PrintHeight > 0 then
               Buffer.PrintStartY := (Buffer.PageMargins.Top * YPPI) / 1000;
               Buffer.PrintStopY
                  := Buffer.PrintHeight
                     - (Buffer.PageMargins.Bottom * YPPI) / 1000;
            else
               WS.Beep;
            end if;
            -- create fonts
            if Buffer.StockFont then
               CreatePrintFontsByType (
                  Buffer.FontType,
                  Buffer.FontSize);
            else
               CreatePrintFontsByName (
                  To_GString (Buffer.FontName),
                  Buffer.FontSize,
                  Buffer.FontCharSet);
            end if;
            -- calculate how many Rows/Cols will fit on a page
            Buffer.PageCols
               := (Buffer.PrintStopX - Buffer.PrintStartX)
                  / Buffer.PrintCellSize.Width;
            Buffer.PageRows
               := (Buffer.PrintStopY - Buffer.PrintStartY)
                  / Buffer.PrintCellSize.Height;
            Buffer.PageGeometryOk := True;
         end if;
         BgColor := Background_Color (Buffer.PrintCanvas);
         if not Buffer.PrintDocOpen then
            -- start a new document
            Start_Document (Buffer.PrintCanvas, "TERMINAL OUTPUT");
            Start_Page (Buffer.PrintCanvas);
            Buffer.PrintRowsUsed := 0;
            Buffer.PrintColsUsed := 0;
            Buffer.PrintDocOpen  := True;
            Text_Color (Buffer.PrintCanvas, FgColor);
            Background_Color (Buffer.PrintCanvas, BgColor);
            Background_Mode (Buffer.PrintCanvas, Transparent);
         end if;
         if Char /= ASCII.NUL then
            -- print spcified character
            declare
               Line : String (1 .. 1);
            begin
               if Char = ASCII.CR then
                  Buffer.PrintColsUsed := 0;
               elsif Char = ASCII.BS then
                  if Buffer.PrintColsUsed > 0 then
                     Buffer.PrintColsUsed := Buffer.PrintColsUsed - 1;
                  end if;
               elsif Char = ASCII.LF or Char = ASCII.FF or Char = ASCII.VT then
                  Buffer.PrintRowsUsed := Buffer.PrintRowsUsed + 1;
                  if Buffer.PrintRowsUsed = Buffer.PageRows then
                     -- a page has been completed
                     if Row < LastRow then
                        -- more to print, so end this page and start another
                        End_Page (Buffer.PrintCanvas);
                        Start_Page (Buffer.PrintCanvas);
                        Buffer.PrintRowsUsed := 0;
                        Text_Color (Buffer.PrintCanvas, FgColor);
                        Background_Color (Buffer.PrintCanvas, BgColor);
                        Background_Mode (Buffer.PrintCanvas, Transparent);
                     end if;
                  end if;
               else
                  Line (1) := Char;
                  if Buffer.StockFont then
                     Select_Object (
                        Buffer.PrintCanvas,
                        Buffer.PrintStockFont);
                  else
                     Select_Object (
                        Buffer.PrintCanvas,
                        Buffer.PrintFonts (False, False, False, False));
                  end if;
                  Put (
                     Buffer.PrintCanvas,
                     Buffer.PrintStartX + Integer (Buffer.PrintColsUsed)
                        * Buffer.PrintCellSize.Width,
                     Buffer.PrintStartY + Integer (Buffer.PrintRowsUsed)
                        * Buffer.PrintCellSize.Height,
                     To_GString (Line));
                  Buffer.PrintColsUsed := Buffer.PrintColsUsed + 1;
                  if Buffer.PrintColsUsed = Buffer.PageCols then
                     Buffer.PrintRowsUsed := Buffer.PrintRowsUsed + 1;
                     Buffer.PrintColsUsed := 0;
                     if Buffer.PrintRowsUsed = Buffer.PageRows then
                        -- a page has been completed
                        if Row < LastRow then
                           -- more to print, so end this page and start another
                           End_Page (Buffer.PrintCanvas);
                           Start_Page (Buffer.PrintCanvas);
                           Buffer.PrintRowsUsed := 0;
                           Text_Color (Buffer.PrintCanvas, FgColor);
                           Background_Color (Buffer.PrintCanvas, BgColor);
                           Background_Mode (Buffer.PrintCanvas, Transparent);
                        end if;
                     end if;
                  end if;
                  Select_Object (Buffer.PrintCanvas, Buffer.DefaultFont);
               end if;
            end;

         elsif Rows then
            -- print specified rows
            for Row in FirstRow .. LastRow loop
               for Col
               in 0 .. Min (
                     Virt_Col (Buffer.PageCols - 1),
                     Buffer.Virt_Used.Col - 1)
               loop
                  PrintBufferChar (
                     Col,
                     Row,
                     Buffer.PrintStartX + Integer (Col)
                        * Buffer.PrintCellSize.Width,
                     Buffer.PrintStartY + Integer (Buffer.PrintRowsUsed)
                        * Buffer.PrintCellSize.Height);
               end loop;
               Buffer.PrintRowsUsed := Buffer.PrintRowsUsed + 1;
               Buffer.PrintColsUsed := 0;
               if Buffer.PrintRowsUsed = Buffer.PageRows then
                  -- a page has been completed
                  if Row < LastRow then
                     -- more to print, so end this page and start another
                     End_Page (Buffer.PrintCanvas);
                     Start_Page (Buffer.PrintCanvas);
                     Buffer.PrintRowsUsed := 0;
                     Text_Color (Buffer.PrintCanvas, FgColor);
                     Background_Color (Buffer.PrintCanvas, BgColor);
                     Background_Mode (Buffer.PrintCanvas, Transparent);
                  end if;
               end if;
            end loop;
         else
            -- print selection or entire buffer
            if (Buffer.PrintFlags and CD.PD_SELECTION) /= 0 then
               -- print selection, if valid
               if Buffer.Sel_Valid then
                  if Buffer.Sel_Type = ByColumn then
                     StartCol
                        := Min (
                              Virt (Buffer, Buffer.Sel_Start.Col),
                              Virt (Buffer, Buffer.Sel_End.Col));
                     StartRow
                        := Min (
                              Virt (Buffer, Buffer.Sel_Start.Row),
                              Virt (Buffer, Buffer.Sel_End.Row));
                     EndCol
                        := Max (
                              Virt (Buffer, Buffer.Sel_Start.Col),
                              Virt (Buffer, Buffer.Sel_End.Col));
                     EndRow
                        := Max (
                              Virt (Buffer, Buffer.Sel_Start.Row),
                              Virt (Buffer, Buffer.Sel_End.Row));
                     EndCol
                        := Min (
                              EndCol,
                              StartCol + Virt_Col (Buffer.PageCols - 1));
                     for Row in StartRow .. EndRow loop
                        for Col in StartCol .. EndCol loop
                           PrintBufferChar (
                              Col,
                              Row,
                              Buffer.PrintStartX
                                 + Integer (Col - StartCol)
                                    * Buffer.PrintCellSize.Width,
                              Buffer.PrintStartY
                                 + Integer (Buffer.PrintRowsUsed)
                                    * Buffer.PrintCellSize.Height);
                        end loop;
                        Buffer.PrintRowsUsed := Buffer.PrintRowsUsed + 1;
                        Buffer.PrintColsUsed := 0;
                        if Buffer.PrintRowsUsed = Buffer.PageRows then
                           -- a page has been completed
                           if Row < EndRow then
                              -- more to print, so end this page
                              -- and start another
                              End_Page (Buffer.PrintCanvas);
                              Start_Page (Buffer.PrintCanvas);
                              Buffer.PrintRowsUsed := 0;
                              Text_Color (Buffer.PrintCanvas, FgColor);
                              Background_Color (Buffer.PrintCanvas, BgColor);
                              Background_Mode (Buffer.PrintCanvas, Transparent);
                           end if;
                        end if;
                     end loop;
                  else
                     -- must be by row, word or line
                     if Less_Than (
                           Buffer,
                           Buffer.Sel_Start,
                           Buffer.Sel_End)
                     then
                        StartCol := Virt (Buffer, Buffer.Sel_Start.Col);
                        StartRow := Virt (Buffer, Buffer.Sel_Start.Row);
                        EndCol   := Virt (Buffer, Buffer.Sel_End.Col);
                        EndRow   := Virt (Buffer, Buffer.Sel_End.Row);
                     else
                        StartCol := Virt (Buffer, Buffer.Sel_End.Col);
                        StartRow := Virt (Buffer, Buffer.Sel_End.Row);
                        EndCol   := Virt (Buffer, Buffer.Sel_Start.Col);
                        EndRow   := Virt (Buffer, Buffer.Sel_Start.Row);
                     end if;
                     Row := StartRow;
                     Col := StartCol;
                     while (Row < EndRow)
                     or (Row = EndRow and Col <= EndCol) loop
                        PrintBufferChar (
                           Col,
                           Row,
                           Buffer.PrintStartX
                              + Integer (Col)
                                 * Buffer.PrintCellSize.Width,
                           Buffer.PrintStartY
                              + Integer (Buffer.PrintRowsUsed)
                                 * Buffer.PrintCellSize.Height);
                        Col := Col + 1;
                        if Col > Min (
                              Buffer.Virt_Used.Col - 1,
                              Virt_Col (Buffer.PageCols - 1))
                        or (Row = EndRow and Col = EndCol)
                        then
                           Col := 0;
                           Row := Row + 1;
                           Buffer.PrintRowsUsed := Buffer.PrintRowsUsed + 1;
                           Buffer.PrintColsUsed := 0;
                           if Buffer.PrintRowsUsed = Buffer.PageRows then
                              -- a page has been completed
                              if Row < EndRow
                              or (Row = EndRow and Col < EndCol) then
                                 -- more to print, so end this page
                                 -- and start another
                                 End_Page (Buffer.PrintCanvas);
                                 Start_Page (Buffer.PrintCanvas);
                                 Buffer.PrintRowsUsed := 0;
                                 Text_Color (
                                    Buffer.PrintCanvas,
                                    FgColor);
                                 Background_Color (
                                    Buffer.PrintCanvas,
                                    BgColor);
                                 Background_Mode (
                                    Buffer.PrintCanvas,
                                    Transparent);
                              end if;
                           end if;
                        end if;
                     end loop;
                  end if;
               else
                  -- no selection to print
                  WS.Beep;
               end if;
            else
               -- print the entire buffer
               for Row in 0 .. Buffer.Virt_Used.Row loop
                  for Col
                  in 0 .. Min (
                        Virt_Col (Buffer.PageCols - 1),
                        Buffer.Virt_Used.Col - 1)
                  loop
                     PrintBufferChar (
                        Col,
                        Row,
                        Buffer.PrintStartX
                           + Integer (Col)
                              * Buffer.PrintCellSize.Width,
                        Buffer.PrintStartY
                           + Integer (Buffer.PrintRowsUsed)
                              * Buffer.PrintCellSize.Height);
                  end loop;
                  Buffer.PrintRowsUsed := Buffer.PrintRowsUsed + 1;
                  Buffer.PrintColsUsed := 0;
                  if Buffer.PrintRowsUsed = Buffer.PageRows then
                     -- a page has been completed
                     if Row < Buffer.Virt_Used.Row then
                        -- more to print, so end this page and start another
                        End_Page (Buffer.PrintCanvas);
                        Start_Page (Buffer.PrintCanvas);
                        Buffer.PrintRowsUsed := 0;
                        Text_Color (Buffer.PrintCanvas, FgColor);
                        Background_Color (Buffer.PrintCanvas, BgColor);
                        Background_Mode (Buffer.PrintCanvas, Transparent);
                     end if;
                  end if;
               end loop;
            end if;
         end if;
         if KeepOpen then
            -- leave the print document open
            if FormFeed then
               -- end the current page, and start a new one
               End_Page (Buffer.PrintCanvas);
               Start_Page (Buffer.PrintCanvas);
               Buffer.PrintRowsUsed := 0;
               Text_Color (Buffer.PrintCanvas, FgColor);
               Background_Color (Buffer.PrintCanvas, BgColor);
               Background_Mode (Buffer.PrintCanvas, Transparent);
            end if;
         else
            -- end the print document
            End_Page (Buffer.PrintCanvas);
            End_Document (Buffer.PrintCanvas);
            Buffer.PrintDocOpen := False;
         end if;
         Select_Object (Buffer.PrintCanvas, Buffer.DefaultFont);
      else
         -- no printer selected, or no default printer
         WS.Beep;
      end if;
   end Print;


   -- PageSetup : Open the "Page Setup" dialog box.
   procedure PageSetup (
         Buffer : in out Graphic_Buffer)
   is
      use type GT.Rectangle_Type;
   begin
      -- before changing page setup, close any open print document
      if Buffer.PrintDocOpen then
         End_Page (Buffer.PrintCanvas);
         End_Document (Buffer.PrintCanvas);
         Buffer.PrintDocOpen := False;
      end if;
      Buffer.PageFlags := CD.PSD_INTHOUSANDTHSOFINCHES;
      if Buffer.PageMargins /= (0, 0, 0, 0) then
         Buffer.PageFlags := Buffer.PageFlags or CD.PSD_MARGINS;
      end if;
      CD.Page_Setup (
         Buffer.Panel,
         Buffer.PrintSettings,
         Buffer.PageFlags,
         Buffer.PageSize,
         Buffer.PageMargins,
         Buffer.PageSetupOk);
      Buffer.PageGeometryOk := False; -- force recalc of page geometry
   end PageSetup;


   -- PerformBS : Perform Backspace processing. Accepts location
   --             so it can be used with Input Cursor or Output Cursor
   procedure PerformBS (
         Buffer   : in out Graphic_Buffer;
         Col      : in out Scrn_Col;
         Row      : in out Scrn_Row;
         Style    : in out Real_Cell;
         Draw     : in     Boolean  := True)
   is
      MaxMove : Scrn_Col;
   begin
      if Buffer.UseRegion and then InRegion (Buffer, Col, Row) then
         MaxMove := Col - Buffer.Regn_Base.Col;
      else
         MaxMove := Col;
      end if;
      if MaxMove >= Width (Buffer, Col, Row) then
         Col := Col - Width (Buffer, Col, Row);
      end if;
   end PerformBS;


   -- PerformCR : Perform Carriage Return processing. Accepts location so it
   --             can be used with Input Cursor or Output Cursor
   procedure PerformCR (
         Buffer   : in out Graphic_Buffer;
         Col      : in out Scrn_Col;
         Row      : in out Scrn_Row;
         Style    : in out Real_Cell;
         Draw     : in     Boolean  := True)
   is
   begin
      Home (Buffer, Col);
   end PerformCR;


   -- PerformBEL : Perform Bell processing. Accepts location so it
   --             can be used with Input Cursor or Output Cursor
   procedure PerformBEL (
         Buffer   : in out Graphic_Buffer;
         Col      : in out Scrn_Col;
         Row      : in out Scrn_Row;
         Style    : in out Real_Cell;
         Draw     : in     Boolean  := True)
   is
   begin
      if Draw then
         WS.Beep;
      end if;
   end PerformBEL;


   -- PerformHT : Perform Horizontal Tab processing. Accepts location so it
   --             can be used with Input Cursor or Output Cursor
   procedure PerformHT (
         Buffer   : in out Graphic_Buffer;
         Col      : in out Scrn_Col;
         Row      : in out Scrn_Row;
         Style    : in out Real_Cell;
         Draw     : in     Boolean  := True)
   is
      DestCol : Scrn_Col;
      Double  : Boolean;
      MaxCol  : Scrn_Col;
   begin
      DestCol := Col;
      if Buffer.UseRegion and then InRegion (Buffer, Col, Row) then
         MaxCol := Buffer.Regn_Base.Col + Scrn_Col (Buffer.Regn_Size.Col) - 1;
      else
         MaxCol := Buffer.Scrn_Size.Col - 1;
      end if;
      Double  := DoubleWidth (Buffer, Col, Row);
      while DestCol < MaxCol loop
         DestCol := DestCol + 1;
         if Double and then Real (Buffer, DestCol) mod 2 /= 0 then
            DestCol := DestCol + 1;
         end if;
         if Double and then Buffer.TabStops (Natural (DestCol) / 2) then
            exit;
         end if;
         if not Double and then Buffer.TabStops (Natural (DestCol)) then
            exit;
         end if;
      end loop;
      Col := Min (DestCol, MaxCol);
   end PerformHT;


   -- PerformBT : Perform Backwards Tab processing. Accepts location so it
   --             can be used with Input Cursor or Output Cursor
   procedure PerformBT (
         Buffer   : in out Graphic_Buffer;
         Col      : in out Scrn_Col;
         Row      : in out Scrn_Row;
         Style    : in out Real_Cell;
         Draw     : in     Boolean  := True)
   is
      DestCol : Scrn_Col;
      Double  : Boolean;
      MinCol  : Scrn_Col;
   begin
      DestCol := Col;
      if Buffer.UseRegion and then InRegion (Buffer, Col, Row) then
         MinCol := Buffer.Regn_Base.Col;
      else
         MinCol := 0;
      end if;
      Double  := DoubleWidth (Buffer, Col, Row);
      while DestCol > MinCol loop
         DestCol := DestCol - 1;
         if Double and then Real (Buffer, DestCol) mod 2 /= 0 then
            DestCol := DestCol - 1;
         end if;
         if Double and then Buffer.TabStops (Natural (DestCol) / 2) then
            exit;
         end if;
         if not Double and then Buffer.TabStops (Natural (DestCol)) then
            exit;
         end if;
      end loop;
      Col := Max (DestCol, MinCol);
   end PerformBT;


   -- PerformLF : Perform Line Feed processing. Accepts location so it can be
   --             used with Input Cursor or Output Cursor.
   procedure PerformLF (
         Buffer   : in out Graphic_Buffer;
         Col      : in out Scrn_Col;
         Row      : in out Scrn_Row;
         Style    : in out Real_Cell;
         Draw     : in     Boolean  := True)
   is
       MaxMove : Scrn_Row;
       Updated : Boolean;
   begin
      if Buffer.PrintAuto then
         -- print the current line
         Print (
            Buffer,
            Rows => True,
            FirstRow => Virt (Buffer, Row),
            LastRow  => Virt (Buffer, Row),
            KeepOpen => True);
      end if;
      if Buffer.UseRegion and then InRegion (Buffer, Col, Row) then
         MaxMove
            := Buffer.Regn_Base.Row + Scrn_Row (Buffer.Regn_Size.Row) - 1 - Row;
      else
         MaxMove
            := Buffer.Scrn_Size.Row - 1 - Row;
      end if;
      if MaxMove > 0 then
         Row := Row + 1;
      else
         -- NOTE: LF does not scroll unless the region is not in use,
         -- or the region is in use and we are within the region
         if not Buffer.UseRegion or else InRegion (Buffer, Col, Row) then
            -- shift the data on display up
            declare
               FillStyle : Real_Cell := Buffer.BlankStyle;
            begin
               FillStyle.FgColor := Style.FgColor;
               FillStyle.BgColor := Style.BgColor;
               ShiftUp (
                  Buffer,
                  FillStyle,
                  AdjustView => not Buffer.UseRegion,
                  Draw => Draw);
            end;
            -- when a new line is brought on display
            -- by using LF, it must be made single width
            SingleWidthLine (Buffer, Col, Row);
         end if;
      end if;
      UpdateUsedRows (Buffer, Row, Updated);
      if Updated then
         UpdateScrollRanges (Buffer);
      end if;
   end PerformLF;


   -- PerformFF : Perform Form Feed processing. Accepts location
   --             so it can be used with Input Cursor or Output Cursor
   procedure PerformFF (
         Buffer   : in out Graphic_Buffer;
         Col      : in out Scrn_Col;
         Row      : in out Scrn_Row;
         Style    : in out Real_Cell;
         Draw     : in     Boolean  := True)
   is
      Scroll        : Natural;
      Scrolled      : Integer;
      LastRowOnView : Boolean := False;
      Updated       : Boolean;
   begin
      if Buffer.PrintAuto then
         -- print the current line
         Print (
            Buffer,
            Rows => True,
            FirstRow => Virt (Buffer, Row),
            LastRow  => Virt (Buffer, Row),
            KeepOpen => True);
      end if;
      -- remember if the last row of the screen is on view,
      -- so we can adjust view later.
      LastRowOnView := OnView (Buffer, Buffer.Scrn_Size.Row - 1);
      -- calculate how far we can Scroll screen down
      Scroll
         := Natural'Min (
               RowsBelowScreen (Buffer),
               Natural (Buffer.Scrn_Size.Row));
      if Scroll > 0 then
         -- Scroll screen down as far as we can
         ScreenDown (
            Buffer,
            Style,
            Scroll,
            Scrolled,
            Draw => Draw);
      end if;
      if Scroll < Natural (Buffer.Scrn_Size.Row) then
         -- cannot Scroll screen down any further, so Scroll the buffer up
         BufferUp (
            Buffer,
            Style,
            Natural (Buffer.Scrn_Size.Row) - Scroll,
            Draw => Draw);
      end if;
      -- if we Scroll the buffer on an FF then we must manually indicate all
      -- the intervening lines are used, because we reset the cursor to 0,0
      UpdateUsedRows (Buffer, Buffer.Scrn_Size.Row - 1, Updated);
      if Updated then
         UpdateScrollRanges (Buffer);
      end if;
      -- redraw the entire screen
      Home (Buffer, Buffer.Input_Curs.Col, Buffer.Input_Curs.Row);
      Home (Buffer, Buffer.Output_Curs.Col, Buffer.Output_Curs.Row);
      Home (Buffer, Col, Row);
      if Buffer.ScreenAndView then
         Buffer.View_Base.Row := Buffer.Scrn_Base.Row;
         UpdateScrollPositions (Buffer);
      elsif LastRowOnView then
         -- put last row back on view
         PutOnView (Buffer, Virt (Buffer, Buffer.Scrn_Size.Row - 1), Scrolled);
         if Scrolled /= 0 then
            UpdateScrollPositions (Buffer);
         end if;
      end if;
      if Draw then
         DrawView (Buffer);
      end if;
   end PerformFF;


   -- PerformNEL : Perform New Line processing. Accepts location
   --             so it can be used with Input Cursor or Output Cursor
   procedure PerformNEL (
         Buffer   : in out Graphic_Buffer;
         Col      : in out Scrn_Col;
         Row      : in out Scrn_Row;
         Style    : in out Real_Cell;
         Draw     : in     Boolean  := True)
   is
      MaxMove   : Scrn_Row;
      RowOnView : Boolean := OnView (Buffer, Row);
      Updated   : Boolean;
   begin
      if Buffer.UseRegion and then InRegion (Buffer, Col, Row) then
         MaxMove
            := Buffer.Regn_Base.Row + Scrn_Row (Buffer.Regn_Size.Row) - 1 - Row;
      else
         MaxMove
            := Buffer.Scrn_Size.Row - 1 - Row;
      end if;
      if MaxMove > 0 then
         Row := Row + 1;
      else
         -- shift the data on the screen up. If we shift the screen,
         -- then also shift the view if the Row is currently on view
         declare
            FillStyle : Real_Cell := Buffer.BlankStyle;
         begin
            FillStyle.FgColor := Style.FgColor;
            FillStyle.BgColor := Style.BgColor;
            ShiftUp (
               Buffer,
               FillStyle,
               AdjustView => RowOnView and not Buffer.UseRegion,
               Draw => Draw);
         end;
         -- when a new line is brought on display
         -- by using NEL, it must be made single width
         SingleWidthLine (Buffer, Col, Row);
      end if;
      UpdateUsedRows (Buffer, Row, Updated);
      if Updated then
         UpdateScrollRanges (Buffer);
      end if;
      Home (Buffer, Col);
   end PerformNEL;


   -- PerformRI : Perform Reverse Index processing. Accepts location
   --             so it can be used with Input Cursor or Output Cursor
   procedure PerformRI (
         Buffer   : in out Graphic_Buffer;
         Col      : in out Scrn_Col;
         Row      : in out Scrn_Row;
         Style    : in out Real_Cell;
         Draw     : in     Boolean  := True)
   is
      MaxMove   : Scrn_Row;
      RowOnView : Boolean := OnView (Buffer, Row);
      Updated   : Boolean;
   begin
      if Buffer.UseRegion and then InRegion (Buffer, Col, Row) then
         MaxMove := Row - Buffer.Regn_Base.Row;
      else
         MaxMove := Row;
      end if;
      if MaxMove > 0  then
         Row := Row - 1;
      else
         -- shift the data on the screen down. If we shift the screen,
         -- then also shift the view if the Row is currently on view
         declare
            FillStyle : Real_Cell := Buffer.BlankStyle;
         begin
            FillStyle.FgColor := Style.FgColor;
            FillStyle.BgColor := Style.BgColor;
            ShiftDown (
               Buffer,
               FillStyle,
               AdjustView => RowOnView and not Buffer.UseRegion,
               Draw => Draw);
         end;
      end if;
      UpdateUsedRows (Buffer, Row, Updated);
      if Updated then
         UpdateScrollRanges (Buffer);
      end if;
   end PerformRI;


   -- PerformIND : Perform Index processing. Accepts location so it
   --              can be used with Input Cursor or Output Cursor
   procedure PerformIND (
         Buffer   : in out Graphic_Buffer;
         Col      : in out Scrn_Col;
         Row      : in out Scrn_Row;
         Style    : in out Real_Cell;
         Draw     : in     Boolean  := True)
   is
      MaxMove   : Scrn_Row;
      RowOnView : Boolean := OnView (Buffer, Row);
      Updated   : Boolean;
   begin
      if Buffer.UseRegion and then InRegion (Buffer, Col, Row) then
         MaxMove
            := Buffer.Regn_Base.Row + Scrn_Row (Buffer.Regn_Size.Row) - 1 - Row;
      else
         MaxMove
            := Buffer.Scrn_Size.Row - 1 - Row;
      end if;
      if MaxMove > 0 then
         Row := Row + 1;
      else
         -- shift the data on display up
         declare
            FillStyle : Real_Cell := Buffer.BlankStyle;
         begin
            FillStyle.FgColor := Style.FgColor;
            FillStyle.BgColor := Style.BgColor;
            ShiftUp (
               Buffer,
               FillStyle,
               AdjustView => RowOnView and not Buffer.UseRegion,
               Draw => Draw);
         end;
      end if;
      UpdateUsedRows (Buffer, Row, Updated);
      if Updated then
         UpdateScrollRanges (Buffer);
      end if;
   end PerformIND;


   -- PerformBI : Perform Back Index processing. Accepts location so
   --             it can be used with Input Cursor or Output Cursor
   procedure PerformBI (
         Buffer   : in out Graphic_Buffer;
         Col      : in out Scrn_Col;
         Row      : in out Scrn_Row;
         Style    : in out Real_Cell;
         Draw     : in     Boolean  := True)
   is
      CharWidth   : Scrn_Col := Width (Buffer, Col, Row);
      MaxMove     : Scrn_Col;
      SavedRegion : Boolean  := Buffer.UseRegion;
      SavedBase   : Scrn_Pos := Buffer.Regn_Base;
      SavedSize   : Regn_Pos := Buffer.Regn_Size;
   begin
      if Buffer.UseRegion and then InRegion (Buffer, Col, Row) then
         MaxMove := Col - Buffer.Regn_Base.Col;
      else
         MaxMove := Col;
      end if;
      if MaxMove >= CharWidth then
         -- can move cursor left
         MoveLeft (Buffer, Col, Row);
      else
         -- temporarily set region to this line
         -- to shift the line right one column
         Buffer.UseRegion     := True;
         Buffer.Regn_Base.Row := Row;
         Buffer.Regn_Size.Row := 1;
         declare
            FillStyle : Real_Cell := Buffer.BlankStyle;
         begin
            FillStyle.FgColor := Style.FgColor;
            FillStyle.BgColor := Style.BgColor;
            ShiftRight (Buffer, FillStyle, Draw => Draw);
         end;
         -- restore original region
         Buffer.UseRegion := SavedRegion;
         Buffer.Regn_Base := SavedBase;
         Buffer.Regn_Size := SavedSize;
      end if;
   end PerformBI;


   -- PerformFI : Perform Forward Index processing. Accepts location so
   --             it can be used with Input Cursor or Output Cursor
   procedure PerformFI (
         Buffer   : in out Graphic_Buffer;
         Col      : in out Scrn_Col;
         Row      : in out Scrn_Row;
         Style    : in out Real_Cell;
         Draw     : in     Boolean  := True)
   is
      CharWidth   : Scrn_Col := Width (Buffer, Col, Row);
      MaxMove     : Scrn_Col;
      SavedRegion : Boolean  := Buffer.UseRegion;
      SavedBase   : Scrn_Pos := Buffer.Regn_Base;
      SavedSize   : Regn_Pos := Buffer.Regn_Size;
   begin
      if Buffer.UseRegion and then InRegion (Buffer, Col, Row) then
         MaxMove
            := Buffer.Regn_Base.Col + Scrn_Col (Buffer.Regn_Size.Col) - 1 - Col;
      else
         MaxMove
            := Buffer.Scrn_Size.Col - 1 - Col;
      end if;
      if MaxMove >= CharWidth then
         -- can move cursor right
         MoveRight (Buffer, Col, Row);
      else
         -- temporarily set region to this line
         -- to shift line left one column
         Buffer.UseRegion     := True;
         Buffer.Regn_Base.Row := Row;
         Buffer.Regn_Size.Row := 1;
         declare
            FillStyle : Real_Cell := Buffer.BlankStyle;
         begin
            FillStyle.FgColor := Style.FgColor;
            FillStyle.BgColor := Style.BgColor;
            ShiftLeft (Buffer, FillStyle, Draw => Draw);
         end;
         -- restore original region
         Buffer.UseRegion := SavedRegion;
         Buffer.Regn_Base := SavedBase;
         Buffer.Regn_Size := SavedSize;
      end if;
   end PerformFI;


end Graphic_Buffer;
