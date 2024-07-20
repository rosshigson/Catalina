-------------------------------------------------------------------------------
--             This file is part of the Ada Terminal Emulator                --
--               (Terminal_Emulator, Term_IO and Redirect)                   --
--                               package                                     --
--                                                                           --
--                             Version 1.4                                   --
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

-- With GWindows;
with GWindows.Colors;
with GWindows.Windows;
with GWindows.Drawing_Objects;
with Common_Dialogs;

package Terminal_Types is

   package CD  renames Common_Dialogs;
   package GDO renames GWindows.Drawing_Objects;
   

   MAX_ROWS     : constant := 32767; -- limited by the dialog box
   MAX_COLUMNS  : constant := 1024;  -- arbitrary (up to 32767)


   subtype Color_Type is GWindows.Colors.Color_Type;

   -- The following colors are the standard GWindows colors,
   -- and are used by the emulator when the bold text attribute
   -- is not required to brighten the text color:

   -- normal colors:
   Black      : Color_Type renames GWindows.Colors.Black;
   Red        : Color_Type renames GWindows.Colors.Red;
   Green      : Color_Type renames GWindows.Colors.Green;
   Yellow     : Color_Type renames GWindows.Colors.Yellow;
   Blue       : Color_Type renames GWindows.Colors.Blue;
   Magenta    : Color_Type renames GWindows.Colors.Magenta;
   White      : Color_Type renames GWindows.Colors.White;
   Cyan       : Color_Type renames GWindows.Colors.Cyan;
   -- other colors:
   Silver     : Color_Type renames GWindows.Colors.Silver;
   Light_Gray : Color_Type renames GWindows.Colors.Light_Gray;
   Gray       : Color_Type renames GWindows.Colors.Gray;
   Dark_Gray  : Color_Type renames GWindows.Colors.Dark_Gray;
   Dark_Red   : Color_Type renames GWindows.Colors.Dark_Red;
   Dark_Green : Color_Type renames GWindows.Colors.Dark_Green;
   Dark_Blue  : Color_Type renames GWindows.Colors.Dark_Blue;
   Pink       : Color_Type renames GWindows.Colors.Pink;
   Orange     : Color_Type renames GWindows.Colors.Orange;

   -- The following colors are more like the PC console colors,
   -- and are used by the emulator when the bold text attribute
   -- is required to brighten the text color:

   -- normal colors:
   PC_Black         : Color_Type := 16#000000#; -- normal black
   PC_Red           : Color_Type := 16#0000BF#; -- normal red
   PC_Green         : Color_Type := 16#00BF00#; -- normal green
   PC_Yellow        : Color_Type := 16#00BFBF#; -- normal yellow
   PC_Blue          : Color_Type := 16#BF0000#; -- normal blue
   PC_Magenta       : Color_Type := 16#BF00BF#; -- normal magenta
   PC_Cyan          : Color_Type := 16#BFBF00#; -- normal cyan
   PC_Gray          : Color_Type := 16#BFBFBF#; -- normal white
   -- bright colors:
   PC_Dark_Gray     : Color_Type := 16#404040#; -- bold black
   PC_Light_Red     : Color_Type := 16#0000FF#; -- bold red
   PC_Light_Green   : Color_Type := 16#00FF00#; -- bold green
   PC_Light_Yellow  : Color_Type := 16#00FFFF#; -- bold yellow
   PC_Light_Blue    : Color_Type := 16#FF0000#; -- bold blue
   PC_Light_Magenta : Color_Type := 16#FF00FF#; -- bold magenta
   PC_Light_Cyan    : Color_Type := 16#FFFF00#; -- bold cyan
   PC_White         : Color_Type := 16#FFFFFF#; -- bold white

   subtype Charset_Type is Integer;

   -- ANSI_CHARSET        : Integer renames CD.ANSI_CHARSET;
   -- DEFAULT_CHARSET     : Integer renames CD.DEFAULT_CHARSET;
   -- SYMBOL_CHARSET      : Integer renames CD.SYMBOL_CHARSET;
   -- SHIFTJIS_CHARSET    : Integer renames CD.SHIFTJIS_CHARSET;
   -- HANGEUL_CHARSET     : Integer renames CD.HANGEUL_CHARSET;
   -- GB2312_CHARSET      : Integer renames CD.GB2312_CHARSET;
   -- CHINESEBIG5_CHARSET : Integer renames CD.CHINESEBIG5_CHARSET;
   -- GREEK_CHARSET       : Integer renames CD.GREEK_CHARSET;
   -- TURKISH_CHARSET     : Integer renames CD.TURKISH_CHARSET;
   -- HEBREW_CHARSET      : Integer renames CD.HEBREW_CHARSET;
   -- ARABIC_CHARSET      : Integer renames CD.ARABIC_CHARSET;
   -- BALTIC_CHARSET      : Integer renames CD.BALTIC_CHARSET;
   -- RUSSIAN_CHARSET     : Integer renames CD.RUSSIAN_CHARSET;
   -- THAI_CHARSET        : Integer renames CD.THAI_CHARSET;
   -- EASTEUROPE_CHARSET  : Integer renames CD.EASTEUROPE_CHARSET;
   -- OEM_CHARSET         : Integer renames CD.OEM_CHARSET;
   -- JOHAB_CHARSET       : Integer renames CD.JOHAB_CHARSET;
   -- VIETNAMESE_CHARSET  : Integer renames CD.VIETNAMESE_CHARSET;
   -- MAC_CHARSET         : Integer renames CD.MAC_CHARSET;


   subtype Font_Type is GDO.Stock_Font_Type;

   ANSI_Fixed_Width    : Font_Type renames GDO.ANSI_Fixed_Width;
   ANSI_Variable_Width : Font_Type renames GDO.ANSI_Variable_Width;
   Default_GUI         : Font_Type renames GDO.Default_GUI;
   OEM_Fixed_Width     : Font_Type renames GDO.OEM_Fixed_Width;
   System_Font         : Font_Type renames GDO.System;
   System_Fixed_Width  : Font_Type renames GDO.System_Fixed_Width;


   subtype Special_Key_Type is GWindows.Windows.Special_Key_Type;

   Escape       : Special_Key_Type renames GWindows.Windows.Escape;
   Pause        : Special_Key_Type renames GWindows.Windows.Pause;
   Caps_Lock    : Special_Key_Type renames GWindows.Windows.Caps_Lock;
   Page_Up      : Special_Key_Type renames GWindows.Windows.Page_Up;
   Page_Down    : Special_Key_Type renames GWindows.Windows.Page_Down;
   End_Key      : Special_Key_Type renames GWindows.Windows.End_Key;
   Home_Key     : Special_Key_Type renames GWindows.Windows.Home_Key;
   Left_Key     : Special_Key_Type renames GWindows.Windows.Left_Key;
   Up_Key       : Special_Key_Type renames GWindows.Windows.Up_Key;
   Right_Key    : Special_Key_Type renames GWindows.Windows.Right_Key;
   Down_Key     : Special_Key_Type renames GWindows.Windows.Down_Key;
   Print_Screen : Special_Key_Type renames GWindows.Windows.Print_Screen;
   Insert       : Special_Key_Type renames GWindows.Windows.Insert;
   Delete       : Special_Key_Type renames GWindows.Windows.Delete;
   F1           : Special_Key_Type renames GWindows.Windows.F1;
   F2           : Special_Key_Type renames GWindows.Windows.F2;
   F3           : Special_Key_Type renames GWindows.Windows.F3;
   F4           : Special_Key_Type renames GWindows.Windows.F4;
   F5           : Special_Key_Type renames GWindows.Windows.F5;
   F6           : Special_Key_Type renames GWindows.Windows.F6;
   F7           : Special_Key_Type renames GWindows.Windows.F7;
   F8           : Special_Key_Type renames GWindows.Windows.F8;
   F9           : Special_Key_Type renames GWindows.Windows.F9;
   F10          : Special_Key_Type renames GWindows.Windows.F10;
   F11          : Special_Key_Type renames GWindows.Windows.F11;
   F12          : Special_Key_Type renames GWindows.Windows.F12;
   Number_Lock  : Special_Key_Type renames GWindows.Windows.Number_Lock;
   Scroll_Lock  : Special_Key_Type renames GWindows.Windows.Scroll_Lock;
   None         : Special_Key_Type renames GWindows.Windows.None;


   type Option is (
         Ignore,
         Yes,
         No);


   type Row_Size is (
         Single_Width,
         Double_Width,
         Double_Height_Upper,
         Double_Height_Lower);


   type Sizing_Mode is (
         Size_Fonts,
         Size_Screen,
         Size_View);


   type Modifier_Key_Type is (
         No_Modifier,
         Control,
         Shift,
         Control_Shift,
         Alt,
         Control_Alt,
         Shift_Alt,
         Control_Shift_Alt);


   type Ansi_Mode is (
         PC,
         VT52,
         VT100,
         VT101,
         VT102,
         VT220,
         VT320,
         VT420);


   DEFAULT_SIZING_MODE  : constant Sizing_Mode := Size_View;
   DEFAULT_TAB_SIZE     : constant             := 8;
   DEFAULT_PRINT_FONT   : constant String      := "Courier";
   PUT_CHAR_BUFF_SIZE   : constant             := 1024;
   DEFAULT_SCREEN_ROWS  : constant             := 25;
   DEFAULT_SCREEN_COLS  : constant             := 80;
   DEFAULT_VIRTUAL_ROWS : constant             := 25;
   DEFAULT_KEYBUF_SIZE  : constant             := 256;
   DEFAULT_FONT_SIZE    : constant             := 12;
   DEFAULT_FONT_NAME    : constant String      := "FixedSys";
   DEFAULT_FONT_TYPE    : constant Font_Type   := ANSI_Fixed_Width;
   DEFAULT_FG_COLOR     : constant Color_Type  := White;
   DEFAULT_BG_COLOR     : constant Color_Type  := Black;
   DEFAULT_CURS_COLOR   : constant Color_Type  := White;
   DEFAULT_ANSI_MODE    : constant Ansi_Mode   := PC;
   BRIGHT_ON_BOLD_FG    : constant Boolean     := True;  -- bold brightens fg color
   BRIGHT_ON_BOLD_BG    : constant Boolean     := False; -- bold brightens bg color


end Terminal_Types;
