-------------------------------------------------------------------------------
--             This file is part of the Ada Terminal Emulator                --
--               (Terminal_Emulator, Term_IO and Redirect)                   --
--                               package                                     --
--                                                                           --
--                             Version 1.9                                   --
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

with Gwindows.GStrings;
pragma Elaborate_All (GWindows.GStrings);

with Terminal_Types;

package Terminal_Internal_Types is

   use Terminal_Types;

   MIN_FONT_SIZE      : constant := 1;       -- minimum allowed font size
   MAX_FONT_SIZE      : constant := 36;      -- maximum allowed font size

   ID_Exit            : constant := 100;
   ID_Open            : constant := 101;
   ID_Save            : constant := 102;
   ID_Cut             : constant := 103;
   ID_Copy            : constant := 104;
   ID_Paste           : constant := 105;
   ID_ScrollOnOutput  : constant := 106;
   ID_VirtualSize     : constant := 107;
   ID_MouseCursor     : constant := 108;
   ID_VertScroll      : constant := 109;
   ID_CursVisible     : constant := 110;
   ID_CursFlashing    : constant := 111;
   ID_ClearScreen     : constant := 112;
   ID_ClearEOL        : constant := 113;
   ID_MainMenu        : constant := 114;
   ID_Sizing          : constant := 115;
   ID_SizeFonts       : constant := 116;
   ID_SizeScreen      : constant := 117;
   ID_Font            : constant := 118;
   ID_FgColor         : constant := 119;
   ID_BgColor         : constant := 120;
   ID_Print           : constant := 121;
   ID_PageSetup       : constant := 122;
   ID_Find            : constant := 123;
   ID_Replace         : constant := 124;
   ID_New             : constant := 125;
   ID_SaveAs          : constant := 126;
   ID_SelectBuffer    : constant := 127;
   ID_UnselectAll     : constant := 128;
   ID_MouseSelects    : constant := 129;
   ID_Caption         : constant := 130;
   ID_OnTop           : constant := 131;
   ID_BufferColor     : constant := 132;
   ID_HorzScroll      : constant := 133;
   ID_SizeView        : constant := 134;
   ID_SelectScreen    : constant := 135;
   ID_SelectView      : constant := 136;
   ID_SetTabSize      : constant := 137;
   ID_SetScreenSize   : constant := 138;
   ID_HelpAbout       : constant := 139;
   ID_HelpInfo        : constant := 140;
   ID_Advanced        : constant := 141;
   ID_SelectRegion    : constant := 142;
   ID_SoftReset       : constant := 143;
   ID_HardReset       : constant := 144;
   ID_SmoothScroll    : constant := 145;
   ID_DTR             : constant := 146;
   ID_PulseDTR        : constant := 147;
   ID_YModemSend      : constant := 148;
   ID_YModemSend1k    : constant := 149;
   ID_YModemReceive   : constant := 150;
   ID_InitBuffer      : constant := 151;

   subtype Unbounded_String is GWindows.GString_Unbounded;

   Null_String : constant Unbounded_String
      := GWindows.GStrings.To_GString_Unbounded (
            GWindows.GStrings.To_GString_From_String (""));


   -- Definitions for Tabs:
   type Tab_Array is array (0 .. MAX_COLUMNS - 1) of Boolean;
   

   -- Definitions for DEC User Defined Keys (UDKs)
   type DECUDK_Key is range 1 .. 20;

   type DECUDK_Type is (
      unshifted,
      shifted,
      alt_unshifted,
      alt_shifted);

   type DECUDK_ARRAY is array (DECUDK_Key, DECUDK_Type) of Unbounded_String;
   

   -- Definitions for PC User Defined Keys (UDKs)
   type PCUDK_Key is range 1 .. 12;

   type PCUDK_Type is (
      normal,
      shift,
      control,
      alt);

   type PCUDK_Array is array (PCUDK_Key, PCUDK_Type) of Unbounded_String;

   -- Definitions for Keyboard Buffer:
   type Keyboard_Cell is
      record
         Special  : Special_Key_Type  := None;
         Modifier : Modifier_Key_Type := No_Modifier;
         Char     : Character         := ' ';
      end record;

   type Keyboard_Buffer is array (Natural range <>) of Keyboard_Cell;

   type Keyboard_Buffer_Access is access Keyboard_Buffer;


   type Font_Type_Array 
   is array (Boolean, Boolean, Boolean, Boolean) of GDO.Font_Type;
   --       (Bold,    Italic,  Strike,  Under  )


   -- Color manipulation functions:

   
   -- Bright : Make the color bright (used when bold is turned off)
   procedure Bright (Color : in out Color_Type);


   -- Dim : Make the color dim (used when bold is turned off)
   procedure Dim (Color : in out Color_Type);


   -- String manipulation functions:


   -- To_Unbounded : convert a string to an unbound string - works
   --                in both wide and non-wide environments.
   -- function To_Unbounded (
   --       Str : in String)
   --    return Unbounded_String;


   -- To_Unbounded : convert a Gtring to an unbound string - works
   --                in both wide and non-wide environments.
   function To_Unbounded (
         GStr : in GWindows.GString)
      return Unbounded_String;


   -- To_GString : convert an unbound string to a GString - works
   --             in both wide and non-wide environments.
   function To_GString (
         UStr : Unbounded_String)
      return GWindows.GString;


   -- To_GString : convert a string to a GString - works
   --             in both wide and non-wide environments.
   function To_GString (
         Str : String)
      return GWindows.GString;


   -- To_String : convert an unbound string to a String - works
   --             in both wide and non-wide environments.
   function To_String (
         UStr : Unbounded_String)
      return String;


   -- Length : get the length of an unbounded string.
   function Length (
         UStr : Unbounded_String)
      return Natural;


end Terminal_Internal_Types;
