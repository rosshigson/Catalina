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

package Term_IO.Float_Text_IO is

   package Float_IO is new Term_IO.Float_IO (Float);

      Default_Fore : Field renames Float_IO.Default_Fore;

      Default_Aft  : Field renames Float_IO.Default_Aft;

      Default_Exp  : Field renames Float_IO.Default_Exp;

      procedure Get(File  : in  File_Type;
                    Item  : out Float;
                    Width : in  Field := 0)
         renames Float_IO.Get;
      procedure Get(Item  : out Float;
                    Width : in  Field := 0)
         renames Float_IO.Get;

      procedure Put(File : in File_Type;
                    Item : in Float;
                    Fore : in Field := Default_Fore;
                    Aft  : in Field := Default_Aft;
                    Exp  : in Field := Default_Exp)
         renames Float_IO.Put;
      procedure Put(Item : in Float;
                    Fore : in Field := Default_Fore;
                    Aft  : in Field := Default_Aft;
                    Exp  : in Field := Default_Exp)
         renames Float_IO.Put;

      procedure Get(From : in String;
                    Item : out Float;
                    Last : out Positive)
         renames Float_IO.Get;
      procedure Put(To   : out String;
                    Item : in Float;
                    Aft  : in Field := Default_Aft;
                    Exp  : in Field := Default_Exp)
         renames Float_IO.Put;


end Term_IO.Float_Text_IO;
