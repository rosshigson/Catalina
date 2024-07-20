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

with Ada.Streams;
with Telnet_Types;
with Telnet_Options;
with User_Data;
with Debug_Io;

with Terminal_To_Transport;
with Transport_To_Terminal;

package body Telnet_Apl is

   use Ada.Streams;
   use Telnet_Types;
   use Telnet_Options;
   use User_Data;

   -- type Control_Function is 
         -- (Ip,  
          -- Ao,  
          -- Ayt, 
          -- Ec,  
          -- El); 


   function Work_To_Do (
         VT : in     Virtual_Terminal)
      return Boolean
   is 
   begin
      return  Terminal_To_Transport.There_Is_Terminal_Input (VT)
      or else Transport_To_Terminal.There_Is_Transport_Message (VT)
      or else Transport_To_Terminal.There_Is_Transport_Input (VT);
   end Work_To_Do;


   function Time_To_Transmit (
         Ucb  : in     User_Control_Block;
         Char : in     Eight_Bits) 
     return Boolean is 
      -- *************************  SPECIFICATION  ******************************
      -- This function returns true if it is time to transmit the characters
      -- which were typed into the keyboard and are to be sent to the remote
      -- TELNET connection.  In the default NVT options, this would be at the
      -- end of a line.[1]  Other options in effect (such as remote ECHO) may
      -- be criteria for character-at-a-time as appossed to line-at-a-time
      -- transmissions.[2]  
      -- 
      -- SPECIFICATION REFERENCES :
      --    [1] Network Working Group Request For Comments : 854, May 1983
      --        (page 5, default condition 1)
      --    [2] Network Working Group Request For Comments : 857, May 1983
      --        (page 3, paragraph 1)
      ---------------------------------------------------------------------------

      Transmit : Boolean := False;  
     
   begin
      if Ucb.Ga_Received 
      or Ucb.Options.Remote_In_Effect (Suppress_Go_Ahead) 
      or Ucb.Options.Local_In_Effect (Suppress_Go_Ahead) then
         -- either we have a go ahead, or the remote end doesn't send them
         -- TBD : the above test also assumes we do not wait for a go ahead
         --       if WE are suppressing go aheads - the RFC is not clear
         if Char = CR then
            -- end of line, no option negotiation pending => transmit line
            -- WAITING FOR RESPONSES TO PENDING OPTION NEGOTIATION CAUSES 
            -- PROBLEMS WITH IMPROPER TELNET IMPLEMENTATIONS, SO THIS ...
            if Ucb.Options.Local_Count = 0 and Ucb.Options.Remote_Count = 0 then
               Transmit := True;
            end if;
            -- ... REPLACED WITH THIS ...
            Transmit := True;
            -- ... TO HERE
         else 
            -- not end of line - see if we are in character-at-a-time mode
            if Ucb.Options.Remote_In_Effect (Echo) then
               Transmit := True;
            end if;
            -- TBD : should we be in character at a time mode if we are
            --       doing the echo ? I.e:
            if Ucb.Options.Local_In_Effect (Echo) then
               Transmit := True;
            end if;
         end if;
      end if;
      return Transmit;
   exception
      when E : others =>
         Debug_Io.Put_Exception ("TIME_TO_TRANSMIT", E);
         raise;
   end Time_To_Transmit;


   procedure Process_Terminal_Input (
         VT : in out Virtual_Terminal)
   is 
      -- *********************  BODY SPECIFICATION  *******************************
      --
      -- Processing sequence :
      --
      -- While there is input to process...
      -- If there is input from the NVT keyboard, get a character.   Set the
      -- NVT I/O state as I/O-done.  If the character was a standard control
      -- function, process the standard control function.  If the character was
      -- not a control function then process it as follows.  If the
      -- communication state is no-connection-established or the command state
      -- is partial-command or a new command was detected then set the NVT I/O
      -- state as partial-command and process a partial command.  Otherwise the
      -- input is data so put the character in the data buffer until an end of
      -- line is detected and then send it through to the transport level. 
      ----------------------------  data declarations  ---------------------------

      Ucb  : User_Control_Block := Get_Ucb (VT);
      Char : Eight_Bits; 
      Data_To_Transmit : Boolean := False; 

      function Is_A_Control_Function (
            Ucb              : in     User_Control_Block;
            Char             : in     Eight_Bits)
         return Boolean
      is 
         -- TBD : detect local control function ?
      begin
         return False;
      end Is_A_Control_Function;

   begin
      Debug_Io.Put_Line ("begin process_terminal_input");
      if Terminal_To_Transport.There_Is_Terminal_Input (VT) then
         Debug_Io.Put_Line ("process_terminal_input thinks there is input");
         loop
            Terminal_To_Transport.Get_Terminal_Input (VT, Char);
            if Is_A_Control_Function (Ucb, Char) then
               Debug_Io.Put_Line ("control function character");
               Terminal_To_Transport.Process_Standard_Control_Function (VT, Char);
            else 
               if Ucb.Partial_Command then
                  Debug_Io.Put_Line ("command character");
                  Transport_To_Terminal.Output_To_Terminal (VT, Char);
                  Terminal_To_Transport.Process_Partial_Command (VT, Char);
               elsif Ucb.Escape_Char /= 0 and Char = Ucb.Escape_Char then
                  Debug_Io.Put_Line ("escape character");
                  -- new command detected
                  Ucb.Partial_Command := True;
                  declare
                     Prompt : String := ASCII.CR & ASCII.LF & "Telnet>";
                  begin
                     for i in Prompt'Range loop
                        Transport_To_Terminal.Output_To_Terminal (VT, Character'Pos (Prompt(i)));
                     end loop;
                  end;
               else
                  Debug_Io.Put_Line ("data character");
                  if not Ucb.Options.Remote_In_Effect (Echo) then
                     -- the remote end will not echo the character, so ... 
                     Transport_To_Terminal.Output_To_Terminal (VT, Char);
                  end if;
                  Terminal_To_Transport.Put_Character_In_Data_Buffer (VT, Char);
                  if Char = T_IAC then
                     -- double IAC on send to indicate a data byte 255
                     Terminal_To_Transport.Put_Character_In_Data_Buffer (VT, Char);
                  end if;
                  Data_To_Transmit := True;
               end if;
            end if;
            exit when not Terminal_To_Transport.There_Is_Terminal_Input (VT);
         end loop;
         if Data_To_Transmit then
            if Time_To_Transmit (Ucb, Char) then
               Debug_Io.Put_Line ("sending data buffer to trans level");
               Terminal_To_Transport.Send_Data_Buffer (VT);
            end if;
         end if;
      else 
         -- no input from keyboard, check for send of buffered input
         -- due to pending option negotiation and/or go ahead processing
         if not Ucb.Terminal_Data.Empty and Time_To_Transmit (Ucb, 0) then
            Terminal_To_Transport.Send_Data_Buffer (VT);
         end if;
      end if;
      Debug_Io.Put_Line ("end process_terminal_input");
   exception
      when E : others =>
         Debug_Io.Put_Exception ("PROCESS_TERMINAL_INPUT", E);
         raise;
   end Process_Terminal_Input;


   procedure Process_Transport_Messages (
         VT : in out Virtual_Terminal)
   is 
      --************************  BODY SPECIFICATION  *****************************
      --
      -- While there are messages to process...
      -- If there is a message from the transport level, retrieve the message and
      -- write the message to the NVT printer.  A message being information 
      -- for the local user/process which was generated by the local transport 
      -- level, not simply data being relayed from the remote TELNET.
      --------------------------  data declarations  ---------------------------

      Message : Buffer_Area;
      Size    : Buffer_Index;  

   begin
      Debug_Io.Put_Line ("begin process_transport_messages");
      if Transport_To_Terminal.There_Is_Transport_Message (VT) then
         Debug_Io.Put_Line ("process_transport_messages thinks there is input");
         loop
            Transport_To_Terminal.Get_Transport_Message (VT, Message, Size);
            Debug_Io.Put ("message length =");
            Debug_Io.Put_Line (Size);
            for i in Message'First .. Message'First + Size - 1 loop
               Transport_To_Terminal.Output_To_Terminal (VT, Message (i));
            end loop;
            exit when Terminal_To_Transport.There_Is_Terminal_Input (VT) 
               or not Transport_To_Terminal.Terminal_Will_Accept_Output (VT)
               or not Transport_To_Terminal.There_Is_Transport_Message (VT);
         end loop;
      end if;
      Debug_Io.Put_Line ("end process_transport_messages");
   exception
      when E : others =>
         Debug_Io.Put_Exception ("PROCESS_TRANSPORT_MESSAGES", E);
         raise;
   end Process_Transport_Messages;


   procedure Process_Transport_Input (
         VT : in out Virtual_Terminal)
   is 
      --**********************  BODY SPECIFICATION  ****************************
      --
      -- Processing sequence :
      --
      -- While there is input to process...
      -- If there is input from the transport level which is data simply
      -- relayed from the remote TELNET, input a character from the
      -- transport level and mark the NVT I/O state as having I/O-done.  If the
      -- character is not a standard control function, write it on the NVT
      -- printer.  If the character is a standard control function, process the
      -- standard control function. 
      --------------------------  data declarations  -------------------------

      Ucb : User_Control_Block := Get_Ucb (VT);

      Char                 : Eight_Bits;  
      Was_Control_Function : Boolean;  
      Urgent               : Boolean      := True;  
      Echo_Chars           : Buffer_Area;  
      Echo_Count           : Buffer_Index := Buffer_Area'First; 

   begin
      Debug_Io.Put_Line ("begin process_transport_input");
      if Transport_To_Terminal.There_Is_Transport_Input (VT) then
         Debug_Io.Put_Line ("process_transport_input thinks there is input");
         loop
            Transport_To_Terminal.Get_Transport_Input (VT, Char, Was_Control_Function, Urgent);
            if Was_Control_Function then
               Transport_To_Terminal.Process_Standard_Control_Function (VT, Char, Urgent);
            else
               Transport_To_Terminal.Output_To_Terminal (VT, Char);
               if Ucb.Options.Local_In_Effect (Echo) then
                  Echo_Chars (Buffer_Area'First + Echo_Count) := Char;
                  Echo_Count := Echo_Count + 1;
               end if;
               -- after processing input, send another go ahead (if required)
               Ucb.Ga_Sent := False;
            end if;
            exit when Echo_Count = MAXIMUM_BUFFER_SIZE
               or     Terminal_To_Transport.There_Is_Terminal_Input (VT) 
               or not Transport_To_Terminal.Terminal_Will_Accept_Output (VT)
               or not Transport_To_Terminal.There_Is_Transport_Input (VT);
         end loop;
      end if;
      if Ucb.Options.Local_In_Effect (Echo) and Echo_Count > 0 then
         Terminal_To_Transport.Send_Data (VT, Echo_Chars, Echo_Count, Urgent => False);
      end if;
      Debug_Io.Put_Line ("end process_transport_input");
   exception
      when E : others =>
         Debug_Io.Put_Exception ("PROCESS_TRANSPORT_INPUT", E);
         raise;
   end Process_Transport_Input;


   procedure Transmit_Telnet_Go_Ahead (
         VT : in out Virtual_Terminal)
   is 
      --*************************  BODY SPECIFICATION  ***************************
      --
      -- Processing sequence ...
      --
      -- Send the TELNET GA (go ahead) signal through the presentation level
      -- to the transport level.
      --------------------------  data declarations  -----------------------------

      Ucb    : User_Control_Block := Get_Ucb (VT);
      Buffer : Buffer_Area;  

   begin
      Buffer (Buffer_Area'First + 0) := T_IAC; -- RFC 854 page 14
      Buffer (Buffer_Area'First + 1) := T_GA;
      Terminal_To_Transport.Send_Data (VT, Buffer, 2, Urgent => False);
      Debug_Io.Put_Line ("telnet go ahead sent");
      Ucb.Ga_Sent := True;
   end Transmit_Telnet_Go_Ahead;

end Telnet_Apl;
