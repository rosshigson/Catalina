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
with Ada.Dynamic_Priorities;
with GWindows.Application;
with GWindows.Base;
with GWindows.Windows;
with GWindows.Drawing; -- !! used in terminal_emulator-terminal_type.adb !!
with GWindows.Drawing_Objects;
with Sizable_Panels;
with Ansi_Parser;
with Terminal_Internal_Types;
with Ansi_Buffer;
with Graphic_Buffer;
with Buffer_Types;
with Font_Maps;
with Win32_Support;

package body Terminal_Emulator is

   use Buffer_Types;
   use Font_Maps;
   use Terminal_Buffer;
   use Sizable_Panels;
   use Terminal_Internal_Types;

   package GDO renames GWindows.Drawing_Objects;
   package AP  renames Ansi_Parser;


   procedure Free is
   new Ada.Unchecked_Deallocation (Terminal_Record, Terminal);

   ---------------------
   -- SetTitleOptions --
   ---------------------

   procedure SetTitleOptions (
         Term    : in out Terminal;
         Visible : in     Option   := Ignore;
         Set     : in     Option   := Ignore;
         Title   : in     String   := "") is
   begin
      if Term /= null then
         Term.Terminal.SetTitleOptions (Visible, Set, Title);
      end if;
   end SetTitleOptions;

   ----------------------
   -- SetWindowOptions --
   ----------------------

   procedure SetWindowOptions (
         Term         : in out Terminal;
         XCoord       : in     Integer  := GC.Use_Default;
         YCoord       : in     Integer  := GC.Use_Default;
         OnTop        : in     Option   := Ignore;
         Visible      : in     Option   := Ignore;
         Active       : in     Option   := Ignore;
         CloseWindow  : in     Option   := Ignore;
         CloseProgram : in     Option   := Ignore) is
   begin
      if Term /= null then
         Term.Terminal.SetWindowOptions (XCoord, YCoord, OnTop,
            Visible, Active, CloseWindow, CloseProgram);
      end if;
   end SetWindowOptions;


   --------------------
   -- SetScreenSize  --
   --------------------

   procedure SetScreenSize (
         Term    : in out Terminal;
         Columns : in     Natural  := DEFAULT_SCREEN_COLS;
         Rows    : in     Natural  := DEFAULT_SCREEN_ROWS) is
   begin
      if Term /= null then
         Term.Terminal.SetScreenSize (Columns, Rows);
      end if;
   end SetScreenSize;


   --------------------
   -- GetScreenSize  --
   --------------------

   procedure GetScreenSize (
         Term    : in out Terminal;
         Columns : in out Natural;
         Rows    : in out Natural) is
   begin
      if Term /= null then
         Columns := Term.ScrnCols;
         Rows    := Term.ScrnRows;
      else
         Columns := 0;
         Rows    := 0;
      end if;
   end GetScreenSize;

   ------------------
   -- SetViewSize  --
   ------------------

   procedure SetViewSize (
         Term    : in out Terminal;
         Columns : in     Natural  := 0;
         Rows    : in     Natural  := 0) is
   begin
      if Term /= null then
         Term.Terminal.SetViewSize (Columns, Rows);
      end if;
   end SetViewSize;


   --------------------
   -- SetRegionSize  --
   --------------------

   procedure SetRegionSize (
         Term    : in out Terminal;
         Columns : in     Natural  := 0;
         Rows    : in     Natural  := 0) is
   begin
      if Term /= null then
         Term.Terminal.SetRegionSize (Columns, Rows);
      end if;
   end SetRegionSize;


   --------------------
   -- SetScreenBase  --
   --------------------

   procedure SetScreenBase (
         Term   : in out Terminal;
         Column : in     Natural  := 0;
         Row    : in     Natural  := 0) is
   begin
      if Term /= null then
         Term.Terminal.SetScreenBase (Column, Row);
      end if;
   end SetScreenBase;


   ------------------
   -- SetViewBase  --
   ------------------

   procedure SetViewBase (
         Term   : in out Terminal;
         Column : in     Natural  := 0;
         Row    : in     Natural  := 0) is
   begin
      if Term /= null then
         Term.Terminal.SetViewBase (Column, Row);
      end if;
   end SetViewBase;


   --------------------
   -- SetRegionBase  --
   --------------------

   procedure SetRegionBase (
         Term   : in out Terminal;
         Column : in     Natural  := 0;
         Row    : in     Natural  := 0) is
   begin
      if Term /= null then
         Term.Terminal.SetRegionBase (Column, Row);
      end if;
   end SetRegionBase;


   ---------------------
   -- SetVirtualSize  --
   ---------------------

   procedure SetVirtualSize (
         Term        : in out Terminal;
         VirtualRows : in     Natural  := 0) is
   begin
      if Term /= null then
         Term.Terminal.SetVirtualSize (VirtualRows);
      end if;
   end SetVirtualSize;


   ----------------
   -- ClearKeyboard --
   ----------------

   procedure ClearKeyboard (
         Term : in out Terminal) is
   begin
      if Term /= null then
         Term.Terminal.ClearKeyboard;
      end if;
   end ClearKeyboard;

   ---------------
   -- ClearToEOL --
   ---------------

   procedure ClearToEOL (
         Term : in out Terminal) is
   begin
      if Term /= null then
         Term.Terminal.ClearToEOL;
      end if;
   end ClearToEOL;

   -----------------
   -- ClearScreen --
   -----------------

   procedure ClearScreen (
         Term : in out Terminal) is
   begin
      if Term /= null then
         Term.Terminal.ClearScreen;
      end if;
   end ClearScreen;

   -----------------
   -- ClearBuffer --
   -----------------

   procedure ClearBuffer (
         Term : in out Terminal) is
   begin
      if Term /= null then
         Term.Terminal.ClearBuffer;
      end if;
   end ClearBuffer;

   -----------
   -- Close --
   -----------

   procedure Close (
         Term : in out Terminal) is
   begin
      if Term /= null then
         Term.Terminal.Close;
         -- give the task a chance to die
         for i in 1 .. 10 loop
             exit when Term.Terminal'Terminated or not Term.Terminal'Callable;
             delay 0.1;
         end loop;
         Free (Term);
      end if;
   end Close;

   ------------
   -- Closed --
   ------------

   function Closed (
         Term : in     Terminal)
     return Boolean is
   begin
      return Term = null
      or else (Term.Terminal'Terminated or not Term.Terminal'Callable);
   end Closed;

   ---------
   -- Get --
   ---------

   procedure Get (
         Term : in out Terminal;
         Char :    out Character) is
   begin
      if Term /= null then
          Term.Terminal.Get (Char);
      end if;
   end Get;

   -----------
   -- UnGet --
   -----------

   procedure UnGet (
         Term : in out Terminal;
         Char : in     Character) is
   begin
      if Term /= null then
         Term.Terminal.UnGet (Char);
      end if;
   end UnGet;

   -----------------
   -- GetExtended --
   -----------------

   procedure GetExtended (
         Term     : in out Terminal;
         Special  :    out Special_Key_Type;
         Modifier :    out Modifier_Key_Type;
         Char     :    out Character) is
   begin
      if Term /= null then
         Term.Terminal.GetExtended (Special, Modifier, Char);
      end if;
   end GetExtended;

   ---------
   -- Get --
   ---------

   procedure Get (
         Term : in out Terminal;
         Line :    out String) is
   begin
      if Term /= null then
         for I in Line'Range loop
            Term.Terminal.Get (Line (I));
         end loop;
      end if;
   end Get;

   -----------------
   -- GetInputPos --
   -----------------

   procedure GetInputPos (
         Term       : in     Terminal;
         Column     :    out Natural;
         Row        :    out Natural;
         InputStyle : in    Boolean := True) is
   begin
      if Term /= null then
         Term.Terminal.GetInputPos (Column, Row, InputStyle);
      end if;
   end GetInputPos;

   ------------------
   -- GetOutputPos --
   ------------------

   procedure GetOutputPos (
         Term        : in     Terminal;
         Column      :    out Natural;
         Row         :    out Natural;
         OutputStyle : in     Boolean := True) is
   begin
      if Term /= null then
         Term.Terminal.GetOutputPos (Column, Row, OutputStyle);
      end if;
   end GetOutputPos;

   -----------
   -- Input --
   -----------

   procedure Peek (
         Term  : in     Terminal;
         Char  :    out Character;
         Ready :    out Boolean) is
   begin
      if Term /= null then
         Term.Terminal.Peek (Char, Ready);
      end if;
   end Peek;

   ----------
   -- Open --
   ----------

   procedure Open (
         Term         : in out Terminal;
         Title        : in     String        := "";
         MainMenu     : in     Option        := Ignore;
         TransferMenu : in     Option        := Ignore;
         OptionMenu   : in     Option        := Ignore;
         AdvancedMenu : in     Option        := Ignore;
         ContextMenu  : in     Option        := Ignore;
         Columns      : in     Natural       := DEFAULT_SCREEN_COLS;
         Rows         : in     Natural       := DEFAULT_SCREEN_ROWS;
         VirtualRows  : in     Natural       := DEFAULT_VIRTUAL_ROWS;
         XCoord       : in     Integer       := GC.Use_Default;
         YCoord       : in     Integer       := GC.Use_Default;
         OnTop        : in     Option        := Ignore;
         Visible      : in     Option        := Ignore;
         Font         : in     String;
         CharSet      : in     Charset_Type  := GDO.ANSI_CHARSET;
         Size         : in     Integer       := DEFAULT_FONT_SIZE) is
   begin
      if Term /= null then
         null;
      else
         Term := new Terminal_Record;
         Term.Terminal.Open (Term, Title, 
            MainMenu, TransferMenu, OptionMenu, AdvancedMenu, ContextMenu,
            Columns, Rows, VirtualRows, XCoord, YCoord, OnTop,
            Visible, Font, CharSet, Size);
      end if;
   end Open;


   ----------
   -- Open --
   ----------

   procedure Open (
         Term         : in out Terminal;
         Title        : in     String    := "";
         MainMenu     : in     Option    := Ignore;
         TransferMenu : in     Option    := Ignore;
         OptionMenu   : in     Option    := Ignore;
         AdvancedMenu : in     Option    := Ignore;
         ContextMenu  : in     Option    := Ignore;
         Columns      : in     Natural   := DEFAULT_SCREEN_COLS;
         Rows         : in     Natural   := DEFAULT_SCREEN_ROWS;
         VirtualRows  : in     Natural   := DEFAULT_VIRTUAL_ROWS;
         XCoord       : in     Integer   := GC.Use_Default;
         YCoord       : in     Integer   := GC.Use_Default;
         OnTop        : in     Option    := Ignore;
         Visible      : in     Option    := Ignore;
         Font         : in     Font_Type := DEFAULT_FONT_TYPE;
         PrintFont    : in     String    := DEFAULT_PRINT_FONT;
         Size         : in     Integer   := DEFAULT_FONT_SIZE) is
   begin
      if Term /= null then
         null;
      else
         Term := new Terminal_Record;
         Term.Terminal.Open (Term, Title, 
            MainMenu, TransferMenu, OptionMenu, AdvancedMenu, ContextMenu,
            Columns, Rows, VirtualRows, XCoord, YCoord, OnTop,
            Visible, Font, PrintFont, Size);
      end if;
   end Open;


   ---------
   -- Put --
   ---------

   procedure Put (
         Term   : in out Terminal;
         Char   : in     Character;
         Column : in     Integer   := -1;
         Row    : in     Integer   := -1;
         Move   : in     Option    := Yes) is
      Added : Boolean;
   begin
      if Term /= null then
         if Column = -1 and Row = -1 and Move = Yes then
            -- this is a candidate for buffering
            Term.Buffer.PutProtect.Acquire;
            PutToBuffer (Term.Buffer, Char, Added);
            Term.Buffer.PutProtect.Release;
            if not Added then
               -- buffer is full, so force put buffer to be
               -- processed, then process the Put request
               Term.Terminal.Put (Char, Column, Row, Move);
            end if;
         else
            -- force put buffer to be processed,
            -- then process the Put request
            Term.Terminal.Put (Char, Column, Row, Move);
         end if;
      end if;
   end Put;

   ---------
   -- Put --
   ---------

   procedure Put (
         Term   : in out Terminal;
         Str    : in     String;
         Column : in     Integer  := -1;
         Row    : in     Integer  := -1;
         Move   : in     Option   := Yes) is
   begin
      if Term /= null then
         Term.Terminal.Put (Str, Column, Row, Move);
      end if;
   end Put;


   ------------
   -- Scroll --
   ------------

   procedure Scroll (
         Term : in out Terminal;
         Rows : in     Integer  := 1) is
   begin
      if Term /= null then
         Term.Terminal.Scroll (Rows);
      end if;
   end Scroll;

   -----------
   -- Shift --
   -----------

   procedure Shift (
         Term : in out Terminal;
         Cols : in     Integer  := 1) is
   begin
      if Term /= null then
         Term.Terminal.Shift (Cols);
      end if;
   end Shift;

   --------------------
   -- SetCursorColor --
   --------------------

   procedure SetCursorColor (
         Term  : in out Terminal;
         Color : in     Color_Type := DEFAULT_CURS_COLOR) is
   begin
      if Term /= null then
         Term.Terminal.SetCursorColor (Color);
      end if;
   end SetCursorColor;

   ----------------------
   -- SetCursorOptions --
   ----------------------

   procedure SetCursorOptions (
         Term     : in out Terminal;
         Visible  : in     Option   := Ignore;
         Flashing : in     Option   := Ignore;
         Bar      : in     Option   := Ignore) is
   begin
      if Term /= null then
         Term.Terminal.SetCursorOptions (Visible, Flashing, Bar);
      end if;
   end SetCursorOptions;

   -------------------
   -- SetRowOptions --
   -------------------

   procedure SetRowOptions (
         Term     : in out Terminal;
         Row      : in     Integer   := -1;
         Size     : in     Row_Size  := Single_Width) is
   begin
      if Term /= null then
         Term.Terminal.SetRowOptions (Row, Size);
      end if;
   end SetRowOptions;

   -------------------
   -- SetTabOptions --
   -------------------

   procedure SetTabOptions (
         Term    : in out Terminal;
         Size    : in     Integer := -1;
         SetAt   : in     Integer := -1;
         ClearAt : in     Integer := -1) is
   begin
      if Term /= null then
         Term.Terminal.SetTabOptions (Size, SetAt, ClearAt);
      end if;
   end SetTabOptions;


   -------------------
   -- SetFontByName --
   -------------------

   procedure SetFontByName (
         Term    : in out Terminal;
         SetName : in     Option        := Ignore;
         Font    : in     String        := DEFAULT_FONT_NAME;
         SetSize : in     Option        := Ignore;
         Size    : in     Natural       := DEFAULT_FONT_SIZE;
         SetChar : in     Option        := Ignore;
         CharSet : in     Charset_Type  := GDO.ANSI_CHARSET) is
   begin
      if Term /= null then
         Term.Terminal.SetFontByName (SetName, Font, SetSize, Size, SetChar, CharSet);
      end if;
   end SetFontByName;

   -------------------
   -- SetFontByType --
   -------------------

   procedure SetFontByType (
         Term    : in out Terminal;
         SetType : in     Option    := Ignore;
         Font    : in     Font_Type := DEFAULT_FONT_TYPE;
         SetSize : in     Option    := Ignore;
         Size    : in     Natural   := DEFAULT_FONT_SIZE) is
   begin
      if Term /= null then
         Term.Terminal.SetFontByType (SetType, Font, SetSize, Size);
      end if;
   end SetFontByType;

   -----------------
   -- SetInputPos --
   -----------------

   procedure SetInputPos (
         Term   : in out Terminal;
         Column : in     Integer  := -1;
         Row    : in     Integer  := -1) is
   begin
      if Term /= null then
         Term.Terminal.SetInputPos (Column, Row);
      end if;
   end SetInputPos;

   ------------------
   -- SetOutputPos --
   ------------------

   procedure SetOutputPos (
         Term   : in out Terminal;
         Column : in     Integer  := -1;
         Row    : in     Integer  := -1) is
   begin
      if Term /= null then
         Term.Terminal.SetOutputPos (Column, Row);
      end if;
   end SetOutputPos;

   ---------------------
   -- SetInputBgColor --
   ---------------------

   procedure SetInputBgColor (
         Term  : in out Terminal;
         Color : in     Color_Type := DEFAULT_BG_COLOR) is
   begin
      if Term /= null then
         Term.Terminal.SetInputBgColor (Color);
      end if;
   end SetInputBgColor;

   ---------------------
   -- SetInputFgColor --
   ---------------------

   procedure SetInputFgColor (
         Term  : in out Terminal;
         Color : in     Color_Type := DEFAULT_FG_COLOR) is
   begin
      if Term /= null then
         Term.Terminal.SetInputFgColor (Color);
      end if;
   end SetInputFgColor;

   -------------------
   -- SetInputStyle --
   -------------------

   procedure SetInputStyle (
         Term      : in out Terminal;
         Bold      : in     Option   := Ignore;
         Italic    : in     Option   := Ignore;
         Underline : in     Option   := Ignore;
         Strikeout : in     Option   := Ignore;
         Inverse   : in     Option   := Ignore;
         Flashing  : in     Option   := Ignore) is
   begin
      if Term /= null then
         Term.Terminal.SetInputStyle (
            Bold, Italic, Underline, Strikeout, Inverse, Flashing);
      end if;
   end SetInputStyle;

   ----------------------
   -- SetOutputBgColor --
   ----------------------

   procedure SetOutputBgColor (
         Term  : in out Terminal;
         Color : in     Color_Type := DEFAULT_BG_COLOR) is
   begin
      if Term /= null then
         Term.Terminal.SetOutputBgColor (Color);
      end if;
   end SetOutputBgColor;

   ----------------------
   -- SetOutputFgColor --
   ----------------------

   procedure SetOutputFgColor (
         Term  : in out Terminal;
         Color : in     Color_Type := DEFAULT_FG_COLOR) is
   begin
      if Term /= null then
         Term.Terminal.SetOutputFgColor (Color);
      end if;
   end SetOutputFgColor;

   --------------------
   -- SetOutputStyle --
   --------------------

   procedure SetOutputStyle (
         Term      : in out Terminal;
         Bold      : in     Option   := Ignore;
         Italic    : in     Option   := Ignore;
         Underline : in     Option   := Ignore;
         Strikeout : in     Option   := Ignore;
         Inverse   : in     Option   := Ignore;
         Flashing  : in     Option   := Ignore) is
   begin
      if Term /= null then
         Term.Terminal.SetOutputStyle (
            Bold, Italic, Underline, Strikeout, Inverse, Flashing);
      end if;
   end SetOutputStyle;

   ---------------------
   -- SetScreenColors --
   ---------------------

   procedure SetScreenColors (
         Term    : in out Terminal;
         FgColor : in     Color_Type := DEFAULT_FG_COLOR;
         BgColor : in     Color_Type := DEFAULT_BG_COLOR;
         Current : in     Option     := Ignore) is
   begin
      if Term /= null then
         Term.Terminal.SetScreenColors (FgColor, BgColor, Current);
      end if;
   end SetScreenColors;

   ---------------------
   -- SetBufferColors --
   ---------------------

   procedure SetBufferColors (
         Term    : in out Terminal;
         FgColor : in     Color_Type := DEFAULT_FG_COLOR;
         BgColor : in     Color_Type := DEFAULT_BG_COLOR;
         Current : in     Option     := Ignore) is
   begin
      if Term /= null then
         Term.Terminal.SetBufferColors (FgColor, BgColor, Current);
      end if;
   end SetBufferColors;

   -----------------------
   -- SetEditingOptions --
   -----------------------

   procedure SetEditingOptions (
         Term   : in out Terminal;
         Wrap   : in     Option   := Ignore;
         Insert : in     Option   := Ignore;
         Echo   : in     Option   := Ignore) is
   begin
      if Term /= null then
         Term.Terminal.SetEditingOptions (Wrap, Insert, Echo);
      end if;
   end SetEditingOptions;

   ---------------------
   -- SetPasteOptions --
   ---------------------

   procedure SetPasteOptions (
         Term       : in out Terminal;
         ToBuffer   : in     Option   := Ignore;
         ToKeyboard : in     Option   := Ignore) is
   begin
      if Term /= null then
         Term.Terminal.SetPasteOptions (ToBuffer, ToKeyboard);
      end if;
   end SetPasteOptions;

   function Pasting (
         Term  : in     Terminal)
    return Boolean is
     Flag : Boolean;      
   begin
      if Term /= null then 
         Term.Terminal.GetPastingFlag(Flag);
         return Flag;   
      else
         return False;
      end if;
   end Pasting;
      
   procedure NotPasting (
         Term  : in     Terminal) is
   begin
      if Term /= null then 
         Term.Terminal.SetPastingFlag(False);
      end if;
   end NotPasting;
      
   

   ----------------------
   -- SetScrollOptions --
   ----------------------

   procedure SetScrollOptions (
         Term       : in out Terminal;
         Horizontal : in     Option   := Ignore;
         Vertical   : in     Option   := Ignore;
         OnOutput   : in     Option   := Ignore;
         Smooth     : in     Option   := Ignore;
         Region     : in     Option   := Ignore) is
   begin
      if Term /= null then
         Term.Terminal.SetScrollOptions (
            Horizontal, Vertical, OnOutput, Smooth, Region);
      end if;
   end SetScrollOptions;

   --------------------
   -- SetMenuOptions --
   --------------------

   procedure SetMenuOptions (
         Term         : in out Terminal;
         MainMenu     : in     Option   := Ignore;
         TransferMenu : in     Option   := Ignore;
         OptionMenu   : in     Option   := Ignore;
         AdvancedMenu : in     Option   := Ignore;
         ContextMenu  : in     Option   := Ignore) is
   begin
      if Term /= null then
         Term.Terminal.SetMenuOptions (
            MainMenu, TransferMenu, OptionMenu, AdvancedMenu, ContextMenu);
      end if;
   end SetMenuOptions;

   ----------------------
   -- SetSizingOptions --
   ----------------------

   procedure SetSizingOptions (
         Term   : in out Terminal;
         Sizing : in     Option      := Ignore;
         Mode   : in     Sizing_Mode := DEFAULT_SIZING_MODE) is
   begin
      if Term /= null then
         Term.Terminal.SetSizingOptions (Sizing, Mode);
      end if;
   end SetSizingOptions;

   ----------------------
   -- SetAnsiOptions --
   ----------------------

   procedure SetAnsiOptions (
         Term     : in out Terminal;
         OnInput  : in     Option    := Ignore;
         OnOutput : in     Option    := Ignore;
         Mode     : in     Ansi_Mode := DEFAULT_ANSI_MODE) is
   begin
      if Term /= null then
         Term.Terminal.SetAnsiOptions (OnInput, OnOutput, Mode);
      end if;
   end SetAnsiOptions;

   ---------------------
   -- SetKeyOptions --
   ---------------------

   procedure SetKeyOptions (
         Term         : in out Terminal;
         ExtendedKeys : in     Option   := Ignore;
         CursorKeys   : in     Option   := Ignore;
         VTKeys       : in     Option   := Ignore;
         AutoRepeat   : in     Option   := Ignore;
         Locked       : in     Option   := Ignore;
         SetSize      : in     Option   := Ignore;
         Size         : in     Natural  := DEFAULT_KEYBUF_SIZE) is
   begin
      if Term /= null then
         Term.Terminal.SetKeyOptions (
            ExtendedKeys,
            CursorKeys,
            VTKeys,
            AutoRepeat,
            Locked,
            SetSize,
            Size);
      end if;
   end SetKeyOptions;


   ---------------------
   -- SetOtherOptions --
   ---------------------

   procedure SetOtherOptions (
         Term              : in out Terminal;
         IgnoreCR          : in     Option   := Ignore;
         IgnoreLF          : in     Option   := Ignore;
         UseLFasEOL        : in     Option   := Ignore;
         AutoLFonCR        : in     Option   := Ignore;
         AutoCRonLF        : in     Option   := Ignore;
         UpDownMoveView    : in     Option   := Ignore;
         PageMoveView      : in     Option   := Ignore;
         HomeEndMoveView   : in     Option   := Ignore;
         LockScreenAndView : in     Option   := Ignore;
         LeftRightWrap     : in     Option   := Ignore;
         LeftRightScroll   : in     Option   := Ignore;
         HomeEndWithinLine : in     Option   := Ignore;
         CombinedStyle     : in     Option   := Ignore;
         CombinedCursor    : in     Option   := Ignore;
         FlashingEnabled   : in     Option   := Ignore;
         HalftoneEnabled   : in     Option   := Ignore;
         DisplayControls   : in     Option   := Ignore;
         SysKeysEnabled    : in     Option   := Ignore;
         DeleteOnBS        : in     Option   := Ignore;
         RedrawPrevious    : in     Option   := Ignore;
         RedrawNext        : in     Option   := Ignore) is
   begin
      if Term /= null then
         Term.Terminal.SetOtherOptions (
            IgnoreCR, IgnoreLF,
            UseLFasEOL, AutoLFonCR, AutoCRonLF,
            UpDownMoveView, PageMoveView,
            HomeEndMoveView, LockScreenAndView,
            LeftRightWrap, LeftRightScroll,
            HomeEndWithinLine, CombinedStyle,
            CombinedCursor, FlashingEnabled,
            HalftoneEnabled, DisplayControls,
            SysKeysEnabled, DeleteOnBS,
            RedrawPrevious, RedrawNext);
      end if;
   end SetOtherOptions;

   ---------------------
   -- SetMouseOptions --
   ---------------------
   procedure SetMouseOptions (
         Term         : in out Terminal;
         MouseCursor  : in     Option   := Ignore;
         MouseSelects : in     Option   := Ignore) is
   begin
      if Term /= null then
         Term.Terminal.SetMouseOptions (MouseCursor, MouseSelects);
      end if;
   end SetMouseOptions;


   ------------------
   -- PushInputPos --
   ------------------
   procedure PushInputPos (
         Term : in out Terminal) is
   begin
      if Term /= null then
         Term.Terminal.PushInputPos;
      end if;
   end PushInputPos;


   -----------------
   -- PopInputPos --
   -----------------
   procedure PopInputPos (
         Term    : in out Terminal;
         Discard : in     Option   := No;
         Show    : in     Option   := Yes;
         Force   : in     Option   := Yes) is
   begin
      if Term /= null then
         Term.Terminal.PopInputPos (Discard, Show, Force);
      end if;
   end PopInputPos;


   -------------------
   -- PushOutputPos --
   -------------------
   procedure PushOutputPos (
         Term : in out Terminal) is
   begin
      if Term /= null then
         Term.Terminal.PushOutputPos;
      end if;
   end PushOutputPos;


   ------------------
   -- PopOutputPos --
   ------------------
   procedure PopOutputPos (
         Term    : in out Terminal;
         Discard : in     Option   := No;
         Show    : in     Option   := Yes;
         Force   : in     Option   := Yes) is
   begin
      if Term /= null then
         Term.Terminal.PopOutputPos (Discard, Show, Force);
      end if;
   end PopOutputPos;


   --------------------------
   -- GetBufferInformation --
   --------------------------
   procedure GetBufferInformation (
         Term        : in out Terminal;
         RealSizeCol :    out Natural;
         RealSizeRow :    out Natural;
         RealUsedCol :    out Natural;
         RealUsedRow :    out Natural;
         VirtBaseCol :    out Natural;
         VirtBaseRow :    out Natural;
         VirtUsedCol :    out Natural;
         VirtUsedRow :    out Natural;
         ScrnBaseCol :    out Natural;
         ScrnBaseRow :    out Natural;
         ScrnSizeCol :    out Natural;
         ScrnSizeRow :    out Natural;
         ViewBaseCol :    out Natural;
         ViewBaseRow :    out Natural;
         ViewSizeCol :    out Natural;
         ViewSizeRow :    out Natural;
         RegnBaseCol :    out Natural;
         RegnBaseRow :    out Natural;
         RegnSizeCol :    out Natural;
         RegnSizeRow :    out Natural) is
   begin
      if Term /= null then
         Term.Terminal.GetBufferInformation (
            RealSizeCol, RealSizeRow,
            RealUsedCol, RealUsedRow,
            VirtBaseCol, VirtBaseRow,
            VirtUsedCol, VirtUsedRow,
            ScrnBaseCol, ScrnBaseRow,
            ScrnSizeCol, ScrnSizeRow,
            ViewBaseCol, ViewBaseRow,
            ViewSizeCol, ViewSizeRow,
            RegnBaseCol, RegnBaseRow,
            RegnSizeCol, RegnSizeRow);
      end if;
   end GetBufferInformation;


   -----------------------
   -- GetEditingOptions --
   -----------------------
   procedure GetEditingOptions (
         Term   : in out Terminal;
         Insert :    out Boolean;
         Wrap   :    out Boolean;
         Echo   :    out Boolean) is
   begin
      if Term /= null then
         Term.Terminal.GetEditingOptions (Insert, Wrap, Echo);
      end if;
   end GetEditingOptions;


   ----------------
   -- ScreenDump --
   ----------------
   procedure ScreenDump (
         Term   : in out Terminal;
         Column : in     Natural;
         Row    : in     Natural;
         Result : in out String;
         Length : in out Natural) is
   begin
      if Term /= null then
         Term.Terminal.ScreenDump (Column, Row, Result, Length);
      end if;
   end ScreenDump;


   -----------------
   -- SetPriority --
   -----------------
   procedure SetPriority (
         Term     : in out Terminal;
         Priority : in     System.Priority := System.Default_Priority - 1) is
   begin
      if Term /= null then
         Term.Terminal.SetPriority (Priority);
      end if;
   end SetPriority;


   ------------------
   -- SetCommsPort --
   ------------------
procedure SetCommsPort (
         Term       : in out Terminal;
         CommsPort  : in     WS.Win32_Handle;
         CommsMutex : in     Protection.MutexPtr) is
   begin
      if Term /= null then
         Term.Terminal.SetCommsPort (CommsPort, CommsMutex);
      end if;
   end SetCommsPort;


   -------------------
   -- Terminal_Type --
   -------------------

   -- protected body Terminal_Type is separate;
   task body Terminal_Type is separate;


end Terminal_Emulator;
