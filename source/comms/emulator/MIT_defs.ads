-------------------------------------------------------------------------------
--             This file is part of the Ada Terminal Emulator                --
--               (Terminal_Emulator, Term_IO and Redirect)                   --
--                               package                                     --
--                                                                           --
--                             Version 0.1                                   --
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
with Win32;
use Win32;

package MIT_Defs is

   -- A real VT420 has that many arguments
   VTARGS : constant := 16;

   -- define types for the parser (from vt420.h)
   subtype PA_ULONG is ULONG;
   subtype PA_LONG is LONG;

   subtype PA_UINT is UINT;
   subtype PA_INT is INT;

   subtype PA_USHORT is UINT;
   subtype PA_SHORT is INT;

   subtype PA_BOOL is INT;

   subtype PA_UCHAR is UINT;
   subtype PA_CHAR is INT;

   subtype PA_PUCHAR is PUCHAR;
   subtype PA_PCHAR is PCHAR;

   subtype PA_LPSTR is LPSTR;

   -- parser modes
   MODE_VT52       : constant PA_INT := 10;
   MODE_VT100      : constant PA_INT := 11;
   MODE_VT420      : constant PA_INT := 12;
   MODE_VT7BIT     : constant PA_INT := 1;
   MODE_VT8BIT     : constant PA_INT := 2;


   type ESC1tbl_rec is record
      ch    : PA_UCHAR;
      arg0  : PA_INT;    -- iArgs[0] will be set to this
      iFunc : PA_INT;
   end record;

   type PESC1tbl_rec is access ESC1tbl_rec;

   type ESC2tbl_rec is record
      ch1   : PA_UCHAR;
      ch2   : PA_UCHAR;
      arg0  : PA_INT;    -- iArgs[0] will be set to this
      iFunc : PA_INT;
   end record;

   type PESC2tbl_rec is access ESC2tbl_rec;

   type iArgs_Array is array (0 .. VTARGS - 1) of PA_INT;

   type LPARGS is access iArgs_Array;

   type intrms_Array is array (0 .. 1) of PA_UCHAR;

   type Ints_And_Pointer_Kind is (Ints, Addr);

   type Two_Ints is record
      Int1, Int2 : PA_INT;
   end record;

   type Ints_And_Address (which : Ints_And_Pointer_Kind := Ints)
   is record
      case which is
         when Ints =>
            Ints : Two_Ints;
         when Addr =>
            Addr : System.Address;
      end case;
   end record;
   pragma Unchecked_Union (Ints_And_Address);




end MIT_Defs;

