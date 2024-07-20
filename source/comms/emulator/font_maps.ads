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

with Interfaces.C;
with GWindows.Drawing;
with Terminal_Types;

package Font_Maps is

   use Terminal_Types;
   use GWindows.Drawing;


   subtype CharPos is Natural 
   range Character'Pos (Character'First) .. Character'Pos (Character'Last);

   type Map_Array is array (CharPos) of CharPos;
   Pragma Pack (Map_Array);

   type Font_Map_Array is record
      Char : Map_Array; -- used to translate characters for display
      Key  : Map_Array; -- used to translate keyboard keys
   end record;

   type Font_Map is access all Font_Map_Array;

   WIN_DEFAULT_ARRAY          : aliased Font_Map_Array;
   ISO_BRITISH_ARRAY          : aliased Font_Map_Array;
   ISO_DUTCH_ARRAY            : aliased Font_Map_Array;
   ISO_FINNISH_ARRAY          : aliased Font_Map_Array;
   ISO_FRENCH_ARRAY           : aliased Font_Map_Array;
   ISO_FRENCH_CANADIAN_ARRAY  : aliased Font_Map_Array;
   ISO_GERMAN_ARRAY           : aliased Font_Map_Array;
   ISO_ITALIAN_ARRAY          : aliased Font_Map_Array;
   ISO_NORWEGIAN_DANISH_ARRAY : aliased Font_Map_Array;
   ISO_SPANISH_ARRAY          : aliased Font_Map_Array;
   ISO_SWEDISH_ARRAY          : aliased Font_Map_Array;
   ISO_SWISS_ARRAY            : aliased Font_Map_Array;
   DEC_MULTINATIONAL_ARRAY    : aliased Font_Map_Array;
   DEC_SPECIAL_ARRAY          : aliased Font_Map_Array;
   DEC_CONTROL_ARRAY          : aliased Font_Map_Array;


   -- NOTE THAT ALL THE ISO_ FONT MAPS SHOULD WORK WITH ANY
   -- WINDOWS ANSI FONT, BUT THE DEC_ FONT MAPS REQUIRE
   -- CHARACTERS NOT IN ANSI FONTS, SO WE HAVE TO USE
   -- SPECIAL "BITMAPPED" CHARACTERS INSTEAD.

   WIN_DEFAULT                : Font_Map := WIN_DEFAULT_ARRAY'Access;
   ISO_BRITISH                : Font_Map := ISO_BRITISH_ARRAY'Access;
   ISO_DUTCH                  : Font_Map := ISO_DUTCH_ARRAY'Access;
   ISO_FINNISH                : Font_Map := ISO_FINNISH_ARRAY'Access;
   ISO_FRENCH                 : Font_Map := ISO_FRENCH_ARRAY'Access;
   ISO_FRENCH_CANADIAN        : Font_Map := ISO_FRENCH_CANADIAN_ARRAY'Access;
   ISO_GERMAN                 : Font_Map := ISO_GERMAN_ARRAY'Access;
   ISO_ITALIAN                : Font_Map := ISO_ITALIAN_ARRAY'Access;
   ISO_NORWEGIAN_DANISH       : Font_Map := ISO_NORWEGIAN_DANISH_ARRAY'Access;
   ISO_SPANISH                : Font_Map := ISO_SPANISH_ARRAY'Access;
   ISO_SWEDISH                : Font_Map := ISO_SWEDISH_ARRAY'Access;
   ISO_SWISS                  : Font_Map := ISO_SWISS_ARRAY'Access;
   DEC_MULTINATIONAL          : Font_Map := DEC_MULTINATIONAL_ARRAY'Access;
   DEC_SPECIAL                : Font_Map := DEC_SPECIAL_ARRAY'Access;
   DEC_CONTROL                : Font_Map := DEC_CONTROL_ARRAY'Access;

   -- Char : Return a character translated by the specified
   --        font mapping for display on the screen using
   --        an ANSI font.
   function Char
         (Char  : in Character;
          GLMap : in Font_Map;
          GRMap : in Font_Map)
      return Character;

   -- Key : Return a character translated by the specified
   --       font mapping when the Keyboard Usage Mode (KBUM)
   --       is set to Typewriter.
   function Key
         (Char  : in Character;
          GLMap : in Font_Map;
          GRMap : in Font_Map)
      return Character;

   -- Bits : Return True if the char in the font mapping
   --        requires a special bitmapped character.
   function Bits
         (Char  : in Character;
          GLMap : in Font_Map;
          GRMap : in Font_Map)
      return Boolean;


   -- NonGraphic : Return True if the char in the font mapping is
   --              a non-graphic character (i.e. should be processed
   --              instead of just displayed).
   function NonGraphic
         (Char  : in Character;
          GLMap : in Font_Map;
          GRMap : in Font_Map)
      return Boolean;


   -- The following definitions are for the special
   -- characters implemented as bitmaps:


   -- swap red and green for StretchDIBlt - don't know why
   RGB_REVERSE  : Boolean := True;

   -- Halftone doesn't work with some display settings, so make it an option
   USE_HALFTONE : Boolean := False;

   -- the size of the special character bitmaps:
   CELL_WIDTH  : constant := 14; -- 2 * DEC resolution, for ease of drawing
   CELL_HEIGHT : constant := 20; -- 2 * DEC resolution, for ease of drawing
   PAD_WIDTH   : constant := 32; -- pad scan lines to multiples of 32 bits

   -- StretchGraphicChar : Stretch (all or part of) a special graphic
   --                      character bitmap to the specified size and
   --                      put it on the canvas at the specified
   --                      location.
   procedure StretchGraphicChar (
          Destination_Canvas : in out Canvas_Type'Class;
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
          RasterOp           : in     Interfaces.C.unsigned := SRCCOPY);


   -- SetStretchMode: Set StretchBlt mode. Must be called
   --                 before any StretchBlt operations.
   procedure SetStretchMode (
         Canvas     : in out Canvas_Type'Class;
         FavorWhite : in     Boolean := True;
         FavorBlack : in     Boolean := False);


   -- get the overhang for the currently selected font
   function GetOverhang (Canvas : in Canvas_Type'Class)
      return Integer;

   -- get the maximum character width for the currently selected font
   function GetMaxWidth (Canvas : in Canvas_Type'Class)
      return Integer;


end Font_Maps;

