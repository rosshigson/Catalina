-------------------------------------------------------------------------------
--             This file is part of the Ada Terminal Emulator                --
--               (Terminal_Emulator, Term_IO and Redirect)                   --
--                               package                                     --
--                                                                           --
--                             Version 0.9                                   --
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

with Terminal_Types;

package Buffer_Types is

   use Terminal_Types;

   MAX_CURS_STACK_SIZE : constant := 10; -- maximum entries in a cursor stack

   type Selection_Type is
         (ByColumn,
          ByRow,
          ByWord,
          ByLine);

   -- Real references : These represent the physical array of output cells.
   type Real_Col is new Natural;
   type Real_Row is new Natural;
   type Real_Pos is
      record
         Col : Real_Col := 0;
         Row : Real_Row := 0;
      end record;

   -- Virtual references : These represent references to the virual buffer,
   -- which is overlaid over the physical array to permit wraparound and
   -- fast scrolling of the physical buffer.
   type Virt_Col is new Natural;
   type Virt_Row is new Natural;
   type Virt_Pos is
      record
         Col : Virt_Col := 0;
         Row : Virt_Row := 0;
      end record;

   -- View references : These represent references to the virual view,
   -- which is overlaid on the virtual buffer to support fast scrolling
   -- of the view.
   type View_Col is new Natural;
   type View_Row is new Natural;
   type View_Pos is
      record
         Col : View_Col := 0;
         Row : View_Row := 0;
      end record;

   -- Screen references : These represent references to the virual screen,
   -- which is overlaid on the virtual buffer to support fast scrolling
   -- of the screen.
   type Scrn_Col is new Natural;
   type Scrn_Row is new Natural;
   type Scrn_Pos is
      record
         Col : Scrn_Col := 0;
         Row : Scrn_Row := 0;
      end record;

   -- Region references : These represent references to the virual region,
   -- which is overlaid on the screen.
   type Regn_Col is new Natural;
   type Regn_Row is new Natural;
   type Regn_Pos is
      record
         Col : Regn_Col := 0;
         Row : Regn_Row := 0;
      end record;


   type Cursor_Stack_Item is record
      Real : Real_Pos;
      Wrap : Boolean;
   end record;

   type Cursor_Stack_Item_Array 
   is array (0 .. MAX_CURS_STACK_SIZE - 1) of Cursor_Stack_Item;

   type Cursor_Stack
         (Size : Natural) is
      record
         Top  : Natural                 := 0;
         Item : Cursor_Stack_Item_Array;
      end record;


   -- Definitions for displayable character cells:
   type Real_Cell is
      record
         Char      : Character  := ' ';
         Bits      : Boolean    := False;
         Bold      : Boolean    := False;
         Italic    : Boolean    := False;
         Underline : Boolean    := False;
         Strikeout : Boolean    := False;
         Inverse   : Boolean    := False;
         Flashing  : Boolean    := False;
         Selected  : Boolean    := False;
         Erasable  : Boolean    := True;
         Size      : Row_Size   := Single_Width;
         FgColor   : Color_Type := DEFAULT_FG_COLOR;
         BgColor   : Color_Type := DEFAULT_BG_COLOR;
      end record;
   pragma Pack (Real_Cell);

   type Real_Cell_Access is access all Real_Cell;


   type Real_Buffer 
   is array (Real_Col range <>, Real_Row range <>) of aliased Real_Cell;

   type Real_Buffer_Access is access all Real_Buffer;


   --
   -- Max, Min : Utility functions - just so we don't need
   --            to say "Real_Row'Min ()" etc
   --

   function Max (
         Left,
         Right : Real_Row)
     return Real_Row;

   function Min (
         Left,
         Right : Real_Row)
     return Real_Row;

   function Max (
         Left,
         Right : Real_Col)
     return Real_Col;

   function Min (
         Left,
         Right : Real_Col)
     return Real_Col;

   function Max (
         Left,
         Right : Virt_Row)
     return Virt_Row;

   function Min (
         Left,
         Right : Virt_Row)
     return Virt_Row;

   function Max (
         Left,
         Right : Virt_Col)
     return Virt_Col;

   function Min (
         Left,
         Right : Virt_Col)
     return Virt_Col;

   function Max (
         Left,
         Right : Scrn_Row)
     return Scrn_Row;

   function Min (
         Left,
         Right : Scrn_Row)
     return Scrn_Row;

   function Max (
         Left,
         Right : Scrn_Col)
     return Scrn_Col;

   function Min (
         Left,
         Right : Scrn_Col)
     return Scrn_Col;

   function Max (
         Left,
         Right : View_Row)
     return View_Row;

   function Min (
         Left,
         Right : View_Row)
     return View_Row;

   function Max (
         Left,
         Right : View_Col)
     return View_Col;

   function Min (
         Left,
         Right : View_Col)
     return View_Col;

   function Max (
         Left,
         Right : Regn_Row)
     return Regn_Row;

   function Min (
         Left,
         Right : Regn_Row)
     return Regn_Row;

   function Max (
         Left,
         Right : Regn_Col)
     return Regn_Col;

   function Min (
         Left,
         Right : Regn_Col)
     return Regn_Col;

end Buffer_Types;
