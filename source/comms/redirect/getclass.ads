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

with Win32;
with Win32.Windef;

with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;

package GetClass is

   Class : Unbounded_String := Null_Unbounded_String;
   Title : Unbounded_String := Null_Unbounded_String;

   -- GetClassCallback : To use this procedure, set the Title, and then
   -- call EnumWindows specifying this procedure as the callback.
   function Callback (
         hwnd : Win32.Windef.HWND;
         lParam : Win32.LPARAM)
      return Win32.BOOL;
      pragma Convention (Stdcall, Callback);

end GetClass;
