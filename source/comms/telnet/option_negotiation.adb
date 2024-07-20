-------------------------------------------------------------------------------
--             This file is part of the Ada Terminal Emulator                --
--               (Terminal_Emulator, Term_IO and Redirect)                   --
--                               package                                     --
--                                                                           --
--                             Version 1.9                                  --
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
with Ada.Streams;

with Debug_Io;
with Virtual_Transport;
with User_Data;

package body Option_Negotiation is

   use Ada.Streams;

   use User_Data;
   use Virtual_Transport;


   -- store option message and if indicated by the debug level
   procedure Store_Option_Message (
      Ucb     : in out User_Control_Block;
      Message : in     String)
   is
   begin
      if Ucb.Debug /= Debug_None and Ucb.Debug /= Debug_Data then
         Store_Message (Ucb, Message);
      end if;
   end Store_Option_Message;


   -- store control message and if indicated by the debug level
   procedure Store_Control_Message (
      Ucb     : in out User_Control_Block;
      Message : in     String)
   is
   begin
      if Ucb.Debug = Debug_Controls or Ucb.Debug = Debug_All then
         Store_Message (Ucb, Message);
      end if;
   end Store_Control_Message;


   -- this routine keeps count of local pending
   procedure Reset_Local_Pending (
         Ucb    : in out User_Control_Block;
         Option : in     Option_Type)
   is 
   begin
      if Ucb.Options.Local_Pending (Option) then
         Ucb.Options.Local_Pending (Option) := False;
         Ucb.Options.Local_Count := Ucb.Options.Local_Count - 1;
      end if;
   end Reset_Local_Pending;
   
   
   -- this routine keeps count of local pending
   procedure Set_Local_Pending (
         Ucb    : in out User_Control_Block;
         Option : in     Option_Type)
   is 
   begin
      if not Ucb.Options.Local_Pending (Option) then
         Ucb.Options.Local_Pending (Option) := True;
         Ucb.Options.Local_Count := Ucb.Options.Local_Count + 1;
      end if;
   end Set_Local_Pending;
   
   
   -- this routine keeps count of remote pending
   procedure Reset_Remote_Pending (
         Ucb    : in out User_Control_Block;
         Option : in     Option_Type)
   is 
   begin
      if Ucb.Options.Remote_Pending (Option) then
         Ucb.Options.Remote_Pending (Option) := False;
         Ucb.Options.Remote_Count := Ucb.Options.Remote_Count - 1;
      end if;
   end Reset_Remote_Pending;
   
   
   -- this routine keeps count of remote pending
   procedure Set_Remote_Pending (
         Ucb    : in out User_Control_Block;
         Option : in     Option_Type)
   is 
   begin
      if not Ucb.Options.Remote_Pending (Option) then
         Ucb.Options.Remote_Pending (Option) := True;
         Ucb.Options.Remote_Count := Ucb.Options.Remote_Count + 1;
      end if;
   end Set_Remote_Pending;
   
   
   -- this routine is used for known options
   procedure Send_Option (
         Ucb    : in out User_Control_Block;
         Action : in     Action_Type;          
         Option : in     Option_Type)
   is 
      Data : Buffer_Area; 
   begin
      Data (Buffer_Area'First + 0) := T_IAC;
      Data (Buffer_Area'First + 1) := Code (Action);
      Data (Buffer_Area'First + 2) := Code (Option);
      Send_Data (Ucb, Data, 3, False);
      Store_Control_Message (Ucb, "SENT: " & Text (Action) & " " & Text (Option));
   exception
      when E : others =>
         Debug_Io.Put_Exception ("SEND_OPTION", E);
         raise;
   end Send_Option;


   -- this routine is used for unknown options
   procedure Send_Option (
         Ucb     : in out User_Control_Block;
         Action  : in     Action_Type; 
         Op_Code : in     Eight_Bits)
   is 
      Data : Buffer_Area; 
   begin
      Data (Buffer_Area'First + 0) := T_IAC;
      Data (Buffer_Area'First + 1) := Code (Action);
      Data (Buffer_Area'First + 2) := Op_Code;
      Send_Data (Ucb, Data, 3, False);
      Store_Control_Message (Ucb, "SENT: " & Text (Action) & " " & Eight_Bits'Image (Op_Code));
   exception
      when E : others =>
         Debug_Io.Put_Exception ("SEND_OPTION", E);
         raise;
   end Send_Option;


   function Local_Option_In_Effect_Or_Pending (
         Ucb    : in     User_Control_Block;
         Option : in     Option_Type) 
     return Boolean
   is 
   begin
      return Ucb.Options.Local_In_Effect (Option) 
      or     Ucb.Options.Local_Pending (Option);
   end Local_Option_In_Effect_Or_Pending;


   function Remote_Option_In_Effect_Or_Pending (
         Ucb    : in     User_Control_Block;
         Option : in     Option_Type) 
     return Boolean
   is 
   begin
      return Ucb.Options.Remote_In_Effect (Option) 
      or     Ucb.Options.Remote_Pending (Option);
   end Remote_Option_In_Effect_Or_Pending;


   procedure Request_Local_Option_Enable (
         VT     : in out Virtual_Terminal;
         Option : in     Option_Type)
   is 
      -- *********************  BODY SPECIFICATION  ****************************
      --
      -- If the connection is established and the option is not already in 
      -- effect, this procedure will negotiate for that option.  Otherwise, 
      -- the desirable option tables will be updated and TELNET PPL will try 
      -- to negotiate these options at the establishment of a new connection.
      --------------------------------------------------------------------------
      Ucb : User_Control_Block := Get_Ucb (VT);
   begin
      if Ucb.Connected and Supported (Option)
      and not Local_Option_In_Effect_Or_Pending (Ucb, Option) then
         Send_Option (Ucb, Telnet_Will, Option);
         Set_Local_Pending (Ucb, Option);
      else
         Ucb.Options.Local_Desired (Option) := True;
      end if;
   exception
      when E : others =>
         Debug_Io.Put_Exception ("DEMAND_LOCAL_OPTION_ENABLE", E);
         raise;
   end Request_Local_Option_Enable;


   procedure Demand_Local_Option_Disable (
         VT     : in out Virtual_Terminal;
         Option : in     Option_Type)
   is 
      -- *********************  BODY SPECIFICATION  ****************************
      --
      -- If the connection is established and the option is already in effect,
      -- this procedure will negotiate the cessation of that 
      -- option.  If there is no connection established, the desirable option 
      -- tables will be updated and TELNET PPL will not try to negotiate this 
      -- option at the establishment of a new connection.  
      --------------------------------------------------------------------------
      Ucb : User_Control_Block := Get_Ucb (VT);
   begin
      if Ucb.Connected and Supported (Option) 
      and Ucb.Options.Local_In_Effect (Option) then
         Send_Option (Ucb, Telnet_Wont, Option);
         Set_Local_Pending (Ucb, Option);
      else
         Ucb.Options.Local_Desired (Option) := False;
      end if;
   exception
      when E : others =>
         Debug_Io.Put_Exception ("DEMAND_LOCAL_OPTION_DISABLE", E);
         raise;
   end Demand_Local_Option_Disable;


   procedure Request_Remote_Option_Enable (
         VT     : in out Virtual_Terminal;
         Option : in     Telnet_Options.Option_Type)
   is 
      -- *********************  BODY SPECIFICATION  ****************************
      --
      -- If the connection is established and the option is not already in 
      -- effect, this procedure will negotiate for that option.  Otherwise, 
      -- the desirable option tables will be updated and TELNET PPL will try 
      -- to negotiate these options at the establishment of a new connection.
      --------------------------------------------------------------------------
      Ucb : User_Control_Block := Get_Ucb (VT);
   begin
      if Ucb.Connected and Supported (Option) 
      and not Remote_Option_In_Effect_Or_Pending (Ucb, Option) then
         Send_Option (Ucb, Telnet_Do, Option);
         Set_Remote_Pending (Ucb, Option);
      else -- add to desired options table
         Ucb.Options.Remote_Desired (Option) := True;
      end if;
   exception
      when E : others =>
         Debug_Io.Put_Exception ("REQUEST_REMOTE_OPTION_ENABLE", E);
         raise;
   end Request_Remote_Option_Enable;


   procedure Demand_Remote_Option_Disable (
         VT     : in out Virtual_Terminal;
         Option : in     Telnet_Options.Option_Type)
   is 
      -- *********************  BODY SPECIFICATION  ****************************
      --
      -- If the connection is established and the option is already in effect,
      -- this procedure will negotiate the cessation of that 
      -- option.  If there is no connection established, the desirable option 
      -- tables will be updated and TELNET PPL will not try to negotiate this 
      -- option at the establishment of a new connection.  
      --------------------------------------------------------------------------
      Ucb : User_Control_Block := Get_Ucb (VT);
   begin
      if Ucb.Connected and Supported (Option) 
      and Ucb.Options.Remote_In_Effect (Option) then
         Send_Option (Ucb, Telnet_Dont, Option);
         Set_Remote_Pending (Ucb, Option);
      else
         Ucb.Options.Remote_Desired (Option) := False;
      end if;
   exception
      when E : others =>
         Debug_Io.Put_Exception ("DEMAND_REMOTE_OPTION_DISABLE", E);
         raise;
   end Demand_Remote_Option_Disable;


   procedure Negotiate_Desired_Options (
         VT : in out Virtual_Terminal)
   is 
      -- *********************  BODY SPECIFICATION  **************************
      --
      -- This procedure will use the information contained in the desirable 
      -- options tables to negotiate initial options with the remote TELNET 
      -- connection.
      --
      -- Processing sequence... 
      -- Check the table of remote options that are desired for the other end 
      -- and send a DO OPTION through the connection for each.  Check the 
      -- table of local options desirable on this end and send a WILL OPTION
      -- through the connection for each.
      ------------------------------------------------------------------------
      Ucb : User_Control_Block := Get_Ucb (VT);
   begin
      for Option in Option_Type loop
         if Supported (Option) and Ucb.Options.Remote_Desired (Option) then
            Request_Remote_Option_Enable (VT, Option);
         end if;
      end loop;
      for Option in Option_Type loop
         if Supported (Option) and Ucb.Options.Local_Desired (Option) then
            Request_Local_Option_Enable (VT, Option);
         end if;
      end loop;
   exception
      when E : others =>
         Debug_Io.Put_Exception ("NEGOTIATE_INITIAL_DESIRED_OPTIONS", E);
         raise;
   end Negotiate_Desired_Options;


   procedure Reset_All_Options (
         VT : in out Virtual_Terminal)
   is
      -- *********************  BODY SPECIFICATION  **************************
      --
      -- This procedure will cancel all options in effect, either locally or
      -- remotely.
      --
      -- Processing sequence... 
      -- If connected, then Demand that all local and remote options in effect
      -- be disabled. Then perform the initial negotiations again.
      ------------------------------------------------------------------------
      Ucb : User_Control_Block := Get_Ucb (VT);
   begin
      if Ucb.Connected then
         for Option in Option_Type loop
            if Supported (Option) then
               if Ucb.Options.Remote_In_Effect (Option) then
                  Send_Option (Ucb, Telnet_Dont, Option);
                  Set_Remote_Pending (Ucb, Option);
               end if;
               if Ucb.Options.Local_In_Effect (Option) then
                  Send_Option (Ucb, Telnet_Wont, Option);
                  Set_Local_Pending (Ucb, Option);
               end if;
            end if;
         end loop;
      end if;
   end Reset_All_Options;


   procedure Remote_Will_Received (
         VT      : in out Virtual_Terminal;
         Op_Code : in     Eight_Bits)
   is 
      -- **********************  BODY SPECIFICATION  ***************************
      --
      -- If the option code is not supported, send a don't for the unknown code;
      -- otherwize process the option in the following manner.
      -- If we already asked for this option  (in remote_options_pending table)
      -- then add it to the remote_options_in_effect table and remove it from 
      -- the remote pending options table.
      -- Otherwize, if the option is in the remote_options_desired table then 
      -- "ack" it and add it to the remote_options_in_effect table.
      -- If the above conditions were not met, then refuse to allow the option 
      -- and "ack" it if required (option not in remote_option_pending table) or
      -- simply remove it from the remote_options_pending table if no "ack"
      -- is neccessary.   
      --------------------------------------------------------------------------
      Ucb    : User_Control_Block := Get_Ucb (VT);
      Option : Option_Type;
   begin
      if Valid_Option (Op_Code) then
         Option := Telnet_Options.Option (Op_Code);
         Store_Control_Message (Ucb, "RCVD: " & Text (Telnet_Will) & " " & Text (Option));
         case Option is
            when Echo =>
               -- note both sides cannot echo at once (=> loop forever)
               -- see RFC 857 for information on the TELNET echo option
               if Ucb.Options.Remote_Pending (Option)
               and not Ucb.Options.Local_In_Effect (Option) then
                  Reset_Remote_Pending (Ucb, Option);
                  Ucb.Options.Remote_In_Effect (Option) := True;
                  Store_Option_Message (Ucb, "remote " & Text (Option) & " option in effect");
               elsif Ucb.Options.Remote_Desired (Option)
               and not Ucb.Options.Local_In_Effect (Option) then
                  Ucb.Options.Remote_In_Effect (Option) := True;
                  Store_Option_Message (Ucb, "remote " & Text (Option) & " option in effect");
                  Send_Option (Ucb, Telnet_Do, Option);
               else -- send negative ack
                  Store_Option_Message (Ucb, "remote " & Text (Option) & " option refused by local telnet");
                  Send_Option (Ucb, Telnet_Dont, Option);
               end if;
            when others =>
               if Supported (Option) then
                  -- option supported, accept if pending or desired
                  if Ucb.Options.Remote_Pending (Option) then
                     Reset_Remote_Pending (Ucb, Option);
                     Ucb.Options.Remote_In_Effect (Option) := True;
                     Store_Option_Message (Ucb, "remote " & Text (Option) & " option in effect");
                  elsif Ucb.Options.Remote_Desired (Option) then
                     Ucb.Options.Remote_In_Effect (Option) := True;
                     Store_Option_Message (Ucb, "remote " & Text (Option) & " option in effect");
                     Send_Option (Ucb, Telnet_Do, Option);
                  else 
                     -- option neither pending nor desired, so send negative ack
                     Store_Option_Message (Ucb, "remote " & Text (Option) & " option refused by local telnet");
                     Send_Option (Ucb, Telnet_Dont, Option);
                  end if;
               else 
                  -- option not supported, refuse offer
                  Store_Option_Message (Ucb, "remote " & Text (Option) & " option not supported by local telnet");
                  Send_Option (Ucb, Telnet_Dont, Option);
               end if;
         end case;
      else
         -- unknown option code, refuse offer
         Store_Option_Message (Ucb, "remote " & Eight_Bits'Image (Op_Code) & " option refused by local telnet");
         Store_Control_Message (Ucb, "RVCD: " & Text (Telnet_Will) & " " & Eight_Bits'Image (Op_Code));
         Send_Option (Ucb, Telnet_Dont, Op_Code);
      end if;
   exception
      when E : others =>
         Debug_Io.Put_Exception ("REMOTE_WILL_RECEIVED", E);
         raise;
   end Remote_Will_Received;


   procedure Remote_Wont_Received (
         VT      : in out Virtual_Terminal;
         Op_Code : in     Eight_Bits)
   is 
      -- **********************  BODY SPECIFICATION  ***************************
      --
      -- If the code is suported then process as follows...
      -- If the option was requested remotly (item in remote_options_in_effect
      -- table and item not in remote_options_pending) then ack the wont with 
      -- a dont.  Remove the item from the romote_options_pending / in_effect 
      -- tables
      --------------------------------------------------------------------------
      Ucb    : User_Control_Block := Get_Ucb (VT);
      Option : Option_Type;
   begin
      if Valid_Option (Op_Code) then
         Option := Telnet_Options.Option (Op_Code);
         Store_Control_Message (Ucb, "RCVD: " & Text (Telnet_Wont) & " " & Text (Option));
         Store_Option_Message (Ucb, "remote " & Text (Option) & " option disabled by remote telnet");
         -- If the option was pending (which means we requested it) then
         -- just accept the WONT, otherwise acknowledge it with a DONT.
         if Ucb.Options.Remote_In_Effect (Option) 
         and not Ucb.Options.Remote_Pending (Option) then
            Send_Option (Ucb, Telnet_Dont, Option);
         end if;
         Ucb.Options.Remote_In_Effect (Option) := False;
         Reset_Remote_Pending (Ucb, Option);
      else
         -- unknown option code, do nothing
         Store_Control_Message (Ucb, "RCVD: " & Text (Telnet_Wont) & " " & Eight_Bits'Image (Op_Code));
      end if;
   exception
      when E : others =>
         Debug_Io.Put_Exception ("REMOTE_WONT_RECEIVED", E);
         raise;
   end Remote_Wont_Received;


   procedure Remote_Do_Received (
         VT      : in out Virtual_Terminal;
         Op_Code : in     Eight_Bits)
   is 
      -- **********************  BODY SPECIFICATION  ***************************
      --
      -- If the option code is not supported, send a don't for the unknown code;
      -- otherwize process the option in the following manner.
      -- If we already asked for this option (in remote_options_pending table)
      -- then add it to the remote_options_in_effect table and remove it from 
      -- the remote pending options table.
      -- Otherwize, if the option is in the remote_options_desired table then 
      -- "ack" it and add it to the remote_options_in_effect table.
      -- If the above conditions were not met, then refuse to allow the option 
      -- and "ack" it if required (option not in remote_option_pending table) or
      -- simply remove it from the remote_options_pending table if no "ack"
      -- is neccessary.   
      --------------------------------------------------------------------------
      Ucb    : User_Control_Block := Get_Ucb (VT);
      Option : Option_Type;
   begin
      if Valid_Option (Op_Code) then
         Option := Telnet_Options.Option (Op_Code);
         Store_Control_Message (Ucb, "RCVD: " & Text (Telnet_Do) & " " & Text (Option));
         case Option is
            when Echo =>
               -- note both sides cannot echo at once (=> loop forever)
               -- see RFC 857 for information on the TELNET echo option
               if Ucb.Options.Local_Pending (Option)
               and not Ucb.Options.Remote_In_Effect (Option) then
                  Reset_Local_Pending (Ucb, Option);
                  Ucb.Options.Local_In_Effect (Option) := True;
                  Store_Option_Message (Ucb, "local " & Text (Option) & " option in effect");
               elsif Ucb.Options.Local_Desired (Option)
               and not Ucb.Options.Remote_In_Effect (Option) then
                  Ucb.Options.Local_In_Effect (Option) := True;
                  Store_Option_Message (Ucb, "local " & Text (Option) & " option in effect");
                  Send_Option (Ucb, Telnet_Will, Option);
               else -- send negative ack
                  Store_Option_Message (Ucb, "local " & Text (Option) & " option refused by local telnet");
                  Send_Option (Ucb, Telnet_Wont, Option);
               end if;
            when Timing_Mark =>
                  -- TBD : sending a WILL TIMING MARK seems to cause unix telnet servers to respond
                  ---      with a WONT SUPPRESS GA - Why ?. This has to be disabled as it causes 
                  --       problems since such servers never actually transmit GA, even though they
                  --       say they have not suppressed it. So the following line:
                  -- Send_Option (Ucb, Telnet_Will, Option);
                  --       is replaced with this:
                  Send_Option (Ucb, Telnet_Wont, Option);
            when others => 
               if Supported (Option) then
                  -- option supported, so if the option was pending (i.e. we requested it), 
                  -- then just accept the DO, otherwise positively acknowledge it
                  if Ucb.Options.Local_Pending (Option) then
                     Reset_Local_Pending (Ucb, Option);
                     Ucb.Options.Local_In_Effect (Option) := True;
                     Store_Option_Message (Ucb, "local " & Text (Option) & " option in effect");
                  else
                  -- note, this used only to accept a DO if the option was desired, but has now
                  -- been changed to accept it under all circumstances if the option is supported
                  -- elsif Ucb.Options.Local_Desired (Option) then
                     Ucb.Options.Local_In_Effect (Option) := True;
                     Store_Option_Message (Ucb, "local " & Text (Option) & " option in effect");
                     Send_Option (Ucb, Telnet_Will, Option);
                  -- else
                     -- Store_Option_Message (Ucb, "local " & Text (Option) & " option refused by local telnet");
                     -- Send_Option (Ucb, Telnet_Wont, Option);
                  end if;
               else 
                  -- option not supported, refuse offer
                  Store_Option_Message (Ucb, "local " & Text (Option) & " option not supported by local telnet");
                  Send_Option (Ucb, Telnet_Wont, Option);
               end if;
         end case;
      else
         -- unknown option code, refuse offer
         Store_Option_Message (Ucb, "local " & Eight_Bits'Image (Op_Code) & " option refused by local telnet");
         Store_Control_Message (Ucb, "RCVD: " & Text (Telnet_Wont) & " " & Eight_Bits'Image (Op_Code));
         Send_Option (Ucb, Telnet_Wont, Op_Code);
      end if;
   exception
      when E : others =>
         Debug_Io.Put_Exception ("REMOTE_DO_RECEIVED", E);
         raise;
   end Remote_Do_Received;


   procedure Remote_Dont_Received (
         VT      : in out Virtual_Terminal;
         Op_Code : in     Eight_Bits)
   is 
      -- *************************  BODY SPECIFICATION  ************************
      --
      -- If the code is suported then process as follows...
      -- If the option was requested remotly (item in local_options_in_effect 
      -- table and item not in local_options_pending) then ack the dont with a
      -- wont.  Remove the item from the local_options_pending / in_effect 
      -- tables
      --------------------------------------------------------------------------
      Ucb    : User_Control_Block := Get_Ucb (VT);
      Option : Option_Type;
   begin
      if Valid_Option (Op_Code) then
         Option := Telnet_Options.Option (Op_Code);
         Store_Control_Message (Ucb, "RCVD: " & Text (Telnet_Dont) & " " & Text (Option));
         Store_Option_Message (Ucb, "local " & Text (Option) & " option not in effect");
         -- If the option was pending (which means we offered it) then
         -- just accept the DONT, otherwise acknowledge it with a WONT.
         if Ucb.Options.Local_In_Effect (Option)
         and not Ucb.Options.Local_Pending (Option) then
            Send_Option (Ucb, Telnet_Wont, Option);
         end if;
         Ucb.Options.Local_In_Effect (Option) := False;
         Reset_Local_Pending (Ucb, Option);
      else
         -- unknown option code - should never get this
         Store_Control_Message (Ucb, "RCVD: " & Text (Telnet_Dont) & " " & Eight_Bits'Image (Op_Code));
      end if;
   exception
      when E : others =>
         Debug_Io.Put_Exception ("REMOTE_DONT_RECEIVED", E);
         raise;
   end Remote_Dont_Received;


   procedure Send_Terminal_Type (
         VT        : in out Virtual_Terminal)
   is
      Ucb    : User_Control_Block := Get_Ucb (VT);
      Data   : Buffer_Area;
      Offset : Buffer_Index;
   begin
      Data (Buffer_Area'First + 0) := T_IAC;
      Data (Buffer_Area'First + 1) := T_SB; 
      Data (Buffer_Area'First + 2) := Code (Terminal_Type);
      Data (Buffer_Area'First + 3) := 0; -- IS
      Offset := 4;
      for i in 1 .. Integer (Ucb.Terminal_Name.Size) loop
         Data (Buffer_Area'First + Offset) := Character'Pos (Ucb.Terminal_Name.Name (i));
         Offset := Offset + 1;
      end loop;
      Data (Buffer_Area'First + Buffer_Area'First + Offset) := T_IAC;
      Offset := Offset + 1;
      Data (Buffer_Area'First + Buffer_Area'First + Offset) := T_SE; 
      Offset := Offset + 1;
      Send_Data (Ucb, Data,  Offset, False);
   exception
      when E : others =>
         Debug_Io.Put_Exception ("SEND_TERMINAL_TYPE", E);
         raise;
   end Send_Terminal_Type;


   procedure Send_Status (
         VT        : in out Virtual_Terminal)
   is
      Ucb    : User_Control_Block := Get_Ucb (VT);
      Data   : Buffer_Area;
      Offset : Buffer_Index;
   begin
      Data (Buffer_Area'First + 0) := T_IAC;
      Data (Buffer_Area'First + 1) := T_SB; 
      Data (Buffer_Area'First + 2) := Code (Status);
      Data (Buffer_Area'First + 3) := 0; -- IS
      Offset := 4;
      for O in Option_Type loop
         if Supported (O) and Ucb.Options.Local_In_Effect (O) then
            Data (Buffer_Area'First + Offset) := Code (Telnet_Will);
            Offset := Offset + 1;
            Data (Buffer_Area'First + Offset) := Code (O);
            Offset := Offset + 1;
         end if;
      end loop;
      for O in Option_Type loop
         if Supported (O) and Ucb.Options.Remote_In_Effect (O) then
            Data (Buffer_Area'First + Offset) := Code (Telnet_Do);
            Offset := Offset + 1;
            Data (Buffer_Area'First + Offset) := Code (O);
            Offset := Offset + 1;
         end if;
      end loop;
      Data (Buffer_Area'First + Buffer_Area'First + Offset) := T_IAC;
      Offset := Offset + 1;
      Data (Buffer_Area'First + Buffer_Area'First + Offset) := T_SE; 
      Offset := Offset + 1;
      Send_Data (Ucb, Data,  Offset, False);
   exception
      when E : others =>
         Debug_Io.Put_Exception ("SEND_STATUS", E);
         raise;
   end Send_Status;

               
   procedure Sub_Negotiation (
         VT        : in out Virtual_Terminal;
         Option    : in     Option_Type;
         SubOption : in     Buffer_Area;
         Length    : in     Buffer_Index)
   is
      Ucb    : User_Control_Block := Get_Ucb (VT);
   begin
      case Option is 
         when Terminal_Type =>
            if Length = 1 and SubOption (SubOption'First) = 1 then -- SEND
               Send_Terminal_Type (VT);
            else
               Debug_Io.Put_Line ("SUBNEGOTIATION : Illegal " & Text (Option) & " Sub-negotiation");
            end if;
         when Status =>
            if Length = 1 and SubOption (SubOption'First) = 1 then -- SEND
               Send_Status (VT);
            elsif Length >= 1 and SubOption (SubOption'First) = 0 then -- IS
               Store_Option_Message (Ucb, "STATUS IS");
               declare
                  Index : Buffer_Index := SubOption'First + 1;
               begin
                  while Index + 2 < Length loop
                     if Telnet_Options.Valid_Action (SubOption (Index)) then
                        if Telnet_Options.Valid_Option (SubOption (Index + 1)) then
                           Store_Option_Message (Ucb, 
                              "  " & 
                              Telnet_Options.Text (Telnet_Options.Action (SubOption (Index))) & 
                              " " & 
                              Telnet_Options.Text (Telnet_Options.Option (SubOption (Index + 1))));
                        else
                           Store_Option_Message (Ucb, 
                              "  " & 
                              Telnet_Options.Text (Telnet_Options.Action (SubOption (Index))) & 
                              " " & 
                              Eight_Bits'Image (SubOption (Index + 1)));
                        end if;
                     else
                        if Telnet_Options.Valid_Option (SubOption (Index + 1)) then
                           Store_Option_Message (Ucb, 
                              "  " & 
                              Eight_Bits'Image (SubOption (Index)) & 
                              " " & 
                              Telnet_Options.Text (Telnet_Options.Option (SubOption (Index + 1))));
                        else
                           Store_Option_Message (Ucb, 
                              "  " & 
                              Eight_Bits'Image (SubOption (Index)) & 
                              " " & 
                              Eight_Bits'Image (SubOption (Index + 1)));
                        end if;
                     end if;
                     Index := Index + 2;
                  end loop;
               end;
               Store_Option_Message (Ucb, "END STATUS");
            else
               Debug_Io.Put_Line ("SUBNEGOTIATION : Illegal " & Text (Option) & " Sub-negotiation");
            end if;
         when others =>
            -- ignore
            null;
      end case;
   exception
      when E : others =>
         Debug_Io.Put_Exception ("SUB_NEGOTIATION", E);
         raise;
   end Sub_Negotiation;


end Option_Negotiation;
