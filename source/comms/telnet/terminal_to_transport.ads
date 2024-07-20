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
with Telnet_Types;
with Telnet_Terminal;

package Terminal_To_Transport is

   -- **********************  USER SPECIFICATION  ******************************
   --
   -- This package provides subprograms to allow APL level processing of data 
   -- entered into the Network Virtual Terminal (NVT) for a particular user of 
   -- TELNET.
   --
   -- **************************************************************************

   use Telnet_Types;
   use Telnet_Terminal;


   function There_Is_Terminal_Input (
         VT : in    Virtual_Terminal)
      return Boolean; 
   -- ************************  USER SPECIFICATION  ****************************
   --
   -- This function returns true if there is input from the NVT keyboard.
   -----------------------------------------------------------------------------


   procedure Get_Terminal_Input (
         VT               : in out Virtual_Terminal;
         Char             :    out Eight_Bits); 
   -- ************************  USER SPECIFICATION  ****************************
   --
   -- This routine returns a logical character from the NVT keyboard.
   -----------------------------------------------------------------------------



   procedure Process_Standard_Control_Function (
         VT   : in out Virtual_Terminal;
         Char : in     Eight_Bits); 
   -- ************************  USER SPECIFICATION  ****************************
   --
   -- This procedure will perform the appropriate action for the specified 
   -- control function.
   -----------------------------------------------------------------------------


   procedure Process_Partial_Command (
         VT   : in out Virtual_Terminal;
         Char : in     Eight_Bits); 
   -- ************************  USER SPECIFICATION  ****************************
   --
   -- This procedure will process the character as part of a partial command.
   -----------------------------------------------------------------------------


   procedure Put_Character_In_Data_Buffer (
         VT   : in out Virtual_Terminal;
         Char : in     Eight_Bits); 
   -- ************************  USER SPECIFICATION  ****************************
   --
   -- This procedure will put a character into the APL keyboard data buffer.
   -----------------------------------------------------------------------------


   procedure Send_Data_Buffer (
         VT   : in out Virtual_Terminal);
   -- ************************  USER SPECIFICATION  ****************************
   --
   -- This procedure will send the entire contents of the APL keyboard data
   -- buffer to the transport level for transmission to the remote TELNET.
   -----------------------------------------------------------------------------

   procedure Send_Data (
         VT     : in out Virtual_Terminal;
         Data   : in     Buffer_Area; 
         Size   : in     Buffer_Index;
         Urgent : in     Boolean);
   -- ************************  USER SPECIFICATION  ****************************
   --
   -- This procedure will send the data to the transport level for transmission 
   -- to the remote TELNET.
   -----------------------------------------------------------------------------


end Terminal_To_Transport;
