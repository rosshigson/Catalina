-------------------------------------------------------------------------------
--             This file is part of the Ada Terminal Emulator                --
--               (Terminal_Emulator, Term_IO and Redirect)                   --
--                               package                                     --
--                                                                           --
--                             Version 0.6                                   --
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
with Telnet_Types;
with Telnet_Options;
with Text_Io;

procedure Options_Test is

   use Telnet_Types;
   use Telnet_Options;
   use Text_Io;
   

   package EightBit_Io is new Text_Io.Modular_Io (Eight_Bits);

   use EightBit_Io;
   
   X    : Eight_Bits;
   
begin
   for O in Option_Type'Range loop
      Put_Line (Option_Type'Image (O) & " = " & Eight_Bits'Image (Code (O)));
   end loop;
   for A in Action_Type'Range loop
      Put_Line (Action_Type'Image (A) & " = " & Eight_Bits'Image (Code (A)));
   end loop;
   loop
      Put ("Enter a value (0 .. 255) : ");
      Get (X);
      if Valid_Option (X) then
         Put ("Valid option : ");
         Put_Line (Option_Type'Image (Option (X)));
      else
         Put_Line ("Not a valid option");
      end if;
      if Valid_Action (X) then
         Put ("Valid action : ");
         Put_Line (Action_Type'Image (Action (X)));
      else
         Put_Line ("Not a valid action");
      end if;
   end loop;
end Options_Test;
