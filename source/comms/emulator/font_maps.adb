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

with System;
with Ada.Unchecked_Conversion;
with Win32.Winnt;
with Win32.Wingdi;
with Interfaces.C;
with GWindows.Types;
with GWindows.Colors;
pragma Elaborate_All (GWindows.Colors);

package body Font_Maps is

   use Interfaces.c;


   -- definitions of bitmaps for the special bitmapped characters
   type Bit is new Natural range 0 .. 1;
   for Bit'Size use 1;

   type BitRow
   is array (0 .. ((CELL_WIDTH + PAD_WIDTH - 1) / PAD_WIDTH) * PAD_WIDTH - 1)
   of Bit;
   pragma Pack (BitRow);
   for BitRow'Alignment use 4;

   type BitMap is array (0 .. CELL_HEIGHT - 1) of BitRow;
   for BitMap'Alignment use 4;

   -- the bitmaps of all the special characters:
   Special_Bitmap : array (CharPos) of aliased BitMap 
                  := (others => (others => (others => 0)));


   -- TWOCOLOR_Array and TWOCOLORBITMAPINFO are for 2 color bitmaps:
   type TWOCOLOR_Array 
   is array (Integer range 0 .. 1) of aliased GWindows.Colors.RGB_Type;
   for TWOCOLOR_Array'Alignment use 4;

   type ac_TWOCOLOR_Array_t is access all TWOCOLOR_Array;

   type TWOCOLORBITMAPINFO is
      record
         bmiHeader : aliased Win32.WinGDI.BITMAPINFOHEADER;
         bmiColors : aliased TWOCOLOR_Array;
      end record;

   type ac_TWOCOLORBITMAPINFO_t is access all TWOCOLORBITMAPINFO;


   -- Bitmapinfo is common to all bitmaps:
   BmInfo : aliased TWOCOLORBITMAPINFO;


   function WinHandle is
   new Ada.Unchecked_Conversion (GWindows.Types.Handle, Win32.Winnt.Handle);


   function Char
         (Char  : in Character;
          GLMap : in Font_Map;
          GRMap : in Font_Map)
      return Character
   is
   begin
      if Character'Pos (Char) <= 127 then
         return Character'Val (GLMap.Char (Character'Pos (Char)));
      else
         return Character'Val (GRMap.Char (Character'Pos (Char)));
      end if;
   end Char;


   function Key
         (Char  : in Character;
          GLMap : in Font_Map;
          GRMap : in Font_Map)
      return Character is
   begin
      if Character'Pos (Char) <= 127 then
         return Character'Val (GLMap.Key (Character'Pos (Char)));
      else
         return Character'Val (GRMap.Key (Character'Pos (Char)));
      end if;
   end Key;


   function Bits
         (Char  : in Character;
          GLMap : in Font_Map;
          GRMap : in Font_Map)
      return Boolean
   is
   begin
      if Character'Pos (Char) <= 127 then
         return GLMap.Char (Character'Pos (Char)) = 0;
      else
         return GRMap.Char (Character'Pos (Char)) = 0;
      end if;
   end Bits;


   function NonGraphic
         (Char  : in Character;
          GLMap : in Font_Map;
          GRMap : in Font_Map)
      return Boolean is
   begin
      if Character'Pos (Char) <= 127 then
         if GLMap = DEC_CONTROL then
            -- specal case - all are displayable
            return False;
         else
            return  Character'Pos (Char) <= 31
            or else Character'Pos (Char) = 127;
         end if;
      else
         if GRMap = DEC_CONTROL then
            -- specal case - all are displayable
            return False;
         else
            return  Character'Pos (Char) in 132 .. 151
            or else Character'Pos (Char) in 155 .. 159;
         end if;
      end if;
   end NonGraphic;


   function To_BITMAPINFO
   is new Ada.Unchecked_Conversion (
      ac_TWOCOLORBITMAPINFO_t,
      Win32.Wingdi.ac_BITMAPINFO_t);


   function To_RGBQUAD
   is new Ada.Unchecked_Conversion (
      ac_TWOCOLOR_Array_t,
      Win32.Wingdi.ac_RGBQUAD_t);


   procedure StretchGraphicChar
         (Destination_Canvas : in out Canvas_Type'Class;
          Destination_X      : in     Integer;
          Destination_Y      : in     Integer;
          Destination_Width  : in     Integer;
          Destination_Height : in     Integer;
          Source_X           : in     Integer;
          Source_Y           : in     Integer;
          Source_Width       : in     Integer;
          Source_Height      : in     Integer;
          Char               : in     Character;
          FgColor            : in     Color_Type;
          BgColor            : in     Color_Type;
          RasterOp           : in     Interfaces.C.unsigned := SRCCOPY)
   is

      procedure GDI_StretchDIBits
        (hdcDest    : GWindows.Types.Handle := Handle (Destination_Canvas);
         nXDest     : Integer               := Destination_X;
         nYDest     : Integer               := Destination_Y;
         nWidth     : Integer               := Destination_Width;
         nHeight    : Integer               := Destination_Height;
         nXSrc      : Integer               := Source_X;
         nYSrc      : Integer               := Source_Y;
         nWidthSrc  : Integer               := Source_Width;
         nHeightSrc : Integer               := Source_Height;
         bits       : Win32.PCVOID;
         info       : ac_TWOCOLORBITMAPINFO_t;
         iUsage     : Interfaces.C.unsigned := Win32.Wingdi.DIB_RGB_COLORS;
         dwRop      : Interfaces.C.unsigned := RasterOp);
      pragma Import (StdCall, GDI_StretchDIBits, "StretchDIBits");

   begin
      BmInfo.bmiColors (0) := GWindows.Colors.To_RGB (BgColor); -- bg color
      BmInfo.bmiColors (1) := GWindows.Colors.To_RGB (FgColor); -- fg color
      if RGB_REVERSE then
         -- Swap red and blue - is this a GWindows bug ?.
         BmInfo.bmiColors (0).Red := GWindows.Colors.To_RGB (BgColor).Blue;
         BmInfo.bmiColors (0).Blue := GWindows.Colors.To_RGB (BgColor).Red;
         BmInfo.bmiColors (1).Red := GWindows.Colors.To_RGB (FgColor).Blue;
         BmInfo.bmiColors (1).Blue := GWindows.Colors.To_RGB (FgColor).Red;
      end if;
      GDI_StretchDIBits (
         bits => Special_Bitmap (Character'Pos (Char))'Address,
         info => BmInfo'access);
   end StretchGraphicChar;


   procedure SetStretchMode (
         Canvas     : in out Canvas_Type'Class;
         FavorWhite : in     Boolean := True;
         FavorBlack : in     Boolean := False)
   is
      IntResult  : Win32.Int;
   begin
      if USE_HALFTONE then
         IntResult := Win32.Wingdi.SetStretchBltMode (
            WinHandle (Handle (Canvas)),
            Win32.Wingdi.HALFTONE);
      elsif FavorWhite then
         IntResult := Win32.Wingdi.SetStretchBltMode (
            WinHandle (Handle (Canvas)),
            Win32.Wingdi.WHITEONBLACK);
      elsif FavorBlack then
         IntResult := Win32.Wingdi.SetStretchBltMode (
            WinHandle (Handle (Canvas)),
            Win32.Wingdi.BLACKONWHITE);
      else
         IntResult := Win32.Wingdi.SetStretchBltMode (
            WinHandle (Handle (Canvas)),
            Win32.Wingdi.COLORONCOLOR);
      end if;
   end SetStretchMode;


   -- get the overhang for the currently selected font
   function GetOverhang (Canvas : in Canvas_Type'Class)
      return Integer
   is
      use type Win32.BOOL;

      BoolResult  : Win32.BOOL;
      TextMetric : aliased Win32.Wingdi.TEXTMETRICA;
   begin
      BoolResult := Win32.Wingdi.GetTextMetrics (
         WinHandle (Handle (Canvas)),
         TextMetric'Unchecked_Access);
      if BoolResult /= Win32.False then
         return Integer (TextMetric.tmOverhang);
      else
         return 0;
      end if;
   end GetOverhang;


   -- get the maxium char width for the currently selected font
   function GetMaxWidth (Canvas : in Canvas_Type'Class)
      return Integer
   is
      use type Win32.BOOL;

      BoolResult  : Win32.BOOL;
      TextMetric : aliased Win32.Wingdi.TEXTMETRICA;
   begin
      BoolResult := Win32.Wingdi.GetTextMetrics (
         WinHandle (Handle (Canvas)),
         TextMetric'Unchecked_Access);
      if BoolResult /= Win32.False then
         return Integer (TextMetric.tmMaxCharWidth);
      else
         return 0;
      end if;
   end GetMaxWidth;


begin

   -- initialize all font maps and unmaps to default mapping, then adjust
   -- any variations individually. Note that the space character
   -- (ASCII.SP) should never be mapped
   for i in 0 .. 255 loop
      -- set up defaults for Char procedure:
      WIN_DEFAULT.Char (i)          := i;
      ISO_BRITISH.Char (i)          := i;
      ISO_DUTCH.Char (i)            := i;
      ISO_FINNISH.Char (i)          := i;
      ISO_FRENCH.Char (i)           := i;
      ISO_FRENCH_CANADIAN.Char (i)  := i;
      ISO_GERMAN.Char (i)           := i;
      ISO_ITALIAN.Char (i)          := i;
      ISO_NORWEGIAN_DANISH.Char (i) := i;
      ISO_SPANISH.Char (i)          := i;
      ISO_SWEDISH.Char (i)          := i;
      ISO_SWISS.Char (i)            := i;
      DEC_MULTINATIONAL.Char (i)    := i;
      DEC_SPECIAL.Char (i)          := i;
      DEC_CONTROL.Char (i)          := i;
      -- set up defaults for Key procedure:
      WIN_DEFAULT.Key (i)           := i;
      ISO_BRITISH.Key (i)           := i;
      ISO_DUTCH.Key (i)             := i;
      ISO_FINNISH.Key (i)           := i;
      ISO_FRENCH.Key (i)            := i;
      ISO_FRENCH_CANADIAN.Key (i)   := i;
      ISO_GERMAN.Key (i)            := i;
      ISO_ITALIAN.Key (i)           := i;
      ISO_NORWEGIAN_DANISH.Key (i)  := i;
      ISO_SPANISH.Key (i)           := i;
      ISO_SWEDISH.Key (i)           := i;
      ISO_SWISS.Key (i)             := i;
      DEC_MULTINATIONAL.Key (i)     := i;
      DEC_SPECIAL.Key (i)           := i;
      DEC_CONTROL.Key (i)           := i;

   end loop;

   -- The null character (ASCII.NUL) must be mapped to space,
   -- in all fonts except DEC_CONTROL, since the value zero
   -- is used to indicate a special bitmapped character
   WIN_DEFAULT.Char (0)          := 32;
   ISO_BRITISH.Char (0)          := 32;
   ISO_DUTCH.Char (0)            := 32;
   ISO_FINNISH.Char (0)          := 32;
   ISO_FRENCH.Char (0)           := 32;
   ISO_FRENCH_CANADIAN.Char (0)  := 32;
   ISO_GERMAN.Char (0)           := 32;
   ISO_ITALIAN.Char (0)          := 32;
   ISO_NORWEGIAN_DANISH.Char (0) := 32;
   ISO_SPANISH.Char (0)          := 32;
   ISO_SWEDISH.Char (0)          := 32;
   ISO_SWISS.Char (0)            := 32;
   DEC_MULTINATIONAL.Char (0)    := 32;
   DEC_SPECIAL.Char (0)          := 32;

   -- ISO_BRITISH mapping : should work with all ANSI fonts
   ISO_BRITISH.Char (35) := 163; -- pound sign

   -- ISO_DUTCH mapping : should work with all ANSI fonts
   ISO_DUTCH.Char (35)  := 163; -- pound sign
   ISO_DUTCH.Char (64)  := 190; -- three quarters
   ISO_DUTCH.Char (91)  := 255; -- ij
   ISO_DUTCH.Char (92)  := 190; -- one half
   ISO_DUTCH.Char (93)  := 124; -- vertical bar
   ISO_DUTCH.Char (123) := 168; -- double dot
   ISO_DUTCH.Char (124) := 102; -- f
   ISO_DUTCH.Char (125) := 188; -- one quarter
   ISO_DUTCH.Char (126) := 180; -- back quote

   -- ISO_FINNISH mapping : should work with all ANSI fonts
   ISO_FINNISH.Char (91)  := 196;
   ISO_FINNISH.Char (92)  := 214;
   ISO_FINNISH.Char (93)  := 197;
   ISO_FINNISH.Char (94)  := 220;
   ISO_FINNISH.Char (96)  := 233;
   ISO_FINNISH.Char (123) := 228;
   ISO_FINNISH.Char (124) := 246;
   ISO_FINNISH.Char (125) := 229;
   ISO_FINNISH.Char (126) := 252;

   -- ISO_FRENCH mapping : should work with all ANSI fonts
   ISO_FRENCH.Char (35)  := 163; -- pound sign
   ISO_FRENCH.Char (64)  := 224;
   ISO_FRENCH.Char (91)  := 176;
   ISO_FRENCH.Char (92)  := 231;
   ISO_FRENCH.Char (93)  := 167;
   ISO_FRENCH.Char (123) := 233;
   ISO_FRENCH.Char (124) := 249;
   ISO_FRENCH.Char (125) := 232;
   ISO_FRENCH.Char (126) := 168;

   -- ISO_FRENCH keys : NOTE for example only - probably incorrect
   ISO_FRENCH.Key  (94)  := 93;  -- shift 6
   ISO_FRENCH.Key  (38)  := 125; -- shift 7


   -- ISO_FRENCH_CANADIAN mapping : should work with all ANSI fonts
   ISO_FRENCH_CANADIAN.Char (64)  := 224;
   ISO_FRENCH_CANADIAN.Char (91)  := 226;
   ISO_FRENCH_CANADIAN.Char (92)  := 231;
   ISO_FRENCH_CANADIAN.Char (93)  := 234;
   ISO_FRENCH_CANADIAN.Char (94)  := 238;
   ISO_FRENCH_CANADIAN.Char (96)  := 244;
   ISO_FRENCH_CANADIAN.Char (123) := 233;
   ISO_FRENCH_CANADIAN.Char (124) := 249;
   ISO_FRENCH_CANADIAN.Char (125) := 232;
   ISO_FRENCH_CANADIAN.Char (126) := 251;

   -- ISO_GERMAN mapping : should work with all ANSI fonts
   ISO_GERMAN.Char (64)  := 167;
   ISO_GERMAN.Char (91)  := 196;
   ISO_GERMAN.Char (92)  := 214;
   ISO_GERMAN.Char (93)  := 220;
   ISO_GERMAN.Char (123) := 228;
   ISO_GERMAN.Char (124) := 246;
   ISO_GERMAN.Char (125) := 252;
   ISO_GERMAN.Char (126) := 223;

   -- ISO_ITALIAN mapping : should work with all ANSI fonts
   ISO_ITALIAN.Char (35)  := 163; -- pound sign
   ISO_ITALIAN.Char (64)  := 167;
   ISO_ITALIAN.Char (91)  := 176;
   ISO_ITALIAN.Char (92)  := 231;
   ISO_ITALIAN.Char (93)  := 233;
   ISO_ITALIAN.Char (96)  := 249;
   ISO_ITALIAN.Char (123) := 224;
   ISO_ITALIAN.Char (124) := 242;
   ISO_ITALIAN.Char (125) := 232;
   ISO_ITALIAN.Char (126) := 236;

   -- ISO_NORWEGIAN_DANISH mapping : should work with all ANSI fonts
   ISO_NORWEGIAN_DANISH.Char (64)  := 196;
   ISO_NORWEGIAN_DANISH.Char (91)  := 198;
   ISO_NORWEGIAN_DANISH.Char (92)  := 216;
   ISO_NORWEGIAN_DANISH.Char (93)  := 197;
   ISO_NORWEGIAN_DANISH.Char (96)  := 228;
   ISO_NORWEGIAN_DANISH.Char (123) := 230;
   ISO_NORWEGIAN_DANISH.Char (124) := 248;
   ISO_NORWEGIAN_DANISH.Char (125) := 229;
   ISO_NORWEGIAN_DANISH.Char (126) := 252;

   -- ISO_SPANISH mapping : should work with all ANSI fonts
   ISO_SPANISH.Char (35)  := 163; -- pound sign
   ISO_SPANISH.Char (64)  := 167;
   ISO_SPANISH.Char (91)  := 161;
   ISO_SPANISH.Char (92)  := 209;
   ISO_SPANISH.Char (93)  := 191;
   ISO_SPANISH.Char (123) := 176;
   ISO_SPANISH.Char (124) := 241;
   ISO_SPANISH.Char (125) := 231;

   -- ISO_SWEDISH mapping : should work with all ANSI fonts
   ISO_SWEDISH.Char (64)  := 201;
   ISO_SWEDISH.Char (91)  := 196;
   ISO_SWEDISH.Char (92)  := 214;
   ISO_SWEDISH.Char (93)  := 197;
   ISO_SWEDISH.Char (96)  := 233;
   ISO_SWEDISH.Char (123) := 228;
   ISO_SWEDISH.Char (124) := 246;
   ISO_SWEDISH.Char (125) := 229;
   ISO_SWEDISH.Char (126) := 252;

   -- ISO_SWISS mapping : should work with all ANSI fonts
   ISO_SWISS.Char (35)  := 249;
   ISO_SWISS.Char (64)  := 224;
   ISO_SWISS.Char (91)  := 233;
   ISO_SWISS.Char (92)  := 231;
   ISO_SWISS.Char (93)  := 234;
   ISO_SWISS.Char (94)  := 238;
   ISO_SWISS.Char (95)  := 232;
   ISO_SWISS.Char (96)  := 244;
   ISO_SWISS.Char (123) := 228;
   ISO_SWISS.Char (124) := 246;
   ISO_SWISS.Char (125) := 252;
   ISO_SWISS.Char (126) := 251;

   -- DEC_SPECIAL mapping : Only the "Terminal" OEM font has graphic chars,
   --                       so instead of defining a character mapping (which
   --                       would therefore only works with the Terminal font),
   --                       we now define our own graphic characters. However,
   --                       here is what such a mapping might look like:

   -- DEC_SPECIAL.Char (95)  :=  32; -- space
   -- DEC_SPECIAL.Char (96)  := 249; -- diamond (no equivalent)
   -- DEC_SPECIAL.Char (97)  := 177; -- checkerboard
   -- DEC_SPECIAL.Char (98)  := 254; -- horizontal tab (no equivalent)
   -- DEC_SPECIAL.Char (99)  := 254; -- form feed (no equivalent)
   -- DEC_SPECIAL.Char (100) := 254; -- carriage return (no equivalent)
   -- DEC_SPECIAL.Char (101) := 254; -- line feed (no equivalent)
   -- DEC_SPECIAL.Char (102) := 248; -- degree
   -- DEC_SPECIAL.Char (103) := 241; -- plus/minus
   -- DEC_SPECIAL.Char (104) := 254; -- new line (no equivalent)
   -- DEC_SPECIAL.Char (105) := 254; -- vertical tab (no equivalent)
   -- DEC_SPECIAL.Char (106) := 217; -- lower-right corner
   -- DEC_SPECIAL.Char (107) := 191; -- upper-right corner
   -- DEC_SPECIAL.Char (108) := 218; -- upper-left corner
   -- DEC_SPECIAL.Char (109) := 192; -- lower-left corner
   -- DEC_SPECIAL.Char (110) := 197; -- crossing lines
   -- DEC_SPECIAL.Char (111) := 254; -- horizontal scan 1 (no equivalent)
   -- DEC_SPECIAL.Char (112) := 254; -- horizontal scan 3 (no equivalent)
   -- DEC_SPECIAL.Char (113) := 196; -- horizontal scan 5
   -- DEC_SPECIAL.Char (114) := 254; -- horizontal scan 7 (no equivalent)
   -- DEC_SPECIAL.Char (115) := 95;  -- horizontal scan 9
   -- DEC_SPECIAL.Char (116) := 195; -- left T
   -- DEC_SPECIAL.Char (117) := 180; -- right T
   -- DEC_SPECIAL.Char (118) := 193; -- bottom T
   -- DEC_SPECIAL.Char (119) := 194; -- top T
   -- DEC_SPECIAL.Char (120) := 179; -- vertical bar
   -- DEC_SPECIAL.Char (121) := 243; -- less than or equal to
   -- DEC_SPECIAL.Char (122) := 242; -- greater than or equal to
   -- DEC_SPECIAL.Char (123) := 227; -- pi
   -- DEC_SPECIAL.Char (124) := 216; -- not equal to
   -- DEC_SPECIAL.Char (125) := 156; -- UK pound sign
   -- DEC_SPECIAL.Char (126) := 250; -- centered dot

   -- Here is the DEC_SPECIAL mapping using special bitmapped
   -- characters, which should work with all ANSI fonts:
   DEC_SPECIAL.Char (95)  := 0;
   DEC_SPECIAL.Char (96)  := 0;
   DEC_SPECIAL.Char (97)  := 0;
   DEC_SPECIAL.Char (98)  := 0;
   DEC_SPECIAL.Char (99)  := 0;
   DEC_SPECIAL.Char (100) := 0;
   DEC_SPECIAL.Char (101) := 0;
   DEC_SPECIAL.Char (102) := 0;
   DEC_SPECIAL.Char (103) := 0;
   DEC_SPECIAL.Char (104) := 0;
   DEC_SPECIAL.Char (105) := 0;
   DEC_SPECIAL.Char (106) := 0;
   DEC_SPECIAL.Char (107) := 0;
   DEC_SPECIAL.Char (108) := 0;
   DEC_SPECIAL.Char (109) := 0;
   DEC_SPECIAL.Char (110) := 0;
   DEC_SPECIAL.Char (111) := 0;
   DEC_SPECIAL.Char (112) := 0;
   DEC_SPECIAL.Char (113) := 0;
   DEC_SPECIAL.Char (114) := 0;
   DEC_SPECIAL.Char (115) := 0;
   DEC_SPECIAL.Char (116) := 0;
   DEC_SPECIAL.Char (117) := 0;
   DEC_SPECIAL.Char (118) := 0;
   DEC_SPECIAL.Char (119) := 0;
   DEC_SPECIAL.Char (120) := 0;
   DEC_SPECIAL.Char (121) := 0;
   DEC_SPECIAL.Char (122) := 0;
   DEC_SPECIAL.Char (123) := 0;
   DEC_SPECIAL.Char (124) := 0;
   DEC_SPECIAL.Char (125) := 0;
   DEC_SPECIAL.Char (126) := 0;

   -- DEC_MULTINATIONAL mapping : should work with all ANSI fonts

   DEC_MULTINATIONAL.Char (128) := 32; -- space
   DEC_MULTINATIONAL.Char (129) := 32; -- space
   DEC_MULTINATIONAL.Char (130) := 32; -- space
   DEC_MULTINATIONAL.Char (131) := 32; -- space
   DEC_MULTINATIONAL.Char (152) := 32; -- space
   DEC_MULTINATIONAL.Char (153) := 32; -- space
   DEC_MULTINATIONAL.Char (154) := 32; -- space
   DEC_MULTINATIONAL.Char (164) := 32; -- space
   DEC_MULTINATIONAL.Char (166) := 32; -- space
   DEC_MULTINATIONAL.Char (168) := 164;
   DEC_MULTINATIONAL.Char (173) := 32; -- space
   DEC_MULTINATIONAL.Char (174) := 32; -- space
   DEC_MULTINATIONAL.Char (175) := 32; -- space
   DEC_MULTINATIONAL.Char (180) := 32; -- space
   DEC_MULTINATIONAL.Char (184) := 32; -- space
   DEC_MULTINATIONAL.Char (190) := 32; -- space
   DEC_MULTINATIONAL.Char (208) := 32; -- space
   DEC_MULTINATIONAL.Char (215) := 140;
   DEC_MULTINATIONAL.Char (221) := 159;
   DEC_MULTINATIONAL.Char (222) := 32; -- space
   DEC_MULTINATIONAL.Char (240) := 32; -- space
   DEC_MULTINATIONAL.Char (247) := 156;
   DEC_MULTINATIONAL.Char (254) := 32; -- space
   DEC_MULTINATIONAL.Char (253) := 255;

   -- DEC_CONTROL mapping : should work with all ANSI fonts

   DEC_CONTROL.Char (0)   := 0;
   DEC_CONTROL.Char (1)   := 0;
   DEC_CONTROL.Char (2)   := 0;
   DEC_CONTROL.Char (3)   := 0;
   DEC_CONTROL.Char (4)   := 0;
   DEC_CONTROL.Char (5)   := 0;
   DEC_CONTROL.Char (6)   := 0;
   DEC_CONTROL.Char (7)   := 0;
   DEC_CONTROL.Char (8)   := 0;
   DEC_CONTROL.Char (9)   := 0;
   DEC_CONTROL.Char (10)  := 0;
   DEC_CONTROL.Char (11)  := 0;
   DEC_CONTROL.Char (12)  := 0;
   DEC_CONTROL.Char (13)  := 0;
   DEC_CONTROL.Char (14)  := 0;
   DEC_CONTROL.Char (15)  := 0;
   DEC_CONTROL.Char (16)  := 0;
   DEC_CONTROL.Char (17)  := 0;
   DEC_CONTROL.Char (18)  := 0;
   DEC_CONTROL.Char (19)  := 0;
   DEC_CONTROL.Char (20)  := 0;
   DEC_CONTROL.Char (21)  := 0;
   DEC_CONTROL.Char (22)  := 0;
   DEC_CONTROL.Char (23)  := 0;
   DEC_CONTROL.Char (24)  := 0;
   DEC_CONTROL.Char (25)  := 0;
   DEC_CONTROL.Char (26)  := 0;
   DEC_CONTROL.Char (27)  := 0;
   DEC_CONTROL.Char (28)  := 0;
   DEC_CONTROL.Char (29)  := 0;
   DEC_CONTROL.Char (30)  := 0;
   DEC_CONTROL.Char (31)  := 0;
   DEC_CONTROL.Char (127) := 0;
   DEC_CONTROL.Char (128) := 0;
   DEC_CONTROL.Char (129) := 0;
   DEC_CONTROL.Char (130) := 0;
   DEC_CONTROL.Char (131) := 0;
   DEC_CONTROL.Char (132) := 0;
   DEC_CONTROL.Char (133) := 0;
   DEC_CONTROL.Char (134) := 0;
   DEC_CONTROL.Char (135) := 0;
   DEC_CONTROL.Char (136) := 0;
   DEC_CONTROL.Char (137) := 0;
   DEC_CONTROL.Char (138) := 0;
   DEC_CONTROL.Char (139) := 0;
   DEC_CONTROL.Char (140) := 0;
   DEC_CONTROL.Char (141) := 0;
   DEC_CONTROL.Char (142) := 0;
   DEC_CONTROL.Char (143) := 0;
   DEC_CONTROL.Char (144) := 0;
   DEC_CONTROL.Char (145) := 0;
   DEC_CONTROL.Char (146) := 0;
   DEC_CONTROL.Char (147) := 0;
   DEC_CONTROL.Char (148) := 0;
   DEC_CONTROL.Char (149) := 0;
   DEC_CONTROL.Char (150) := 0;
   DEC_CONTROL.Char (151) := 0;
   DEC_CONTROL.Char (152) := 0;
   DEC_CONTROL.Char (153) := 0;
   DEC_CONTROL.Char (154) := 0;
   DEC_CONTROL.Char (155) := 0;
   DEC_CONTROL.Char (156) := 0;
   DEC_CONTROL.Char (157) := 0;
   DEC_CONTROL.Char (158) := 0;
   DEC_CONTROL.Char (159) := 0;
   DEC_CONTROL.Char (160) := 0;
   DEC_CONTROL.Char (164) := 0;
   DEC_CONTROL.Char (166) := 0;
   DEC_CONTROL.Char (168) := 164;
   DEC_CONTROL.Char (172) := 0;
   DEC_CONTROL.Char (173) := 0;
   DEC_CONTROL.Char (174) := 0;
   DEC_CONTROL.Char (175) := 0;
   DEC_CONTROL.Char (180) := 0;
   DEC_CONTROL.Char (184) := 0;
   DEC_CONTROL.Char (190) := 0;
   DEC_CONTROL.Char (208) := 0;
   DEC_CONTROL.Char (215) := 140;
   DEC_CONTROL.Char (221) := 159;
   DEC_CONTROL.Char (222) := 0;
   DEC_CONTROL.Char (240) := 0;
   DEC_CONTROL.Char (247) := 156;
   DEC_CONTROL.Char (254) := 0;
   DEC_CONTROL.Char (253) := 255;

   -- The special character bitmap arrays are set up to make them easy to draw.
   -- The resolution can be adjusted, since they are always scaled for display.
   -- The bitmaps are adjusted later for Intel endian-ness, and to reverse the
   -- row ordering, so be aware that when examined (e.g. in a debugger) they
   -- will look different:

   Special_Bitmap (0)   := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,1,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,1,1,1,1,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,1,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0));

   Special_Bitmap (1)   := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0));

   Special_Bitmap (2)   := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0));

   Special_Bitmap (3)   := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0));

   Special_Bitmap (4)   := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,1,1,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0));

   Special_Bitmap (5)   := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,1,1,0, others => 0));

   Special_Bitmap (6)   := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,1,1,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,1,0, others => 0));

   Special_Bitmap (7)   := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0));

   Special_Bitmap (8)   := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0));

   Special_Bitmap (9)   := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,1,1,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0));

   Special_Bitmap (10)  := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0));

   Special_Bitmap (11)  := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,1,1,1,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,1,1,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,1,1,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0));

   Special_Bitmap (12)  := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0));

   Special_Bitmap (13)  := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,1,1,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0));

   Special_Bitmap (14)  := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,0,0,0, others => 0));

   Special_Bitmap (15)  := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0));

   Special_Bitmap (16)  := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0));

   Special_Bitmap (17)  := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0));

   Special_Bitmap (18)  := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,0,0,0,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0));

   Special_Bitmap (19)  := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,0,0,0,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0));

   Special_Bitmap (20)  := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,1,1,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0));

   Special_Bitmap (21)  := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,1,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,1,1,1,1,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,1,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0));

   Special_Bitmap (22)  := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0));

   Special_Bitmap (23)  := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0));

   Special_Bitmap (24)  := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,1,1,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,1,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,1,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0));

   Special_Bitmap (25)  := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,0,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,1,1,1,0,0,1,1,1,0, others => 0),
                            (0,0,0,0,0,1,1,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,1,1,0,1,1,0,1,1,0, others => 0),
                            (0,0,0,0,0,1,1,0,1,1,0,1,1,0, others => 0),
                            (0,0,0,0,0,1,1,0,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,1,1,0,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,1,1,0,0,0,0,1,1,0, others => 0));

   Special_Bitmap (26)  := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,1,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,1,1,1,0,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,1,1,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,1,1,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0));

   Special_Bitmap (27)  := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0));

   Special_Bitmap (28)  := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0));

   Special_Bitmap (29)  := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,1,1,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,1,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,0,1,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,1,1,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0));

   Special_Bitmap (30)  := ((0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,1,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0));

   Special_Bitmap (31)  := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0));

   Special_Bitmap (95)  := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0));

   Special_Bitmap (96)  := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,1,1,1,1,1,1,0,0,0,0, others => 0),
                            (0,0,0,1,1,1,1,1,1,1,1,0,0,0, others => 0),
                            (0,0,0,1,1,1,1,1,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,1,1,1,1,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0));

   Special_Bitmap (97)  := ((0,0,1,1,0,0,1,1,0,0,1,1,0,0, others => 0),
                            (0,0,1,1,0,0,1,1,0,0,1,1,0,0, others => 0),
                            (1,1,0,0,1,1,0,0,1,1,0,0,1,1, others => 0),
                            (1,1,0,0,1,1,0,0,1,1,0,0,1,1, others => 0),
                            (0,0,1,1,0,0,1,1,0,0,1,1,0,0, others => 0),
                            (0,0,1,1,0,0,1,1,0,0,1,1,0,0, others => 0),
                            (1,1,0,0,1,1,0,0,1,1,0,0,1,1, others => 0),
                            (1,1,0,0,1,1,0,0,1,1,0,0,1,1, others => 0),
                            (0,0,1,1,0,0,1,1,0,0,1,1,0,0, others => 0),
                            (0,0,1,1,0,0,1,1,0,0,1,1,0,0, others => 0),
                            (1,1,0,0,1,1,0,0,1,1,0,0,1,1, others => 0),
                            (1,1,0,0,1,1,0,0,1,1,0,0,1,1, others => 0),
                            (0,0,1,1,0,0,1,1,0,0,1,1,0,0, others => 0),
                            (0,0,1,1,0,0,1,1,0,0,1,1,0,0, others => 0),
                            (1,1,0,0,1,1,0,0,1,1,0,0,1,1, others => 0),
                            (1,1,0,0,1,1,0,0,1,1,0,0,1,1, others => 0),
                            (0,0,1,1,0,0,1,1,0,0,1,1,0,0, others => 0),
                            (0,0,1,1,0,0,1,1,0,0,1,1,0,0, others => 0),
                            (1,1,0,0,1,1,0,0,1,1,0,0,1,1, others => 0),
                            (1,1,0,0,1,1,0,0,1,1,0,0,1,1, others => 0));

   Special_Bitmap (98)  := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,1,1,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0));

   Special_Bitmap (99)  := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0));

   Special_Bitmap (100) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,1,1,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0));

   Special_Bitmap (101) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0));

   Special_Bitmap (102) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,1,1,1,1,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,1,1,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,1,1,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,1,1,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,1,1,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,1,1,1,1,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0));

   Special_Bitmap (103) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,1,1,1,1,1,1,0,0, others => 0),
                            (0,0,1,1,1,1,1,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,1,1,1,1,1,1,0,0, others => 0),
                            (0,0,1,1,1,1,1,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0));

   Special_Bitmap (104) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,1,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,1,1,1,1,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,1,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0));

   Special_Bitmap (105) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,1,1,1,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,1,1,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,1,1,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0));

   Special_Bitmap (106) := ((0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (1,1,1,1,1,1,1,1,1,0,0,0,0,0, others => 0),
                            (1,1,1,1,1,1,1,1,1,0,0,0,0,0, others => 0),
                            (1,1,1,1,1,1,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0));

   Special_Bitmap (107) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (1,1,1,1,1,1,1,1,1,0,0,0,0,0, others => 0),
                            (1,1,1,1,1,1,1,1,1,0,0,0,0,0, others => 0),
                            (1,1,1,1,1,1,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0));

   Special_Bitmap (108) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,1,1,1,1,1, others => 0),
                            (0,0,0,0,0,0,1,1,1,1,1,1,1,1, others => 0),
                            (0,0,0,0,0,0,1,1,1,1,1,1,1,1, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0));

   Special_Bitmap (109) := ((0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,1,1,1,1,1, others => 0),
                            (0,0,0,0,0,0,1,1,1,1,1,1,1,1, others => 0),
                            (0,0,0,0,0,0,1,1,1,1,1,1,1,1, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0));

   Special_Bitmap (110) := ((0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (1,1,1,1,1,1,1,1,1,1,1,1,1,1, others => 0),
                            (1,1,1,1,1,1,1,1,1,1,1,1,1,1, others => 0),
                            (1,1,1,1,1,1,1,1,1,1,1,1,1,1, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0));

   Special_Bitmap (111) := ((1,1,1,1,1,1,1,1,1,1,1,1,1,1, others => 0),
                            (1,1,1,1,1,1,1,1,1,1,1,1,1,1, others => 0),
                            (1,1,1,1,1,1,1,1,1,1,1,1,1,1, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0));

   Special_Bitmap (112) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (1,1,1,1,1,1,1,1,1,1,1,1,1,1, others => 0),
                            (1,1,1,1,1,1,1,1,1,1,1,1,1,1, others => 0),
                            (1,1,1,1,1,1,1,1,1,1,1,1,1,1, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0));

   Special_Bitmap (113) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (1,1,1,1,1,1,1,1,1,1,1,1,1,1, others => 0),
                            (1,1,1,1,1,1,1,1,1,1,1,1,1,1, others => 0),
                            (1,1,1,1,1,1,1,1,1,1,1,1,1,1, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0));

   Special_Bitmap (114) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (1,1,1,1,1,1,1,1,1,1,1,1,1,1, others => 0),
                            (1,1,1,1,1,1,1,1,1,1,1,1,1,1, others => 0),
                            (1,1,1,1,1,1,1,1,1,1,1,1,1,1, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0));

   Special_Bitmap (115) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (1,1,1,1,1,1,1,1,1,1,1,1,1,1, others => 0),
                            (1,1,1,1,1,1,1,1,1,1,1,1,1,1, others => 0),
                            (1,1,1,1,1,1,1,1,1,1,1,1,1,1, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0));

   Special_Bitmap (116) := ((0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,1,1,1,1,1, others => 0),
                            (0,0,0,0,0,0,1,1,1,1,1,1,1,1, others => 0),
                            (0,0,0,0,0,0,1,1,1,1,1,1,1,1, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0));

   Special_Bitmap (117) := ((0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (1,1,1,1,1,1,1,1,1,0,0,0,0,0, others => 0),
                            (1,1,1,1,1,1,1,1,1,0,0,0,0,0, others => 0),
                            (1,1,1,1,1,1,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0));

   Special_Bitmap (118) := ((0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (1,1,1,1,1,1,1,1,1,1,1,1,1,1, others => 0),
                            (1,1,1,1,1,1,1,1,1,1,1,1,1,1, others => 0),
                            (1,1,1,1,1,1,1,1,1,1,1,1,1,1, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0));

   Special_Bitmap (119) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (1,1,1,1,1,1,1,1,1,1,1,1,1,1, others => 0),
                            (1,1,1,1,1,1,1,1,1,1,1,1,1,1, others => 0),
                            (1,1,1,1,1,1,1,1,1,1,1,1,1,1, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0));

   Special_Bitmap (120) := ((0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0));

   Special_Bitmap (121) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,1,1,1,1,1,0,0,0,0, others => 0),
                            (0,0,0,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,1,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,1,0,0,0,0,0,0,1,1,1,0,0, others => 0),
                            (0,0,1,1,1,0,0,0,0,0,0,1,0,0, others => 0),
                            (0,0,0,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0));

   Special_Bitmap (122) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,1,1,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,1,1,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,0,0,0,0,0,0,1,0,0, others => 0),
                            (0,0,1,0,0,0,0,0,0,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0));

   Special_Bitmap (123) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,0,0,0,0,1,1,1,0,0, others => 0),
                            (0,0,1,1,1,1,1,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,1,1,1,1,1,1,1,0,0,0,0, others => 0),
                            (0,0,0,1,1,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,1,1,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,1,1,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,1,1,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,1,1,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,1,1,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,1,1,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,1,1,0,0,0,1,1,1,1,0,0, others => 0),
                            (0,0,0,1,1,0,0,0,1,1,1,1,0,0, others => 0),
                            (0,0,0,1,1,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0));

   Special_Bitmap (124) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,1,1,1,1,1,1,0,0, others => 0),
                            (0,0,1,1,1,1,1,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,1,1,1,1,1,1,0,0, others => 0),
                            (0,0,1,1,1,1,1,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,1,1,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0));

   Special_Bitmap (125) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,1,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,1,1,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,1,1,1,1,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,1,1,1,1,1,1,1,1,0,0,0, others => 0),
                            (0,0,0,1,1,1,1,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,1,1,1,0,0,0,0,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0));

   Special_Bitmap (126) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0));

   Special_Bitmap (127) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,1,1,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0));

   Special_Bitmap (128) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,0,0,0, others => 0));

   Special_Bitmap (129) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0));

   Special_Bitmap (130) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0));

   Special_Bitmap (131) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,1,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,0,0,0, others => 0));

   Special_Bitmap (132) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,1,1,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0));

   Special_Bitmap (133) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0));

   Special_Bitmap (134) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0));

   Special_Bitmap (135) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0));

   Special_Bitmap (136) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0));

   Special_Bitmap (137) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0));

   Special_Bitmap (138) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0));

   Special_Bitmap (139) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0));

   Special_Bitmap (140) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0));

   Special_Bitmap (141) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,1,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,0,0,0, others => 0));

   Special_Bitmap (142) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0));

   Special_Bitmap (143) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0));

   Special_Bitmap (144) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,0,0,0, others => 0));

   Special_Bitmap (145) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0));

   Special_Bitmap (146) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0));

   Special_Bitmap (147) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,1,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,0,0,0, others => 0));

   Special_Bitmap (148) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,1,1,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0));

   Special_Bitmap (149) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0));

   Special_Bitmap (150) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0));

   Special_Bitmap (151) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,0,0,0,0, others => 0));

   Special_Bitmap (152) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0));

   Special_Bitmap (153) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,1,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,0,0,0, others => 0));

   Special_Bitmap (154) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0));

   Special_Bitmap (155) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0));

   Special_Bitmap (156) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0));

   Special_Bitmap (157) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,1,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,0,0,0, others => 0));

   Special_Bitmap (158) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0));

   Special_Bitmap (159) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0));

   Special_Bitmap (160) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,1,1,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,0,0,0, others => 0));

   Special_Bitmap (164) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,1,1,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,1,1,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0));

   Special_Bitmap (166) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,1,1,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0));

   Special_Bitmap (172) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,1,1,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0));

   Special_Bitmap (173) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,1,1,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,1,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,0,0,0, others => 0));

   Special_Bitmap (174) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,1,1,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0));

   Special_Bitmap (175) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,1,1,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0));

   Special_Bitmap (180) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,1,1,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,1,1,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,1,1,0,0,0, others => 0));

   Special_Bitmap (184) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,1,0,0, others => 0));

   Special_Bitmap (190) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0));

   Special_Bitmap (208) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,0,0,0,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,0,0,0, others => 0));

   Special_Bitmap (222) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0));

   Special_Bitmap (240) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,1,1,0,0,0,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,1,1,1,0,0,0, others => 0));

   Special_Bitmap (254) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,1,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,1,1,1,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,1,1,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0),
                            (0,0,0,0,0,0,0,1,1,1,1,1,1,0, others => 0));

   Special_Bitmap (255) := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,1,1,1,1,1,1,1,1,1,1,0,0, others => 0),
                            (0,0,1,1,1,1,1,1,1,1,1,1,0,0, others => 0),
                            (0,0,1,1,0,0,0,0,0,0,1,1,0,0, others => 0),
                            (0,0,1,1,0,0,0,0,0,0,1,1,0,0, others => 0),
                            (0,0,1,1,0,0,0,0,0,0,1,1,0,0, others => 0),
                            (0,0,1,1,0,0,0,0,0,0,1,1,0,0, others => 0),
                            (0,0,1,1,0,0,0,0,0,0,1,1,0,0, others => 0),
                            (0,0,1,1,0,0,0,0,0,0,1,1,0,0, others => 0),
                            (0,0,1,1,0,0,0,0,0,0,1,1,0,0, others => 0),
                            (0,0,1,1,1,1,1,1,1,1,1,1,0,0, others => 0),
                            (0,0,1,1,1,1,1,1,1,1,1,1,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0),
                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0, others => 0));

   -- since GNAT has only default bit ordering, we must manually reverse
   -- the bits in each byte (to adjust for Intel endian-ness) of each of
   -- the bitmaps drawn above. We also reverse the rows to be bottom up:

   declare
      Reversed : BitRow;
   begin
      for i in CharPos loop
         for j in 0 .. CELL_HEIGHT - 1 loop
            for k in 0 .. CELL_WIDTH - 1 loop
               -- reverse the bits in each byte
               Reversed (((k / 8) * 8 + 7) - (k mod 8))
                  := Special_Bitmap (i) (j) (k);
            end loop;
            Special_Bitmap (i) (j) := Reversed;
         end loop;
      end loop;
      for i in CharPos loop
         for j in 0 .. (CELL_HEIGHT - 1) / 2 loop
            Reversed := Special_Bitmap (i) (j);
            Special_Bitmap (i) (j) := Special_Bitmap (i) (CELL_HEIGHT - 1 - j);
            Special_Bitmap (i) (CELL_HEIGHT - 1 - j) := Reversed;
         end loop;
      end loop;
   end;

   BmInfo.bmiHeader.biSize          := (Win32.Wingdi.BITMAPINFOHEADER'Size)
                                       / System.Storage_Unit;
   BmInfo.bmiHeader.biWidth         := CELL_WIDTH;
   BmInfo.bmiHeader.biHeight        := CELL_HEIGHT;
   BmInfo.bmiHeader.biPlanes        := 1;
   BmInfo.bmiHeader.biBitCount      := 1;
   BmInfo.bmiHeader.biCompression   := Win32.Wingdi.BI_RGB; -- uncompressed
   BmInfo.bmiHeader.biSizeImage     := 0; -- uncompressed
   BmInfo.bmiHeader.biXPelsPerMeter := 0; -- not relevant
   BmInfo.bmiHeader.biXPelsPerMeter := 0; -- not relevant
   BmInfo.bmiHeader.biClrUsed       := 2; -- 2 colors in color table
   BmInfo.bmiHeader.biClrImportant  := 0; -- all colours important
   -- the following colors are default only - they are
   -- overridden withg the current fg and bg colors in the
   -- real bitmaps before they are used:
   BmInfo.bmiColors (0) := GWindows.Colors.To_RGB (Black); -- bg color
   BmInfo.bmiColors (1) := GWindows.Colors.To_RGB (White); -- fg color

end Font_Maps;

