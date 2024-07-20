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

with System;
with GWindows.Constants;
with Terminal_Types;
with Terminal_Buffer;

with Win32_Support;

with Protection;

package Terminal_Emulator is

   package WS renames Win32_Support;

   -- Notes on Terminal_Emulator
   -- ==========================
   --
   -- Terminal_Emulator is a full featured ANSI terminal emulator that
   -- supports complete VT52, VT100 and VT102 emulation including double
   -- height and double width characters, smooth scrolling, graphic
   -- characters, and national and multinational character sets. It also
   -- supports a substantial set of VT220 and VT420 features, as well as
   -- ISO 6429.
   --
   -- As well as supporting the ANSI control sequences, Terminal_Emulator
   -- provides an Ada 95 API that allows high level structured access to
   -- most ANSI capabilities, as well as many additional capabilities.
   --
   -- For a description of the ANSI control sequences supported, and for
   -- a complete description of the use of this API, refer to the
   -- Terminal_Emulator documentation.
   --

   use Terminal_Types;

   package GC renames GWindows.Constants;


   type Terminal is limited private;

   type Access_Terminal is access all Terminal;


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
         Size         : in     Integer       := DEFAULT_FONT_SIZE);

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
         Size         : in     Integer   := DEFAULT_FONT_SIZE);

   procedure SetTitleOptions (
         Term    : in out Terminal;
         Visible : in     Option   := Ignore;
         Set     : in     Option   := Ignore;
         Title   : in     String   := "");

   procedure SetWindowOptions (
         Term         : in out Terminal;
         XCoord       : in     Integer  := GC.Use_Default;
         YCoord       : in     Integer  := GC.Use_Default;
         OnTop        : in     Option   := Ignore;
         Visible      : in     Option   := Ignore;
         Active       : in     Option   := Ignore;
         CloseWindow  : in     Option   := Ignore;
         CloseProgram : in     Option   := Ignore);

   procedure SetScreenSize (
         Term    : in out Terminal;
         Columns : in     Natural  := DEFAULT_SCREEN_COLS;
         Rows    : in     Natural  := DEFAULT_SCREEN_ROWS);

   procedure GetScreenSize (
         Term    : in out Terminal;
         Columns : in out Natural;
         Rows    : in out Natural);

   procedure SetViewSize (
         Term    : in out Terminal;
         Columns : in     Natural  := 0;
         Rows    : in     Natural  := 0);

   procedure SetRegionSize (
         Term    : in out Terminal;
         Columns : in     Natural  := 0;
         Rows    : in     Natural  := 0);

   procedure SetScreenBase (
         Term   : in out Terminal;
         Column : in     Natural  := 0;
         Row    : in     Natural  := 0);

   procedure SetViewBase (
         Term   : in out Terminal;
         Column : in     Natural  := 0;
         Row    : in     Natural  := 0);

   procedure SetRegionBase (
         Term   : in out Terminal;
         Column : in     Natural  := 0;
         Row    : in     Natural  := 0);

   procedure SetVirtualSize (
         Term        : in out Terminal;
         VirtualRows : in     Natural  := 0);

   procedure Close (
         Term : in out Terminal);

   function Closed (
         Term : in     Terminal)
     return Boolean;

   procedure ClearScreen (
         Term : in out Terminal);

   procedure ClearBuffer (
         Term : in out Terminal);

   procedure ClearToEOL (
         Term : in out Terminal);

   procedure ClearKeyboard (
         Term : in out Terminal);

   procedure Scroll (
         Term  : in out Terminal;
         Rows  : in     Integer  := 1);

   procedure Shift (
         Term  : in out Terminal;
         Cols  : in     Integer  := 1);

   procedure SetEditingOptions (
         Term   : in out Terminal;
         Wrap   : in     Option   := Ignore;
         Insert : in     Option   := Ignore;
         Echo   : in     Option   := Ignore);

   procedure SetPasteOptions (
         Term       : in out Terminal;
         ToBuffer   : in     Option   := Ignore;
         ToKeyboard : in     Option   := Ignore);

   function Pasting (
         Term  : in     Terminal)
     return Boolean;

   procedure NotPasting (
        Term  : in     Terminal);

   procedure SetScrollOptions (
         Term       : in out Terminal;
         Horizontal : in     Option   := Ignore;
         Vertical   : in     Option   := Ignore;
         OnOutput   : in     Option   := Ignore;
         Smooth     : in     Option   := Ignore;
         Region     : in     Option   := Ignore);

   procedure SetMenuOptions (
         Term         : in out Terminal;
         MainMenu     : in     Option   := Ignore;
         TransferMenu : in     Option   := Ignore;
         OptionMenu   : in     Option   := Ignore;
         AdvancedMenu : in     Option   := Ignore;
         ContextMenu  : in     Option   := Ignore);

   procedure SetSizingOptions (
         Term   : in out Terminal;
         Sizing : in     Option      := Ignore;
         Mode   : in     Sizing_Mode := DEFAULT_SIZING_MODE);

   procedure SetAnsiOptions (
         Term     : in out Terminal;
         OnInput  : in     Option    := Ignore;
         OnOutput : in     Option    := Ignore;
         Mode     : in     Ansi_Mode := DEFAULT_ANSI_MODE);

   procedure GetInputPos (
         Term       : in     Terminal;
         Column     :    out Natural;
         Row        :    out Natural;
         InputStyle : in     Boolean := True);

   procedure SetInputPos (
         Term   : in out Terminal;
         Column : in     Integer  := -1;
         Row    : in     Integer  := -1);

   procedure GetOutputPos (
         Term        : in     Terminal;
         Column      :    out Natural;
         Row         :    out Natural;
         OutputStyle : in     Boolean := True);

   procedure SetOutputPos (
         Term   : in out Terminal;
         Column : in     Integer  := -1;
         Row    : in     Integer  := -1);

   procedure PushInputPos (
         Term : in out Terminal);

   procedure PopInputPos (
         Term    : in out Terminal;
         Discard : in     Option   := No;
         Show    : in     Option   := Yes;
         Force   : in     Option   := Yes);

   procedure PushOutputPos (
         Term : in out Terminal);

   procedure PopOutputPos (
         Term    : in out Terminal;
         Discard : in     Option   := No;
         Show    : in     Option   := Yes;
         Force   : in     Option   := Yes);

   procedure Peek (
         Term  : in     Terminal;
         Char  :    out Character;
         Ready :    out Boolean);

   procedure Get (
         Term : in out Terminal;
         Char :    out Character);

   procedure UnGet (
         Term : in out Terminal;
         Char : in     Character);

   procedure GetExtended (
         Term     : in out Terminal;
         Special  :    out Special_Key_Type;
         Modifier :    out Modifier_Key_Type;
         Char     :    out Character);

   procedure Get (
         Term : in out Terminal;
         Line :    out String);

   procedure Put (
         Term   : in out Terminal;
         Char   : in     Character;
         Column : in     Integer   := -1;
         Row    : in     Integer   := -1;
         Move   : in     Option    := Yes);

   procedure Put (
         Term   : in out Terminal;
         Str    : in     String;
         Column : in     Integer  := -1;
         Row    : in     Integer  := -1;
         Move   : in     Option   := Yes);

   procedure SetInputFgColor (
         Term  : in out Terminal;
         Color : in     Color_Type := DEFAULT_FG_COLOR);

   procedure SetInputBgColor (
         Term  : in out Terminal;
         Color : in     Color_Type := DEFAULT_BG_COLOR);

   procedure SetInputStyle (
         Term      : in out Terminal;
         Bold      : in     Option   := Ignore;
         Italic    : in     Option   := Ignore;
         Underline : in     Option   := Ignore;
         Strikeout : in     Option   := Ignore;
         Inverse   : in     Option   := Ignore;
         Flashing  : in     Option   := Ignore);

   procedure SetOutputFgColor (
         Term  : in out Terminal;
         Color : in     Color_Type := DEFAULT_FG_COLOR);

   procedure SetOutputBgColor (
         Term  : in out Terminal;
         Color : in     Color_Type := DEFAULT_BG_COLOR);

   procedure SetOutputStyle (
         Term      : in out Terminal;
         Bold      : in     Option   := Ignore;
         Italic    : in     Option   := Ignore;
         Underline : in     Option   := Ignore;
         Strikeout : in     Option   := Ignore;
         Inverse   : in     Option   := Ignore;
         Flashing  : in     Option   := Ignore);

   procedure SetCursorColor (
         Term  : in out Terminal;
         Color : in     Color_Type := DEFAULT_CURS_COLOR);

   procedure SetCursorOptions (
         Term     : in out Terminal;
         Visible  : in     Option   := Ignore;
         Flashing : in     Option   := Ignore;
         Bar      : in     Option   := Ignore);

   procedure SetRowOptions (
         Term     : in out Terminal;
         Row      : in     Integer   := -1;
         Size     : in     Row_Size  := Single_Width);

   procedure SetScreenColors (
         Term    : in out Terminal;
         FgColor : in     Color_Type := DEFAULT_FG_COLOR;
         BgColor : in     Color_Type := DEFAULT_BG_COLOR;
         Current : in     Option     := Ignore);

   procedure SetBufferColors (
         Term    : in out Terminal;
         FgColor : in     Color_Type := DEFAULT_FG_COLOR;
         BgColor : in     Color_Type := DEFAULT_BG_COLOR;
         Current : in     Option     := Ignore);

   procedure SetKeyOptions (
         Term         : in out Terminal;
         ExtendedKeys : in     Option   := Ignore;
         CursorKeys   : in     Option   := Ignore;
         VTKeys       : in     Option   := Ignore;
         AutoRepeat   : in     Option   := Ignore;
         Locked       : in     Option   := Ignore;
         SetSize      : in     Option   := Ignore;
         Size         : in     Natural  := DEFAULT_KEYBUF_SIZE);

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
         RedrawNext        : in     Option   := Ignore);

   procedure SetMouseOptions (
         Term         : in out Terminal;
         MouseCursor  : in     Option   := Ignore;
         MouseSelects : in     Option   := Ignore);

   procedure SetTabOptions (
         Term    : in out Terminal;
         Size    : in     Integer := -1;
         SetAt   : in     Integer := -1;
         ClearAt : in     Integer := -1);

   procedure SetFontByType (
         Term    : in out Terminal;
         SetType : in     Option    := Ignore;
         Font    : in     Font_Type := DEFAULT_FONT_TYPE;
         SetSize : in     Option    := Ignore;
         Size    : in     Natural   := DEFAULT_FONT_SIZE);

   procedure SetFontByName (
         Term    : in out Terminal;
         SetName : in     Option        := Ignore;
         Font    : in     String        := DEFAULT_FONT_NAME;
         SetSize : in     Option        := Ignore;
         Size    : in     Natural       := DEFAULT_FONT_SIZE;
         SetChar : in     Option        := Ignore;
         CharSet : in     Charset_Type  := GDO.ANSI_CHARSET);

   procedure GetEditingOptions (
         Term   : in out Terminal;
         Insert :    out Boolean;
         Wrap   :    out Boolean;
         Echo   :    out Boolean);

   procedure ScreenDump (
         Term   : in out Terminal;
         Column : in     Natural;
         Row    : in     Natural;
         Result : in out String;
         Length : in out Natural);

   procedure SetPriority (
         Term     : in out Terminal;
         Priority : in     System.Priority := System.Default_Priority - 1);

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
         RegnSizeRow :    out Natural);

   --
   --  Since most common terminal configurations use the
   --  INPUT cursor and the OUTPUT style, the following
   --  renamed procedures are more intuitive. Except for
   --  special cases, they should be used in preference
   --  to the corresponding Input and Output specific
   --  procedures defined above.
   --

   procedure SetPos (
         Term   : in out Terminal;
         Column : in     Integer  := -1;
         Row    : in     Integer  := -1)
      renames SetInputPos;

   procedure GetPos (
         Term   : in     Terminal;
         Column :    out Natural;
         Row    :    out Natural;
         Style  : in     Boolean := True)
      renames GetInputPos;

   procedure SetStyle (
         Term      : in out Terminal;
         Bold      : in     Option   := Ignore;
         Italic    : in     Option   := Ignore;
         Underline : in     Option   := Ignore;
         Strikeout : in     Option   := Ignore;
         Inverse   : in     Option   := Ignore;
         Flashing  : in     Option   := Ignore)
      renames SetOutputStyle;

   procedure SetFgColor (
         Term  : in out Terminal;
         Color : in     Color_Type := DEFAULT_FG_COLOR)
      renames SetOutputFgColor;

   procedure SetBgColor (
         Term  : in out Terminal;
         Color : in     Color_Type := DEFAULT_FG_COLOR)
      renames SetOutputBgColor;

   procedure SetCommsPort (
         Term       : in out Terminal;
         CommsPort  : in     WS.Win32_Handle;
         CommsMutex : in     Protection.MutexPtr);


private

   task type Terminal_Type is

      -- For most efficient operation, the screen task should
      -- be lower in priority than the task that uses it. If
      -- this task does not have the default priority, use
      -- SetPriority to change the priority of the screen task.

      pragma Priority (System.Default_Priority - 1);

      entry Open (
            Self         : in     Terminal;
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
            Size         : in     Integer       := DEFAULT_FONT_SIZE);

      entry Open (
            Self         : in     Terminal;
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
            Size         : in     Integer   := DEFAULT_FONT_SIZE);

      entry SetTitleOptions (
            Visible : in     Option := Ignore;
            Set     : in     Option := Ignore;
            Title   : in     String := "");

      entry SetWindowOptions (
            XCoord       : in     Integer := GC.Use_Default;
            YCoord       : in     Integer := GC.Use_Default;
            OnTop        : in     Option  := Ignore;
            Visible      : in     Option  := Ignore;
            Active       : in     Option  := Ignore;
            CloseWindow  : in     Option  := Ignore;
            CloseProgram : in     Option  := Ignore);

      entry SetScreenSize (
            Columns : in     Natural := DEFAULT_SCREEN_COLS;
            Rows    : in     Natural := DEFAULT_SCREEN_ROWS);

      entry SetViewSize (
            Columns : in     Natural := 0;
            Rows    : in     Natural := 0);

      entry SetRegionSize (
            Columns : in     Natural := 0;
            Rows    : in     Natural := 0);

      entry SetScreenBase (
            Column : in     Natural := 0;
            Row    : in     Natural := 0);

      entry SetViewBase (
            Column : in     Natural := 0;
            Row    : in     Natural := 0);

      entry SetRegionBase (
            Column : in     Natural := 0;
            Row    : in     Natural := 0);

      entry SetVirtualSize (
            VirtualRows : in     Natural := 0);

      entry Close;

      entry ClearScreen;

      entry ClearBuffer;

      entry ClearToEOL;

      entry ClearKeyboard;

      entry Scroll (
            Rows : in     Integer := 1);

      entry Shift (
            Cols : in     Integer := 1);

      entry SetEditingOptions (
            Wrap   : in     Option := Ignore;
            Insert : in     Option := Ignore;
            Echo   : in     Option := Ignore);

      entry SetPasteOptions (
            ToBuffer   : in     Option := Ignore;
            ToKeyboard : in     Option := Ignore);

      entry GetPastingFlag(
            Pasting    : out Boolean);

      entry SetPastingFlag(
            Pasting    : in Boolean);

      entry SetScrollOptions (
            Horizontal : in     Option := Ignore;
            Vertical   : in     Option := Ignore;
            OnOutput   : in     Option := Ignore;
            Smooth     : in     Option := Ignore;
            Region     : in     Option := Ignore);

      entry SetMenuOptions (
            MainMenu     : in     Option := Ignore;
            TransferMenu : in     Option := Ignore;
            OptionMenu   : in     Option := Ignore;
            AdvancedMenu : in     Option := Ignore;
            ContextMenu  : in     Option := Ignore);

      entry SetSizingOptions (
            Sizing : in     Option := Ignore;
            Mode   : in     Sizing_Mode := DEFAULT_SIZING_MODE);

      entry SetAnsiOptions (
            OnInput  : in     Option    := Ignore;
            OnOutput : in     Option    := Ignore;
            Mode     : in     Ansi_Mode := DEFAULT_ANSI_MODE);

      entry GetInputPos (
            Column     :    out Natural;
            Row        :    out Natural;
            InputStyle : in     Boolean := True);

      entry SetInputPos (
            Column : in     Integer := -1;
            Row    : in     Integer := -1);

      entry GetOutputPos (
            Column      :    out Natural;
            Row         :    out Natural;
            OutputStyle : in     Boolean := True);

      entry SetOutputPos (
            Column : in     Integer := -1;
            Row    : in     Integer := -1);

      entry PushInputPos;

      entry PopInputPos (
            Discard : in     Option := No;
            Show    : in     Option := Yes;
            Force   : in     Option := Yes);

      entry PushOutputPos;

      entry PopOutputPos (
            Discard : in     Option := No;
            Show    : in     Option := Yes;
            Force   : in     Option := Yes);

      entry Peek (
            Char  :    out Character;
            Ready :    out Boolean);

      entry Get (
            Char :    out Character);

      entry UnGet (
            Char : in     Character);

      entry GetExtended (
            Special  :    out Special_Key_Type;
            Modifier :    out Modifier_Key_Type;
            Char     :    out Character);

      entry Put (
            Char   : in     Character;
            Column : in     Integer   := -1;
            Row    : in     Integer   := -1;
            Move   : in     Option    := Yes);

      entry Put (
            Str    : in     String;
            Column : in     Integer  := -1;
            Row    : in     Integer  := -1;
            Move   : in     Option   := Yes);

      entry SetInputFgColor (
            Color : in     Color_Type := DEFAULT_FG_COLOR);

      entry SetInputBgColor (
            Color : in     Color_Type := DEFAULT_BG_COLOR);

      entry SetInputStyle (
            Bold      : in     Option := Ignore;
            Italic    : in     Option := Ignore;
            Underline : in     Option := Ignore;
            Strikeout : in     Option := Ignore;
            Inverse   : in     Option := Ignore;
            Flashing  : in     Option := Ignore);

      entry SetOutputFgColor (
            Color : in     Color_Type := DEFAULT_FG_COLOR);

      entry SetOutputBgColor (
            Color : in     Color_Type := DEFAULT_BG_COLOR);

      entry SetScreenColors (
            FgColor : in     Color_Type := DEFAULT_FG_COLOR;
            BgColor : in     Color_Type := DEFAULT_BG_COLOR;
            Current : in     Option     := Ignore);

      entry SetBufferColors (
            FgColor : in     Color_Type := DEFAULT_FG_COLOR;
            BgColor : in     Color_Type := DEFAULT_BG_COLOR;
            Current : in     Option     := Ignore);

      entry SetOutputStyle (
            Bold      : in     Option := Ignore;
            Italic    : in     Option := Ignore;
            Underline : in     Option := Ignore;
            Strikeout : in     Option := Ignore;
            Inverse   : in     Option := Ignore;
            Flashing  : in     Option := Ignore);

      entry SetCursorColor (
            Color : in     Color_Type := DEFAULT_CURS_COLOR);

      entry SetCursorOptions (
            Visible  : in     Option := Ignore;
            Flashing : in     Option := Ignore;
            Bar      : in     Option := Ignore);

      entry SetRowOptions (
            Row      : in     Integer   := -1;
            Size     : in     Row_Size  := Single_Width);

      entry SetKeyOptions (
            ExtendedKeys : in     Option   := Ignore;
            CursorKeys   : in     Option   := Ignore;
            VTKeys       : in     Option   := Ignore;
            AutoRepeat   : in     Option   := Ignore;
            Locked       : in     Option   := Ignore;
            SetSize      : in     Option   := Ignore;
            Size         : in     Natural  := DEFAULT_KEYBUF_SIZE);

      entry SetOtherOptions (
            IgnoreCR          : in     Option := Ignore;
            IgnoreLF          : in     Option := Ignore;
            UseLFasEOL        : in     Option := Ignore;
            AutoLFonCR        : in     Option := Ignore;
            AutoCRonLF        : in     Option := Ignore;
            UpDownMoveView    : in     Option := Ignore;
            PageMoveView      : in     Option := Ignore;
            HomeEndMoveView   : in     Option := Ignore;
            LockScreenAndView : in     Option := Ignore;
            LeftRightWrap     : in     Option := Ignore;
            LeftRightScroll   : in     Option := Ignore;
            HomeEndWithinLine : in     Option := Ignore;
            CombinedStyle     : in     Option := Ignore;
            CombinedCursor    : in     Option := Ignore;
            FlashingEnabled   : in     Option := Ignore;
            HalftoneEnabled   : in     Option := Ignore;
            DisplayControls   : in     Option := Ignore;
            SysKeysEnabled    : in     Option := Ignore;
            DeleteOnBS        : in     Option := Ignore;
            RedrawPrevious    : in     Option := Ignore;
            RedrawNext        : in     Option := Ignore);

      entry SetMouseOptions (
            MouseCursor  : in     Option := Ignore;
            MouseSelects : in     Option := Ignore);

      entry SetTabOptions (
            Size    : in     Integer := -1;
            SetAt   : in     Integer := -1;
            ClearAt : in     Integer := -1);

      entry SetFontByType (
            SetType : in     Option    := Ignore;
            Font    : in     Font_Type := DEFAULT_FONT_TYPE;
            SetSize : in     Option    := Ignore;
            Size    : in     Natural   := DEFAULT_FONT_SIZE);

      entry SetFontByName (
            SetName : in     Option       := Ignore;
            Font    : in     String       := DEFAULT_FONT_NAME;
            SetSize : in     Option       := Ignore;
            Size    : in     Natural      := DEFAULT_FONT_SIZE;
            SetChar : in     Option       := Ignore;
            CharSet : in     Charset_Type := GDO.ANSI_CHARSET);

      entry GetEditingOptions (
            Insert :    out Boolean;
            Wrap   :    out Boolean;
            Echo   :    out Boolean);

      entry ScreenDump (
            Column : in     Natural;
            Row    : in     Natural;
            Result : in out String;
            Length : in out Natural);

      entry SetPriority (
            Priority : in     System.Priority := System.Default_Priority - 1);

      entry SetCommsPort (
            CommsPort  : in     WS.Win32_Handle;
            CommsMutex : in     Protection.MutexPtr);

      entry GetBufferInformation (
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
            RegnSizeRow :    out Natural);

   end Terminal_Type;

   type Terminal_Record is
      record
         Terminal : Terminal_Type;
         Buffer   : Terminal_Buffer.Terminal_Buffer;
         ScrnCols : Natural := 0;
         ScrnRows : Natural := 0;
      end record;

   type Terminal is access Terminal_Record;

end Terminal_Emulator;
