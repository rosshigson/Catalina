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
with Telnet_Terminal;

package Telnet_Apl is

   use Telnet_Terminal;

   -- **************************************************************************
   --
   -- This package performs the TELNET application protocol level(APL) processing
   -- and imports procedures to access the TELNET presentation protocol 
   -- level(PPL).  This package is responsible for the semantics of the user 
   -- information exchange and uses the virtual resources provided for by the PPL
   -- to access the network virtual terminal(NVT) and virtual transport level.
   -- For example, this level could access the NVT to get user/process input
   -- to TELNET; determine that it was a proper TELNET command to open a new
   -- connection and call upon the virtual transport level to establish the
   -- new connection.  If the real world terminal type were to change or the
   -- transport level's actual implementation were changed, this would have no
   -- effect on the APL.
   --
   -- ****************************************************************************
   

   function Work_To_Do (
         VT : in     Virtual_Terminal)
      return Boolean;
   -- ************************  USER SPECIFICATION  ****************************
   -- 
   -- Return TRUE if there is any telnet work to do.
   -----------------------------------------------------------------------------


   procedure Process_Terminal_Input (
         VT : in out Virtual_Terminal);
   -- ************************  USER SPECIFICATION  ****************************
   -- 
   -- This procedure will input and process one character from the NVT 
   -- keyboard if one is available.
   -----------------------------------------------------------------------------


   procedure Process_Transport_Messages (
         VT : in out Virtual_Terminal);
   -- ************************  USER SPECIFICATION  ****************************
   -- 
   -- This procedure will input and process one entire message from the 
   -- transport level if a message is available.  A message being information 
   -- for the local user/process which was generated by the local transport 
   -- level, not simply data being relayed from the remote TELNET.
   -----------------------------------------------------------------------------


   procedure Process_Transport_Input (
         VT : in out Virtual_Terminal);
   -- ************************  USER SPECIFICATION  ****************************
   -- 
   -- This procedure will input and process one character from the 
   -- transport level which was relayed from the remote TELNET if it is
   -- available.
   -----------------------------------------------------------------------------


   procedure Transmit_Telnet_Go_Ahead (
         VT : in out Virtual_Terminal);
   -- ************************  USER SPECIFICATION  ****************************
   -- 
   -- This procedure will send the TELNET GA signal to the remote TELNET.
   -----------------------------------------------------------------------------

end Telnet_Apl;
