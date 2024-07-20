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
with Telnet_Options;
with Telnet_Terminal;

package Option_Negotiation is

   use Telnet_Types;
   use Telnet_Options;
   use Telnet_Terminal;

   --*****************  USER SPECIFICATION  ********************************
   --
   -- This package will have routines to negotiate the transfer syntax and 
   -- virtual resource characteristics. A procedure will negotiate initial
   -- options. Additionally, procedures can be called to explicitly request 
   -- option enable or demand option disable of a particular option at any 
   -- time.
   -- **********************************************************************


   procedure Request_Local_Option_Enable (
         VT     : in out Virtual_Terminal;
         Option : in     Option_Type); 
   -- ********************  USER SPECIFICATION  ****************************
   --
   -- If the connection is established and the option is not already in effect,
   -- this procedure will negotiate for that option.  If there is no connection
   -- established, the desirable option tables will be updated and TELNET
   -- PPL will try to negotiate these options at the establishment of a new 
   -- connection.  
   -------------------------------------------------------------------------


   procedure Demand_Local_Option_Disable (
         VT     : in out Virtual_Terminal;
         Option : in     Option_Type); 
   -- ********************  USER SPECIFICATION  ****************************
   --
   -- If the connection is established and the option is already in effect,
   -- this procedure will negotiate the cessation of that option.  If there is
   -- no connection established, the desirable option tables will be updated 
   -- and TELNET PPL will not try to negotiate this option at the establishment 
   -- of a new connection.  
   -------------------------------------------------------------------------


   procedure Request_Remote_Option_Enable (
         VT     : in out Virtual_Terminal;
         Option : in     Option_Type); 
   -- ********************  USER SPECIFICATION  ****************************
   --
   -- If the connection is established and the option is not already in
   -- effect, this procedure will negotiate for that option.  If there is 
   -- no connection established, the desirable option tables will be 
   -- updated and TELNET PPL will try to negotiate these options at the 
   -- establishment of a new connection.  
   -------------------------------------------------------------------------


   procedure Demand_Remote_Option_Disable (
         VT     : in out Virtual_Terminal;
         Option : in     Option_Type); 
   -- ********************  USER SPECIFICATION  ****************************
   --
   -- If the connection is established and the option is already in effect,
   -- this procedure will negotiate the cessation of that option.  If there
   -- is no connection established, the desirable option tables will be 
   -- updated and TELNET PPL will not try to negotiate this option at the 
   -- establishment of a new connection.  
   -------------------------------------------------------------------------


   procedure Negotiate_Desired_Options (
         VT : in out Virtual_Terminal);
   -- ********************  USER SPECIFICATION  ****************************
   --
   -- This procedure will use the information contained in the desirable 
   -- options tables to negotiate options with the remote TELNET.
   -------------------------------------------------------------------------


   procedure Reset_All_Options (
         VT : in out Virtual_Terminal);
   -- *********************  BODY SPECIFICATION  **************************
   --
   -- This procedure will cancel all options in effect, either locally or
   -- remotely.
   --
   ------------------------------------------------------------------------


   procedure Remote_Will_Received (
         VT      : in out Virtual_Terminal;
         Op_Code : in     Eight_Bits); 
   -- *********************  USER SPECIFICATION  ***************************
   --
   -- This procedure will inform the option negotiation subprograms that a 
   -- WILL (option) was received from the remote TELNET.
   -------------------------------------------------------------------------


   procedure Remote_Wont_Received (
         VT      : in out Virtual_Terminal;
         Op_Code : in     Eight_Bits); 
   -- *********************  USER SPECIFICATION  ***************************
   --
   -- This procedure will inform the option negotiation subprograms that a 
   -- WONT (option) was received from the remote TELNET.
   -------------------------------------------------------------------------


   procedure Remote_Do_Received (
         VT      : in out Virtual_Terminal;
         Op_Code : in     Eight_Bits); 
   -- *********************  USER SPECIFICATION  ***************************
   --
   -- This procedure will inform the option negotiation subprograms that a 
   -- DO (option) was received from the remote TELNET.
   -------------------------------------------------------------------------


   procedure Remote_Dont_Received (
         VT      : in out Virtual_Terminal;
         Op_Code : in     Eight_Bits); 
   -- *********************  USER SPECIFICATION  ***************************
   --
   -- This procedure will inform the option negotiation subprograms that a 
   -- DONT (option) was received from the remote TELNET.
   -------------------------------------------------------------------------


   procedure Send_Terminal_Type (
         VT        : in out Virtual_Terminal);
   -- *********************  USER SPECIFICATION  ***************************
   --
   -- This procedure initiates a sub-negotation to send the terminal type
   -- to the remote telnet.
   -------------------------------------------------------------------------
   

   
   procedure Send_Status (
         VT        : in out Virtual_Terminal);
   -- *********************  USER SPECIFICATION  ***************************
   --
   -- This procedure initiates a sub-negotation to send the status to the 
   -- remote telnet.
   -------------------------------------------------------------------------

   
   procedure Sub_Negotiation (
         VT        : in out Virtual_Terminal;
         Option    : in     Option_Type;
         SubOption : in     Buffer_Area;
         Length    : in     Buffer_Index); 
   -- *********************  USER SPECIFICATION  ***************************
   --
   -- This procedure processes a sub-negotiation string received from the 
   -- remote TELNET.
   -------------------------------------------------------------------------
   
end Option_Negotiation;
