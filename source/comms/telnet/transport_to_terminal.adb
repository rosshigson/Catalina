-------------------------------------------------------------------------------
--             This file is part of the Ada Terminal Emulator                --
--               (Terminal_Emulator, Term_IO and Redirect)                   --
--                               package                                     --
--                                                                           --
--                             Version 2.1                                   --
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
with Virtual_Transport;
with Telnet_Options;
with Option_Negotiation;
with User_Data;
with Debug_Io;

package body Transport_To_Terminal is

   -- *******************  BODY SPECIFICATION  *********************************
   --
   -- This package provides subprograms to process (at the APL level) data
   -- input to TELNET from the transport level.  Make the appropriate calls
   -- to the lower level APL packages which will in turn call routines from
   -- the PPL.  Data input is data sent from the remote TELNET.
   --
   -- **************************************************************************

   use Ada.Streams;
   use User_Data;
   use Telnet_Options;


   -- store control message and if indicated by the debug level
   procedure Store_Control_Message (
      Ucb     : in out User_Control_Block;
      Message : in     String)
   is
   begin
      if Ucb.Debug = Debug_Controls or Ucb.Debug = Debug_All then
         Virtual_Transport.Store_Message (Ucb, Message);
      end if;
   end Store_Control_Message;


   function There_Is_Transport_Input  (
         VT    : in     Virtual_Terminal)
      return Boolean
   is
      Ucb   : User_Control_Block := Get_Ucb (VT);
      Input : Boolean;
   begin
      Virtual_Transport.Check_For_Input (Ucb, Input);
      return Input;
   exception
      when E : others =>
         Debug_Io.Put_Exception ("THERE_IS_TRANSPORT_INPUT", E);
         raise;
   end There_Is_Transport_Input;


   function There_Is_Transport_Message  (
         VT    : in     Virtual_Terminal)
      return Boolean
   is
      Ucb   : User_Control_Block := Get_Ucb (VT);
      Input : Boolean;
   begin
      Virtual_Transport.Check_For_Message (Ucb, Input);
      return Input;
   exception
      when E : others =>
         Debug_Io.Put_Exception ("THERE_IS_TRANSPORT_MESSAGE", E);
         raise;
   end There_Is_Transport_Message;


   procedure Get_Transport_Input (
         VT               : in out Virtual_Terminal;
         Char             :    out Eight_Bits;
         Control_Function :    out Boolean;
         Urgent           :    out Boolean)
   is
      -- ************************  BODY SPECIFICATION  ****************************
      --
      -- This procedure returns a character sent from the remote TELNET
      -- and indicates whether it is to be interpreted as a control function.
      -- Characters which are part of a synch are flagged as a control function.
      -- The urgent data flag or the user_data.synch_is_in_progress = TRUE indicates
      -- that the current character is to be interpreted as a control function.
      -- If the character is an IAC (Interperate As Command), get another
      -- character.  If the second character is not an IAC it is a command and to
      -- be interpreted as a control function.  (This will also have the effect of
      -- of screening out the doubling of the IAC code done by the remote TELNET
      -- when it is not to be interpreted as an IAC, ie. the data byte 255.)
      -- A call to this procedure without checking for the presence of characters
      -- to input is erroneous but will result in char := 0 and control_function
      -- := FALSE.
      -----------------------------------------------------------------------------

      Ucb                   : User_Control_Block := Get_Ucb (VT);
      Temp_Char             : Eight_Bits;
      Temp_Control_Function : Boolean;
      Temp_Urgent           : Boolean;

   begin
      Temp_Char := 0;
      Temp_Control_Function := False;
      if There_Is_Transport_Input (VT) then
         Virtual_Transport.Get_Input (Ucb, Temp_Char, Temp_Urgent);
         if Ucb.Synch_Is_In_Progress or Temp_Urgent then -- special handling required
            Temp_Control_Function := True;
            Debug_Io.Put ("input_character: control func detected, code =");
            Debug_Io.Put_Line (Temp_Char);
         end if;
         if Temp_Char = T_IAC then
            loop
               exit when There_Is_Transport_Input (VT);
               delay 0.1;
            end loop;
            Virtual_Transport.Get_Input (Ucb, Temp_Char, Temp_Urgent);
            if Temp_Char /= T_IAC then
               -- command IAC
               Temp_Control_Function := True;
            end if;
         end if;
      end if;

      Char := Temp_Char;
      Control_Function := Temp_Control_Function;
      Urgent := Temp_Urgent;

   exception
      when E : others =>
         Debug_Io.Put_Exception ("GET_A_CHARACTER", E);
         raise;
   end Get_Transport_Input;


   procedure Get_Transport_Message (
         VT      : in out Virtual_Terminal;
         Message :    out Buffer_Area;
         Size    :    out Buffer_Index)
   is
      Ucb : User_Control_Block := Get_Ucb (VT);
   begin
      Virtual_Transport.Get_Message (Ucb, Message, Size);
   exception
      when E : others =>
         Debug_Io.Put_Exception ("GET_A_MESSAGE", E);
         raise;
   end Get_Transport_Message;


   procedure Process_Standard_Control_Function (
         VT     : in out Virtual_Terminal;
         Char   : in     Eight_Bits;
         Urgent : in     Boolean)
   is
      -- ************************  BODY SPECIFICATION  ****************************
      --
      -- This procedure processes a control function which was received from
      -- the remote TELNET.  Handling of the TELNET synch mechanism is also done
      -- here as follows.  The synch is sent via the transport level send
      -- operation with the urgent flag set and the data mark (DM) as the last
      -- (or only) data octet.  If the transport level urgent data flag is set,
      -- the data stream is scanned for IP, AO, AYT, and DM signals.
      -- When in normal mode, the DM is a no-op; when in urgent mode, it signals
      -- the end of urgent processing.  If the transport level indicates the end
      -- of urgent data before the DM is found, TELNET will continue special
      -- handling of the data stream until the DM is found. If more urgent data is
      -- indicated after the DM is found, TELNET will continue special handling
      -- of the data stream until the DM is found.  NOTE: Site dependent code used
      -- for the IP and BREAK commands.
      -- See RFC 854, page 9 for details on the TELNET synch mechanism.
      -----------------------------------------------------------------------------

      Ucb : User_Control_Block := Get_Ucb (VT);

   begin

      Debug_Io.Put_Line ("begin process_standard_control_function");
      Debug_Io.Put ("char_code =");
      Debug_Io.Put_Line (Char);
      if Ucb.Synch_Is_In_Progress then
         Debug_Io.Put_Line ("synch is in progress");
      else
         Debug_Io.Put_Line ("synch is NOT in progress");
      end if;
      if Urgent then
         Debug_Io.Put_Line ("urgent data");
         if not Ucb.Synch_Is_In_Progress then
            Debug_Io.Put_Line ("start of synch");
            Ucb.Synch_Is_In_Progress := True;
         end if;
      else
         Debug_Io.Put_Line ("NOT urgent data");
      end if;

      case Char is
         when T_EOR =>
            Store_Control_Message (Ucb, "RCVD: EOR");
            null; -- nop for now
         when T_SE => -- SE (RFC 854, p. 14)
            Store_Control_Message (Ucb, "RCVD: SE");
            null; -- nop for now
         when T_NOP => -- SE (RFC 854, p. 14)
            Store_Control_Message (Ucb, "RCVD: NOP");
            null; -- nop for now
         when T_SB =>
            Store_Control_Message (Ucb, "RCVD: SB");
            -- suboption negotiation - get all until IAC SE - and be
            -- careful to treat double IAC as normal character 255
            declare
               Urgent            : Boolean;
               Last_Char_Was_IAC : Boolean      := False;
               Char              : Eight_Bits;
               Option_Received   : Boolean      := False;
               Option_Code       : Eight_Bits;
               Option            : Option_Type;
               SubOption         : Buffer_Area;
               Length            : Buffer_Index := Buffer_Area'First;
               Valid             : Boolean      := False;
            begin
               loop
                  loop
                     exit when There_Is_Transport_Input (VT);
                     delay 0.1;
                  end loop;
                  Virtual_Transport.Get_Input (Ucb, Char, Urgent);
                  if (Char = T_IAC and Last_Char_Was_IAC)
                  or (Char /= T_IAC and not Last_Char_Was_IAC) then
                     -- process as normal character
                     if not Option_Received then
                        Option_Code := Char;
                        Option_Received := True;
                        if Valid_Option (Option_Code) then
                           Option := Telnet_Options.Option (Option_Code);
                           Store_Control_Message (Ucb, "RCVD: " & Telnet_Options.Text (Option));
                           Debug_Io.Put_Line ("Legal Subnegotiation - option = " & Text (Option));
                           Valid := True;
                        else
                           Store_Control_Message (Ucb, "RCVD: UNKNOWN OPTION - " & Eight_Bits'Image (Option_Code));
                           Debug_Io.Put_Line ("Illegal Subnegotiation - unknown option = "
                              & Eight_Bits'Image (Option_Code));
                           Valid := False;
                        end if;
                     elsif Length < MAXIMUM_BUFFER_SIZE then
                        SubOption (SubOption'First + Length) := Char;
                        Store_Control_Message (Ucb, "RCVD: " & Eight_Bits'Image (Char));
                        Length := Length + 1;
                     else
                        Valid := False;
                        Debug_Io.Put_Line ("Illegal Subnegotiation - too long");
                     end if;
                  elsif Last_Char_Was_IAC then
                     if Char = T_SE then
                        -- correct suboption end
                        Store_Control_Message (Ucb, "RCVD: SE");
                        exit;
                     else
                        -- illegal suboption
                        Debug_Io.Put_Line ("Illegal Subnegotiation - contains IAC");
                        Valid := False;
                        exit;
                     end if;
                  else -- must be a new IAC, so just remember it
                     Last_Char_Was_IAC := True;
                  end if;
               end loop;
               if Valid then
                  Option_Negotiation.Sub_Negotiation (VT, Option, SubOption, Length);
               else
                  Debug_Io.Put_Line ("Illegal Subnegotiation ignored");
               end if;
            end;
         when T_DM => -- DM
            Store_Control_Message (Ucb, "RCVD: DM");
            if Ucb.Synch_Is_In_Progress then
               Debug_Io.Put_Line ("end of synch");
               Ucb.Synch_Is_In_Progress := False;
            end if;
         when T_BRK => -- break
            Store_Control_Message (Ucb, "RCVD: BRK");
            -- ****** NOTE: SITE DEPENDENT CODE USED ******
            Telnet_Terminal.Output_To_Terminal (VT, 3); -- ctrl c
         when T_IP => -- IP
            Store_Control_Message (Ucb, "RCVD: IP");
            -- ****** NOTE: SITE DEPENDENT CODE USED ******
            Telnet_Terminal.Output_To_Terminal (VT, 25); -- ctrl y
         when T_AO => -- AO
            Store_Control_Message (Ucb, "RCVD: AO");
            declare -- (RFC 854, P. 7,8,&14)
               Buffer    : Buffer_Area;
               Size      : Buffer_Index := 0;
               Data_Mark : Buffer_Area;
            begin
               Ucb.Terminal_Data.Get_First (Buffer, Size); -- trash rest of buffer
               Data_Mark (Buffer_Area'First) := T_DM;
               Virtual_Transport.Send_Data (Ucb, Data_Mark, 1, Urgent => True); -- synch
            end;
         when T_AYT => -- AYT   (RFC 854, P. 13,14)
            Store_Control_Message (Ucb, "RCVD: AYT");
            declare
               Ayt_String : String := ASCII.CR & "I AM HERE." & ASCII.CR;
               Ayt_Buffer : Buffer_Area;
               Ayt_Index  : Buffer_Index := Buffer_Area'First;
            begin
               for Index in Ayt_String'Range loop -- convert type
                  Ayt_Buffer (Ayt_Index) := Character'Pos (Ayt_String (Index));
                  Ayt_Index := Ayt_Index + 1;
               end loop;
               Virtual_Transport.Send_Data (Ucb, Ayt_Buffer, Ayt_String'Length, Urgent => False);
            end;
         when T_EC => -- EC  (RFC 854, P. 13,14)
            Store_Control_Message (Ucb, "RCVD: EC");
            if not Ucb.Terminal_Data.Empty and (Ucb.Synch_Is_In_Progress = False) then
               declare
                  Char : Eight_Bits := 0;
               begin
                  if not Ucb.Terminal_Data.Empty then
                     Ucb.Terminal_Data.Get_Last (Char);
                  end if;
               end;
            end if;
         when T_EL => -- EL
            Store_Control_Message (Ucb, "RCVD: EL");
            if not Ucb.Terminal_Data.Empty and (Ucb.Synch_Is_In_Progress = False) then
               declare
                  Buffer : Buffer_Area;
                  Size   : Buffer_Index := 0;
               begin
                  Ucb.Terminal_Data.Get_First (Buffer, Size);
                  for Index in reverse Buffer_Area'First .. Buffer_Area'First + Size - 1 loop
                     -- delete up to CRLF
                     if Buffer (Index) = LF then
                        if Index > Buffer_Area'First and then Buffer (Index - 1) = CR then
                           Ucb.Terminal_Data.Put_Last (Buffer (Buffer_Area'First .. Index));
                           exit;
                        end if;
                     end if;
                  end loop;
               end;
            end if;
         when T_GA => -- GA
            Store_Control_Message (Ucb, "RCVD: GA");
            Ucb.Ga_Received := True;
         when T_WILL => -- WILL (option code)
            -- get option code
            declare
               Urgent      : Boolean;
               Option_Code : Eight_Bits;
            begin
               loop
                  exit when There_Is_Transport_Input (VT);
                  delay 0.1;
               end loop;
               Virtual_Transport.Get_Input (Ucb, Option_Code, Urgent);
               Option_Negotiation.Remote_Will_Received (VT, Option_Code);
            end;
         when T_WONT => -- WON'T (option code)
            -- get option code
            declare
               Urgent      : Boolean;
               Option_Code : Eight_Bits;
            begin
               loop
                  exit when There_Is_Transport_Input (VT);
                  delay 0.1;
               end loop;
               Virtual_Transport.Get_Input (Ucb, Option_Code, Urgent);
               Option_Negotiation.Remote_Wont_Received (VT, Option_Code);
            end;
         when T_DO => -- DO (option code)
            -- get option code
            declare
               Urgent      : Boolean;
               Option_Code : Eight_Bits;
            begin
               loop
                  exit when There_Is_Transport_Input (VT);
                  delay 0.1;
               end loop;
               Virtual_Transport.Get_Input (Ucb, Option_Code, Urgent);
               Option_Negotiation.Remote_Do_Received (VT, Option_Code);
            end;
         when T_DONT => -- DON'T (option code)
            -- get option code
            declare
               Urgent      : Boolean;
               Option_Code : Eight_Bits;
            begin
               loop
                  exit when There_Is_Transport_Input (VT);
                  delay 0.1;
               end loop;
               Virtual_Transport.Get_Input (Ucb, Option_Code, Urgent);
               Option_Negotiation.Remote_Dont_Received (VT, Option_Code);
            end;
         when others =>
            -- other input ignored.
            Store_Control_Message (Ucb, "RCVD: UNKNOWN CONTROL - " & Eight_Bits'Image (Char));
            Debug_Io.Put_Line ("ignored");
      end case;
      Debug_Io.Put_Line ("end process_standard_control_function");
   exception
      when E : others =>
         Debug_Io.Put_Exception ("PROCESS_STANDARD_CONTROL_FUNCTIONS", E);
         raise;
   end Process_Standard_Control_Function;


   procedure Output_To_Terminal (
         VT   : in out Virtual_Terminal;
         Char : in     Eight_Bits)
   is
   begin
      Telnet_Terminal.Output_To_Terminal (VT, Char);
   end Output_To_Terminal;

   function Terminal_Will_Accept_Output (
         VT   : in     Virtual_Terminal)
      return Boolean
   is
   begin
      return Telnet_Terminal.Terminal_Will_Accept_Output (VT);
   end Terminal_Will_Accept_Output;

end Transport_To_Terminal;
