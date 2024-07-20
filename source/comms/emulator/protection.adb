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

package body Protection is

   -----------
   -- Mutex --
   -----------

   protected body Mutex is

      -------------
      -- Acquire --
      -------------

      entry Acquire when not Locked is
      begin
         Locked := True;
      end Acquire;

      -------------
      -- Release --
      -------------

      entry Release when True is
      begin
         Locked := False;
      end Release;

   end Mutex;

   ---------------
   -- Semaphore --
   ---------------

   protected body Semaphore is

      -----------
      -- Reset --
      -----------

      entry Reset when Signals > 0 is
      begin
         Signals := Signals - 1;
      end Reset;

      ------------
      -- Signal --
      ------------

      entry Signal when True is
      begin
         if Signals = 0 or not Once_Only then
            Signals := Signals + 1;
         end if;
      end Signal;

      ----------
      -- Wait --
      ----------

      entry Wait when Signals > 0  is
      begin
         if Auto_Reset then
            requeue Reset;
         end if;
      end Wait;

   end Semaphore;

end Protection;

