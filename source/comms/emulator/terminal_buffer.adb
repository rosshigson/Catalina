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

with System;                      use System;
with GNAT.OS_Lib;
with GWindows.Types;
with GWindows.Windows;
with GWindows.Drawing;
with GWindows.Application;
with GWindows.Message_Boxes;
with GWindows.Key_States;
with GWindows.Metrics;
with GWindows.Colors;
with Font_Maps;
with Terminal_Internal_Types;
with Terminal_Dialogs;
with Win32;
with Win32.Winbase;
with Win32_Support;

with FYModem;

with Real_Buffer;

package body Terminal_Buffer is

   use Terminal_Internal_Types;
   use Font_Maps;

   package WB renames Win32.Winbase;
   package WS  renames Win32_Support;
   package GT  renames GWindows.Types;


   DEBUG_KEYS : constant Boolean := False;


   -- GetFromBuffer : Get a char from the PutBuffer.
   procedure GetfromBuffer (
         Buffer  : in out Terminal_Buffer;
         Char    :    out Character;
         Removed :    out Boolean) is
   begin
      if Buffer.PutStart /= Buffer.PutFinish then
         -- get the character from the start of the put buffer
         Char := Buffer.PutBuffer (Buffer.PutStart);
         Buffer.PutStart
            := (Buffer.PutStart + 1) mod (PUT_CHAR_BUFF_SIZE + 1);
         Removed := True;
      else
         Removed := False;
      end if;
   end GetfromBuffer;


   -- PutToBuffer : Put a char to the PutBuffer.
   procedure PutToBuffer (
         Buffer : in out Terminal_Buffer;
         Char   : in     Character;
         Added  :    out Boolean) is
   begin
      if (Buffer.PutFinish - Buffer.PutStart) mod (PUT_CHAR_BUFF_SIZE + 1)
            < PUT_CHAR_BUFF_SIZE then
         -- add the character to the end of the put buffer
         Buffer.PutBuffer (Buffer.PutFinish) := Char;
         Buffer.PutFinish
            := (Buffer.PutFinish + 1) mod (PUT_CHAR_BUFF_SIZE + 1);
         Added := True;
      else
         Added := False;
      end if;
   end PutToBuffer;


   -- ProcessPutBuffer : process the put buffer by putting each
   --                    character that has been buffered.
   procedure ProcessPutBuffer (
         Buffer       : in out Terminal_Buffer;
         HandleCursor : in     Boolean := True)
   is
      Removed  : Boolean;
      Char     : Character;
      Cursdone : Boolean   := False;
      PutChars : Boolean   := False;
   begin
      Buffer.PutProtect.Acquire;
      loop
         GetfromBuffer (Buffer, Char, Removed);
         exit when not Removed;
         if HandleCursor and not Cursdone then
            UndrawCursor (Buffer);
            Cursdone := True;
         end if;
         if Buffer.SingleCursor then
            -- use input cursor and output style
            ProcessChar (
               Buffer,
               Buffer.Input_Curs.Col,
               Buffer.Input_Curs.Row,
               Buffer.WrapNextIn,
               Char,
               Buffer.OutputStyle,
               Input => False);
         else
            -- use output cursor and outputstyle
            ProcessChar (
               Buffer,
               Buffer.Output_Curs.Col,
               Buffer.Output_Curs.Row,
               Buffer.WrapNextOut,
               Char,
               Buffer.OutputStyle,
               Input => False);
         end if;
         PutChars := True;
      end loop;
      Buffer.PutProtect.Release;
      if HandleCursor and Cursdone then
         if Buffer.CursVisible
         and not Buffer.CursDrawn
         and not Buffer.Selecting then
            if (Buffer.CursFlashing and not Buffer.CursFlashOff)
            or else not Buffer.CursFlashing then
               DrawCursor (Buffer);
            end if;
         end if;
      end if;
      if PutChars then
         Redraw (Buffer.Panel);
      end if;
   end ProcessPutBuffer;


   procedure Do_Vertical_Scroll (
         Buffer  : in out Terminal_Buffer;
         Window  : in out GWindows.Base.Base_Window_Type'Class;
         Request : in     GWindows.Base.Scroll_Request_Type)
   is
      use GWindows.Windows;

      UsedRows   : Virt_Row;
      TopRow     : Integer;
      Scroll     : Natural;
      SaveSmooth : Boolean := Buffer.SmoothScroll;

   begin
      -- temporarily turn off smooth scroll
      Buffer.SmoothScroll := False;
      UsedRows
         := Max (
               Virt (Buffer, Buffer.Scrn_Size.Row - 1) + 1,
               Buffer.Virt_Used.Row);
      case Request is
         when GWindows.Base.End_Scroll =>
            null;
         when GWindows.Base.First =>
            UndrawCursor (Buffer);
            ViewUp (Buffer, Natural (UsedRows), Scroll);
            DrawCursor (Buffer);
         when GWindows.Base.Last =>
            UndrawCursor (Buffer);
            ViewDown (Buffer, Natural (UsedRows), Scroll);
            DrawCursor (Buffer);
         when GWindows.Base.Previous_Unit =>
            UndrawCursor (Buffer);
            ViewUp (Buffer, 1, Scroll);
            DrawCursor (Buffer);
         when GWindows.Base.Next_Unit =>
            UndrawCursor (Buffer);
            ViewDown (Buffer, 1, Scroll);
            DrawCursor (Buffer);
         when GWindows.Base.Previous_Page =>
            UndrawCursor (Buffer);
            ViewUp (Buffer, Natural (Buffer.View_Size.Row), Scroll);
            DrawCursor (Buffer);
         when GWindows.Base.Next_Page =>
            UndrawCursor (Buffer);
            ViewDown (Buffer, Natural (Buffer.View_Size.Row), Scroll);
            DrawCursor (Buffer);
         when GWindows.Base.Thumb_Set =>
            TopRow := Scroll_Drag_Position (Buffer.Panel, Vertical);
            if TopRow in 0 .. Integer (UsedRows) - 1 then
               -- redraw entire screen
               Buffer.View_Base.Row := Virt_Row (TopRow);
               if Buffer.ScreenAndView then
                  Buffer.Scrn_Base.Row := Buffer.View_Base.Row;
               end if;
               UndrawCursor (Buffer);
               DrawView (Buffer);
               DrawCursor (Buffer);
            end if;
         when GWindows.Base.Thumb_Drag =>
            TopRow := Scroll_Drag_Position (Buffer.Panel, Vertical);
            if TopRow in 0 .. Integer (UsedRows) - 1 then
               -- redraw entire screen
               Buffer.View_Base.Row := Virt_Row (TopRow);
               if Buffer.ScreenAndView then
                  Buffer.Scrn_Base.Row := Buffer.View_Base.Row;
               end if;
               UndrawCursor (Buffer);
               DrawView (Buffer);
               DrawCursor (Buffer);
            end if;
      end case;
      UpdateScrollPositions (Buffer);
      -- restore smooth scroll setting
      Buffer.SmoothScroll := SaveSmooth;
   end Do_Vertical_Scroll;


   procedure Do_Horizontal_Scroll (
         Buffer  : in out Terminal_Buffer;
         Window  : in out GWindows.Base.Base_Window_Type'Class;
         Request : in     GWindows.Base.Scroll_Request_Type)
   is
      use GWindows.Windows;

      LeftCol : Integer;

   begin
      case Request is
         when GWindows.Base.End_Scroll =>
            null;
         when GWindows.Base.First =>
            UndrawCursor (Buffer);
            ViewLeft (Buffer, Natural (Buffer.Scrn_Size.Col));
            DrawCursor (Buffer);
         when GWindows.Base.Last =>
            UndrawCursor (Buffer);
            ViewRight (Buffer, Natural (Buffer.Scrn_Size.Col));
            DrawCursor (Buffer);
         when GWindows.Base.Previous_Unit =>
            UndrawCursor (Buffer);
            ViewLeft (Buffer, 1);
            DrawCursor (Buffer);
         when GWindows.Base.Next_Unit =>
            UndrawCursor (Buffer);
            ViewRight (Buffer, 1);
            DrawCursor (Buffer);
         when GWindows.Base.Previous_Page =>
            UndrawCursor (Buffer);
            ViewLeft (Buffer, Natural (Buffer.View_Size.Col));
            DrawCursor (Buffer);
         when GWindows.Base.Next_Page =>
            UndrawCursor (Buffer);
            ViewRight (Buffer, Natural (Buffer.View_Size.Col));
            DrawCursor (Buffer);
         when GWindows.Base.Thumb_Set =>
            LeftCol := Scroll_Drag_Position (Buffer.Panel, Horizontal);
            if LeftCol
            in 0 .. Integer (Buffer.Virt_Used.Col)
                     - Integer (Buffer.View_Size.Col)
            then
               -- redraw entire screen
               Buffer.View_Base.Col := Virt_Col (LeftCol);
               UndrawCursor (Buffer);
               DrawView (Buffer);
               DrawCursor (Buffer);
            end if;
         when GWindows.Base.Thumb_Drag =>
            LeftCol := Scroll_Drag_Position (Buffer.Panel, Horizontal);
            if LeftCol
            in 0 .. Integer (Buffer.Virt_Used.Col)
                     - Integer (Buffer.View_Size.Col)
            then
               -- redraw entire screen
               Buffer.View_Base.Col := Virt_Col (LeftCol);
               UndrawCursor (Buffer);
               DrawView (Buffer);
               DrawCursor (Buffer);
            end if;
      end case;
      UpdateScrollPositions (Buffer);
   end Do_Horizontal_Scroll;


   procedure Do_Close (
         Buffer    : in out Terminal_Buffer;
         Window    : in out GWindows.Base.Base_Window_Type'Class;
         Can_Close :    out Boolean)
   is
      use GWindows.Message_Boxes;
   begin
      if not Buffer.CloseFlag then
         if Buffer.ProgramClose then
            if Message_Box (
               Buffer.Panel,
               "Closing Window",
               "Closing this window will terminate the program. "
                  & "Do you want to proceed ?",
               Yes_No_Box,
               Warning_Icon)
            = Yes then
               Can_Close := True;
            else
               Can_Close := False;
            end if;
         elsif Buffer.WindowClose then
            Can_Close := True;
         else
            Can_Close := False;
         end if;
      else
         Can_Close := True;
      end if;
   end Do_Close;


   procedure Do_Destroy (
         Buffer : in out Terminal_Buffer;
         Window : in out GWindows.Base.Base_Window_Type'Class)
   is
      use GWindows.Message_Boxes;
   begin
      Buffer.CloseFlag := True;
   end Do_Destroy;


   -- GetModifers : Decode the modifier keys and return the modifier.
   function GetModifiers return Modifier_Key_Type
   is
      use GWindows.Key_States;
   begin
      if Is_Key_Down (VK_MENU) then
         if Is_Key_Down (VK_CONTROL) then
            if Is_Key_Down (VK_SHIFT) then
               return Control_Shift_Alt;
            else
               return Control_Alt;
            end if;
         else
            if Is_Key_Down (VK_SHIFT) then
               return Shift_Alt;
            else
               return Alt;
            end if;
         end if;
      else
        if Is_Key_Down (VK_CONTROL) then
           if Is_Key_Down (VK_SHIFT) then
              return Control_Shift;
           else
              return Control;
           end if;
        else
           if Is_Key_Down (VK_SHIFT) then
               return Shift;
           else
               return No_Modifier;
           end if;
        end if;
      end if;
   end GetModifiers;


   -- NumericKeypad : return True if the character was typed
   --                 on the numeric keypad - depends on
   --                 the virtual key code previously stored
   --                 by Do_Virtual_Key.
   function NumericKeypad (
         Buffer   : in     Terminal_Buffer;
         Char     : in     Character;
         Extended : in     Boolean) return Boolean
   is
      use GWindows.Key_States;
   begin
      if Extended and (Char = ASCII.CR or Char = '/') then
         -- Enter and '/' from numeric keypad
         -- are flagged as extended keys
         return True;
      else
         return Buffer.VirtualKey in VK_NUMPAD0 .. VK_DIVIDE
         or     Buffer.VirtualKey = VK_NUMLOCK;
      end if;
   end NumericKeypad;


   -- Do_Key_Down : Process WM_KEYDOWN messages. All special
   --               or extended keys are processed here.
   procedure Do_Key_Down (
         Buffer  : in out Terminal_Buffer;
         Window  : in out GWindows.Base.Base_Window_Type'Class;
         Special : in     GWindows.Windows.Special_Key_Type;
         Value   : in     GWindows.GCharacter)
   is
      use type GWindows.Windows.Special_Key_Type;
      Sent : Boolean;
   begin

      if DEBUG_KEYS then
         ProcessStr (
            Buffer,
            Buffer.Input_Curs.Col,
            Buffer.Input_Curs.Row,
            Buffer.WrapNextIn,
            "[" & Integer'Image (Buffer.VirtualKey) & " ",
            Buffer.OutputStyle,
            Input => False);
         ProcessStr (
            Buffer,
            Buffer.Input_Curs.Col,
            Buffer.Input_Curs.Row,
            Buffer.WrapNextIn,
            Modifier_Key_Type'Image (GetModifiers) & " ",
            Buffer.OutputStyle,
            Input => False);
         ProcessStr (
            Buffer,
            Buffer.Input_Curs.Col,
            Buffer.Input_Curs.Row,
            Buffer.WrapNextIn,
            Special_Key_Type'Image (Special) & "]",
            Buffer.OutputStyle,
            Input => False);
      end if;

      if Buffer.KeyLockOn then
         -- keyboard locked, so do nothing
         return;
      end if;
      case Special is
         when Up_Key | Down_Key | Left_Key | Right_Key |
              Page_Up | Page_Down | Home_Key | End_Key |
              Insert | Delete | Scroll_Lock |  F1 .. F12 =>
            ProcessPutBuffer (Buffer, True);
            ProcessKey (Buffer, Special, ASCII.NUL, GetModifiers, False, Sent);
         when Number_Lock =>
            if Buffer.VTKeysOn then
               -- treat num lock as an ordinary key (if this keystroke
               -- turned num lock off, it will be turned back on later)
               ProcessPutBuffer (Buffer, True);
               ProcessKey (Buffer, None, ASCII.NUL, GetModifiers, True, Sent);
               if Buffer.AnsiMode /= PC then
                  -- Now turn num lock back on.
                  -- Note that on WinNT/2000/XP, where turning on num
                  -- lock must be done by simulating keystrokes, we have
                  -- to do it twice - this is because we are doing it from
                  -- in the num lock key down processing and Windows will
                  -- not yet have seen the corresponding key up message.
                  -- Windows will therefore see DOWN-down-up-down-up-UP,
                  -- but will interpret this as DOWN-up-down-up, which is
                  -- what we want.
                  -- Windows 95/98 doesn't use simulated keystrokes, to
                  -- turn on num lock, so doing it twice is a bit
                  -- redundant, but it will work ok.
                  TurnOnNumLock (Buffer);
                  TurnOnNumLock (Buffer);
               end if;
            end if;
         when others =>
            -- other keys not processed here - all
            -- normal keys are processed in Do_Key
            null;
      end case;
   end Do_Key_Down;


   -- Do_Virtual_Key : Receive a Virtual key code, which may be
   --                  required during subsequent key processing.
   procedure Do_Virtual_Key (
         Buffer  : in out Terminal_Buffer;
         Window  : in out GWindows.Base.Base_Window_Type'Class;
         Virtual : in     Integer)
   is
      use GWindows.Key_States;
   begin
      -- We do not decode the virtual key here, we just keep it till
      -- we process the characters in Do_Key. This is a lousy way to
      -- do this, since it leads to a race condition, but I can't
      -- figure out an alternative without rewriting too much of
      -- GWindows.
      Buffer.VirtualKey := Virtual;
   end Do_Virtual_Key;


   -- Do_Key : Process WM_CHAR messages. All normal keys are
   --          processed here.
   procedure Do_Key (
         Buffer   : in out Terminal_Buffer;
         Window   : in out GWindows.Base.Base_Window_Type'Class;
         Special  : in     GWindows.Windows.Special_Key_Type;
         Value    : in     GWindows.GCharacter;
         Repeat   : in     Boolean;
         Extended : in     Boolean)
   is
      use type GWindows.Windows.Special_Key_Type;

      Char : Character;
      Sent : Boolean;

   begin
      if GWindows.GCharacter'Pos (Value) <= Character'Pos (Character'Last) then
         -- Value is a wide character with a character equivalent, or
         -- not a wide character (depends on environment).
         Char := Character'Val (GWindows.GCharacter'Pos (Value));
      else
         -- Value is a wide character with no equivalent
         Char := ' ';
      end if;

      if DEBUG_KEYS then
         ProcessStr (
            Buffer,
            Buffer.Input_Curs.Col,
            Buffer.Input_Curs.Row,
            Buffer.WrapNextIn,
            "<" & Char & " "
               & Boolean'Image (NumericKeypad (Buffer, Char, Extended)) & " ",
            Buffer.OutputStyle,
            Input => False);
         ProcessStr (
            Buffer,
            Buffer.Input_Curs.Col,
            Buffer.Input_Curs.Row,
            Buffer.WrapNextIn,
            Modifier_Key_Type'Image (GetModifiers) & " ",
            Buffer.OutputStyle,
            Input => False);
         ProcessStr (
            Buffer,
            Buffer.Input_Curs.Col,
            Buffer.Input_Curs.Row,
            Buffer.WrapNextIn,
            Special_Key_Type'Image (Special) & ">",
            Buffer.OutputStyle,
            Input => False);
      end if;

      if Buffer.KeyLockOn then
         -- keyboard locked, so do nothing
         return;
      end if;
      if not Buffer.DECKBUM then
         -- Typewriter mode - translate key according to the
         -- last NRC font map selected into G0:
         Char := Key (Char, Buffer.KeySet, Buffer.KeySet);
      end if;
      if Special = None then
         -- normal keys only processed here - special
         -- keys are processed in Do_Key_Down
         if Repeat and not Buffer.KeyRepeatOn then
            -- key is a repeat, but autorepeat is turned off
            return;
         end if;
         ProcessPutBuffer (Buffer, True);
         ProcessKey (
            Buffer,
            Special,
            Char,
            GetModifiers,
            NumericKeypad (Buffer, Char, Extended),
            Sent);
      end if;
   end Do_Key;


   -- UpdateSizeDisplay : update the contents of the size display.
   procedure UpdateSizeDisplay (
         Buffer : in out Terminal_Buffer)
   is
      ScrnColsimage : String  := Scrn_Col'Image (Buffer.Scrn_Size.Col);
      ScrnRowsimage : String  := Scrn_Row'Image (Buffer.Scrn_Size.Row);
      ViewColsimage : String  := View_Col'Image (Buffer.View_Size.Col);
      ViewRowsimage : String  := View_Row'Image (Buffer.View_Size.Row);
      FontImage     : String  := Natural'Image (Buffer.FontSize);
      SizeCanvas    : Drawing_Canvas_Type;
      Size          : GT.Size_Type := (0, 0);
      TopPos        : Integer;
      LeftPos       : Integer;
   begin
      if Buffer.SizeDisplayed then
         LeftPos := Left (Buffer.Panel) + Width (Buffer.Panel) / 2;
         TopPos  := Top (Buffer.Panel) + Height (Buffer.Panel) / 2;
         Get_Canvas (Buffer.SizeDisplay, SizeCanvas);
         Text_Color (SizeCanvas, White);
         Background_Color (SizeCanvas, Black);
         Background_Mode (SizeCanvas, GWindows.Drawing.Opaque);
         Select_Object (SizeCanvas, Buffer.DefaultFont);
         if Buffer.SizingMode = Size_Fonts then
            Size := Text_Output_Size (SizeCanvas,
               To_GString ("Font:" & FontImage));
            Client_Area_Size (Buffer.SizeDisplay, Size.Width, Size.Height);
            Get_Canvas (Buffer.SizeDisplay, SizeCanvas);
            Put (SizeCanvas, 0, 0, To_GString ("Font:" & FontImage));
            Client_Area_Size (Buffer.SizeDisplay, Size.Width, Size.Height);
         elsif Buffer.SizingMode = Size_Screen then
            Size := Text_Output_Size (SizeCanvas,
               To_GString ("Screen:" & ScrnColsimage & " x" & ScrnRowsimage));
            Client_Area_Size (Buffer.SizeDisplay, Size.Width, Size.Height);
            Get_Canvas (Buffer.SizeDisplay, SizeCanvas);
            Put (SizeCanvas, 0, 0,
               To_GString ("Screen:" & ScrnColsimage & " x" & ScrnRowsimage));
            Client_Area_Size (Buffer.SizeDisplay, Size.Width, Size.Height);
         else
            -- sizing view
            Size := Text_Output_Size (SizeCanvas,
               To_GString ("View:" & ViewColsimage & " x" & ViewRowsimage));
            Client_Area_Size (Buffer.SizeDisplay, Size.Width, Size.Height);
            Get_Canvas (Buffer.SizeDisplay, SizeCanvas);
            Put (SizeCanvas, 0, 0,
               To_GString ("View:" & ViewColsimage & " x" & ViewRowsimage));
            Client_Area_Size (Buffer.SizeDisplay, Size.Width, Size.Height);
         end if;
         -- Move (Buffer.SizeDisplay, Left => LeftPos, Top => TopPos);
         Redraw (Buffer.SizeDisplay, Redraw_Now => True);
      end if;
   end UpdateSizeDisplay;


   -- CreateSizeDisplay : create and display the size display.
   procedure CreateSizeDisplay (
         Buffer : in out Terminal_Buffer)
   is
      TopPos  : Integer;
      LeftPos : Integer;
   begin
      if not Buffer.SizeDisplayed then
         LeftPos := Left (Buffer.Panel) + Width (Buffer.Panel) / 2;
         TopPos  := Top (Buffer.Panel) + Height (Buffer.Panel) / 2;
         Create (Buffer.SizeDisplay, "",
            Left => LeftPos, Top => TopPos, Width => 0, Height => 0);
         Sizable (Buffer.SizeDisplay, True);
         Caption (Buffer.SizeDisplay, False);
         Client_Area_Size (Buffer.SizeDisplay, 0, 0);
         Order (Buffer.SizeDisplay, GWindows.Base.Always_On_Top);
         Sizable_Panels.Visible (Buffer.SizeDisplay, True);
      end if;
      Buffer.SizeDisplayed := True;
      UpdateSizeDisplay (Buffer);
   end CreateSizeDisplay;


   -- DeleteSizeDisplay : Close and delete the size display.
   procedure DeleteSizeDisplay (
         Buffer : in out Terminal_Buffer)
   is
   begin
      if Buffer.SizeDisplayed then
         Close (Buffer.SizeDisplay);
      end if;
      Buffer.SizeDisplayed := False;
   end DeleteSizeDisplay;


   -- Do_Size : Respond to window sizing messages.
   procedure Do_Size (
         Buffer   : in out Terminal_Buffer;
         Window   : in out GWindows.Base.Base_Window_Type'Class;
         SizeType : in     Integer;
         Width    : in     Integer;
         Height   : in     Integer)
   is
      use GWindows.Windows;
      use GWindows.Application;
      use GWindows.Metrics;

      function Metric (Index : Integer) return Integer
         renames Get_System_Metric;

      nHeight         : Integer       := Height;
      nWidth          : Integer       := Width;
      OldScrnRows     : Scrn_Row;
      OldScrnCols     : Scrn_Col;
      OldViewRows     : View_Row;
      OldViewCols     : View_Col;
      NewVirtCols     : Virt_Col;
      NewVirtRows     : Virt_Row;
      NewScrnCols     : Scrn_Col;
      NewScrnRows     : Scrn_Row;
      NewViewCols     : View_Col;
      NewViewRows     : View_Row;
      NewCellSize     : GT.Size_Type;
      NewFontSize     : Natural;
      NewFontCellSize : GT.Size_Type;
      CursRowOnView   : Boolean;
      LastRowOnView   : Boolean;
      LastViewRow     : Virt_Row;
      Scrolled        : Integer;
      SaveSmooth      : Boolean := Buffer.SmoothScroll;

   begin
      if Buffer.EnableResize then
         if SizeType /= SIZE_MINIMIZED then
            if not Buffer.VertScrollbar then
               -- make sure there is space for Scrollbar when maximized
               nWidth := Integer'Min (
                            nWidth,
                            Desktop_Width - Metric (SM_CXVSCROLL));
            end if;
            if not Buffer.HorzScrollbar then
               -- make sure there is space for Scrollbar when maximized
               nHeight := Integer'Min (
                            nHeight,
                            Desktop_Height - Metric (SM_CYHSCROLL));
            end if;
            if not Buffer.MainMenuOn then
               -- make sure there is space for main menu when maximized
               nHeight := Integer'Min (
                            nHeight,
                            Desktop_Height - Metric (SM_CYMENU));
            end if;
            if not Buffer.TitleOn then
               -- make sure there is space for title when maximized
               nHeight := Integer'Min (
                            nHeight,
                            Desktop_Height - Metric (SM_CYCAPTION));
            end if;
            CreateSizeDisplay (Buffer);
            if Buffer.SizingMode = Size_Screen
            or Buffer.SizingMode = Size_View then
               -- temporarily turn off smooth scrolling
               Buffer.SmoothScroll := False;
               -- remember whether the cursor, first and/or last screen row
               -- are on view, for adjusting view later.
               CursRowOnView := OnView (Buffer, Buffer.Input_Curs.Row);
               LastRowOnView := OnView (Buffer, Buffer.Scrn_Size.Row - 1);
               LastViewRow   := Virt (Buffer, Buffer.View_Size.Row - 1);
               UndrawCursor (Buffer, Now => False);
               OldScrnCols := Buffer.Scrn_Size.Col;
               OldScrnRows := Buffer.Scrn_Size.Row;
               OldViewCols := Buffer.View_Size.Col;
               OldViewRows := Buffer.View_Size.Row;
               -- calculate in new number of rows and columns - i
               -- both must be at least 1
               NewViewCols
                  := Min (
                        View_Col (nWidth / Buffer.CellSize.Width),
                        View_Col (MAX_COLUMNS));
               NewViewCols := Max (NewViewCols, 1);
               NewViewRows
                  := Max (
                        View_Row (nHeight / Buffer.CellSize.Height),
                        1);
               if Buffer.SizingMode = Size_View then
                  -- new view columns cannot be wider than old screen columns
                  NewViewCols
                     := Min (
                           NewViewCols,
                           View_Col (OldScrnCols));
                  -- new view rows cannot be larger than virtual buffer
                  NewViewRows
                     := Min (
                           NewViewRows,
                           View_Row (Buffer.Real_Used.Row));
               end if;
               if  (NewViewCols /= OldViewCols)
               or  (NewViewRows /= OldViewRows) then
                  if Buffer.SizingMode = Size_Screen then
                     -- new screen size is view size
                     NewScrnCols := Scrn_Col (NewViewCols);
                     NewScrnRows := Scrn_Row (NewViewRows);
                     -- new virtual columns same as view columns -
                     -- virtual rows is at least the same as the
                     -- current virtual buffer.
                     NewVirtCols := Virt_Col (NewViewCols);
                     NewVirtRows
                        := Max (
                              Virt_Row (NewViewRows),
                              Virt_Row (Buffer.Real_Used.Row));
                     -- size the buffer for the new screen
                     Resize (
                        Buffer,
                        NewVirtCols,
                        NewVirtRows,
                        NewScrnCols,
                        NewScrnRows,
                        NewViewCols,
                        NewViewRows,
                        Buffer.OutputStyle);
                  else
                     -- screen size does not change - just resize the view
                     NewScrnCols := OldScrnCols;
                     NewScrnRows := OldScrnRows;
                     if NewViewCols > OldViewCols then
                        -- expanding the width of the view, so Scroll the
                        -- view to the left.
                        ViewLeft (
                           Buffer,
                           Integer (NewViewCols) - Integer (OldViewCols));
                     end if;
                     Buffer.View_Size := (NewViewCols, NewViewRows);
                  end if;
                  if Buffer.ScreenAndView then
                     Buffer.Scrn_Base.Row := Buffer.View_Base.Row;
                  else
                     -- perform view row adjustments - order is largely a
                     -- matter of taste, but we should keep significant rows
                     -- on the view during resizing. We must do at least one
                     -- of these to make sure the view is valid.
                     Scrolled := 0;
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
               end if;
               UpdateScrollRanges (Buffer);
               UpdateScrollPositions (Buffer);
               nWidth
                  := Buffer.CellSize.Width
                     * Integer (Buffer.View_Size.Col);
               nHeight
                  := Buffer.CellSize.Height
                     * Integer (Buffer.View_Size.Row);
               -- restore smooth scrolling setting
               Buffer.SmoothScroll := SaveSmooth;
            else
               -- sizing fonts
               if not Buffer.StockFont then
                  -- calculate new maximum cell size
                  NewCellSize.Height
                     := nHeight / Integer (Buffer.View_Size.Row);
                  NewCellSize.Width
                     := nWidth  / Integer (Buffer.View_Size.Col);
                  NewFontCellSize := (0, 0);
                  NewFontSize := 0;
                  for TestSize in reverse MIN_FONT_SIZE .. MAX_FONT_SIZE loop
                     if Buffer.FontCellSize (TestSize).Height
                        <= NewCellSize.Height
                     and Buffer.FontCellSize (TestSize).Width
                        <= NewCellSize.Width
                     then
                        NewFontSize     := TestSize;
                        NewFontCellSize := Buffer.FontCellSize (TestSize);
                        exit;
                     end if;
                  end loop;
                  if NewFontSize /= 0 then
                     if NewFontSize /= Buffer.FontSize then
                        CreateFontsByName (
                           Buffer,
                           To_GString (Buffer.FontName),
                           NewFontSize,
                           Buffer.FontCharSet);
                     end if;
                     nWidth
                        := NewFontCellSize.Width
                           * Integer (Buffer.View_Size.Col);
                     nHeight
                        := NewFontCellSize.Height
                           * Integer (Buffer.View_Size.Row);
                  else
                     NewFontCellSize := Buffer.FontCellSize (Buffer.FontSize);
                     nWidth
                        := NewFontCellSize.Width
                           * Integer (Buffer.View_Size.Col);
                     nHeight
                        := NewFontCellSize.Height
                           * Integer (Buffer.View_Size.Row);
                  end if;
               else
                  nWidth
                     := Buffer.CellSize.Width * Integer (Buffer.View_Size.Col);
                  nHeight
                     := Buffer.CellSize.Height * Integer (Buffer.View_Size.Row);
               end if;
            end if;
            UpdateSizeDisplay (Buffer);
            if not Buffer.VertScrollbar then
               -- make sure there is space for Scrollbar when maximized
               nWidth
                  := Integer'Min (
                        nWidth,
                        Desktop_Width + Metric (SM_CXVSCROLL));
            end if;
            if not Buffer.HorzScrollbar then
               -- make sure there is space for Scrollbar when maximized
               nHeight
                  := Integer'Min (
                        nHeight,
                        Desktop_Height + Metric (SM_CYHSCROLL));
            end if;
            if not Buffer.MainMenuOn then
               -- make sure there is space for main menu when maximized
               nHeight
                  := Integer'Min (
                        nHeight,
                        Desktop_Height + Metric (SM_CYMENU));
            end if;
            if not Buffer.TitleOn then
               -- make sure there is space for title when maximized
               nHeight
                  := Integer'Min (
                        nHeight,
                        Desktop_Height + Metric (SM_CYCAPTION));
            end if;
            if Client_Area_Width (Buffer.Panel) /= nWidth
            or Client_Area_Height (Buffer.Panel) /= nHeight then
               Client_Area_Size (Buffer.Panel, nWidth, nHeight);
            end if;
            Fill_Rectangle (
               Buffer.Canvas,
               (0, 0, Desktop_Width, Desktop_Height),
               GWindows.Colors.COLOR_BACKGROUND);
         end if;
         DrawView (Buffer, Now => False);
         DrawCursor (Buffer, Now => False);
      end if;
   end Do_Size;


   -- Do_Focus : Got focus - draw cursor, and also turn on num lock
   --            if we are using the num lock key as GOLD PF1
   procedure Do_Focus (
         Buffer : in out Terminal_Buffer;
         Window : in out GWindows.Base.Base_Window_Type'Class)
   is
   begin
      Buffer.HaveFocus := True;
      DrawCursor (Buffer);
      if Buffer.VTKeysOn and Buffer.AnsiMode /= PC then
         -- make sure num lock is on so that the numeric
         -- keypad sends identifiable keypad keys
         TurnOnNumLock (Buffer);
      end if;
   end Do_Focus;


   -- Do_Lost_Focus : Lost focus - undraw cursor
   procedure Do_Lost_Focus (
         Buffer : in out Terminal_Buffer;
         Window : in out GWindows.Base.Base_Window_Type'Class)
   is
   begin
      if Buffer.Real_Buffer /= null then
         UndrawCursor (Buffer);
      end if;
      Buffer.HaveFocus := False;
   end Do_Lost_Focus;

   procedure YModem_Send_Start (Window : in out GWindows.Base.Base_Window_Type'Class)
   is
      Status : Integer;
   begin
      Status := FYModem.Send;
   end YModem_Send_Start;

   procedure YModem_Receive_Start (Window : in out GWindows.Base.Base_Window_Type'Class)
   is
      Status : Integer;
   begin
      Status := FYModem.Receive;
   end YModem_Receive_Start;

   procedure YModem_Abort (Window : in out GWindows.Base.Base_Window_Type'Class)
   is
      Status : Integer;
   begin
      Status := FYModem.Cancel;
   end YModem_Abort;

   -- Do_Menu_Select : Perform all main window menu processing,
   --                  including context menu.
   procedure Do_Menu_Select (
         Buffer : in out Terminal_Buffer;
         Window : in out GWindows.Base.Base_Window_Type'Class;
         Item   : in     Integer)
   is
      use GWindows.Message_Boxes;

      Clip   : WS.Clipboard_Data_Access;
      Length : Natural;
      Scrolled : Natural;
   begin
      UndrawCursor (Buffer);
      case Item is

         when ID_Exit =>
            if Buffer.ProgramClose then
               Buffer.CloseFlag := Message_Box (
                  Buffer.Panel,
                  "Closing Window",
                  "Closing this window will terminate the program. "
                     & "Do you want to proceed ?",
                  Yes_No_Box,
                  Warning_Icon)
               = Yes;
            elsif Buffer.WindowClose then
               Buffer.CloseFlag := True;
            end if;

         when ID_Cut =>
            -- not implemented
            null;

         when ID_Copy =>
            CopySelection (Buffer, Buffer.CopyBuff, Buffer.CopyLen);
            if not WS.NullClipboardData (Buffer.CopyBuff)
            and then WS.OpenClipboard (Handle (Buffer.Panel)) then
               if not WS.EmptyClipboard then
                  -- what to do ?
                  WS.Beep;
               end if;
               WS.SetClipboardData (Buffer.CopyBuff);
               if not WS.CloseClipboard then
                  -- what to do ?
                  WS.Beep;
               end if;
            end if;

         when ID_Paste =>
            if WS.OpenClipboard (Handle (Buffer.Panel)) then
               WS.GetClipboardData (Clip, Length);
               if Length > 0 then
                  -- paste always uses input cursor
                  PasteSelection (
                     Buffer,
                     Buffer.Input_Curs.Col,
                     Buffer.Input_Curs.Row,
                     Buffer.WrapNextIn,
                     Buffer.InputStyle,
                     Clip,
                     Length);
                  WS.FreeClipboardData (Clip);
               end if;
               if not WS.CloseClipboard then
                  -- what to do ?
                  WS.Beep;
               end if;
            end if;

         when ID_ScrollOnOutput =>
            Buffer.ScrollOnPut := not Buffer.ScrollOnPut;

         when ID_SmoothScroll =>
            Buffer.SmoothScroll := not Buffer.SmoothScroll;

         when ID_MouseCursor =>
            Buffer.MouseCursorOn := not Buffer.MouseCursorOn;

         when ID_VertScroll =>
            if Buffer.VertScrollbar then
               VerticalScrollbar (Buffer, No);
            else
               VerticalScrollbar (Buffer, Yes);
            end if;
            ResizeClientArea (Buffer);
            DrawView (Buffer);

         when ID_HorzScroll =>
            if Buffer.HorzScrollbar then
               HorizontalScrollbar (Buffer, No);
            else
               HorizontalScrollbar (Buffer, Yes);
            end if;
            ResizeClientArea (Buffer);
            DrawView (Buffer);

         when ID_CursVisible =>
            Buffer.CursVisible := not Buffer.CursVisible;

         when ID_CursFlashing =>
            FlashControl (
               Buffer,
               not Buffer.CursFlashing,
               Buffer.TextFlashing);

         when ID_ClearScreen =>
            ClearScreenBuffer (Buffer);
            Buffer.Input_Curs  := (0, 0);
            Buffer.WrapNextIn  := False;
            Buffer.Output_Curs := (0, 0);
            Buffer.WrapNextOut := False;
            DrawView (Buffer);

         when ID_InitBuffer =>
            Initialize (Buffer, Buffer.BlankStyle);
            ResetOffsets (Buffer);
            ClearScreenBuffer (Buffer);
            ScreenUp (
               Buffer,
               Buffer.BlankStyle,
               Integer(Buffer.Real_Size.Row),
               Scrolled,
               True,
               True);
            UpdateScrollRanges(Buffer);
            UpdateScrollPositions(Buffer);
            Buffer.Input_Curs  := (0, 0);
            Buffer.WrapNextIn  := False;
            Buffer.Output_Curs := (0, 0);
            Buffer.WrapNextOut := False;
            DrawView (Buffer);

         when ID_ClearEOL =>
            if Buffer.SingleCursor then
               -- use input cursor
               ClearEOL (
                  Buffer,
                  Buffer.Input_Curs.Col,
                  Buffer.Input_Curs.Row);
            else
               -- use output cursor
               ClearEOL (
                  Buffer,
                  Buffer.Output_Curs.Col,
                  Buffer.Output_Curs.Row);
            end if;

         when ID_MainMenu =>
            if Buffer.MainMenuOn then
               CreateMenus (Buffer, MainMenu => No);
            else
               CreateMenus (Buffer, MainMenu=> Yes);
            end if;
            -- I don't know why, but we have to do this twice:
            ResizeClientArea (Buffer);
            ResizeClientArea (Buffer);
            DrawView (Buffer);

         when ID_Caption =>
            if Buffer.TitleOn then
               WindowCaption (Buffer, No);
            else
               WindowCaption (Buffer, Yes);
            end if;
            -- I don't know why, but but we have to do this twice:
            ResizeClientArea (Buffer);
            ResizeClientArea (Buffer);
            DrawView (Buffer);

         when ID_Sizing =>
            if Buffer.SizingOn then
               WindowSizing (Buffer, No);
            else
               WindowSizing (Buffer, Yes);
            end if;
            ResizeClientArea (Buffer);
            DrawView (Buffer);

         when ID_SizeFonts =>
            Buffer.SizingMode := Size_Fonts;

         when ID_SizeScreen =>
            Buffer.SizingMode := Size_Screen;

         when ID_SizeView =>
            Buffer.SizingMode := Size_View;

         when ID_Font =>
            SelectFont (Buffer);

         when ID_FgColor =>
            declare
               Color   : GWindows.Colors.Color_Type;
               Success : Boolean;
            begin
               Color   := Buffer.OutputStyle.FgColor;
               CD.Choose_Color (Buffer.Panel, Color, Success);
               Buffer.OutputStyle.FgColor := Color;
               DrawView (Buffer);
            end;

         when ID_BgColor =>
            declare
               Color   : GWindows.Colors.Color_Type;
               Success : Boolean;
            begin
               Color   := Buffer.OutputStyle.BgColor;
               CD.Choose_Color (Buffer.Panel, Color, Success);
               Buffer.OutputStyle.BgColor := Color;
               DrawView (Buffer);
            end;

         when ID_BufferColor =>
            Buffer.BlankStyle.FgColor := Buffer.OutputStyle.FgColor;
            Buffer.BlankStyle.BgColor := Buffer.OutputStyle.BgColor;
            Buffer.InitSaveFg := Buffer.BlankStyle.FgColor;
            Buffer.InitSaveBg := Buffer.BlankStyle.BgColor;
            Buffer.FgBgSaved := True;
            InitializeBufferColors (
               Buffer,
               Buffer.BlankStyle.FgColor,
               Buffer.BlankStyle.BgColor);

            DrawView (Buffer);

         when ID_Open =>
            OpenFile (Buffer);

         when ID_SaveAs =>
            SaveAsFile (Buffer);

         when ID_Save =>
            SaveFile (Buffer);

         when ID_VirtualSize =>
            declare
               use Terminal_Dialogs;

               MininimRows : Natural := Natural (Buffer.Scrn_Size.Row);
               MaximumRows : Natural := MAX_ROWS;
               CurrentRows : Natural := Natural (Buffer.Real_Used.Row);
               Rows        : Natural := Natural (Buffer.Real_Used.Row);
               Ok          : Boolean := False;
            begin
               Single_Value_Dialog (
                  Buffer.Panel,
                  "Virtual Size",
                  "Enter new Virtual Buffer size (rows):",
                  MininimRows, MaximumRows, CurrentRows, Rows, Ok);
               if Ok and Rows /= Natural (Buffer.Real_Used.Row) then
                  -- resize virtual buffer
                  NullSelection (Buffer);
                  Buffer.EnableResize := False;
                  Resize (
                     Buffer,
                     Buffer.Virt_Used.Col,
                     Min (
                        Max (
                           Virt_Row (Buffer.Scrn_Size.Row),
                           Virt_Row (Rows)),
                        Virt_Row (MAX_ROWS)),
                     Buffer.Scrn_Size.Col,
                     Buffer.Scrn_Size.Row,
                     Buffer.View_Size.Col,
                     Buffer.View_Size.Row,
                     Buffer.OutputStyle);
                  -- if Myself /= null then -- TBD
                     -- Myself.ScrnCols := Natural (Buffer.Scrn_Size.Col);
                     -- Myself.ScrnRows := Natural (Buffer.Scrn_Size.Row);
                  -- end if;
                  UpdateScrollRanges (Buffer);
                  UpdateScrollPositions (Buffer);
               end if;
               DrawView (Buffer);
            end;

         when ID_SetTabSize =>
            declare
               use Terminal_Dialogs;

               Min  : Natural := 0;
               Max  : Natural := Natural (Buffer.Virt_Used.Col);
               Pos  : Natural := Buffer.TabSize;
               Tabs : Natural := Buffer.TabSize;
               Ok   : Boolean := False;
            begin
               Single_Value_Dialog (
                  Buffer.Panel,
                  "Tab Size",
                  "Enter tab size (zero to remove all tabs):",
                  Min, Max, Pos, Tabs, Ok);
               if Ok then
                  SetDefaultTabStops (Buffer, Tabs);
               end if;
            end;

         when ID_SetScreenSize =>
            declare
               use Terminal_Dialogs;
               use GWindows.Metrics;

               MinCol  : Natural := 1;
               MaxCol  : Natural := MAX_COLUMNS;
               PosCol  : Natural := Natural (Buffer.Scrn_Size.Col);
               ResCol  : Natural := Natural (Buffer.Scrn_Size.Col);
               MinRow  : Natural := 1;
               MaxRow  : Natural := MAX_ROWS;
               PosRow  : Natural := Natural (Buffer.Scrn_Size.Row);
               ResRow  : Natural := Natural (Buffer.Scrn_Size.Row);
               Ok      : Boolean := False;
            begin
               MaxCol := Natural'Min (
                  MAX_COLUMNS,
                  (GWindows.Application.Desktop_Width
                     - Get_System_Metric (SM_CXVSCROLL))
                  / Buffer.CellSize.Width);
               MaxRow := Natural'Min (
                  MAX_ROWS,
                  (GWindows.Application.Desktop_Height
                     - Get_System_Metric (SM_CYHSCROLL)
                     - Get_System_Metric (SM_CYCAPTION)
                     - Get_System_Metric (SM_CYMENU))
                  / Buffer.CellSize.Height);
               Double_Value_Dialog (
                  Buffer.Panel,
                  "Screen Size",
                  "Enter new Screen (and View) size:",
                  "Columns:", MinCol, MaxCol, PosCol, ResCol,
                  "Rows:", MinRow, MaxRow, PosRow, ResRow,
                  Ok);
               if Ok
               and (ResCol /= Natural (Buffer.Scrn_Size.Col)
                 or ResRow /= Natural (Buffer.Scrn_Size.Row))
               then
                  ResizeScreen (Buffer, ResCol, ResRow, SetView => True);
               end if;
               DrawView (Buffer);
            end;

         when ID_HelpAbout =>
            declare
               use Terminal_Dialogs;
            begin
               About_Dialog (Buffer.Panel, "About");
            end;

         when ID_HelpInfo =>
            declare
               use Terminal_Dialogs;
            begin
               Info_Dialog (Buffer.Panel, "Buffer Information",
                  Natural (Buffer.Real_Size.Col),
                  Natural (Buffer.Real_Size.Row),
                  Natural (Buffer.Real_Used.Col),
                  Natural (Buffer.Real_Used.Row),
                  Natural (Buffer.Virt_Base.Col),
                  Natural (Buffer.Virt_Base.Row),
                  Natural (Buffer.Virt_Used.Col),
                  Natural (Buffer.Virt_Used.Row),
                  Natural (Buffer.Scrn_Base.Col),
                  Natural (Buffer.Scrn_Base.Row),
                  Natural (Buffer.Scrn_Size.Col),
                  Natural (Buffer.Scrn_Size.Row),
                  Natural (Buffer.View_Base.Col),
                  Natural (Buffer.View_Base.Row),
                  Natural (Buffer.View_Size.Col),
                  Natural (Buffer.View_Size.Row),
                  Natural (Buffer.Regn_Base.Col),
                  Natural (Buffer.Regn_Base.Row),
                  Natural (Buffer.Regn_Size.Col),
                  Natural (Buffer.Regn_Size.Row));
            end;

         when ID_Advanced =>
            declare
               use Terminal_Dialogs;
               Ok           : Boolean   := False;
               Flashing     : Boolean   := Buffer.TextFlashing;
               Cursor       : Boolean   := Buffer.SingleCursor;
               ScreenView   : Boolean   := Buffer.ScreenAndView;
               SysKeysOn    : Boolean   := System_Keys (Buffer.Panel);
               NewMode      : Ansi_Mode := Buffer.AnsiMode;
               NewOnInput   : Boolean   := Buffer.AnsiOnInput;
               NewOnOutput  : Boolean   := Buffer.AnsiOnOutput;
               DeleteOnBS   : Boolean   := not Buffer.DECBKM;
               DisplayCodes : Boolean := Buffer.DECCRM;
            begin
               Advanced_Dialog (
                  Buffer.Panel,
                  "Advanced Options",
                  Buffer.EchoOn,
                  Buffer.InsertOn,
                  Buffer.WrapOn,
                  Buffer.IgnoreCR,
                  Buffer.IgnoreLF,
                  Buffer.LFasEOL,
                  Buffer.LFonCR,
                  Buffer.CRonLF,
                  Buffer.CursorKeysOn,
                  Buffer.ExtendedKeysOn,
                  Buffer.SingleStyle,
                  Cursor,
                  Buffer.UpDownView,
                  Buffer.PageView,
                  Buffer.HomeEndView,
                  ScreenView,
                  Buffer.LRWrap,
                  Buffer.LRScroll,
                  Buffer.HomeEndInLine,
                  Flashing,
                  Buffer.AnyFont,
                  Buffer.MouseCursorOn,
                  SysKeysOn,
                  Buffer.RedrawPrev,
                  Buffer.RedrawNext,
                  NewMode,
                  NewOnInput,
                  NewOnOutput,
                  DeleteOnBS,
                  Buffer.UseRegion,
                  DisplayCodes,
                  Buffer.VTKeysOn,
                  Ok);
               if Ok then
                  Buffer.DECBKM := not DeleteOnBS;
                  if Buffer.SingleCursor and not Cursor then
                     -- turned off single cursor, so initialize
                     -- output cursor to input cursor
                     Buffer.Output_Curs := Buffer.Input_Curs;
                  end if;
                  Buffer.SingleCursor := Cursor;
                  if not Buffer.ScreenAndView and ScreenView then
                     -- turned on screen and view lock, so initialize
                     -- view base to be screen base
                     Buffer.View_Base.Row := Buffer.Scrn_Base.Row;
                     UpdateScrollPositions (Buffer);
                  end if;
                  Buffer.ScreenAndView := ScreenView;
                  if Buffer.TextFlashing /= Flashing then
                     -- changed text flashing, so start/stop flash task
                     FlashControl (Buffer, Buffer.CursFlashing, Flashing);
                  end if;
                  if SysKeysOn /= System_Keys (Buffer.Panel) then
                     System_Keys (Buffer.Panel, SysKeysOn);
                  end if;
                  if NewMode /= Buffer.AnsiMode
                  or NewOnInput /= Buffer.AnsiOnInput
                  or NewOnOutput /= Buffer.AnsiOnOutput then
                     -- changed ANSI options, so reset the parser and
                     -- soft reset the terminal
                     Buffer.AnsiOnInput  := NewOnInput;
                     Buffer.AnsiOnOutput := NewOnOutput;
                     Buffer.AnsiMode     := NewMode;
                     Buffer.AnsiBase     := NewMode;
                     case Buffer.AnsiMode is
                        when PC =>
                           -- for PC, use VT100 - differences are taken
                           -- care of in the Ansi_Buffer routines
                           AP.SwitchParserMode (Buffer.AnsiParser, AP.VT100);
                        when VT52 =>
                           AP.SwitchParserMode (Buffer.AnsiParser, AP.VT52);
                        when VT100 | VT101 | VT102 =>
                           AP.SwitchParserMode (Buffer.AnsiParser, AP.VT100);
                        when VT220 | VT320 | VT420 =>
                           AP.SwitchParserMode (Buffer.AnsiParser, AP.VT420);
                     end case;
                     AnsiReset (
                        Buffer,
                        Buffer.Input_Curs.Col,
                        Buffer.Input_Curs.Row,
                        Buffer.OutputStyle);
                  end if;
                  -- note that changing the Display Control Codes option
                  -- can override the ANSI On Input or ANSI on Output options:
                  if DisplayCodes and not Buffer.DECCRM then
                     Buffer.DECCRM       := True;
                     Buffer.AnsiOnInput  := False;
                     Buffer.AnsiOnOutput := False;
                     Buffer.GLSet        := DEC_CONTROL;
                     Buffer.GRSet        := DEC_CONTROL;
                     Buffer.SingleShift  := False;
                  elsif not DisplayCodes and Buffer.DECCRM then
                     Buffer.DECCRM := False;
                     Buffer.GLSet        := DEC_MULTINATIONAL;
                     Buffer.GRSet        := DEC_MULTINATIONAL;
                     Buffer.SingleShift  := False;
                  end if;
                  if Buffer.VTKeysOn and Buffer.AnsiMode /= PC then
                     -- make sure num lock is on so that numeric
                     -- keypad returns identifiable keypad keys
                     TurnOnNumLock (Buffer);
                  end if;
               end if;
               DrawView (Buffer);
            end;

         when ID_New =>
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

         when ID_Print =>
            -- force printer dialog to appear
            Buffer.PrintChosenOk := False;
            Print (Buffer);

         when ID_PageSetup =>
            PageSetup (Buffer);

         when ID_SelectBuffer =>
            if Buffer.Sel_Valid then
               -- blank out previous selection
               UpdateSelection (Buffer, Buffer.Sel_End, False);
               Buffer.Sel_Valid := False;
            end if;
            if Buffer.Virt_Used.Row > 0 then
               Buffer.Sel_Type := ByRow;
               Buffer.Sel_Start
                  := (Real (Buffer, Virt_Col (0)),
                      Real (Buffer, Virt_Row (0)));
               UpdateSelection (
                  Buffer,
                  (Real (Buffer, Buffer.Virt_Used.Col - 1),
                   Real (Buffer, Buffer.Virt_Used.Row - 1)),
                  True);
               Buffer.Sel_Valid := True;
            end if;
            DrawView (Buffer);

         when ID_SelectScreen =>
            if Buffer.Sel_Valid then
               -- blank out previous selection
               UpdateSelection (Buffer, Buffer.Sel_End, False);
               Buffer.Sel_Valid := False;
            end if;
            Buffer.Sel_Type := ByRow;
            Buffer.Sel_Start
               := (Real (Buffer, Scrn_Col (0)),
                   Real (Buffer, Scrn_Row (0)));
            UpdateSelection (
               Buffer,
               (Real (Buffer, Buffer.Scrn_Size.Col - 1),
                Real (Buffer, Buffer.Scrn_Size.Row - 1)),
               True);
            Buffer.Sel_Valid := True;
            DrawView (Buffer);

         when ID_SelectRegion =>
            if Buffer.Sel_Valid then
               -- blank out previous selection
               UpdateSelection (Buffer, Buffer.Sel_End, False);
               Buffer.Sel_Valid := False;
            end if;
            Buffer.Sel_Type := ByColumn;
            Buffer.Sel_Start
               := (Real (Buffer, Regn_Col (0)),
                   Real (Buffer, Regn_Row (0)));
            UpdateSelection (
               Buffer,
               (Real (Buffer, Buffer.Regn_Size.Col - 1),
                Real (Buffer, Buffer.Regn_Size.Row - 1)),
               True);
            Buffer.Sel_Valid := True;
            DrawView (Buffer);


         when ID_SelectView =>
            if Buffer.Sel_Valid then
               -- blank out previous selection
               UpdateSelection (Buffer, Buffer.Sel_End, False);
               Buffer.Sel_Valid := False;
            end if;
            Buffer.Sel_Type := ByColumn;
            Buffer.Sel_Start
               := (Real (Buffer, View_Col (0)),
               Real (Buffer, View_Row (0)));
            UpdateSelection (
               Buffer,
               (Real (Buffer, Buffer.View_Size.Col - 1),
                Real (Buffer, Buffer.View_Size.Row - 1)),
               True);
            Buffer.Sel_Valid := True;
            DrawView (Buffer);

         when ID_UnselectAll =>
            NullSelection (Buffer);
            DrawView (Buffer);

         when ID_MouseSelects =>
            Buffer.MouseSelectsOn := not Buffer.MouseSelectsOn;

         when ID_OnTop =>
            Buffer.AlwaysOnTop := not Buffer.AlwaysOnTop;
            if Buffer.AlwaysOnTop then
               Order (Buffer.Panel, GWindows.Base.Always_On_Top);
            else
               Order (Buffer.Panel, GWindows.Base.Not_Always_On_Top);
            end if;

         when ID_SoftReset =>
            if Buffer.SingleCursor then
               SoftReset (
                  Buffer,
                  Buffer.Input_Curs.Col,
                  Buffer.Input_Curs.Row,
                  Buffer.OutputStyle);
            else
               SoftReset (
                  Buffer,
                  Buffer.Output_Curs.Col,
                  Buffer.Output_Curs.Row,
                  Buffer.OutputStyle);
            end if;

         when ID_HardReset =>
            if Buffer.SingleCursor then
               HardReset (
                  Buffer,
                  Buffer.Input_Curs.Col,
                  Buffer.Input_Curs.Row,
                  Buffer.OutputStyle);
            else
               HardReset (
                  Buffer,
                  Buffer.Output_Curs.Col,
                  Buffer.Output_Curs.Row,
                  Buffer.OutputStyle);
            end if;

         when ID_DTR =>
            Buffer.DTROn := not Buffer.DTROn;
            ControlDTR(Buffer);

         when ID_PulseDTR =>
            PulseDTR(Buffer);

         when ID_YModemSend =>
            declare
               use type Win32.BOOL;
               OldTimeouts   : aliased WB.COMMTIMEOUTS;
               NewTimeouts   : aliased WB.COMMTIMEOUTS;
               Result        : Win32.BOOL;
               Status        : Integer := 0;
               Ok            : Boolean := False;
            begin
               if Buffer.CommsPort /= WS.INVALID_HANDLE_VALUE then
                  Buffer.CommsMutex.all.Acquire;
                  -- save existing comms timeouts
                  Result := WB.GetCommTimeouts (Buffer.CommsPort,
                                                OldTimeouts'Unchecked_Access);
                  -- set new comms timeouts
                  NewTimeouts.ReadIntervalTimeout         := 0;
                  NewTimeouts.ReadTotalTimeoutMultiplier  := 0;
                  NewTimeouts.ReadTotalTimeoutConstant    := 1000;
                  NewTimeouts.WriteTotalTimeoutMultiplier := 0;
                  NewTimeouts.WriteTotalTimeoutConstant   := 1000;
                  Result := WB.SetCommTimeouts (Buffer.CommsPort,
                                                NewTimeouts'Unchecked_Access);
                  Status := FYModem.SetComms(Buffer.CommsPort, 1, 0); -- need to set small time?
                  Terminal_Dialogs.YModem_Dialog (
                     Buffer.Panel,
                     "Send using YModem",
                     "Enter File Name to Send:",
                     YModem_Send_Start'Unrestricted_Access,
                     YModem_Abort'Unrestricted_Access,
                     Ok);
                  -- restore original comms timeouts
                  Result := WB.SetCommTimeouts (Buffer.CommsPort,
                                                OldTimeouts'Unchecked_Access);
                  Buffer.CommsMutex.all.Release;
               end if;
            end;

         when ID_YModemSend1k =>
            declare
               use type Win32.BOOL;
               OldTimeouts   : aliased WB.COMMTIMEOUTS;
               NewTimeouts   : aliased WB.COMMTIMEOUTS;
               Result        : Win32.BOOL;
               Status        : Integer := 0;
               Ok            : Boolean := False;
            begin
               if Buffer.CommsPort /= WS.INVALID_HANDLE_VALUE then
                  Buffer.CommsMutex.all.Acquire;
                  -- save existing comms timeouts
                  Result := WB.GetCommTimeouts (Buffer.CommsPort,
                                                OldTimeouts'Unchecked_Access);
                  -- set new comms timeouts
                  NewTimeouts.ReadIntervalTimeout         := 0;
                  NewTimeouts.ReadTotalTimeoutMultiplier  := 0;
                  NewTimeouts.ReadTotalTimeoutConstant    := 1000;
                  NewTimeouts.WriteTotalTimeoutMultiplier := 0;
                  NewTimeouts.WriteTotalTimeoutConstant   := 1000;
                  Result := WB.SetCommTimeouts (Buffer.CommsPort,
                                                NewTimeouts'Unchecked_Access);
                  Status := FYModem.SetComms(Buffer.CommsPort, 0, 0); -- need to set small time?
                  Terminal_Dialogs.YModem_Dialog (
                     Buffer.Panel,
                     "Send using YModem 1K",
                     "Enter File Name to Send:",
                     YModem_Send_Start'Unrestricted_Access,
                     YModem_Abort'Unrestricted_Access,
                     Ok);
                  -- restore original comms timeouts
                  Result := WB.SetCommTimeouts (Buffer.CommsPort,
                                                OldTimeouts'Unchecked_Access);
                  Buffer.CommsMutex.all.Release;
               end if;
            end;


         when ID_YModemReceive =>
            declare
               use type Win32.BOOL;
               OldTimeouts   : aliased WB.COMMTIMEOUTS;
               NewTimeouts   : aliased WB.COMMTIMEOUTS;
               Result        : Win32.BOOL;
               Status        : Integer := 0;
               Ok            : Boolean := False;
            begin
               if Buffer.CommsPort /= WS.INVALID_HANDLE_VALUE then
                  Buffer.CommsMutex.all.Acquire;
                  -- save existing comms timeouts
                  Result := WB.GetCommTimeouts (Buffer.CommsPort,
                                                OldTimeouts'Unchecked_Access);
                  -- set new comms timeouts
                  NewTimeouts.ReadIntervalTimeout         := 0;
                  NewTimeouts.ReadTotalTimeoutMultiplier  := 0;
                  NewTimeouts.ReadTotalTimeoutConstant    := 1000;
                  NewTimeouts.WriteTotalTimeoutMultiplier := 0;
                  NewTimeouts.WriteTotalTimeoutConstant   := 1000;
                  Result := WB.SetCommTimeouts (Buffer.CommsPort,
                                                NewTimeouts'Unchecked_Access);
                  Status := FYModem.SetComms(Buffer.CommsPort, 1, 0); -- need to set small time?
                  Terminal_Dialogs.YModem_Dialog (
                     Buffer.Panel,
                     "Receive using YModem",
                     "Enter File Name to Receive:",
                     YModem_Receive_Start'Unrestricted_Access,
                     YModem_Abort'Unrestricted_Access,
                     Ok);
                  -- restore original comms timeouts
                  Result := WB.SetCommTimeouts (Buffer.CommsPort,
                                                OldTimeouts'Unchecked_Access);
                  Buffer.CommsMutex.all.Release;
               end if;
            end;

         when others =>
            null;

      end case;
      UpdateMenuStates (Buffer);
      DrawCursor (Buffer);
   end Do_Menu_Select;


   -- Do_Context_Menu : display the context menu.
   procedure Do_Context_Menu (
         Buffer : in out Terminal_Buffer;
         Window : in out GWindows.Base.Base_Window_Type'Class;
         X      : in     Integer;
         Y      : in     Integer)
   is
   begin
      UpdateMenuStates (Buffer);
      Display_Context_Menu (Buffer.Panel, Buffer.MenuContext, 0, X, Y);
   end Do_Context_Menu;


   -- UpdateMenuStates : set the states of all menu entries to
   --                    be checked or unchecked, grayed or enabled.
   procedure UpdateMenuStates (
         Buffer : in out Terminal_Buffer)
   is
      use GWindows.Menus;
   begin
      if Buffer.MainMenuOn then
         if Buffer.SizingOn then
            State (Buffer.MenuFile, Command, ID_SetScreenSize, Enabled);
         else
            State (Buffer.MenuFile, Command, ID_SetScreenSize, Grayed);
         end if;
         if Buffer.WindowClose or Buffer.ProgramClose then
            State (Buffer.MenuFile, Command, ID_Exit, Enabled);
         else
            State (Buffer.MenuFile, Command, ID_Exit, Grayed);
         end if;
         Check (
            Buffer.MenuFile,
            Command,
            ID_DTR,
            Buffer.DTROn);
         Check (
            Buffer.MenuEdit,
            Command,
            ID_MouseSelects,
            Buffer.MouseSelectsOn);
         if Buffer.OptionMenuOn then
            Check (
               Buffer.MenuOption,
               Command,
               ID_MainMenu,
               Buffer.MainMenuOn);
            Check (
               Buffer.MenuOption,
               Command,
               ID_OnTop,
               Buffer.AlwaysOnTop);
            Check (
               Buffer.MenuOption,
               Command,
               ID_VertScroll,
               Buffer.VertScrollbar);
            Check (
               Buffer.MenuOption,
               Command,
               ID_HorzScroll,
               Buffer.HorzScrollbar);
            Check (
               Buffer.MenuOption,
               Command,
               ID_CursVisible,
               Buffer.CursVisible);
            Check (
               Buffer.MenuOption,
               Command,
               ID_CursFlashing,
               Buffer.CursFlashing);
            Check (
               Buffer.MenuOption,
               Command,
               ID_ScrollOnOutput,
               Buffer.ScrollOnPut);
            Check (
               Buffer.MenuOption,
               Command,
               ID_SmoothScroll,
               Buffer.SmoothScroll);
            Check (
               Buffer.MenuOption,
               Command,
               ID_Caption,
               Buffer.TitleOn);
            Check (
               Buffer.MenuOption,
               Command,
               ID_Sizing,
               Buffer.SizingOn);
            Check (
               Buffer.MenuOption,
               Command,
               ID_SizeFonts,
               (Buffer.SizingMode = Size_Fonts));
            Check (
               Buffer.MenuOption,
               Command,
               ID_SizeScreen,
               (Buffer.SizingMode = Size_Screen));
            Check (
               Buffer.MenuOption,
               Command,
               ID_SizeView,
               (Buffer.SizingMode = Size_View));
            if Buffer.CursVisible then
               State (Buffer.MenuOption, Command, ID_CursFlashing, Enabled);
            else
               State (Buffer.MenuOption, Command, ID_CursFlashing, Grayed);
            end if;
            if Buffer.SizingOn then
               if not Buffer.StockFont then
                  State (Buffer.MenuOption, Command, ID_SizeFonts, Enabled);
               end if;
               State (Buffer.MenuOption, Command, ID_SizeScreen, Enabled);
               State (Buffer.MenuOption, Command, ID_SizeView, Enabled);
            else
               State (Buffer.MenuOption, Command, ID_SizeFonts, Grayed);
               State (Buffer.MenuOption, Command, ID_SizeScreen, Grayed);
               State (Buffer.MenuOption, Command, ID_SizeView, Grayed);
            end if;
         end if;
      end if;

      if Buffer.ContextMenuOn then
         if Buffer.WindowClose or Buffer.ProgramClose then
            State (Buffer.MenuContext, Command, ID_Exit, Enabled);
         else
            State (Buffer.MenuContext, Command, ID_Exit, Grayed);
         end if;
         Check (
            Buffer.MenuContext,
            Command,
            ID_MainMenu,
            Buffer.MainMenuOn);
         Check (
            Buffer.MenuContext,
            Command,
            ID_Caption,
            Buffer.TitleOn);
         Check (
            Buffer.MenuContext,
            Command,
            ID_Sizing,
            Buffer.SizingOn);
         Check (
            Buffer.MenuContext,
            Command,
            ID_OnTop,
            Buffer.AlwaysOnTop);
         Check (
            Buffer.MenuContext,
            Command,
            ID_VertScroll,
            Buffer.VertScrollbar);
         Check (
            Buffer.MenuContext,
            Command,
            ID_HorzScroll,
            Buffer.HorzScrollbar);
         Check (
            Buffer.MenuContext,
            Command,
            ID_MouseSelects,
            Buffer.MouseSelectsOn);
      end if;

   end UpdateMenuStates;


   -- CreateMenus : Create all main window menus, including context menu.
   procedure CreateMenus (
         Buffer       : in out Terminal_Buffer;
         MainMenu     : in     Option := Ignore;
         TransferMenu : in     Option := Ignore;
         OptionMenu   : in     Option := Ignore;
         AdvancedMenu : in     Option := Ignore;
         ContextMenu  : in     Option := Ignore)
   is
      use GWindows.Menus;
      MenuFont : GDO.Font_Type;
   begin
      -- The following stops the program processing WM_SIZE messages
      -- resulting from this routine. This is to stop Windows incorrectly
      -- calculating the size of the Client Area. Processing of WM_SIZE
      -- messages is resumed after all outstanding Windows messages
      -- have been processed.
      Buffer.EnableResize := False;

      if MainMenu = Yes then
         Buffer.MainMenuOn := True;
      elsif MainMenu = No then
         Buffer.MainMenuOn := False;
      end if;
      if TransferMenu = Yes then
         Buffer.TransferMenuOn := True;
      elsif TransferMenu = No then
         Buffer.TransferMenuOn := False;
      end if;
      if OptionMenu = Yes then
         Buffer.OptionMenuOn := True;
      elsif OptionMenu = No then
         Buffer.OptionMenuOn := False;
      end if;
      if AdvancedMenu = Yes then
         Buffer.AdvancedMenuOn := True;
      elsif AdvancedMenu = No then
         Buffer.AdvancedMenuOn := False;
      end if;
      if ContextMenu = Yes then
         Buffer.ContextMenuOn := True;
      elsif ContextMenu = No then
         Buffer.ContextMenuOn := False;
      end if;

      if Buffer.MainMenuOn then
         --  Use Windows GUI font for Menus despite other font settings
         GDO.Create_Stock_Font (MenuFont, GDO.Default_GUI);
         Set_Font (Buffer.Panel, MenuFont);

         Buffer.MenuMain     := Create_Menu;
         Buffer.MenuFile     := Create_Menu;
         Buffer.MenuEdit     := Create_Menu;
         Buffer.MenuFormat   := Create_Menu;
         Buffer.MenuHelp     := Create_Menu;
         if Buffer.OptionMenuOn then
            Buffer.MenuOption   := Create_Menu;
         end if;
         if Buffer.TransferMenuOn then
            Buffer.MenuTransfer := Create_Menu;
         end if;

         Append_Item (Buffer.MenuFile, "&New", ID_New);
         Append_Item (Buffer.MenuFile, "&Open...", ID_Open);
         Append_Item (Buffer.MenuFile, "&Save", ID_Save);
         Append_Item (Buffer.MenuFile, "Save &As...", ID_SaveAs);
         Append_Separator (Buffer.MenuFile);
         Append_Item (Buffer.MenuFile, "&Virtual Size ...", ID_VirtualSize);
         Append_Item (Buffer.MenuFile, "S&creen Size ...", ID_SetScreenSize);
         Append_Separator (Buffer.MenuFile);
         Append_Item (Buffer.MenuFile, "Page Se&tup...", ID_PageSetup);
         Append_Item (Buffer.MenuFile, "&Print...", ID_Print);
         Append_Separator (Buffer.MenuFile);
         Append_Item (Buffer.MenuFile, "S&oft Reset", ID_SoftReset);
         Append_Item (Buffer.MenuFile, "&Hard Reset", ID_HardReset);
         Append_Separator (Buffer.MenuFile);
         if (Buffer.CommsPort /= WS.INVALID_HANDLE_VALUE) then
            Append_Item (Buffer.MenuFile, "&DTR", ID_DTR);
            Append_Item (Buffer.MenuFile, "&Pulse DTR", ID_PulseDTR);
            Append_Separator (Buffer.MenuFile);
         end if;
         Append_Item (Buffer.MenuFile, "E&xit", ID_Exit);

         Append_Item (Buffer.MenuEdit, "Select &All", ID_SelectBuffer);
         Append_Item (Buffer.MenuEdit, "Select &Screen", ID_SelectScreen);
         Append_Item (Buffer.MenuEdit, "Select &Region", ID_SelectRegion);
         Append_Item (Buffer.MenuEdit, "Select &View", ID_SelectView);
         Append_Item (Buffer.MenuEdit, "&Unselect All", ID_UnselectAll);
         Append_Item (Buffer.MenuEdit, "&Mouse Selects", ID_MouseSelects);
         Append_Separator (Buffer.MenuEdit);
         Append_Item (Buffer.MenuEdit, "&Copy", ID_Copy);
         Append_Item (Buffer.MenuEdit, "&Paste", ID_Paste);
         Append_Separator (Buffer.MenuEdit);
         Append_Item (Buffer.MenuEdit, "Clear &Buffer", ID_InitBuffer);
         Append_Item (Buffer.MenuEdit, "Clear Sc&reen", ID_ClearScreen);
         Append_Item (Buffer.MenuEdit, "Clear To &EOL", ID_ClearEOL);

         Append_Item (Buffer.MenuFormat, "&Font ...", ID_Font);
         Append_Item (Buffer.MenuFormat, "Fg &Color ...", ID_FgColor);
         Append_Item (Buffer.MenuFormat, "&Bg Color ...", ID_BgColor);
         Append_Item (Buffer.MenuFormat, "Set &All to Colors", ID_BufferColor);

         if Buffer.OptionMenuOn then
            Append_Item (Buffer.MenuOption, "Show &Menu",
               ID_MainMenu);
            Append_Item (Buffer.MenuOption, "Show &Title",
               ID_Caption);
            Append_Item (Buffer.MenuOption, "&Vertical Scrollbar",
               ID_VertScroll);
            Append_Item (Buffer.MenuOption, "&Horizontal Scrollbar",
               ID_HorzScroll);
            Append_Item (Buffer.MenuOption, "Scroll on &Output",
               ID_ScrollOnOutput);
            Append_Item (Buffer.MenuOption, "S&mooth Scrolling",
               ID_SmoothScroll);
            Append_Item (Buffer.MenuOption, "Al&ways On Top",
               ID_OnTop);
            Append_Separator (Buffer.MenuOption);
            Append_Item (Buffer.MenuOption, "&Cursor Visible",
               ID_CursVisible);
            Append_Item (Buffer.MenuOption, "Cursor &Flashing",
               ID_CursFlashing);
            Append_Separator (Buffer.MenuOption);
            Append_Item (Buffer.MenuOption, "Window Si&zable",
               ID_Sizing);
            Append_Item (Buffer.MenuOption, "&Font Sizing",
               ID_SizeFonts);
            Append_Item (Buffer.MenuOption, "&Screen Sizing",
               ID_SizeScreen);
            Append_Item (Buffer.MenuOption, "View Si&zing",
               ID_SizeView);
            Append_Separator (Buffer.MenuOption);
            Append_Item (Buffer.MenuOption, "Ta&b Size ...",
               ID_SetTabSize);
            if Buffer.AdvancedMenuOn then
               Append_Separator (Buffer.MenuOption);
               Append_Item (Buffer.MenuOption, "Advanced ...",
                  ID_Advanced);
            end if;
         end if;

         if Buffer.TransferMenuOn then
            Append_Item (Buffer.MenuTransfer, "&Send",
               ID_YModemSend);
            Append_Item (Buffer.MenuTransfer, "Send 1&k",
               ID_YModemSend1k);
            Append_Item (Buffer.MenuTransfer, "&Receive",
               ID_YModemReceive);
         end if;

         Append_Menu (Buffer.MenuMain, "&File", Buffer.MenuFile);
         if Buffer.TransferMenuOn then
            Append_Menu (Buffer.MenuMain, "&YModem", Buffer.MenuTransfer);
         end if;
         Append_Menu (Buffer.MenuMain, "&Edit", Buffer.MenuEdit);
         Append_Menu (Buffer.MenuMain, "Fo&rmat", Buffer.MenuFormat);
         if Buffer.OptionMenuOn then
            Append_Menu (Buffer.MenuMain, "&Options", Buffer.MenuOption);
         end if;

         Append_Menu (Buffer.MenuMain, "&Help", Buffer.MenuHelp);
         Append_Item (Buffer.MenuHelp, "&About ...", ID_HelpAbout);
         Append_Item (Buffer.MenuHelp, "&Info ...", ID_HelpInfo);

         Sizable_Panels.Menu (Buffer.Panel, Buffer.MenuMain);
         GDO.Delete (MenuFont);

         UpdateMenuStates (Buffer);
      else
         Sizable_Panels.Menu (
            Buffer.Panel,
            Null_Menu,
            Destroy_Old => True);
      end if;

      if Buffer.ContextMenuOn then
         --  Use Windows GUI font for Menus despite other font settings
         GDO.Create_Stock_Font (MenuFont, GDO.Default_GUI);
         Set_Font (Buffer.Panel, MenuFont);

         Buffer.MenuContext  := Create_Popup;

         Append_Item (Buffer.MenuContext, "&Copy",
            ID_Copy);
         Append_Item (Buffer.MenuContext, "&Paste",
            ID_Paste);
         Append_Separator (Buffer.MenuContext);
         Append_Item (Buffer.MenuContext, "Sh&ow Menu",
            ID_MainMenu);
         Append_Item (Buffer.MenuContext, "&Show Title",
            ID_Caption);
         Append_Item (Buffer.MenuContext, "Window Si&zable",
            ID_Sizing);
         Append_Item (Buffer.MenuContext, "&Vertical Scrollbar",
            ID_VertScroll);
         Append_Item (Buffer.MenuContext, "&Horizontal Scrollbar",
            ID_HorzScroll);
         Append_Item (Buffer.MenuContext, "Al&ways on Top",
            ID_OnTop);
         Append_Separator (Buffer.MenuContext);
         Append_Item (Buffer.MenuContext, "&Mouse Selects",
            ID_MouseSelects);
         Append_Separator (Buffer.MenuContext);
         Append_Item (Buffer.MenuContext, "E&xit",
            ID_Exit);

         GDO.Delete (MenuFont);
         UpdateMenuStates (Buffer);
      end if;
   end CreateMenus;


   -- Do_Left_Button_Down : perform mouse left button processing.
   --                       Thie procedure does single clicks, and
   --                       simulates triple-clicks. See also
   --                       Do_Left_Button_Double_Click
   procedure Do_Left_Button_Down (
         Buffer : in out Terminal_Buffer;
         Window : in out GWindows.Base.Base_Window_Type'Class;
         X      : in     Integer;
         Y      : in     Integer;
         Keys   : in     GWindows.Windows.Mouse_Key_States)
   is
      use type ART.Time;
      use type ART.Time_Span;

      RealPos     : Real_Pos;
      TripleTime  : ART.Time;
      TripleClick : Boolean  := False;

   begin
      TripleTime  := ART.Clock;
      UndrawCursor (Buffer);
      ConvertCoordsToReal (Buffer, X, Y, RealPos);
      -- see if this is really a triple click
      TripleClick := Buffer.DoubleClick
         and then ((ART.Clock - Buffer.DoubleTime)
            < ART.Milliseconds (WS.DoubleClickTime))
         and then (Buffer.DoublePos = RealPos);
      Buffer.DoubleClick := False;
      if Buffer.MouseCursorOn then
         -- NOTE we cannot extend selections when the mouse cursor
         -- is enabled, since SHIFT + MOUSE_CLICK in this
         -- mode is required to start a normal selection
         if Buffer.MouseSelectsOn then
            if Buffer.Sel_Valid then
               -- blank out previous selection
               UpdateSelection (Buffer, Buffer.Sel_End, False);
            end if;
            if TripleClick and Buffer.Sel_Valid then
               ExtendSelectionCycle (Buffer, Keys, RealPos);
            else
               if Keys (GWindows.Windows.Control) then
                  StartSelection (Buffer, ByColumn, RealPos);
               elsif Keys (GWindows.Windows.Shift) then
                  if AlreadySelected (Buffer, RealPos) then
                     NullSelection (Buffer);
                  else
                     StartSelection (Buffer, ByRow, RealPos);
                  end if;
               else
                  -- move cursor if position is on screen
                  if OnScreen (Buffer, RealPos.Col, RealPos.Row) then
                     Buffer.Input_Curs
                        := (Scrn (Buffer, RealPos.Col),
                            Scrn (Buffer, RealPos.Row));
                     Buffer.WrapNextIn := False;
                  end if;
               end if;
            end if;
         else
            -- move cursor if position is on screen
            if OnScreen (Buffer, RealPos.Col, RealPos.Row) then
               Buffer.Input_Curs
                  := (Scrn (Buffer, RealPos.Col),
                      Scrn (Buffer, RealPos.Row));
               Buffer.WrapNextIn := False;
            end if;
         end if;
      elsif Buffer.MouseSelectsOn then
         if Buffer.Sel_Valid then
            -- blank out previous selection
            UpdateSelection (Buffer, Buffer.Sel_End, False);
         end if;
         if TripleClick then
            StartSelectionCycle (Buffer, Keys, RealPos);
         else
            if Keys (GWindows.Windows.Control) then
               StartSelection (Buffer, ByColumn, RealPos);
            elsif Keys (GWindows.Windows.Shift) and Buffer.Sel_Valid then
               ExtendSelection (Buffer, Buffer.Sel_Type, RealPos);
            else
               if AlreadySelected (Buffer, RealPos) then
                  NullSelection (Buffer);
               else
                  StartSelection (Buffer, ByRow, RealPos);
               end if;
            end if;
         end if;
      end if;
      if not Buffer.Selecting then
         DrawCursor (Buffer);
      end if;
   end Do_Left_Button_Down;


   -- Do_Left_Button_Up : release the mouse if we have it.
   procedure Do_Left_Button_Up (
         Buffer : in out Terminal_Buffer;
         Window : in out GWindows.Base.Base_Window_Type'Class;
         X      : in     Integer;
         Y      : in     Integer;
         Keys   : in     GWindows.Windows.Mouse_Key_States)
   is
   begin
      if Buffer.Selecting then
         Buffer.Selecting := False;
         GWindows.Base.Release_Mouse;
      end if;
      DrawCursor (Buffer);
   end Do_Left_Button_Up;


   -- Do_Left_Button_Double_Click : perform mouse left button processing.
   --                               This procedure handles double clicks.
   --                               See also Do_Left_Button_Down
   procedure Do_Left_Button_Double_Click (
         Buffer : in out Terminal_Buffer;
         Window : in out GWindows.Base.Base_Window_Type'Class;
         X      : in     Integer;
         Y      : in     Integer;
         Keys   : in     GWindows.Windows.Mouse_Key_States)
   is

      RealPos : Real_Pos;

   begin
      -- save double click time in case this turns into a triple click
      Buffer.DoubleTime := ART.Clock;
      UndrawCursor (Buffer);
      ConvertCoordsToReal (Buffer, X, Y, RealPos);
      Buffer.DoubleClick := True;
      Buffer.DoublePos := RealPos;
      if Buffer.MouseCursorOn and Buffer.MouseSelectsOn then
         if Buffer.Sel_Valid then
            -- blank out previous selection
            UpdateSelection (Buffer, Buffer.Sel_End, False);
            ExtendSelectionCycle (Buffer, Keys, RealPos);
         end if;
      elsif Buffer.MouseSelectsOn then
         if Buffer.Sel_Valid then
            -- blank out previous selection
            UpdateSelection (Buffer, Buffer.Sel_End, False);
            StartSelectionCycle (Buffer, Keys, RealPos);
         else
            -- start new selection
            if Keys (GWindows.Windows.Control) then
               StartSelection (Buffer, ByColumn, RealPos);
            else
               StartSelection (Buffer, ByRow, RealPos);
            end if;
         end if;
      end if;
      if not Buffer.Selecting then
         DrawCursor (Buffer);
      end if;
   end Do_Left_Button_Double_Click;


   -- Do_Mouse_Move : Note that we only handle mouse moves completely within
   --                 the client window - others are handled elsewhere.
   procedure Do_Mouse_Move (
         Buffer : in out Terminal_Buffer;
         Window : in out GWindows.Base.Base_Window_Type'Class;
         X      : in     Integer;
         Y      : in     Integer;
         Keys   : in     GWindows.Windows.Mouse_Key_States)
   is

      RealPos        : Real_Pos;
      InClientWidth  : Boolean  := False;
      InClientHeight : Boolean  := False;

   begin
      if Buffer.Selecting then
         if X >= 0
         and X < Integer (Buffer.View_Size.Col) * Buffer.CellSize.Width then
            InClientWidth := True;
            RealPos.Col
               := Real (Buffer, View_Col (X / Buffer.CellSize.Width));
         end if;
         if Y >= 0
         and Y < Integer (Buffer.View_Size.Row) * Buffer.CellSize.Height then
            InClientHeight := True;
            RealPos.Row
               := Real (Buffer, View_Row (Y / Buffer.CellSize.Height));
         end if;
         if  InClientWidth
         and InClientHeight
         and (Buffer.Sel_End /= RealPos) then
            UpdateSelection (Buffer, RealPos, True);
         end if;
      end if;
   end Do_Mouse_Move;


   -- Do_Capture_Changed : Someone else captured the mouse.
   procedure Do_Capture_Changed (
         Buffer : in out Terminal_Buffer;
         Window : in out GWindows.Base.Base_Window_Type'Class)
   is
   begin
      if Buffer.Selecting then
         NullSelection (Buffer);
         Buffer.Selecting   := False;
         DrawCursor (Buffer);
      end if;
   end Do_Capture_Changed;


   -- Do_Init_Menu : The menu is about to be displayed
   procedure Do_Init_Menu (
         Buffer : in out Terminal_Buffer;
         Window : in out GWindows.Base.Base_Window_Type'Class)
   is
   begin
      UpdateMenuStates (Buffer);
   end Do_Init_Menu;


   -- HouseKeeping : Do things that need to be done periodically.
   --                Returns False if application has been closed.
   procedure HouseKeeping (
         Buffer : in out Terminal_Buffer;
         Open   :    out Boolean)
   is
      use GWindows.Drawing;

      FlashView : Boolean := False; -- view flag for flashing text

   begin
      ProcessPutBuffer (Buffer, True);
      if Buffer.CloseFlag then
         -- close any open print document
         if Buffer.PrintDocOpen then
            End_Page (Buffer.PrintCanvas);
            End_Document (Buffer.PrintCanvas);
            Buffer.PrintDocOpen := False;
         end if;
         Free_Flashing_Task (Buffer);
         Free_Keyboard_Buffer (Buffer);
         Free (Buffer);
         GWindows.Menus.Destroy_Menu (Buffer.MenuContext);
         if Buffer.ProgramClose then
            -- closing this terminal terminates the program (ungracefully)
            GNAT.OS_Lib.OS_Exit (0);
         elsif Buffer.WindowClose then
            -- closing this terminal just closes the window
            Close (Buffer.Panel);
         end if;
         Open := False;
      else
         -- Control flashing cursor (if visible and flashing). The state is
         -- as determined by FlashingCursOff and CursDrawn. Here we only
         -- turn the cursor off if required. Turning it on if required
         -- is done later (see below).
         if Buffer.CursVisible and Buffer.CursDrawn then
            if Buffer.CursFlashing and Buffer.CursFlashOff then
               UndrawCursor (Buffer, Now => True);
            end if;
         end if;
         -- perform text flashing
         if Buffer.TextFlashing then
            if (Buffer.TextDrawn = Buffer.TextFlashOff) then
               -- must redraw any rows that contain flashing characters
               Buffer.TextDrawn := not Buffer.TextDrawn;
               for Row in 0 .. Buffer.View_Size.Row - 1 loop
                  declare
                     FlashRow : Boolean := False; -- row flag for flashing text
                     FlashCol : View_Col;
                     RealRow  : Real_Row := Real (Buffer, Row);
                  begin
                     for Col in 0 .. Buffer.View_Size.Col - 1 loop
                        if Buffer.Real_Buffer (
                              Real (Buffer, Col),
                              RealRow).Flashing
                        then
                           FlashCol  := Col;
                           FlashRow  := True;
                           exit;
                        end if;
                     end loop;
                     if FlashRow then
                        DrawViewRow (Buffer, FlashCol, Row);
                        FlashView := True;
                     end if;
                  end;
               end loop;
               if FlashView then
                  Redraw (Buffer.Panel, Redraw_Now => True);
               end if;
            end if;
         end if;
         -- Control flashing cursor (if visible and flashing).
         -- Here we only turn the cursor on if required. We do not need
         -- to disable cursor flashing while selecting, but it speeds up
         -- the screen redraw. See above.
         if Buffer.CursVisible
         and not Buffer.CursDrawn
         and not Buffer.Selecting then
            if (Buffer.CursFlashing and not Buffer.CursFlashOff)
            or else not Buffer.CursFlashing then
               DrawCursor (Buffer, Now => True);
            end if;
         end if;
         -- update the selection for mouse moves outside client area
         if Buffer.Selecting then
            -- use GetCursorPos and process mouse outside the client
            -- area. Note "On_Mouse_Move" handles mouse inside the
            -- client area. Also note the acceleration handling.
            declare
               OutsideClientWidth  : Boolean            := True;
               OutsideClientHeight : Boolean            := True;
               Point               : GT.Point_Type;
               RealCol             : Real_Col;
               RealRow             : Real_Row;
               Scroll              : Natural;
               X                   : Integer;
               Y                   : Integer;
            begin
               WS.GetCursorPos (Point);
               WS.ScreenToClient (Handle (Buffer.Panel), Point);
               X := Integer (Point.x);
               Y := Integer (Point.y);
               if X < 0 then
                  RealCol := Real (Buffer, View_Col (0));
               elsif X >= Integer (Buffer.View_Size.Col)
                           * Buffer.CellSize.Width
               then
                  RealCol := Real (Buffer, Buffer.View_Size.Col - 1);
               else
                  OutsideClientWidth := False;
                  RealCol
                     := Real (Buffer, View_Col (X / Buffer.CellSize.Width));
               end if;
               if Y < -Buffer.CellSize.Height then
                  ViewUp (
                     Buffer,
                     Natural'Max (Natural (Buffer.View_Size.Row) / 2, 1),
                     Scroll);
                  RealRow := Real (Buffer, View_Row (0));
               elsif Y < 0 then
                  ViewUp (Buffer, 1, Scroll);
                  RealRow := Real (Buffer, View_Row (0));
               elsif Y >= Integer (Buffer.View_Size.Row)
                             * Buffer.CellSize.Height
                          + Buffer.CellSize.Height
               then
                  ViewDown (
                     Buffer,
                     Natural'Max (Natural (Buffer.View_Size.Row) / 2, 1),
                     Scroll);
                  RealRow := Real (Buffer, Buffer.View_Size.Row - 1);
               elsif Y >= Integer (Buffer.View_Size.Row)
                           * Buffer.CellSize.Height
               then
                  ViewDown (Buffer, 1, Scroll);
                  RealRow := Real (Buffer, Buffer.View_Size.Row - 1);
               else
                  OutsideClientHeight := False;
                  RealRow := Real (
                     Buffer,
                     View_Row (Y / Buffer.CellSize.Height));
               end if;
               if DoubleWidth (Buffer, RealCol, RealRow)
               and then RealCol mod 2 /= 0 then
                  RealCol := RealCol - 1;
               end if;
               if  (OutsideClientWidth or OutsideClientHeight)
               and (Buffer.Sel_End /= (RealCol, RealRow)) then
                  UpdateSelection (Buffer, (RealCol, RealRow), True);
               end if;
            end;
         end if;
         -- process Windows messages
         while Messages_Waiting loop
            GWindows.Application.Message_Check;
         end loop;
         -- re-enable processing of window sizing messages if
         -- this has been disabled during message processing
         Buffer.EnableResize := True;
         open := True;
      end if;
      -- shut down size display (it will be left open after
      -- resizing finishes, since we cannot tell when that
      -- happens from within the resizing procedure)
      if Buffer.SizeDisplayed then
         DeleteSizeDisplay (Buffer);
      end if;
   end HouseKeeping;


end Terminal_Buffer;
