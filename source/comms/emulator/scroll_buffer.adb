-------------------------------------------------------------------------------
--             This file is part of the Ada Terminal Emulator                --
--               (Terminal_Emulator, Term_IO and Redirect)                   --
--                               package                                     --
--                                                                           --
--                             Version 2.0                                   --
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

with Ada.Characters.Handling;
with GWindows.Application;
with GWindows.Metrics;
with Terminal_Internal_Types;
with Sizable_Panels;
with Ada.Unchecked_Deallocation;

package body Scroll_Buffer is

   use Terminal_Internal_Types;
   use Sizable_Panels;

   package ACH renames Ada.Characters.Handling;

   
   -- SetDefaultTabStops : Set tab stops every "Size" columns
   --                      (remove all if Size = 0)
   procedure SetDefaultTabStops (
         Buffer : in out Scroll_Buffer;
         Size   : in     Natural)
   is
   begin
      for Col in 0 .. MAX_COLUMNS - 1 loop
         if Size > 0 and then Col > 0
         and then (Col mod Size) = 0 then
            Buffer.TabStops (Col) := True;
         else
            Buffer.TabStops (Col) := False;
         end if;
      end loop;
      Buffer.TabSize := Size;
   end SetDefaultTabStops;


   -- ReceiveKey : Pop the first key off the keybuffer. Return True if
   --              key available, False if not.
   procedure ReceiveKey (
         Buffer    : in out Scroll_Buffer;
         Special   :    out Special_Key_Type;
         Char      :    out Character;
         Modifier  :    out Modifier_Key_Type;
         Available :    out Boolean)
   is
   begin
      if Buffer.KeySize > 0 then
         if Buffer.KeyStart /= Buffer.KeyFinish then
            Special  := Buffer.KeyBuff (Buffer.KeyStart).Special;
            Char     := Buffer.KeyBuff (Buffer.KeyStart).Char;
            Modifier := Buffer.KeyBuff (Buffer.KeyStart).Modifier;
            Buffer.KeyStart := (Buffer.KeyStart + 1) mod (Buffer.KeySize + 1);
            Available := True;
         else
            WS.Beep;
            Available := False;
         end if;
      else
         -- no key buffer
         Available := False;
      end if;
   end ReceiveKey;


   -- UnReceiveKey : Push a key back onto the start of the key buffer.
   --                Return True if added, False if key buffer full.
   procedure UnReceiveKey (
         Buffer   : in out Scroll_Buffer;
         Special  : in     Special_Key_Type;
         Char     : in     Character;
         Modifier : in     Modifier_Key_Type;
         Added    :    out Boolean)
   is
   begin
      if Buffer.KeySize > 0 then
         if (Buffer.KeyFinish - Buffer.KeyStart) mod (Buffer.KeySize + 1) 
         <  Buffer.KeySize then
            -- add the character to the start of the key buffer
            Buffer.KeyStart := (Buffer.KeyStart - 1) mod (Buffer.KeySize + 1);
            Buffer.KeyBuff (Buffer.KeyStart).Special  := Special;
            Buffer.KeyBuff (Buffer.KeyStart).Char     := Char;
            Buffer.KeyBuff (Buffer.KeyStart).Modifier := Modifier;
            Added := True;
         else
            WS.Beep;
            Added := False;
         end if;
      else
         -- no key buffer
         Added := False;
      end if;
   end UnReceiveKey;


   -- SendKey : Push a key to onto the end of the key buffer. If the key
   --           is a special key, the char should be null. Return True if
   --           added, False if key buffer full.
   procedure SendKey (
         Buffer   : in out Scroll_Buffer;
         Special  : in     Special_Key_Type;
         Char     : in     Character;
         Modifier : in     Modifier_Key_Type;
         Sent     :    out Boolean)
   is
   begin
      if Buffer.KeySize > 0 then
         if (Buffer.KeyFinish - Buffer.KeyStart) mod (Buffer.KeySize + 1) 
         < Buffer.KeySize - 1 then
            -- add the character to the end of the key buffer
            Buffer.KeyBuff (Buffer.KeyFinish).Special  := Special;
            Buffer.KeyBuff (Buffer.KeyFinish).Char     := Char;
            Buffer.KeyBuff (Buffer.KeyFinish).Modifier := Modifier;
            Buffer.KeyFinish := (Buffer.KeyFinish + 1) mod (Buffer.KeySize + 1);
            Sent := True;
         else
            WS.Beep;
            Sent := False;
         end if;
      else
         -- no key buffer
         Sent := False;
      end if;
   end SendKey;


   -- SendString : Push a string onto the key buffer. No special keys
   --              or modifiers are supported. The whole string must
   --              fit into the key buffer or none of it is sent.
   procedure SendString (
         Buffer : in out Scroll_Buffer;
         Str    : in     String;
         Sent   :    out Boolean)
   is
      KeySent : Boolean;
   begin
      if Buffer.KeySize > 0 then
         if (Buffer.KeyFinish - Buffer.KeyStart) mod (Buffer.KeySize + 1) 
         < Buffer.KeySize - Str'Length then
            for i in Str'First .. Str'Last loop
               SendKey (Buffer, None, Str (i), No_Modifier, KeySent);
               if not KeySent then
                  -- should never happen
                  WS.Beep;
                  Sent := False;
                  return;
               end if;
            end loop;
            Sent := True;
         else
            -- not enough room in key buffer
            WS.Beep;
            Sent := False;
         end if;
      else
         -- no key buffer
         Sent := False;
      end if;
   end SendString;


   -- UpdateScrollPositions : Update the Scrollbar position
   --                        (if Scrollbars on display).
   procedure UpdateScrollPositions (
         Buffer : in out Scroll_Buffer)
   is
      use GWindows.Windows;
      
      UsedRows : Virt_Row 
         := Max (Virt (Buffer, Buffer.Scrn_Size.Row), Buffer.Virt_Used.Row);
         
      Pos      : Integer;

   begin
      if Buffer.VertScrollbar
      and then Natural (UsedRows) > Natural (Buffer.View_Size.Row) then
         Pos := Scroll_Position (Buffer.Panel, Vertical);
         if Pos /= Integer (Buffer.View_Base.Row) then
            Scroll_Position (
               Buffer.Panel, 
               Vertical, 
               Integer (Buffer.View_Base.Row));
         end if;
      end if;
      if Buffer.HorzScrollbar
      and then Natural (Buffer.Virt_Used.Col) 
             > Natural (Buffer.View_Size.Col) then
         Pos := Scroll_Position (Buffer.Panel, Horizontal);
         if Pos /= Integer (Buffer.View_Base.Col) then
            Scroll_Position (
               Buffer.Panel, 
               Horizontal, 
               Integer (Buffer.View_Base.Col));
         end if;
      end if;
   end UpdateScrollPositions;


   -- UpdateScrollRanges : Update the Scrollbar ranges
   --                     (if Scrollbar on display).
   procedure UpdateScrollRanges (
         Buffer : in out Scroll_Buffer)
   is
      use GWindows.Windows;

      UsedRows : Virt_Row 
         := Max (Virt (Buffer, Buffer.Scrn_Size.Row), Buffer.Virt_Used.Row);

   begin
      if Buffer.VertScrollbar
      and then Natural (UsedRows) > Natural (Buffer.View_Size.Row) then
         Scroll_Minimum (
            Buffer.Panel, 
            Vertical, 
            0);
         Scroll_Maximum (
            Buffer.Panel, 
            Vertical, 
            Integer (UsedRows) - 1);
         Scroll_Page_Size (
            Buffer.Panel, 
            Vertical, 
            Integer (Buffer.View_Size.Row));
         Scroll_Position (
            Buffer.Panel, 
            Vertical, 
            Integer (Buffer.View_Base.Row));
      else
         Scroll_Minimum (Buffer.Panel, Vertical, 0);
         Scroll_Maximum (Buffer.Panel, Vertical, 0);
      end if;
      if Buffer.HorzScrollbar
      and then Natural (Buffer.Virt_Used.Col) 
             > Natural (Buffer.View_Size.Col) then
         Scroll_Minimum (
            Buffer.Panel, 
            Horizontal, 
            0);
         Scroll_Maximum (
            Buffer.Panel, 
            Horizontal, 
            Integer (Buffer.Virt_Used.Col - 1));
         Scroll_Page_Size (
            Buffer.Panel, 
            Horizontal, 
            Integer (Buffer.View_Size.Col));
         Scroll_Position (
            Buffer.Panel, 
            Horizontal, 
            Integer (Buffer.View_Base.Col));
      else
         Scroll_Minimum (Buffer.Panel, Horizontal, 0);
         Scroll_Maximum (Buffer.Panel, Horizontal, 0);
      end if;
   end UpdateScrollRanges;


   -- BufferUp : Erase the top line of the Virtual buffer, then scroll
   --            it up to make a new blank line appear at the bottom
   --            of the virtual buffer. The blank line will be given
   --            the bg color specified in style.
   procedure BufferUp (
         Buffer : in out Scroll_Buffer;
         Style  : in out Real_Cell;
         Scroll : in     Natural := 1;
         Draw   : in     Boolean := True)
   is
      TopRow : Real_Row := Buffer.Virt_Base.Row;
   begin
      if Scroll <= Natural (Buffer.Real_Used.Row) then
         for Row in 1 .. Scroll loop
            for Col in 0 .. Buffer.Virt_Used.Col - 1 loop
               -- make the blank line appear with the bg color
               -- specified by style, but the rest of the 
               -- attributes as specified by blankstyle
               Buffer.Real_Buffer (Real (Buffer, Col), TopRow) 
                  := Buffer.BlankStyle;
               Buffer.Real_Buffer (Real (Buffer, Col), TopRow).BgColor 
                  := Style.BgColor;
            end loop;
            -- make sure this row was not selected
            if Buffer.Sel_Valid then
               if  (Buffer.Sel_Start.Row = TopRow)
               and (Buffer.Sel_End.Row   = TopRow) then
                  -- entire selection has now disappeared
                  NullSelection (Buffer);
               elsif Buffer.Sel_Start.Row = TopRow then
                  -- start row of selection has disappeared
                  Buffer.Sel_Start.Row := Add (Buffer, Buffer.Sel_Start.Row, 1);
                  if Buffer.Sel_Type /= ByColumn then
                     Buffer.Sel_Start.Col := 0;
                  end if;
               elsif Buffer.Sel_End.Row = TopRow then
                  -- end row of selection has disappeared
                  Buffer.Sel_End.Row := Add (Buffer, Buffer.Sel_End.Row, 1);
                  if Buffer.Sel_Type /= ByColumn then
                     Buffer.Sel_End.Col := 0;
                  end if;
               end if;
            end if;
            TopRow := Add (Buffer, TopRow, 1);
         end loop;
         Buffer.Virt_Base.Row := TopRow;
         if Draw then
            if Scroll < Natural (Buffer.View_Size.Row) then
               BitBltUp (
                  Buffer, 
                  Rows => Scroll, 
                  BgColor => Style.BgColor);
               for Row in Buffer.View_Size.Row - View_Row (Scroll) 
                       .. Buffer.View_Size.Row - 1 loop
                  DrawViewRow (Buffer, 0, Row);
               end loop;
               Redraw (Buffer.Panel, Redraw_Now => True);
            else
               DrawView (Buffer);
            end if;
         end if;
         UpdateScrollPositions (Buffer);
      end if;
   end BufferUp;


   -- BufferDown : Erase the bottom line of the Virtual buffer, then scroll
   --              it down to make a new blank line appear at the top
   --              of the virtual buffer. The blank line will be given
   --              the bg color specified in style.
   procedure BufferDown (
         Buffer : in out Scroll_Buffer;
         Style  : in out Real_Cell;
         Scroll : in     Natural := 1;
         Draw   : in     Boolean := True)
   is
      TopRow    : Real_Row := Buffer.Virt_Base.Row;
      BottomRow : Real_Row := Real (Buffer, 
                                    Virt_Row (Buffer.Real_Used.Row - 1));
      Updated   : Boolean;
   begin
      if Scroll <= Natural (Buffer.Real_Used.Row) then
         for Row in 1 .. Scroll loop
            for Col in 0 .. Buffer.Virt_Used.Col - 1 loop
               -- make the blank line appear with the bg color
               -- specified by style, but the rest of the 
               -- attributes as specified by blankstyle
               Buffer.Real_Buffer (Real (Buffer, Col), BottomRow) 
                  := Buffer.BlankStyle;
               Buffer.Real_Buffer (Real (Buffer, Col), BottomRow).BgColor 
                  := Style.BgColor;
            end loop;
            -- make sure this row was not selected
            if Buffer.Sel_Valid then
               if (Buffer.Sel_Start.Row = BottomRow) 
               and (Buffer.Sel_End.Row = BottomRow) then
                  -- entire selection has now disappeared
                  NullSelection (Buffer);
               elsif Buffer.Sel_Start.Row = BottomRow then
                  -- start row of selection has disappeared
                  Buffer.Sel_Start.Row := Sub (Buffer, Buffer.Sel_Start.Row, 1);
                  if Buffer.Sel_Type /= ByColumn then
                     Buffer.Sel_Start.Col := 0;
                  end if;
               elsif Buffer.Sel_End.Row = BottomRow then
                  -- end row of selection has disappeared
                  Buffer.Sel_End.Row := Sub (Buffer, Buffer.Sel_End.Row, 1);
                  if Buffer.Sel_Type /= ByColumn then
                     Buffer.Sel_End.Col := 0;
                  end if;
               end if;
            end if;
            BottomRow := Sub (Buffer, BottomRow, 1);
            TopRow := Sub (Buffer, TopRow, 1);
            -- increment virtual rows used
            UpdateUsedRows (Buffer, Buffer.Virt_Used.Row, Updated);
            if Updated then
               UpdateScrollRanges (Buffer);
            end if;
         end loop;
         Buffer.Virt_Base.Row := TopRow;
         if Draw then
            if Scroll < Natural (Buffer.View_Size.Row) then
               BitBltDown (
                  Buffer, 
                  Rows => Scroll, 
                  BgColor => Style.BgColor);
               for Row in 0 .. Buffer.View_Size.Row - View_Row (Scroll) loop
                  DrawViewRow (Buffer, 0, Row);
               end loop;
               Redraw (Buffer.Panel, Redraw_Now => True);
            else
               DrawView (Buffer);
            end if;
         end if;
         UpdateScrollPositions (Buffer);
      end if;
   end BufferDown;


   -- ViewDown: Scroll the View down the specified number of rows
   --           (if possible). Returns number of rows actually Scrolled.
   procedure ViewDown (
         Buffer   : in out Scroll_Buffer;
         Rows     : in     Natural;
         Scrolled :    out Natural)
   is
      Scroll : Natural;
   begin
      -- calculate how far we can adjust the view down
      Scroll := Natural'Min (RowsBelowView (Buffer), Rows);
      if Scroll > 0 then
         -- Scroll
         Buffer.View_Base.Row := Buffer.View_Base.Row + Virt_Row (Scroll);
         if Buffer.ScreenAndView then
            Buffer.Scrn_Base.Row := Buffer.View_Base.Row;
         end if;
         if Scroll < Natural (Buffer.View_Size.Row) then
            BitBltUp (
               Buffer, 
               Rows => Scroll, 
               BgColor => Buffer.BlankStyle.BgColor);
            for Row in Buffer.View_Size.Row - View_Row (Scroll) 
                    .. Buffer.View_Size.Row - 1 loop
               DrawViewRow (Buffer, 0, Row);
            end loop;
            Redraw (Buffer.Panel, Redraw_Now => True);
         else
            DrawView (Buffer);
         end if;
         UpdateScrollPositions (Buffer);
      end if;
      Scrolled := Scroll;
   end ViewDown;


   -- ViewUp: Scroll the View up the specified number of rows.
   --         (if possible). Returns number of rows actually Scrolled.
   procedure ViewUp (
         Buffer   : in out Scroll_Buffer;
         Rows     : in     Natural;
         Scrolled :    out Natural)
   is
      Scroll : Natural;
   begin
      -- calculate how far we can adjust the view up
      Scroll := Natural'Min (Natural (Buffer.View_Base.Row), Rows);
      if Scroll > 0 then
         -- Scroll
         Buffer.View_Base.Row := Buffer.View_Base.Row - Virt_Row (Scroll);
         if Buffer.ScreenAndView then
            Buffer.Scrn_Base.Row := Buffer.View_Base.Row;
         end if;
         if Scroll < Natural (Buffer.View_Size.Row) then
            BitBltDown (
               Buffer, 
               Rows => Scroll, 
               BgColor => Buffer.BlankStyle.BgColor);
            for Row in 0 .. View_Row (Scroll) - 1 loop
               DrawViewRow (Buffer, 0, Row);
            end loop;
            Redraw (Buffer.Panel, Redraw_Now => True);
         else
            DrawView (Buffer);
         end if;
         UpdateScrollPositions (Buffer);
      end if;
      Scrolled := Scroll;
   end ViewUp;


   -- ViewRight: Scroll the View right the specified number of columns.
   procedure ViewRight (
         Buffer : in out Scroll_Buffer;
         Cols   : in     Natural := 1)
   is
      Scroll : Natural;
   begin
      -- calculate how far we can adjust the view right
      Scroll := Natural'Min (ColsRightOfView (Buffer), Cols);
      if Scroll > 0 then
         -- Scroll
         Buffer.View_Base.Col := Buffer.View_Base.Col + Virt_Col (Scroll);
         DrawView (Buffer);
      end if;
   end ViewRight;


   -- ViewLeft: Scroll the View left the specified number of columns.
   procedure ViewLeft (
         Buffer : in out Scroll_Buffer;
         Cols   : in     Natural := 1)
   is
      Scroll : Natural;
   begin
      -- calculate how far we can adjust the view left
      if Buffer.View_Base.Col > Buffer.Scrn_Base.Col then
         Scroll := Natural'Min (
            Natural (Buffer.View_Base.Col - Buffer.Scrn_Base.Col), 
            Cols);
         if Scroll > 0 then
            -- Scroll
            Buffer.View_Base.Col := Buffer.View_Base.Col - Virt_Col (Scroll);
            DrawView (Buffer);
         end if;
      end if;
   end ViewLeft;


   -- ScreenDown : Scroll the screen or region down the requested number
   --              of rows (if possible) and return the actual number
   --              of rows Scrolled (always zero if region scroll).
   --              Update view if any of screen is on view. Adjust
   --              view by a similar amount if requested. When regions 
   --              are in use, new blank cells are filled with the
   --              bg color specified in Style.
   procedure ScreenDown (
         Buffer     : in out Scroll_Buffer;
         Style      : in out Real_Cell;
         Rows       : in     Natural;
         Scrolled   :    out Natural;
         AdjustView : in     Boolean := False;
         Draw       : in     Boolean := True)
   is
      Scroll   : Natural;
      RealCol  : Real_Col;
      RealRow  : Real_Row;
      Double   : Boolean := False;
      Selected : Boolean := False;
   begin
      if Buffer.UseRegion then
         -- scroll only within region
         Scroll := Rows;
         for i in 1 .. Scroll loop
            if Natural (Buffer.Regn_Size.Col) 
            <  Natural (Buffer.Scrn_Size.Col) then
               -- region is not as wide as screen, so row size does not move
               -- with line, and we must cope with double width lines
               for RegnRow in 0 .. Buffer.Regn_Size.Row - 2 loop
                  RealRow  := Real (Buffer, RegnRow);
                  for RegnCol in 0 .. Buffer.Regn_Size.Col - 1 loop
                     RealCol  := Real (Buffer, RegnCol);
                     Double   := Double 
                              or DoubleWidth (Buffer, RealCol, RealRow);
                     Selected := Selected 
                              or Buffer.Real_Buffer (RealCol, RealRow).Selected;
                     MoveRegnCell (
                        Buffer, 
                        RegnCol, 
                        RegnRow + 1, 
                        RegnCol, 
                        RegnRow);
                  end loop;
               end loop;
               RealRow  := Real (Buffer, Buffer.Regn_Size.Row - 1);
               for RegnCol in 0 .. Buffer.Regn_Size.Col - 1 loop
                  RealCol  := Real (Buffer, RegnCol);
                  Double   := Double 
                           or DoubleWidth (Buffer, RealCol, RealRow);
                  Selected := Selected 
                           or Buffer.Real_Buffer (RealCol, RealRow).Selected;
                  FillRegnCell (
                     Buffer, 
                     RegnCol, 
                     Buffer.Regn_Size.Row - 1,
                     ' ', 
                     False,
                     Style);
               end loop;
            else
               -- region is as wide as screen, so row size moves with line,
               -- and we don't need to worry about double width lines
               for RegnRow in 0 .. Buffer.Regn_Size.Row - 2 loop
                  RealRow := Real (Buffer, RegnRow);
                  for RegnCol in 0 .. Buffer.Regn_Size.Col - 1 loop
                     RealCol  := Real (Buffer, RegnCol);
                     Selected := Selected 
                              or Buffer.Real_Buffer (RealCol, RealRow).Selected;
                     MoveRealCell (
                        Buffer, 
                        RealCol, 
                        Real (Buffer, RegnRow + 1), 
                        RealCol, 
                        RealRow, 
                        SaveSize => False);
                  end loop;
               end loop;
               RealRow := Real (Buffer, Buffer.Regn_Size.Row - 1);
               for RegnCol in 0 .. Buffer.Regn_Size.Col - 1 loop
                  RealCol  := Real (Buffer, RegnCol);
                  Selected := Selected 
                           or Buffer.Real_Buffer (RealCol, RealRow).Selected;
                  FillRealCell (
                     Buffer, 
                     Real (Buffer, RegnCol), 
                     RealRow,
                     ' ', 
                     False,
                     Style);
               end loop;
            end if;
            if Draw then
               -- now redraw the affected part of the view
               if Double or Selected then
                  -- some double lines or selected cells - cannot use bitblt
                  for Row in Regn_Row (0) .. Buffer.Regn_Size.Row - 1 loop
                     if OnView (Buffer, Real (Buffer, Row)) then
                        DrawViewRow (Buffer, 0, View (Buffer, Row));
                     end if;
                     Redraw (Buffer.Panel, Redraw_Now => True);
                  end loop;
               else
                  -- use bitblt
                  declare
                     FromCol : Virt_Col;
                     FromRow : Virt_Row;
                     ToCol   : Virt_Col;
                     ToRow   : Virt_Row;
                  begin
                     FromCol := Max (
                        Virt (Buffer, Regn_Col (0)), 
                        Virt (Buffer, View_Col (0)));
                     FromRow := Max (
                        Virt (Buffer, Regn_Row (0)), 
                        Virt (Buffer, View_Row (0)));
                     ToCol   := Min (
                        Virt (Buffer, Buffer.Regn_Size.Col - 1), 
                        Virt (Buffer, Buffer.View_Size.Col - 1));
                     ToRow   := Min (
                        Virt (Buffer, Buffer.Regn_Size.Row - 1), 
                        Virt (Buffer, Buffer.View_Size.Row - 1));
                     if FromCol <= ToCol and FromRow <= ToRow then
                        -- some screen was on view, so redraw that part of view
                        BitBltUp (
                           Buffer,
                           View (Buffer, FromCol),
                           View (Buffer, FromRow),
                           View (Buffer, ToCol),
                           View (Buffer, ToRow),
                           Rows => 1,
                           BgColor => Style.BgColor);
                        DrawViewRow (Buffer, 0, View (Buffer, ToRow));
                        Redraw (Buffer.Panel, Redraw_Now => True);
                     end if;
                  end;
               end if;
            end if;
         end loop;
      else
         -- scroll whole screen - calculate how far we can scroll screen down
         Scroll := Natural'Min (RowsBelowScreen (Buffer), Rows);
         if Scroll > 0 then
            for i in 1 .. Scroll loop
               -- scroll by adjusting screen base
               Buffer.Scrn_Base.Row := Buffer.Scrn_Base.Row + 1;
               -- make new cells use bf color of Style
               RealRow := Real (Buffer, Buffer.Scrn_Size.Row - 1);
               for ScrnCol in 0 .. Buffer.Scrn_Size.Col - 1 loop
                  RealCol  := Real (Buffer, ScrnCol);
                  FillRealCell (
                     Buffer, 
                     Real (Buffer, ScrnCol), 
                     RealRow,
                     ' ', 
                     False,
                     Style);
               end loop;
               -- view follows screen if they are locked together, or
               -- if we have been requested to adjust view as well
               if Buffer.ScreenAndView 
               or (AdjustView and RowsBelowView (Buffer) > 0) then
                  Buffer.View_Base.Row := Buffer.View_Base.Row + 1;
                  if Draw then
                     BitBltUp (
                        Buffer, 
                        Rows => 1, 
                        BgColor => Style.BgColor);
                     DrawViewRow (Buffer, 0, Buffer.View_Size.Row - 1);
                     Redraw (Buffer.Panel, Redraw_Now => True);
                  end if;
               end if;
               UpdateScrollRanges (Buffer);
            end loop;
            UpdateScrollPositions (Buffer);
         end if;
      end if;
      Scrolled := Scroll;
   end ScreenDown;


   -- ScreenUp : Scroll the screen or region up the requested number
   --            of rows (if possible) and return the actual number
   --            of rows scrolled (always zero if region scroll).
   --            Update view if any of screen is on view. Adjust
   --            view by a similar amount if requested. When regions 
   --            are in use, new blank cells are filled with the
   --            bg color specified in Style.           
   procedure ScreenUp (
         Buffer     : in out Scroll_Buffer;
         Style      : in out Real_Cell;
         Rows       : in     Natural;
         Scrolled   :    out Natural;
         AdjustView : in     Boolean := False;
         Draw       : in     Boolean := True)
   is
      Scroll   : Natural;
      RealCol  : Real_Col;
      RealRow  : Real_Row;
      Double   : Boolean := False;
      Selected : Boolean := False;
   begin
      if Buffer.UseRegion then
         -- scroll only within region
         Scroll := Rows;
         for i in 1 .. Scroll loop
            if Natural (Buffer.Regn_Size.Col) < Natural (Buffer.Scrn_Size.Col) 
            then
               -- region is not as wide as screen, so row size does not move
               -- with line, and we must cope with double width lines
               for RegnRow in reverse 1 .. Buffer.Regn_Size.Row - 1 loop
                  RealRow  := Real (Buffer, RegnRow);
                  for RegnCol in 0 .. Buffer.Regn_Size.Col - 1 loop
                     RealCol  := Real (Buffer, RegnCol);
                     Double   
                        := Double 
                           or DoubleWidth (Buffer, RealCol, RealRow);
                     Selected 
                        := Selected 
                           or Buffer.Real_Buffer (RealCol, RealRow).Selected;
                     MoveRegnCell (
                        Buffer, 
                        RegnCol, 
                        RegnRow - 1, 
                        RegnCol, 
                        RegnRow);
                  end loop;
               end loop;
               RealRow  := Real (Buffer, Regn_Row (0));
               for RegnCol in 0 .. Buffer.Regn_Size.Col - 1 loop
                  RealCol  := Real (Buffer, RegnCol);
                  Double   
                     := Double 
                        or DoubleWidth (Buffer, RealCol, RealRow);
                  Selected 
                     := Selected 
                        or Buffer.Real_Buffer (RealCol, RealRow).Selected;
                  FillRegnCell (
                     Buffer, 
                     RegnCol, 
                     0,
                     ' ', 
                     False,
                     Style);
               end loop;
            else
               -- region is as wide as screen, so row size moves with line,
               -- and we don't need to worry about double width lines
               for RegnRow in reverse 1 .. Buffer.Regn_Size.Row - 1 loop
                  RealRow := Real (Buffer, RegnRow);
                  for RegnCol in 0 .. Buffer.Regn_Size.Col - 1 loop
                     RealCol  := Real (Buffer, RegnCol);
                     Selected 
                        := Selected 
                           or Buffer.Real_Buffer (RealCol, RealRow).Selected;
                     MoveRealCell (
                        Buffer, 
                        RealCol, 
                        Real (Buffer, RegnRow - 1), 
                        RealCol, 
                        RealRow, 
                        SaveSize => False);
                  end loop;
               end loop;
               RealRow := Real (Buffer, Regn_Row (0));
               for RegnCol in 0 .. Buffer.Regn_Size.Col - 1 loop
                  RealCol  := Real (Buffer, RegnCol);
                  Selected 
                     := Selected 
                        or Buffer.Real_Buffer (RealCol, RealRow).Selected;
                  FillRealCell (
                     Buffer, 
                     Real (Buffer, RegnCol), 
                     RealRow,
                     ' ', 
                     False,
                     Style);
               end loop;
            end if;
            if Draw then
               -- now redraw the affected part of the view
               if Double or Selected then
                  -- some double lines or selected cells - cannot use bitblt
                  for Row in Regn_Row (0) .. Buffer.Regn_Size.Row - 1 loop
                     if OnView (Buffer, Real (Buffer, Row)) then
                        DrawViewRow (Buffer, 0, View (Buffer, Row));
                     end if;
                     Redraw (Buffer.Panel, Redraw_Now => True);
                  end loop;
               else
                  -- use bitblt
                  declare
                     FromCol : Virt_Col;
                     FromRow : Virt_Row;
                     ToCol   : Virt_Col;
                     ToRow   : Virt_Row;
                  begin
                     FromCol := Max (
                        Virt (Buffer, Regn_Col (0)), 
                        Virt (Buffer, View_Col (0)));
                     FromRow := Max (
                        Virt (Buffer, Regn_Row (0)), 
                        Virt (Buffer, View_Row (0)));
                     ToCol   := Min (
                        Virt (Buffer, Buffer.Regn_Size.Col - 1), 
                        Virt (Buffer, Buffer.View_Size.Col - 1));
                     ToRow   := Min (
                        Virt (Buffer, Buffer.Regn_Size.Row - 1), 
                        Virt (Buffer, Buffer.View_Size.Row - 1));
                     if FromCol <= ToCol and FromRow <= ToRow then
                        -- some screen was on view, so redraw that part of view
                        BitBltDown (
                           Buffer,
                           View (Buffer, FromCol),
                           View (Buffer, FromRow),
                           View (Buffer, ToCol),
                           View (Buffer, ToRow),
                           Rows => 1,
                           BgColor => Style.BgColor);
                        DrawViewRow (Buffer, 0, View (Buffer, FromRow));
                        Redraw (Buffer.Panel, Redraw_Now => True);
                     end if;
                  end;
               end if;
            end if;
         end loop;
      else
         -- scroll whole screen - calculate how far we can Scroll screen up
         Scroll := Natural'Min (Natural (Buffer.Scrn_Base.Row), Rows);
         if Scroll > 0 then
            for i in 1 .. Scroll loop
               -- scroll by adjusting screen base
               Buffer.Scrn_Base.Row := Buffer.Scrn_Base.Row - 1;
               -- make new cells use bf color of Style
               RealRow := Real (Buffer, Scrn_Row (0));
               for ScrnCol in 0 .. Buffer.Scrn_Size.Col - 1 loop
                  RealCol  := Real (Buffer, ScrnCol);
                  FillRealCell (
                     Buffer, 
                     Real (Buffer, ScrnCol), 
                     RealRow,
                     ' ', 
                     False,
                     Style);
               end loop;
               -- view follows screen if they are locked together, or
               -- if we have been requested to adjust view as well
               if Buffer.ScreenAndView 
               or (AdjustView and Buffer.View_Base.Row > 0) then
                  Buffer.View_Base.Row := Buffer.View_Base.Row - 1;
                  if Draw then
                     BitBltDown (
                        Buffer, 
                        Rows => 1, 
                        BgColor => Style.BgColor);
                     DrawViewRow (Buffer, 0, 0);
                     Redraw (Buffer.Panel, Redraw_Now => True);
                  end if;
               end if;
            end loop;
            UpdateScrollPositions (Buffer);
         end if;
      end if;
      Scrolled := Scroll;
   end ScreenUp;


   -- ShiftUp : Make the data appear to move up by
   --           moving the screen down (if possible),
   --           or the buffer up the specified
   --           number of rows. Does not adjust
   --           cursor position. Adjusts view
   --           as well if requested. Fill new cells
   --           with the bg color specified in Style.
   procedure ShiftUp (
         Buffer     : in out Scroll_Buffer;
         Style      : in out Real_Cell;
         Rows       : in     Natural := 1;
         AdjustView : in     Boolean := False;
         Draw       : in     Boolean := True)
   is
      Scroll : Natural;
   begin
      -- first scroll the screen down as far as we can
      ScreenDown (Buffer, Style, Rows, Scroll, AdjustView, Draw);
      if Scroll < Rows then
         -- we did not scroll screen down far enough,
         -- so scroll the buffer up as well
         BufferUp (Buffer, Style, Rows - Scroll, Draw);
      end if;
   end ShiftUp;


   -- ShiftDown : Make the data appear to move down by
   --             moving the screen up (if possible),
   --             or the buffer down the specified
   --             number of rows. Does not adjust
   --             cursor position. Adjusts view
   --             as well if requested. Fill new cells
   --             with the bg color specified in Style.
   procedure ShiftDown (
         Buffer     : in out Scroll_Buffer;
         Style      : in out Real_Cell;
         Rows       : in     Natural := 1;
         AdjustView : in     Boolean := False;
         Draw       : in     Boolean := True)
   is
      Scroll : Natural;
   begin
      -- first scroll the screen up as far as we can
      ScreenUp (Buffer, Style, Rows, Scroll, AdjustView, Draw);
      if Scroll < Rows then
         -- we did not scroll screen up far enough,
         -- so scroll the buffer down as well
         BufferDown (Buffer, Style, Rows - Scroll, Draw);
      end if;
   end ShiftDown;


   -- ShiftRight : Shift the data on the screen or region right the
   --              requested number of columns. Blank columns are
   --              added to the left, using the bg color specified
   --              in the Style. Update view if any of screen 
   --              is on view. Fill new cells with the bg color 
   --              specified in Style. 
   procedure ShiftRight (
         Buffer : in out Scroll_Buffer;
         Style  : in out Real_Cell;
         Cols   : in     Natural := 1;
         Draw   : in     Boolean := True)
   is
      FromCol  : Scrn_Col;
      FromRow  : Scrn_Row;
      ToCol    : Scrn_Col;
      ToRow    : Scrn_Row;
      RealCol  : Real_Col;
      RealRow  : Real_Row;
      DummyCol : Scrn_Col;
      DummyRow : Scrn_Row;
      Size     : Row_Size;
   begin
      if Buffer.UseRegion then
         -- shift only within region
         FromCol := Scrn (Buffer, Regn_Col (0));
         FromRow := Scrn (Buffer, Regn_Row (0));
         ToCol   := Buffer.Regn_Base.Col + Scrn_Col (Buffer.Regn_Size.Col - 1);
         ToRow   := Buffer.Regn_Base.Row + Scrn_Row (Buffer.Regn_Size.Row - 1);
      else
         -- shift whole screen
         FromCol := 0;
         FromRow := 0;
         ToCol   := Buffer.Scrn_Size.Col - 1;
         ToRow   := Buffer.Scrn_Size.Row - 1;
      end if;
      for i in 1 .. Cols loop
         for Row in FromRow .. ToRow loop
            RealRow := Real (Buffer, Row);
            RealCol := Real (Buffer, FromCol);
            if DoubleWidth (Buffer, RealCol, RealRow) then
               -- for double width, we must unscramble the line
               -- to shift and then rescramble the line
               Size := Buffer.Real_Buffer (RealCol, RealRow).Size;
               DummyCol := FromCol;
               DummyRow := Row;
               SingleWidthLine (Buffer, DummyCol, DummyRow);
               for RealCol in reverse Real (Buffer, FromCol) 
                                   .. Real (Buffer, ToCol) - 1 loop
                  MoveRealCell (Buffer, RealCol, RealRow, RealCol + 1, RealRow);
               end loop;
               FillRealCell (
                  Buffer, 
                  Real (Buffer, FromCol), 
                  RealRow,
                  ' ', 
                  False,
                  Style);
               DoubleWidthLine (Buffer, DummyCol, DummyRow, Size);
            else
               for RealCol in reverse Real (Buffer, FromCol) 
                                   .. Real (Buffer, ToCol) - 1 loop
                  MoveRealCell (Buffer, RealCol, RealRow, RealCol + 1, RealRow);
               end loop;
               FillRealCell (
                  Buffer, 
                  Real (Buffer, FromCol), 
                  RealRow,
                  ' ', 
                  False,
                  Style);
            end if;
            if Draw and OnView (Buffer, Row) then
               DrawViewRow (Buffer, 0, View (Buffer, Row));
            end if;
         end loop;
         if Draw then
            Redraw (Buffer.Panel, Redraw_Now => True);
         end if;
      end loop;
   end ShiftRight;


   -- ShiftLeft : Shift the data on the screen or region left the
   --             requested number of columns. Blank columns are
   --             added to the right using the bg color specified
   --             in the Style. Update view if any of screen 
   --             is on view. Fill new cells with the bg color 
   --             specified in Style. 
   procedure ShiftLeft (
         Buffer : in out Scroll_Buffer;
         Style  : in out Real_Cell;
         Cols   : in     Natural := 1;
         Draw   : in     Boolean := True)
   is
      FromCol  : Scrn_Col;
      FromRow  : Scrn_Row;
      ToCol    : Scrn_Col;
      ToRow    : Scrn_Row;
      RealCol  : Real_Col;
      RealRow  : Real_Row;
      DummyCol : Scrn_Col;
      DummyRow : Scrn_Row;
      Size     : Row_Size;
   begin
      if Buffer.UseRegion then
         -- shift only within region
         FromCol := Scrn (Buffer, Regn_Col (0));
         FromRow := Scrn (Buffer, Regn_Row (0));
         ToCol   := Buffer.Regn_Base.Col + Scrn_Col (Buffer.Regn_Size.Col - 1);
         ToRow   := Buffer.Regn_Base.Row + Scrn_Row (Buffer.Regn_Size.Row - 1);
      else
         -- shift whole screen
         FromCol := 0;
         FromRow := 0;
         ToCol   := Buffer.Scrn_Size.Col - 1;
         ToRow   := Buffer.Scrn_Size.Row - 1;
      end if;
      for i in 1 .. Cols loop
         for Row in FromRow .. ToRow loop
            RealRow := Real (Buffer, Row);
            RealCol := Real (Buffer, FromCol);
            if DoubleWidth (Buffer, RealCol, RealRow) then
               -- for double width, we must unscramble the line
               -- to shift and then rescramble the line
               Size := Buffer.Real_Buffer (RealCol, RealRow).Size;
               DummyCol := FromCol;
               DummyRow := Row;
               SingleWidthLine (Buffer, DummyCol, DummyRow);
               for RealCol in Real (Buffer, FromCol) 
                           .. Real (Buffer, ToCol) - 1 loop
                  MoveRealCell (Buffer, RealCol + 1, RealRow, RealCol, RealRow);
               end loop;
               FillRealCell (
                  Buffer, 
                  Real (Buffer, ToCol), 
                  RealRow,
                  ' ', 
                  False,
                  Style);
               DoubleWidthLine (Buffer, DummyCol, DummyRow, Size);
            else
               for RealCol in Real (Buffer, FromCol) 
                           .. Real (Buffer, ToCol) - 1 loop
                  MoveRealCell (Buffer, RealCol + 1, RealRow, RealCol, RealRow);
               end loop;
               FillRealCell (
                  Buffer, 
                  Real (Buffer, ToCol), 
                  RealRow, 
                  ' ', 
                  False,
                  Style);
            end if;
            if Draw and OnView (Buffer, Row) then
               DrawViewRow (Buffer, 0, View (Buffer, Row));
            end if;
         end loop;
         if Draw then
            Redraw (Buffer.Panel, Redraw_Now => True);
         end if;
      end loop;
   end ShiftLeft;


   -- PutOnScreen : Scroll screen up or down to get the specified
   --               real row on screen. Returns amount Scrolled.
   procedure PutOnScreen (
         Buffer   : in out Scroll_Buffer;
         Row      : in     Real_Row;
         Scrolled :   out Integer)
   is
      Scroll : Integer := 0;
      Moved  : Natural := 0;
   begin
      Scroll := CalculateScreenScroll (Buffer, Virt (Buffer, Row));
      if Scroll > 0 then
         ScreenDown (Buffer, Buffer.BlankStyle, Natural (Scroll), Moved);
         Scrolled := Moved;
      elsif Scroll < 0 then
         ScreenUp (Buffer, Buffer.BlankStyle, Natural (-Scroll), Moved);
         Scrolled := -Moved;
      else
         Scrolled := 0;
      end if;
   end PutOnScreen;


   -- PutOnView : Scroll view up or down to get the specified
   --             screen row on view. Returns amount Scrolled.
   procedure PutOnView (
         Buffer   : in out Scroll_Buffer;
         Row      : in     Virt_Row;
         Scrolled :    out Integer)
   is
      Scroll   : Integer := 0;
      Moved    : Natural := 0;
   begin
      Scroll := CalculateViewScroll (Buffer, Row);
      if Scroll > 0 then
         ViewDown (Buffer, Natural (Scroll), Moved);
         Scrolled := Moved;
      elsif Scroll < 0 then
         ViewUp (Buffer, Natural (-Scroll), Moved);
         Scrolled := -Moved;
      else
         Scrolled := 0;
      end if;
   end PutOnView;


   -- UpdateSelection : update current selection, given a new
   --                   end position. State can be to set the
   --                   selection, or unset it.
   procedure UpdateSelection (
         Buffer    : in out Scroll_Buffer;
         NewEndPos : in     Real_Pos;
         State     : in     Boolean)
   is

      StartRow : Virt_Row;
      StartCol : Virt_Col;
      EndRow   : Virt_Row;
      EndCol   : Virt_Col;
      FirstRow : Virt_Row;
      LastRow  : Virt_Row;
      Char     : Character;

      -- SelectByColumn : Caller must ensure that
      --                  (StartCol < EndCol) and (StartRow < EndRow)
      procedure SelectByColumn (
            Buffer   : in out Scroll_Buffer;
            StartCol : in     Virt_Col;
            StartRow : in     Virt_Row;
            EndCol   : in     Virt_Col;
            EndRow   : in     Virt_Row;
            State    : in     Boolean)
      is
      begin
         for Row in StartRow .. EndRow loop
            for Col in StartCol .. EndCol loop
               Buffer.Real_Buffer (
                     Real (Buffer, Col), 
                     Real (Buffer, Row)).Selected 
                  := State;
            end loop;
         end loop;
      end SelectByColumn;

      -- SelectByRow : Caller must ensure that
      --               (StartCol, StartRow) < (EndCol, EndRow)
      procedure SelectByRow (
            Buffer   : in out Scroll_Buffer;
            StartCol : in     Virt_Col;
            StartRow : in     Virt_Row;
            EndCol   : in     Virt_Col;
            EndRow   : in     Virt_Row;
            State    : in     Boolean)
      is
         Col : Virt_Col := StartCol;
         Row : Virt_Row := StartRow;
      begin
         while (Row < EndRow) or (Row = EndRow and Col <= EndCol) loop
            Buffer.Real_Buffer (
                  Real (Buffer, Col), 
                  Real (Buffer, Row)).Selected 
               := State;
            Col := Col + 1;
            if Col > Buffer.Virt_Used.Col - 1 then
               Col := 0;
               Row := Row + 1;
            end if;
         end loop;
      end SelectByRow;

   begin
      -- undo previous selection (if there was one)
      if Buffer.Sel_Valid then
         if Buffer.Sel_Type = ByLine then
            StartCol := 0;
            StartRow := Min (
               Virt (Buffer, Buffer.Sel_Start.Row), 
               Virt (Buffer, Buffer.Sel_End.Row));
            EndCol   := Buffer.Virt_Used.Col - 1;
            EndRow   := Max (
               Virt (Buffer, Buffer.Sel_Start.Row), 
               Virt (Buffer, Buffer.Sel_End.Row));
            -- otherwise same as by column
            SelectByColumn (Buffer, StartCol, StartRow, EndCol, EndRow, False);
         elsif Buffer.Sel_Type = ByColumn then
            StartCol := Min (
               Virt (Buffer, Buffer.Sel_Start.Col), 
               Virt (Buffer, Buffer.Sel_End.Col));
            StartRow := Min (
               Virt (Buffer, Buffer.Sel_Start.Row), 
               Virt (Buffer, Buffer.Sel_End.Row));
            EndCol   := Max (
               Virt (Buffer, Buffer.Sel_Start.Col), 
               Virt (Buffer, Buffer.Sel_End.Col));
            EndRow   := Max (
               Virt (Buffer, Buffer.Sel_Start.Row), 
               Virt (Buffer, Buffer.Sel_End.Row));
            SelectByColumn (Buffer, StartCol, StartRow, EndCol, EndRow, False);
         else
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
            SelectByRow (Buffer, StartCol, StartRow, EndCol, EndRow, False);
         end if;
         -- remember first and last affected rows
         FirstRow := StartRow;
         LastRow  := EndRow;
      end if;
      -- draw new selection
      if Buffer.Sel_Type = ByColumn then
         -- ensure (StartCol < EndCol) and (StartRow < EndRow)
         StartCol := Min (
            Virt (Buffer, Buffer.Sel_Start.Col), 
            Virt (Buffer, NewEndPos.Col));
         StartRow := Min (
            Virt (Buffer, Buffer.Sel_Start.Row), 
            Virt (Buffer, NewEndPos.Row));
         EndCol   := Max (
            Virt (Buffer, Buffer.Sel_Start.Col), 
            Virt (Buffer, NewEndPos.Col));
         EndRow   := Max (
            Virt (Buffer, Buffer.Sel_Start.Row), 
            Virt (Buffer, NewEndPos.Row));
         SelectByColumn (Buffer, StartCol, StartRow, EndCol, EndRow, State);
         -- update end of selection
         Buffer.Sel_End := NewEndPos;
      else
         -- ensure (StartCol, StartRow) < (EndCol, EndRow)
         if Less_Than (Buffer, Buffer.Sel_Start, NewEndPos) then
            StartCol := Virt (Buffer, Buffer.Sel_Start.Col);
            StartRow := Virt (Buffer, Buffer.Sel_Start.Row);
            EndCol   := Virt (Buffer, NewEndPos.Col);
            EndRow   := Virt (Buffer, NewEndPos.Row);
            if Buffer.Sel_Type = ByLine then
               -- selection is entire line
               StartCol := 0;
               EndCol   := Buffer.Virt_Used.Col - 1;
            elsif Buffer.Sel_Type = ByWord then
               -- extend start and end of selection to word boundaries
               Char := Buffer.Real_Buffer (
                          Real (Buffer, StartCol), 
                          Real (Buffer, StartRow)).Char;
               if not ACH.Is_Alphanumeric (Char) then
                  while StartCol > 0
                  and then Char =
                     Buffer.Real_Buffer (
                        Real (Buffer, StartCol - 1), 
                        Real (Buffer, StartRow)).Char
                  loop
                     StartCol := StartCol - 1;
                  end loop;
               else
                  while StartCol > 0
                  and then ACH.Is_Alphanumeric (
                     Buffer.Real_Buffer (Real (Buffer, StartCol - 1), 
                     Real (Buffer, StartRow)).Char)
                  loop
                     StartCol := StartCol - 1;
                  end loop;
               end if;
               Char := Buffer.Real_Buffer (
                  Real (Buffer, EndCol), 
                  Real (Buffer, EndRow)).Char;
               if not ACH.Is_Alphanumeric (Char) then
                  while EndCol < Buffer.Virt_Used.Col - 1
                  and then Char =
                     Buffer.Real_Buffer (
                        Real (Buffer, EndCol + 1), 
                        Real (Buffer, EndRow)).Char
                  loop
                     EndCol := EndCol + 1;
                  end loop;
               else
                  while EndCol < Buffer.Virt_Used.Col - 1
                  and then ACH.Is_Alphanumeric (
                     Buffer.Real_Buffer (
                        Real (Buffer, EndCol + 1), 
                        Real (Buffer, EndRow)).Char)
                  loop
                     EndCol := EndCol + 1;
                  end loop;
               end if;
            end if;
            -- update start and end of selection
            Buffer.Sel_Start 
               := (Real (Buffer, StartCol), Real (Buffer, StartRow));
            Buffer.Sel_End   
               := (Real (Buffer, EndCol), Real (Buffer, EndRow));
         else
            StartCol := Virt (Buffer, NewEndPos.Col);
            StartRow := Virt (Buffer, NewEndPos.Row);
            EndCol   := Virt (Buffer, Buffer.Sel_Start.Col);
            EndRow   := Virt (Buffer, Buffer.Sel_Start.Row);
            if Buffer.Sel_Type = ByLine then
               -- selection is entire line
               StartCol := 0;
               EndCol   := Buffer.Virt_Used.Col - 1;
            elsif Buffer.Sel_Type = ByWord then
               Char 
                  := Buffer.Real_Buffer (
                        Real (Buffer, StartCol), 
                        Real (Buffer, StartRow)).Char;
               if not ACH.Is_Alphanumeric (Char) then
                  while StartCol > 0
                  and then Char =
                     Buffer.Real_Buffer (
                        Real (Buffer, StartCol - 1), 
                        Real (Buffer, StartRow)).Char
                  loop
                     StartCol := StartCol - 1;
                  end loop;
               else
                  while StartCol > 0
                  and then ACH.Is_Alphanumeric (
                     Buffer.Real_Buffer (
                        Real (Buffer, StartCol - 1), 
                        Real (Buffer, StartRow)).Char)
                  loop
                     StartCol := StartCol - 1;
                  end loop;
               end if;
               Char := Buffer.Real_Buffer (
                  Real (Buffer, EndCol), 
                  Real (Buffer, EndRow)).Char;
               if not ACH.Is_Alphanumeric (Char) then
                  while EndCol < Buffer.Virt_Used.Col - 1
                  and then Char =
                     Buffer.Real_Buffer (
                        Real (Buffer, EndCol + 1), 
                        Real (Buffer, EndRow)).Char
                  loop
                     EndCol := EndCol + 1;
                  end loop;
               else
                  while Scrn_Col (EndCol) < Buffer.Scrn_Size.Col - 1
                  and then ACH.Is_Alphanumeric (
                     Buffer.Real_Buffer (
                        Real (Buffer, EndCol + 1), 
                        Real (Buffer, EndRow)).Char)
                  loop
                     EndCol := EndCol + 1;
                  end loop;
               end if;
            end if;
            -- update start and end of selection
            Buffer.Sel_Start 
               := (Real (Buffer, EndCol), Real (Buffer, EndRow));
            Buffer.Sel_End   
               := (Real (Buffer, StartCol), Real (Buffer, StartRow));
         end if;
         SelectByRow (Buffer, StartCol, StartRow, EndCol, EndRow, State);
      end if;
      -- update first and last affected rows
      if Buffer.Sel_Valid then
         FirstRow := Min (FirstRow, StartRow);
         LastRow  := Max (LastRow, EndRow);
      else
         FirstRow := StartRow;
         LastRow  := EndRow;
      end if;
      -- redraw affected rows
      for Row in FirstRow .. LastRow loop
         if OnView (Buffer, Real (Buffer, Row)) then
            DrawViewRow (Buffer, 0, View (Buffer, Row));
         end if;
      end loop;
      Redraw (Buffer.Panel, Redraw_Now => True);
   end UpdateSelection;


   -- NullSelection : remove any current selection
   procedure NullSelection (
         Buffer : in out Scroll_Buffer)
   is
   begin
      if Buffer.Sel_Valid then
         UpdateSelection (Buffer, Buffer.Sel_End, False);
         Buffer.Sel_Valid := False;
      end if;
   end NullSelection;


   -- ConvertCoordsToReal : Convert mouse (X, Y) to real buffer position.
   --                       Scroll view up or down if appropriate.
   procedure ConvertCoordsToReal (
         Buffer  : in out Scroll_Buffer;
         X       : in     Integer;
         Y       : in     Integer;
         RealPos : in out Real_Pos)
   is
      Scroll : Natural;
   begin
      if X < 0 then
         RealPos.Col := Real (Buffer, View_Col (0));
      elsif X >= Integer (Buffer.View_Size.Col) * Buffer.CellSize.Width then
         RealPos.Col := Real (Buffer, Buffer.View_Size.Col - 1);
      else
         RealPos.Col := Real (Buffer, View_Col (X / Buffer.CellSize.Width));
      end if;
      if Y < 0 then
         ViewUp (Buffer, 1, Scroll);
         RealPos.Row := Real (Buffer, View_Row (0));
      elsif Y >= Integer (Buffer.View_Size.Row) * Buffer.CellSize.Height then
         ViewDown (Buffer, 1, Scroll);
         RealPos.Row := Real (Buffer, Buffer.View_Size.Row - 1);
      else
         RealPos.Row := Real (Buffer, View_Row (Y / Buffer.CellSize.Height));
      end if;
      if DoubleWidth (Buffer, RealPos.Col, RealPos.Row)
      and then RealPos.Col mod 2 /= 0 then
         RealPos.Col := RealPos.Col - 1;
      end if;
   end ConvertCoordsToReal;


   -- StartSelection : Start a selection of the specified type.
   --                : Used in processing mouse clicks.
   --                : Start capturing the mouse.
   procedure StartSelection (
         Buffer    : in out Scroll_Buffer;
         Selection : in     Selection_Type;
         RealPos   : in     Real_Pos)
   is
   begin
      Buffer.Sel_Start := RealPos;
      Buffer.Sel_Type  := Selection;
      UpdateSelection (Buffer, Buffer.Sel_Start, True);
      Buffer.Sel_Valid := True;
      Buffer.Selecting := True;
      Capture_Mouse (Buffer.Panel);
   end StartSelection;


   -- ExtendSelection : Extend a selection, possibly changing the
   --                   selection type. Used in processing clicks.
   --                   Also starts capturing the mouse, so we can
   --                   update the selection when the mouse moves
   --                   outside the client area.
   procedure ExtendSelection (
         Buffer    : in out Scroll_Buffer;
         Selection : in     Selection_Type;
         RealPos   : in     Real_Pos)
   is
   begin
      Buffer.Sel_Type  := Selection;
      UpdateSelection (Buffer, RealPos, True);
      Buffer.Selecting := True;
      Buffer.Sel_Valid := True;
      Capture_Mouse (Buffer.Panel);
   end ExtendSelection;


   -- AlreadySelected : True if single character already selected.
   --                   This can affect the behaviour of a click.
   function AlreadySelected (
         Buffer  : in     Scroll_Buffer;
         RealPos : in     Real_Pos)
     return Boolean is
   begin
      return Buffer.Sel_Valid 
      and   (Buffer.Sel_Start = Buffer.Sel_End) 
      and   (Buffer.Sel_Start = RealPos);
   end AlreadySelected;


   -- StartSelectionCycle : Start a new selection, cycling
   --                       through selection types.
   procedure StartSelectionCycle (
         Buffer  : in out Scroll_Buffer;
         Keys    : in     GWindows.Windows.Mouse_Key_States;
         RealPos : in     Real_Pos)
   is
   begin
      if Keys (GWindows.Windows.Control) then
         -- start column selection
         StartSelection (Buffer, ByColumn, RealPos);
      elsif Keys (GWindows.Windows.Shift) then
         StartSelection (Buffer, Buffer.Sel_Type, RealPos);
      else
         -- cycle selection type
         if Buffer.Sel_Type = ByLine then
            NullSelection (Buffer);
         elsif Buffer.Sel_Type = ByWord then
            StartSelection (Buffer, ByLine, RealPos);
         elsif Buffer.Sel_Type = ByRow then
            StartSelection (Buffer, ByWord, RealPos);
         else
            if AlreadySelected (Buffer, RealPos) then
               NullSelection (Buffer);
            else
               StartSelection (Buffer, ByRow, RealPos);
            end if;
         end if;
      end if;
   end StartSelectionCycle;


   -- ExtendSelectionCycle : Extend a selection, cycling
   --                        through selection types.
   procedure ExtendSelectionCycle (
         Buffer  : in out Scroll_Buffer;
         Keys    : in     GWindows.Windows.Mouse_Key_States;
         RealPos : in     Real_Pos)
   is
   begin
      if Keys (GWindows.Windows.Control) then
         -- extend column selection
         ExtendSelection (Buffer, ByColumn, RealPos);
      elsif Keys (GWindows.Windows.Shift) then
         -- cycle selection type
         if Buffer.Sel_Type = ByLine then
            NullSelection (Buffer);
         elsif Buffer.Sel_Type = ByWord then
            ExtendSelection (Buffer, ByLine, RealPos);
         elsif Buffer.Sel_Type = ByRow then
            ExtendSelection (Buffer, ByWord, RealPos);
         else
            if AlreadySelected (Buffer, RealPos) then
               NullSelection (Buffer);
            else
               ExtendSelection (Buffer, ByRow, RealPos);
            end if;
         end if;
      end if;
   end ExtendSelectionCycle;


   -- ResizeView : Set view to the specified size. The view
   --              cannot be bigger than the current screen
   --              size. If the view cannot be made as large
   --              as requested, make it as large as possible.
   procedure ResizeView (
         Buffer   : in out Scroll_Buffer;
         Cols     : in     Natural;
         Rows     : in     Natural;
         SetView  : in     Boolean := False)
   is
      use GWindows.Application;
      use GWindows.Metrics;

      function Metric (Index : Integer) return Integer
         renames Get_System_Metric;

      ViewCols : View_Col;
      ViewRows : View_Row;
      Width    : Integer;
      Height   : Integer;
   begin
      if Cols > 0 and Rows > 0 then
         ViewCols := Min (View_Col (Cols), View_Col (Buffer.Scrn_Size.Col));
         ViewRows := Min (View_Row (Rows), View_Row (Buffer.Scrn_Size.Row));
         Width    := Buffer.CellSize.Width * Integer (ViewCols);
         Height   := Buffer.CellSize.Height * Integer (ViewRows);
         -- make sure there is space left for Scrollbar
         Width := Integer'Min (
                     Width,
                     Desktop_Width - Metric (SM_CXVSCROLL));
         -- make sure there is space for scrollbar, title bar
         -- and main menu
         Height := Integer'Min (
                      Height,
                      Desktop_Height
                         - Metric (SM_CYHSCROLL)
                         - Metric (SM_CYMENU)
                         - Metric (SM_CYCAPTION));
         ViewCols  := Min (
            ViewCols, 
            View_Col (Width / Buffer.CellSize.Width));
         ViewRows  := Min (
            ViewRows, 
            View_Row (Height / Buffer.CellSize.Height));
         Buffer.View_Size := (ViewCols, ViewRows);
         -- I don't know why, but it is necessary to do this twice:
         ResizeClientArea (Buffer);
         ResizeClientArea (Buffer);
         UpdateScrollPositions (Buffer);
         DrawView (Buffer);
      end if;
   end ResizeView;


   -- ResizeScreen : Set screen to the specified size. Default
   --                is not to adjust the view size unless the
   --                screen and view are locked, or the new
   --                screen would be smaller than the current view.
   --                This can be overridden by the SetView flag.
   procedure ResizeScreen (
         Buffer   : in out Scroll_Buffer;
         Cols     : in     Natural;
         Rows     : in     Natural;
         SetView  : in     Boolean := False)
   is
      use GWindows.Application;

      CursRowOnView : Boolean;
      LastRowOnView : Boolean;
      LastViewRow   : Virt_Row;
      Scrolled      : Integer;
      VirtCols      : Virt_Col;
      VirtRows      : Virt_Row;
      ScrnCols      : Scrn_Col;
      ScrnRows      : Scrn_Row;
      ViewCols      : View_Col;
      ViewRows      : View_Row;
      ChangeView    : Boolean := SetView;

   begin
      if Cols > 0 and Rows > 0 then
         VirtCols := Min (Virt_Col (Cols), Virt_Col (MAX_COLUMNS));
         VirtRows := Max (
            Virt_Row (Buffer.Scrn_Size.Row), 
            Virt_Row (Buffer.Real_Used.Row));
         VirtRows := Min (VirtRows, Virt_Row (MAX_ROWS));
         ScrnCols := Min (Scrn_Col (Cols), Scrn_Col (MAX_COLUMNS));
         ScrnRows := Min (Scrn_Row (Rows), Scrn_Row (MAX_ROWS));
         if Buffer.ScreenAndView or ChangeView then
            -- new view size will be the same as the new screen size
            ViewCols := View_Col (ScrnCols);
            ViewRows := View_Row (ScrnRows);
         else
            -- new view size cannot end up larger than new screen size,
            -- but it can stay smaller
            ViewCols := Min (Buffer.View_Size.Col, View_Col (ScrnCols));
            ViewRows := Min (Buffer.View_Size.Row, View_Row (ScrnRows));
            if ViewRows /= Buffer.View_Size.Row 
            or ViewCols /= Buffer.View_Size.Col then
               -- current view size is bigger than new screen size,
               -- so we must change it as well
               ChangeView := True;
            end if;
         end if;
         CursRowOnView := OnView (Buffer, Buffer.Input_Curs.Row);
         LastRowOnView := OnView (Buffer, Buffer.Scrn_Size.Row - 1);
         LastViewRow   := Virt (Buffer, Buffer.View_Size.Row - 1);
         NullSelection (Buffer);
         Buffer.EnableResize := False;
         Resize (
            Buffer,
            VirtCols,
            VirtRows,
            ScrnCols,
            ScrnRows,
            ViewCols,
            ViewRows,
            Buffer.OutputStyle);
         UpdateScrollRanges (Buffer);
         if Buffer.ScreenAndView then
            Buffer.Scrn_Base.Row := Buffer.View_Base.Row;
         else
            -- perform view row adjustments - order is largely a
            -- matter of taste, but we should keep significant rows
            -- on the view during resizing. We must do at least
            -- on of these to make sure the view is valid.
            if CursRowOnView then
               PutOnView (
                  Buffer, 
                  Virt (Buffer, Buffer.Input_Curs.Row), 
                  Scrolled);
            elsif LastRowOnView then
               PutOnView (
                  Buffer, 
                  Virt (Buffer, Buffer.Scrn_Size.Row - 1), 
                  Scrolled);
            else
               PutOnView (Buffer, LastViewRow, Scrolled);
            end if;
         end if;
         UpdateScrollPositions (Buffer);
         if Buffer.ScreenAndView or ChangeView then
            -- also change view size
            ResizeView (Buffer, Natural (ViewCols), Natural (ViewRows));
         else
            DrawScreen (Buffer);
         end if;
      end if;
   end ResizeScreen;

   -- VerticalScrollbar : Enable or disable vertical scroll bar.
   procedure VerticalScrollbar (
         Buffer  : in out Scroll_Buffer;
         Visible : in     Option)
   is
   begin
      -- The following line stops the processing WM_SIZE messages
      -- resulting from this routine. This is to stop Windows
      -- incorrectly calculating the size of the Client Area.
      -- Processing of WM_SIZE messages is resumed after all
      -- outstanding Windows messages have been processed.
      Buffer.EnableResize := False;
      if Visible = Yes then
         Buffer.VertScrollbar := True;
      elsif Visible = No then
         Buffer.VertScrollbar := False;
      end if;
      if Buffer.VertScrollbar then
         Scroll_Range (Buffer.Panel, GWindows.Windows.Vertical, 0, 0);
         Scroll_Position (Buffer.Panel, GWindows.Windows.Vertical, 0);
         Scroll_Page_Size (
            Buffer.Panel,
            GWindows.Windows.Vertical,
            Integer (Buffer.View_Size.Row));
         Vertical_Scroll_Bar (Buffer.Panel, State => True);
         UpdateScrollRanges (Buffer);
         UpdateScrollPositions (Buffer);
      else
         Vertical_Scroll_Bar (Buffer.Panel, State => False);
      end if;
   end VerticalScrollbar;


   -- HorizontalScrollbar : Enable or disable horizontal scroll bar.
   procedure HorizontalScrollbar (
         Buffer  : in out Scroll_Buffer;
         Visible : in     Option)
   is
   begin
      -- The following line stops the processing of WM_SIZE messages
      -- resulting from this routine. This is to stop Windows
      -- incorrectly calculating the size of the Client Area.
      -- Processing of WM_SIZE messages is resumed after all
      -- outstanding Windows messages have been processed.
      Buffer.EnableResize := False;
      if Visible = Yes then
         Buffer.HorzScrollbar := True;
      elsif Visible = No then
         Buffer.HorzScrollbar := False;
      end if;
      if Buffer.HorzScrollbar then
         Scroll_Range (Buffer.Panel, GWindows.Windows.Horizontal, 0, 0);
         Scroll_Position (Buffer.Panel, GWindows.Windows.Horizontal, 0);
         Scroll_Page_Size (
            Buffer.Panel,
            GWindows.Windows.Horizontal,
            Integer (Buffer.View_Size.Row));
         Horizontal_Scroll_Bar (Buffer.Panel, State => True);
         UpdateScrollRanges (Buffer);
         UpdateScrollPositions (Buffer);
      else
         Horizontal_Scroll_Bar (Buffer.Panel, State => False);
      end if;
   end HorizontalScrollbar;


   -- WindowSizing : Change the Sizing option.
   procedure WindowSizing (
         Buffer   : in out Scroll_Buffer;
         Sizing   : in     Option)
   is
   begin
      -- The following line stops the processing of WM_SIZE messages
      -- resulting from this routine. This is to stop Windows
      -- incorrectly calculating the size of the Client Area.
      -- Processing of WM_SIZE messages is resumed after all
      -- outstanding Windows messages have been processed.
      Buffer.EnableResize := False;
      if Sizing = Yes then
         Buffer.SizingOn := True;
      elsif Sizing = No then
         Buffer.SizingOn := False;
      end if;
      Sizable (Buffer.Panel, Buffer.SizingOn);
   end WindowSizing;


   -- WindowCaption : Change the Title option.
   procedure WindowCaption (
         Buffer : in out Scroll_Buffer;
         Title  : in     Option)
   is
   begin
      -- The following line stops the processing of WM_SIZE messages
      -- resulting from this routine. This is to stop Windows
      -- incorrectly calculating the size of the Client Area.
      -- Processing of WM_SIZE messages is resumed after all
      -- outstanding Windows messages have been processed.
      Buffer.EnableResize := False;
      if Title = Yes then
         Buffer.TitleOn := True;
      elsif Title = No then
         Buffer.TitleOn := False;
      end if;
      Caption (Buffer.Panel, Buffer.TitleOn);
   end WindowCaption;


   procedure New_Keyboard_Buffer (
         Buffer : in out Scroll_Buffer)
   is
   begin
      Buffer.KeyBuff := new Keyboard_Buffer (0 .. Buffer.KeySize);
   end New_Keyboard_Buffer;


   procedure Free_Keyboard_Buffer (
         Buffer   : in out Scroll_Buffer)
   is
      procedure Free is new Ada.Unchecked_Deallocation (
         Keyboard_Buffer, 
         Keyboard_Buffer_Access);
   begin
      Free (Buffer.KeyBuff);
   end Free_Keyboard_Buffer;



end Scroll_Buffer;
