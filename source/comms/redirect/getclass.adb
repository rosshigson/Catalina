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

with Win32.Winuser;
with Ada.Strings.Unbounded;
with Interfaces.C;

package body GetClass is

   use Ada.Strings.Unbounded;
   package IC renames Interfaces.C;
   use type Win32.Int;

   MAX_LENGTH : constant := 256;

   function Callback (
         hwnd   : Win32.Windef.HWND;
         lParam : Win32.LPARAM)
      return Win32.BOOL
   is
      ThisTitle : aliased IC.Char_Array (0 .. IC.size_t (MAX_LENGTH));
      ThisClass : aliased IC.Char_Array (0 .. IC.size_t (MAX_LENGTH));
      IntResult : Win32.Int;
   begin
      IntResult := Win32.Winuser.GetWindowText (
         hWnd,
         (ThisTitle (0)'Unchecked_Access),
         MAX_LENGTH);
      if IntResult > 0 then
         if Title = To_Unbounded_String (IC.To_Ada (ThisTitle (0 .. IC.size_t (IntResult)))) then
            IntResult := Win32.Winuser.GetClassName (
               hWnd,
               (ThisClass (0)'Unchecked_Access),
               MAX_LENGTH);
            if IntResult > 0 then
               Class := To_Unbounded_String ( IC.To_Ada (ThisClass (0 .. IC.size_t (IntResult))));
            end if;
            return Win32.FALSE;
         end if;
      end if;
      return Win32.TRUE;
   end Callback;

end GetClass;
