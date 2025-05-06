-------------------------------------------------------------------------------
--             This file is part of the Ada Terminal Emulator                --
--               (Terminal_Emulator, Term_IO and Redirect)                   --
--                               package                                     --
--                                                                           --
--                             Version 3.0                                   --
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
with Telnet_Apl;
with Debug_Io;
with User_Data;
with Virtual_Transport;
with Option_Negotiation;

package body Telnet_Package is

   use User_Data;
   use Telnet_Apl;
   use Telnet_Options;
   use Telnet_Types;
   use Option_Negotiation;


   procedure Request_To_Do_Option (
         Option    : in     Telnet_Options.Option_Type; 
         VT        : in out Virtual_Terminal)
   is 
   begin
      Request_Local_Option_Enable (VT, Option);
   exception
      when E : others =>
         Debug_Io.Put_Exception ("TELNET_REQUEST_TO_DO_OPTION", E);
         raise;
   end Request_To_Do_Option;


   procedure Demand_Not_To_Do_Option (
         Option    : in     Telnet_Options.Option_Type; 
         VT        : in out Virtual_Terminal)
   is 
   begin
      Demand_Local_Option_Disable (VT, Option);
   exception
      when E : others =>
         Debug_Io.Put_Exception ("TELNET_DEMAND_NOT_TO_DO_OPTION", E);
         raise;
   end Demand_Not_To_Do_Option;


   procedure Request_Remote_To_Do_Option (
         Option    : in     Telnet_Options.Option_Type; 
         VT        : in out Virtual_Terminal)
   is 
   begin
      Request_Remote_Option_Enable (VT, Option);
   exception
      when E : others =>
         Debug_Io.Put_Exception ("TELNET_REQUEST_REMOTE_TO_DO_OPTION", E);
         raise;
   end Request_Remote_To_Do_Option;


   procedure Demand_Remote_Not_To_Do_Option (
         Option    : in     Telnet_Options.Option_Type; 
         VT        : in out Virtual_Terminal)
   is 
   begin
      Demand_Remote_Option_Disable (VT, Option);
   exception
      when E : others =>
         Debug_Io.Put_Exception ("TELNET_DEMAND_REMOTE_NOT_TO_DO_OPTION", E);
         raise;
   end Demand_Remote_Not_To_Do_Option;


   procedure Set_Device_Type (
         Device_Type : in     Io_Device_Supported_Type; 
         VT          : in out Virtual_Terminal)
   is 
      -----------------TBD
   begin
      null;
   end Set_Device_Type;


   procedure Set_Connection_Type ( 
         VT     : in out Virtual_Terminal;
         Active : in     Boolean)
   is 
      Ucb : User_Control_Block := Get_Ucb (VT);
   begin
      Ucb.Active := Active;
   end Set_Connection_Type;


   procedure Telnet (
         VT        : in out Virtual_Terminal) 
   is 
      -- *****************  BODY SPECIFICATION  *****************************
      --
      -- Processing sequence...
      --
      -- Initialize the user information.  If the NVT I/O state is I/O done,
      -- then set the go ahead sent state to no_go_ahead_sent and the NVT I/O 
      -- state to no I/O done. Process any input from the NVT keyboard. Process
      -- any messages from the transport level.  Process any transport level 
      -- input.  If APL had completed sending data to the NVT printer and had
      -- no queued input from  the  NVT keyboard  for  further processing 
      -- (NVT I/O  state  is no-I/O-done) and the TELNET go ahead was not 
      -- already sent then the APL must transmit the TELNET GA (go ahead) to
      -- the transport level [2] and mark the go ahead sent state to 
      -- go_ahead_sent.  Restore the user information.
      --
      --
      -- SPECIFICATION REFERENCES:
      -- 
      --    [1] Network Working Group Request for Comments: 854, May 1983,
      --        TELNET PROTOCOL SPECIFICATION
      --
      --    [2] RFC 854 : TELNET rotocol Specification
      --         page 5, condition 2
      --
      --------------------------------------------------------------------------

      Ucb               : User_Control_Block := Get_Ucb (VT);
      Already_Connected : Boolean;  

   begin
      -- make one "pass" for this user 
      Already_Connected := Ucb.Connected;
      while Work_To_Do (VT) loop
         Process_Terminal_Input (VT);
         Process_Transport_Messages (VT);
         Process_Transport_Input (VT);
      end loop;
      if Ucb.Connected then
         --Ucb.Options.Remote_In_Effect (Echo) := true;
         --Ucb.Options.Remote_In_Effect (Suppress_Go_Ahead) := true;
         if not Ucb.Ga_Sent
         and not (Ucb.Mode = Mode_Character)
         and not Ucb.Options.Local_In_Effect (Suppress_Go_Ahead) then
            -- nothing more can be done without addiitonal input, so ...
            Transmit_Telnet_Go_Ahead (VT);
         end if;
         if not Already_Connected then
            -- a new connection has just been established, so ...
            Negotiate_Desired_Options (VT);
         end if;
      else
         if not Ucb.Active then
            -- we are not an active connection, so do a passive 
            -- open, which will not return until a client connects
            Virtual_Transport.Do_Passive_Open (Ucb);
         end if;
      end if;
   exception
      when E : others =>
         Debug_Io.Put_Exception ("TELNET", E);
         raise;
   end Telnet;


end Telnet_Package;
