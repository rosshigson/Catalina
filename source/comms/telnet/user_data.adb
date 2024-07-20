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

with Debug_Io;
with Protection;

package body User_Data is


   User_Mutex : Protection.Mutex;


   -- state information manipulation functions/procedures:

   procedure Initialize (
         Ucb : in out User_Control_Block) 
   is

   begin -- restore default values
      User_Mutex.Acquire;
      Ucb.Connected               := False;
      Ucb.Ga_Sent                 := False;
      Ucb.Ga_Received             := False;
      Ucb.Synch_Is_In_Progress    := False;
      Ucb.Last_Normal_Char_Was_CR := False;
      Ucb.Last_Urgent_Char_Was_CR := False;
      Ucb.Partial_Command         := False;
      Reset (Ucb.Options);
      Ucb.Partial_Command_Data.Reset (Raise_Errors_As_Exceptions => True);
      Ucb.Terminal_Data.Reset (Raise_Errors_As_Exceptions => True);
      Ucb.Transport_Data.Messages.Reset (Raise_Errors_As_Exceptions => True);
      Ucb.Transport_Data.Normal_Data.Reset (Raise_Errors_As_Exceptions => True);
      Ucb.Transport_Data.Urgent_Data.Reset (Raise_Errors_As_Exceptions => True);
      User_Mutex.Release;
   end Initialize;


   procedure Wait (
         Ucb : in out User_Control_Block)
   is
   begin
      Ucb.Signal.Signal.Wait;
      -- Ucb.Signal.Wait;
   exception
      when E : others =>
         Debug_Io.Put_Exception ("WAIT", E);
         raise;
   end Wait;

   procedure Signal (
         Ucb : in out User_Control_Block)
   is
   begin
      Ucb.Signal.Signal.Signal;
      -- Ucb.Signal.Signal;
   exception
      when E : others =>
         Debug_Io.Put_Exception ("SIGNAL", E);
         raise;
   end Signal;

end User_Data;
