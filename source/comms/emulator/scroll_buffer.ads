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

with GWindows.Windows;

with Terminal_Types;
with Terminal_Internal_Types;
with Buffer_Types;
with View_Buffer;
with Win32_Support;

package Scroll_Buffer is

   use Terminal_Types;
   use Terminal_Internal_Types;
   use Buffer_Types;
   use View_Buffer;

   package WS  renames Win32_Support;


   type Scroll_Buffer is new View_Buffer.View_Buffer with record

      TitleOn       : Boolean     := True;  -- terminal has title bar (caption)
      TitleText     : Unbounded_String := Null_String;

      EnableResize  : Boolean     := False; -- process Window size messages
      SizingOn      : Boolean     := True;  -- window can be resized

      VertScrollbar : Boolean     := False; -- vertical Scroll bar
      HorzScrollbar : Boolean     := False; -- horizontal Scroll bar
      PasteToBuff   : Boolean     := False; -- paste selection to buffer
      PasteToKybd   : Boolean     := True;  -- paste selection to keyboard
      ScreenAndView : Boolean     := False; -- Screen and View locked together

      Selecting     : Boolean     := False;
      CopyBuff      : WS.Clipboard_Data_Access;
      CopyLen       : Natural     := 0;
   
      KeyBuff       : Keyboard_Buffer_Access;
      KeySize       : Natural     := DEFAULT_KEYBUF_SIZE;
      KeyStart      : Natural     := 0;
      KeyFinish     : Natural     := 0;

      TabSize       : Natural     := DEFAULT_TAB_SIZE;
      TabStops      : Tab_Array := (others => False);
   
   end record;
 


   -- SetDefaultTabStops : Set tab stops every "Size" columns
   --                      (remove all if Size = 0)
   procedure SetDefaultTabStops (
         Buffer : in out Scroll_Buffer;
         Size   : in     Natural);


   -- ReceiveKey : Pop the first key off the keybuffer. Return True if
   --              key available, False if not.
   procedure ReceiveKey (
         Buffer    : in out Scroll_Buffer;
         Special   :    out Special_Key_Type;
         Char      :    out Character;
         Modifier  :    out Modifier_Key_Type;
         Available :    out Boolean);


   -- UnReceiveKey : Push a key back onto the start of the key buffer.
   --                Return True if added, False if key buffer full.
   procedure UnReceiveKey (
         Buffer   : in out Scroll_Buffer;
         Special  : in     Special_Key_Type;
         Char     : in     Character;
         Modifier : in     Modifier_Key_Type;
         Added    :    out Boolean);


   -- SendKey : Push a key to onto the end of the key buffer. If the key
   --           is a special key, the char should be null. Return True if
   --           added, False if key buffer full.
   procedure SendKey (
         Buffer   : in out Scroll_Buffer;
         Special  : in     Special_Key_Type;
         Char     : in     Character;
         Modifier : in     Modifier_Key_Type;
         Sent     :    out Boolean);


   -- SendString : Push a string onto the key buffer. No special keys
   --              or modifiers are supported. The whole string must
   --              fit into the key buffer or none of it is sent.
   procedure SendString (
         Buffer : in out Scroll_Buffer;
         Str    : in     String;
         Sent   :    out Boolean);


   -- UpdateScrollPositions : Update the Scrollbar position
   --                         (if Scrollbars on display).
   procedure UpdateScrollPositions (
         Buffer : in out Scroll_Buffer);


   -- UpdateScrollRanges : Update the Scrollbar ranges
   --                      (if Scrollbar on display).
   procedure UpdateScrollRanges (
         Buffer : in out Scroll_Buffer);


   -- BufferUp : Erase the top line of the Virtual buffer, then scroll
   --            it up to make a new blank line appear at the bottom
   --            of the virtual buffer. The blank line will be given
   --            the bg color specified in Style.
   procedure BufferUp (
         Buffer : in out Scroll_Buffer;
         Style  : in out Real_Cell;
         Scroll : in     Natural := 1;
         Draw   : in     Boolean := True);


   -- BufferDown : Erase the bottom line of the Virtual buffer, then scroll
   --              it down to make a new blank line appear at the top
   --              of the virtual buffer. The blank line will be given
   --              the bg color specified in style.
   procedure BufferDown (
         Buffer : in out Scroll_Buffer;
         Style  : in out Real_Cell;
         Scroll : in     Natural := 1;
         Draw   : in     Boolean := True);


   -- ViewDown : Scroll the View down the specified number of rows
   --            (if possible). Returns number of rows actually Scrolled.
   procedure ViewDown (
         Buffer   : in out Scroll_Buffer;
         Rows     : in     Natural;
         Scrolled :    out Natural);


   -- ViewUp : Scroll the View up the specified number of rows.
   --          (if possible). Returns number of rows actually Scrolled.
   procedure ViewUp (
         Buffer   : in out Scroll_Buffer;
         Rows     : in     Natural;
         Scrolled :    out Natural);


   -- ViewRight : Scroll the View right the specified number of columns.
   procedure ViewRight (
         Buffer : in out Scroll_Buffer;
         Cols   : in     Natural := 1);


   -- ViewLeft : Scroll the View left the specified number of columns.
   procedure ViewLeft (
         Buffer : in out Scroll_Buffer;
         Cols   : in     Natural := 1);


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
         Draw       : in     Boolean := True);


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
         Draw       : in     Boolean := True);


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
         Draw       : in     Boolean := True);


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
         Draw       : in     Boolean := True);


   -- ShiftRight : Shift the data on the screen or region right the
   --              requested number of columns. Blank columns are
   --              added to the left. Update view if any of screen 
   --              is on view. Fill new cells with the bg color 
   --              specified in Style. 
   procedure ShiftRight (
         Buffer : in out Scroll_Buffer;
         Style  : in out Real_Cell;
         Cols   : in     Natural := 1;
         Draw   : in     Boolean := True);


   -- ShiftLeft : Shift the data on the screen or region left the
   --             requested number of columns. Blank columns are
   --             added to the right. Update view if any of screen 
   --             is on view. Fill new cells with the bg color 
   --             specified in Style.
   procedure ShiftLeft (
         Buffer : in out Scroll_Buffer;
         Style  : in out Real_Cell;
         Cols   : in     Natural := 1;
         Draw   : in     Boolean := True);


   -- PutOnScreen : Scroll screen up or down to get the specified
   --               real row on screen. Returns amount Scrolled.
   procedure PutOnScreen (
         Buffer   : in out Scroll_Buffer;
         Row      : in     Real_Row;
         Scrolled :   out Integer);


   -- PutOnView : Scroll view up or down to get the specified
   --             screen row on view. Returns amount Scrolled.
   procedure PutOnView (
         Buffer   : in out Scroll_Buffer;
         Row      : in     Virt_Row;
         Scrolled :    out Integer);


   -- UpdateSelection : update current selection, given a new
   --                   end position. State can be to set the
   --                   selection, or unset it.
   procedure UpdateSelection (
         Buffer    : in out Scroll_Buffer;
         NewEndPos : in     Real_Pos;
         State     : in     Boolean);


   -- NullSelection : remove any current selection
   procedure NullSelection (
         Buffer : in out Scroll_Buffer);


   -- ConvertCoordsToReal : Convert mouse (X, Y) to real buffer position.
   --                       Scroll view up or down if appropriate.
   procedure ConvertCoordsToReal (
         Buffer  : in out Scroll_Buffer;
         X       : in     Integer;
         Y       : in     Integer;
         RealPos : in out Real_Pos);


   -- StartSelection : Start a selection of the specified type.
   --                : Used in processing mouse clicks.
   --                : Start capturing the mouse.
   procedure StartSelection (
         Buffer    : in out Scroll_Buffer;
         Selection : in     Selection_Type;
         RealPos   : in     Real_Pos);


   -- ExtendSelection : Extend a selection, possibly changing the
   --                   selection type. Used in processing clicks.
   --                   Also starts capturing the mouse, so we can
   --                   update the selection when the mouse moves
   --                   outside the client area.
   procedure ExtendSelection (
         Buffer    : in out Scroll_Buffer;
         Selection : in     Selection_Type;
         RealPos   : in     Real_Pos);


   -- AlreadySelected : True if single character already selected.
   --                   This can affect the behaviour of a click.
   function AlreadySelected (
         Buffer  : in     Scroll_Buffer;
         RealPos : in     Real_Pos)
      return Boolean;


   -- StartSelectionCycle : Start a new selection, cycling
   --                       through selection types.
   procedure StartSelectionCycle (
         Buffer  : in out Scroll_Buffer;
         Keys    : in     GWindows.Windows.Mouse_Key_States;
         RealPos : in     Real_Pos);


   -- ExtendSelectionCycle : Extend a selection, cycling
   --                        through selection types.
   procedure ExtendSelectionCycle (
         Buffer  : in out Scroll_Buffer;
         Keys    : in     GWindows.Windows.Mouse_Key_States;
         RealPos : in     Real_Pos);


   -- ResizeView : Set view to the specified size. The view
   --              cannot be bigger than the current screen
   --              size. If the view cannot be made as large
   --              as requested, make it as large as possible.
   procedure ResizeView (
         Buffer   : in out Scroll_Buffer;
         Cols     : in     Natural;
         Rows     : in     Natural;
         SetView  : in     Boolean := False);


   -- ResizeScreen : Set screen to the specified size. Default
   --                is not to adjust the view size unless the
   --                screen and view are locked, or the new
   --                screen would be smaller than the current view.
   --                This can be overridden by the SetView flag.
   procedure ResizeScreen (
         Buffer   : in out Scroll_Buffer;
         Cols     : in     Natural;
         Rows     : in     Natural;
         SetView  : in     Boolean := False);
 

   -- VerticalScrollbar : Enable or disable vertical scroll bar.
   procedure VerticalScrollbar (
         Buffer  : in out Scroll_Buffer;
         Visible : in     Option);


   -- HorizontalScrollbar : Enable or disable horizontal scroll bar.
   procedure HorizontalScrollbar (
         Buffer  : in out Scroll_Buffer;
         Visible : in     Option);


   -- WindowSizing : Change the Sizing option.
   procedure WindowSizing (
         Buffer   : in out Scroll_Buffer;
         Sizing   : in     Option);


   -- WindowCaption : Change the Title option.
   procedure WindowCaption (
         Buffer : in out Scroll_Buffer;
         Title  : in     Option);


   procedure New_Keyboard_Buffer (
         Buffer : in out Scroll_Buffer);


   procedure Free_Keyboard_Buffer (
         Buffer   : in out Scroll_Buffer);


end Scroll_Buffer;
