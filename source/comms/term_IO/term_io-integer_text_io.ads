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

with Term_IO;
pragma Elaborate_All (Term_IO);

package Term_IO.Integer_Text_IO is

   use Term_IO;

   package Integer_IO is new Term_IO.Integer_IO (Integer);

   Default_Width : Field renames Integer_IO.Default_Width;
   Default_Base  : Field renames Integer_IO.Default_Base;

   procedure Get(File  : in  File_Type;
                 Item  : out Integer;
                 Width : in Field := 0)
      renames Integer_IO.Get;
   procedure Get(Item  : out Integer;
                 Width : in  Field := 0)
      renames Integer_IO.Get;

   procedure Put(File  : in File_Type;
                 Item  : in Integer;
                 Width : in Field := Default_Width;
                 Base  : in Number_Base := Default_Base)
      renames Integer_IO.Put;
   procedure Put(Item  : in Integer;
                 Width : in Field := Default_Width;
                 Base  : in Number_Base := Default_Base)
      renames Integer_IO.Put;
   procedure Get(From : in  String;
                 Item : out Integer;
                 Last : out Positive)
      renames Integer_IO.Get;
   procedure Put(To   : out String;
                 Item : in Integer;
                 Base : in Number_Base := Default_Base)
      renames Integer_IO.Put;

end Term_IO.Integer_Text_IO;
