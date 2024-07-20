-------------------------------------------------------------------------------
--             This file is part of the Ada Terminal Emulator                --
--               (Terminal_Emulator, Term_IO and Redirect)                   --
--                               package                                     --
--                                                                           --
--                             Version 2.2                                   --
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
with Ada.Characters.Handling;
with User_Data;
with Telnet_Options;
with Virtual_Transport;
with Option_Negotiation;
with Debug_Io;
with Sockets; -- for name or IP address conversion

package body Terminal_To_Transport is

   use Ada.Streams;
   use Ada.Characters.Handling;
   use User_Data;


   function There_Is_Terminal_Input (
         VT : in    Virtual_Terminal)
      return Boolean
   is
   begin
      return Telnet_Terminal.There_Is_Terminal_Input (VT);
   end There_Is_Terminal_Input;


   procedure Get_Terminal_Input (
         VT               : in out Virtual_Terminal;
         Char             :    out Eight_Bits)
   is
   begin
      Telnet_Terminal.Get_Terminal_Input (VT, Char);
   end Get_Terminal_Input;


   procedure Write_To_Terminal (
         VT  : in out Virtual_Terminal;
         Str : in     String)
   is
   begin
      for i in Str'Range loop
         Telnet_Terminal.Output_To_Terminal (VT, Character'Pos (Str(i)));
      end loop;
         Telnet_Terminal.Output_To_Terminal (VT, CR);
         Telnet_Terminal.Output_To_Terminal (VT, LF);
   end Write_To_Terminal;


   procedure Process_Standard_Control_Function (
         VT   : in out Virtual_Terminal;
         Char : in     Eight_Bits)
   is
      Ucb : User_Control_Block := Get_Ucb (VT);

   begin
      case Char is -- page 14 of RFC 854
         when T_EOR | T_NOP .. T_GA => -- EOR, NOP, DM, BRK, IP, AO, AYT, EC, EL, GA,
            -- put in data buffer or command buffer baised on command state
            if not Ucb.Partial_Command then
               Put_Character_In_Data_Buffer (VT, T_IAC);
               Put_Character_In_Data_Buffer (VT, Char);
            else
               -- partial command (EC, EL handled locally, rest==>"bad")
               Process_Partial_Command (VT, Char);
            end if; -- not a partial command
         when others =>
            null; -- TBD  error condition
      end case;
   exception
      when E : others =>
         Debug_Io.Put_Exception ("PROCESS_STANDARD_CONTROL_FUNCTION", E);
         raise;
   end Process_Standard_Control_Function;


   procedure Process_Partial_Command (
         VT   : in out Virtual_Terminal;
         Char : in     Eight_Bits)
   is
      -- *********************  BODY SPECIFICATION  ****************************
      --
      -- This procedure will process the character as part of a partial command
      --
      -- Processing sequence...
      --
      -- If the character is not an end-of-line, add the character to the
      -- partial command buffer.  If the character is an end-of-line, the
      -- command will be parsed for semantics and the appropriate call will
      -- be made to the presentation level which will convert the desired
      -- action into the syntax of a call to the actual transport level.
      -- Whether or not the complete command was entered properly, the command
      -- state will be set to no-partial-command.

      Ucb : User_Control_Block := Get_UCB (VT);

      procedure Add_Char_To_Command_Buffer (
            Ucb  : in out User_Control_Block;
            Char : in     Eight_Bits)
      is
         -- ***************************  SPECIFICATION  ****************************
         --
         -- This procedure will place a character into the partial command buffer.
         -- If the character is an erase character or erase line then remove
         -- one or all of the characters. Also process DEL and BS.
         ---------------------------------------------------------------------------

         Command_Buffer : Buffer_Area;
         Size           : Buffer_Index := 0;

      begin
         case Char is -- page 14 of RFC 854
            when T_EC | T_EL => -- EC, EL
               if not Ucb.Partial_Command_Data.Empty then
                  Ucb.Partial_Command_Data.Get_First (Command_Buffer, Size);
                  if Char = T_EC then -- EC
                     -- put all but one back into the buffer
                     for Index in Buffer_Area'First .. Buffer_Area'First + Size - 2 loop
                        Ucb.Partial_Command_Data.Put_Last (Command_Buffer (Index));
                     end loop;
                     -- show character was deleted on nvt printer
                     -- could be more eligant later on
                     Telnet_Terminal.Output_To_Terminal (VT, Character'Pos('/'));
                     Telnet_Terminal.Output_To_Terminal (VT, Command_Buffer (Size - 1));
                     Telnet_Terminal.Output_To_Terminal (VT, Character'Pos('/'));
                     Size := Size - 1;
                  else -- EL
                     -- show line was deleted on nvt printer
                     -- could be more eligant later on
                     Telnet_Terminal.Output_To_Terminal (VT, Character'Pos('/'));
                     Telnet_Terminal.Output_To_Terminal (VT, Character'Pos('E'));
                     Telnet_Terminal.Output_To_Terminal (VT, Character'Pos('L'));
                     Telnet_Terminal.Output_To_Terminal (VT, Character'Pos('/'));
                     Telnet_Terminal.Output_To_Terminal (VT, CR);
                     Telnet_Terminal.Output_To_Terminal (VT, LF);
                     Size := 0;
                  end if;
                  -- Following lines removed => stay at command level
                  -- if Size = 0 then
                  --    Ucb.Partial_Command := False;
                  -- end if;
               end if;
            when T_EOR | T_NOP | T_DM | T_BRK | T_IP | T_AO | T_AYT | T_GA =>
               -- not EC or EL control function ==> not allowed in command string
               Ucb.Partial_Command := False;

               Telnet_Terminal.Output_To_Terminal (VT, Character'Pos('B'));
               Telnet_Terminal.Output_To_Terminal (VT, Character'Pos('A'));
               Telnet_Terminal.Output_To_Terminal (VT, Character'Pos('D'));
               Telnet_Terminal.Output_To_Terminal (VT, BELL);
               Telnet_Terminal.Output_To_Terminal (VT, CR);
               Telnet_Terminal.Output_To_Terminal (VT, LF);
            when BS | DEL =>
               if not Ucb.Partial_Command_Data.Empty then
                  Ucb.Partial_Command_Data.Get_First (Command_Buffer, Size);
                  -- put all but one back into the buffer
                  for Index in Buffer_Area'First .. Buffer_Area'First + Size - 2 loop
                     Ucb.Partial_Command_Data.Put_Last (Command_Buffer (Index));
                  end loop;
                  Size := Size - 1;
                  -- Following lines removed => stay at command level
                  -- if Size = 0 then
                  --    Ucb.Partial_Command := False;
                  -- end if;
                  if Char = DEL then
                     Telnet_Terminal.Output_To_Terminal (VT, BS);
                  end if;
                  Telnet_Terminal.Output_To_Terminal (VT, Character'Pos (' '));
                  Telnet_Terminal.Output_To_Terminal (VT, BS);
               else
                  -- nothing in buffer
                  Telnet_Terminal.Output_To_Terminal (VT, BELL);
                  if Char = BS then
                     Telnet_Terminal.Output_To_Terminal (VT, Character'Pos ('>'));
                  end if;
               end if;
            when others =>
               Ucb.Partial_Command_Data.Put_Last (Char);
         end case;
      exception
         when E : others =>
            Debug_Io.Put_Exception ("ADD_TO_PARTIAL_COMMAND_BUFFER", E);
            raise;
      end Add_Char_To_Command_Buffer;


      procedure Process_Command_Buffer (
         VT  : in out Virtual_Terminal)
      is
         ----------------------------------------------------------------------
         -- **********************  USER SPECIFICATION  ****************************
         --
         -- This procedure will examine the command buffer and make the proper
         -- PPL procedure call to carry out that command action.
         ---------------------------------------------------------------------------
         type Command_Type is
               (Open_Command,
                Help_Command,
                Close_Command,
                Reset_Command,
                Reset_Options_Command,
                Negotiate_Options_Command,
                Echo_Local_Command,
                Echo_Remote_Command,
                Binary_Local_Command,
                Binary_Remote_Command,
                Suppress_Ga_Local_Command,
                Suppress_Ga_Remote_Command,
                Send_Abort_Output_Command,
                Send_Are_You_There_Command,
                Send_Break_Command,
                Send_Erase_Character_Command,
                Send_Erase_Line_Command,
                Send_Interrupt_Process_Command,
                Send_Sync_Command,
                Send_Escape_Command,
                Send_End_Record_Command,
                Send_Status_Request_Command,
                Send_Status_Update_Command,
                Quit_Echo_Local_Command,
                Quit_Echo_Remote_Command,
                Quit_Suppress_Ga_Local_Command,
                Quit_Suppress_Ga_Remote_Command,
                Quit_Binary_Local_Command,
                Quit_Binary_Remote_Command,
                Translate_CR_Output_Command,
                Translate_CR_Input_Command,
                Quit_Translate_CR_Output_Command,
                Quit_Translate_CR_Input_Command,
                Bad_Command,
                Null_Command);

         Ucb             : User_Control_Block := Get_UCB (VT);
         Command_Bytes   : Buffer_Area;
         Command_Size    : Buffer_Index := 0;
         Command_String  : String (1 .. MAXIMUM_BUFFER_SIZE);
         Command_Length  : Natural;
         Open_Address    : Address_Type := No_Address;
         Successful      : Boolean;
         Type_Of_Command : Command_Type;

         procedure Determine_Command_Type (
               Command_String  : in out String;
               Command_Length  : in out Natural;
               Type_Of_Command :    out Command_Type)
         is
            -- *************************  SPECIFICATION  ****************************
            --
            -- This procedure will examine the command string and determine type
            -- of command.  In the case of an 'open' command, the parameters
            -- will be set to the correct values.
            -------------------------------------------------------------------------

            procedure Strip_Off_Extra_Characters (
                  Str : in out String;
                  Len : in out Natural)
            is
               -- *************************  SPECIFICATION  **************************
               --
               -- This procedure returns a string in which the first four characters
               -- are comprised of the first character of each word in the command.
               -- If less than three words are in the command the missing word's
               -- position (s) are padded with blanks.  If the command was an OPEN,
               -- the remainder of the string is the OPEN address.
               -----------------------------------------------------------------------

               Kept_Pos      : Natural := 1; -- see below
               Kept_Buffer   : String (1 .. Len + 3);  -- allow for padding
               Store_Char    : Boolean := False;
               Adr_Start_Pos : Natural;
            begin -- strip off extra characters
               Debug_Io.Put ("in strip off extra characters, item = ");
               Debug_Io.Put_Line (Str (Str'First .. Str'First + Len - 1));
               Debug_Io.Put ("length = ");
               Debug_Io.Put_Line (Len);
               if To_Upper (Str (Str'First)) = 'O' then
                  -- open (has parameters)
                  Debug_Io.Put_Line ("open detected");
                  Kept_Buffer (1 .. 4) :="O   "; -- pad
                  Kept_Pos := 4;
                  Adr_Start_Pos := len + 1;
                  for Index in 2 .. Len loop
                     -- skip any extra letters
                     if Str (Index) = ' ' then
                        -- end of "open", start of address
                        Adr_Start_Pos := Index + 1;
                        exit; -- skip any extra characters loop
                     end if;
                  end loop;
                  if Adr_Start_Pos <= Len then
                     for Index in Adr_Start_Pos .. Len loop
                        -- copy address
                        Kept_Pos := Kept_Pos + 1;
                        Kept_Buffer (Kept_Pos) := Str (Index);
                     end loop;
                  end if;
                  Len := Kept_Pos;
                  Debug_Io.Put_Line ("open processed");
               else -- (no parameters)
                  Debug_Io.Put_Line ("non-open detected");
                  Kept_Buffer (1) := To_Upper (Str (Str'First));
                  for Str_Pos in 2 .. Len loop
                     Debug_Io.Put ("item_pos = ");
                     Debug_Io.Put (Str_Pos);
                     Debug_Io.Put (" item (item_pos) = ");
                     Debug_Io.Put_Line (Str (Str_Pos));
                     if Str (Str_Pos) = ' ' then -- delimiter
                        Store_Char := True;
                     else -- non blank
                        if Store_Char then
                           Kept_Pos := Kept_Pos + 1;
                           Kept_Buffer (Kept_Pos) := To_Upper (Str (Str_Pos));
                           Store_Char := False;
                        end if; -- store char?
                     end if; -- blank character?
                  end loop; -- examine all positions
                  for Pad_Pos in Kept_Pos + 1 .. 4 loop -- pad with blanks
                     Kept_Pos := Kept_Pos + 1;
                     Kept_Buffer (Pad_Pos) := ' ';
                  end loop;
                  Len := 0; -- no params
               end if; -- item (1) = 'O'?
               Str (Str'First .. Str'First + Kept_Pos - 1) := Kept_Buffer (1 .. Kept_Pos);
               Debug_Io.Put ("leaving strip off extra characters, item = ");
               Debug_Io.Put_Line (Str (Str'First .. Str'First + Kept_Pos - 1));
               Debug_Io.Put ("length = ");
               Debug_Io.Put_Line (Len);
            exception
               when E : others =>
                  Debug_Io.Put_Exception ("STRIP_OFF_EXTRA_CHARACTERS", E);
                  raise;
            end Strip_Off_Extra_Characters;

            function Valid_Open_Parameters
                  return Boolean
            is
               Ok : Boolean;

               procedure Strip_Command_To_Address (
                     Str : in out String;
                     Len : in out Natural)
               is
                  -- this procedure strips the leading 'O' and blanks from the
                  -- command string
                  Out_Str : String (1 .. MAXIMUM_BUFFER_SIZE);
                  Out_Pos : Natural := 0;
               begin
                  Debug_Io.Put_Line ("in strip_command_to_address");
                  Debug_Io.Put ("length = ");
                  Debug_Io.Put_Line (Len);
                  for Str_Pos in 2 .. Natural'Min (Len, MAXIMUM_BUFFER_SIZE) loop
                     if Str (Str_Pos) /= ' ' then
                        Out_Pos := Out_Pos + 1;
                        Out_Str (Out_Pos) := Str (Str_Pos);
                     end if;
                  end loop;
                  Str (Str'First .. Str'First + Out_Pos - 1) := Out_Str (1 .. Out_Pos);
                  Debug_Io.Put ("address = ");
                  Debug_Io.Put_Line (Str (Str'First .. Str'First + Out_Pos - 1));
                  Len := Out_Pos;
                  Debug_Io.Put ("length = ");
                  Debug_Io.Put_Line (Len);
                  Debug_Io.Put_Line ("end strip_command_to_adress");
               exception
                  when E : others =>
                     Debug_Io.Put_Exception ("STRIP_COMMAND_TO_ADDRESS", E);
                     raise;
               end Strip_Command_To_Address;

            begin -- process_open_command_parameters
               Debug_Io.Put_Line ("in process_open_parameters");
               Strip_Command_To_Address (Command_String, Command_Length);
               Debug_Io.Put ("address = ");
               Debug_Io.Put_Line (Command_String (Command_String'First .. Command_String'First + Command_Length - 1));
               Debug_Io.Put ("length = ");
               Debug_Io.Put_Line (Command_Length);
               if Command_Length = 0 then
                  if Ucb.Host_Name.Size > 0 then
                     -- use defaults
                     Command_Length := Ucb.Host_Name.Size;
                     Debug_Io.Put ("default address = ");
                     Debug_Io.Put_Line (Ucb.Host_Name.Name (1 .. Command_Length));
                     Debug_Io.Put ("default address length = ");
                     Debug_Io.Put_Line (Command_Length);
                     Command_String (Command_String'First .. Command_String'First + Command_Length - 1) := Ucb.Host_Name.Name (1 .. Command_Length);
                  else
                     Write_To_Terminal (VT, "There is no default host - command ignored");
                     Ok := False;
                  end if;
               end if;
               if Command_Length /= 0 then
                  begin
                     -- see if it is a raw IP address
                     Open_Address.Addr := Sockets.Inet_Addr (Command_String (Command_String'First .. Command_String'First + Command_Length - 1));
                     Ok := True;
                  exception
                     when others =>
                        Ok := False;
                  end;
                  if not Ok then
                     -- else look it up by name
                     begin
                        Open_Address.Addr := Sockets.Addresses (
                           Sockets.Get_Host_By_Name (Command_String (Command_String'First .. Command_String'First + Command_Length - 1)));
                        Ok := True;
                     exception
                        when others =>
                           Ok := False;
                     end;
                  end if;
                  if Ok then
                     Open_Address.Port := Ucb.Port;
                     Debug_Io.Put_Line ("open address = " & Sockets.Image (Open_Address));
                  else
                     Write_To_Terminal (VT, "Unknown host - command ignored");
                  end if;
                  Debug_Io.Put_Line ("end process_open_parameters");
               end if;
               return Ok;
            exception
               when E : others =>
                  Debug_Io.Put_Exception ("PROCESS_OPEN_PARAMETERS", E);
                  raise;
            end Valid_Open_Parameters;


         begin -- determine command type
            Debug_Io.Put_Line ("in determine command type");
            Debug_Io.Put ("command string = ");
            Debug_Io.Put_Line (Command_String (Command_String'First .. Command_String'First + Command_Length - 1));
            Debug_Io.Put ("length = ");
            Debug_Io.Put_Line (Command_Length);
            Strip_Off_Extra_Characters (Command_String, Command_Length);
            if Command_String (Command_String'First .. Command_String'First + 3) = "O   " then
               if Valid_Open_Parameters then
                  Type_Of_Command := Open_Command;
               else
                  Type_Of_Command := Null_Command;
               end if;
            elsif Command_String (Command_String'First .. Command_String'First + 3) = "?   " then
               Type_Of_Command := Help_Command;
            elsif Command_String (Command_String'First .. Command_String'First + 3) = "H   " then
               Type_Of_Command := Help_Command;
            elsif Command_String (Command_String'First .. Command_String'First + 3) = "C   " then
               Type_Of_Command := Close_Command;
            elsif Command_String (Command_String'First .. Command_String'First + 3) = "R   " then
               Type_Of_Command := Reset_Command;
            elsif Command_String (Command_String'First .. Command_String'First + 3) = "RO  " then
               Type_Of_Command := Reset_Options_Command;
            elsif Command_String (Command_String'First .. Command_String'First + 3) = "NO  " then
               Type_Of_Command := Negotiate_Options_Command;
            elsif Command_String (Command_String'First .. Command_String'First + 3) = "SSR " then
               Type_Of_Command := Send_Status_Request_Command;
            elsif Command_String (Command_String'First .. Command_String'First + 3) = "SER " then
               Type_Of_Command := Send_End_Record_Command;
            elsif Command_String (Command_String'First .. Command_String'First + 3) = "SSU " then
               Type_Of_Command := Send_Status_Update_Command;
            elsif Command_String (Command_String'First .. Command_String'First + 3) = "E   " then
               Type_Of_Command := Echo_Local_Command;
            elsif Command_String (Command_String'First .. Command_String'First + 3) = "EL  " then
               Type_Of_Command := Echo_Local_Command;
            elsif Command_String (Command_String'First .. Command_String'First + 3) = "ER  " then
               Type_Of_Command := Echo_Remote_Command;
            elsif Command_String (Command_String'First .. Command_String'First + 3) = "QE  " then
               Type_Of_Command := Quit_Echo_Local_Command;
            elsif Command_String (Command_String'First .. Command_String'First + 3) = "QEL " then
               Type_Of_Command := Quit_Echo_Local_Command;
            elsif Command_String (Command_String'First .. Command_String'First + 3) = "QER " then
               Type_Of_Command := Quit_Echo_Remote_Command;
            elsif Command_String (Command_String'First .. Command_String'First + 3) = "B   " then
               Type_Of_Command := Binary_Local_Command;
            elsif Command_String (Command_String'First .. Command_String'First + 3) = "BL  " then
               Type_Of_Command := Binary_Local_Command;
            elsif Command_String (Command_String'First .. Command_String'First + 3) = "BR  " then
               Type_Of_Command := Binary_Remote_Command;
            elsif Command_String (Command_String'First .. Command_String'First + 3) = "QB  " then
               Type_Of_Command := Quit_Binary_Local_Command;
            elsif Command_String (Command_String'First .. Command_String'First + 3) = "QBL " then
               Type_Of_Command := Quit_Binary_Local_Command;
            elsif Command_String (Command_String'First .. Command_String'First + 3) = "QBR " then
               Type_Of_Command := Quit_Binary_Remote_Command;
            elsif Command_String (Command_String'First .. Command_String'First + 3) = "SG  " then
               Type_Of_Command := Suppress_Ga_Local_Command;
            elsif Command_String (Command_String'First .. Command_String'First + 3) = "SGL " then
               Type_Of_Command := Suppress_Ga_Local_Command;
            elsif Command_String (Command_String'First .. Command_String'First + 3) = "SGR " then
               Type_Of_Command := Suppress_Ga_Remote_Command;
            elsif Command_String (Command_String'First .. Command_String'First + 3) = "QSG " then
               Type_Of_Command := Quit_Suppress_Ga_Local_Command;
            elsif Command_String (Command_String'First .. Command_String'First + 3) = "QSGL" then
               Type_Of_Command := Quit_Suppress_Ga_Local_Command;
            elsif Command_String (Command_String'First .. Command_String'First + 3) = "QSGR" then
               Type_Of_Command := Quit_Suppress_Ga_Remote_Command;
            elsif Command_String (Command_String'First .. Command_String'First + 3) = "SAO " then
               Type_Of_Command := Send_Abort_Output_Command;
            elsif Command_String (Command_String'First .. Command_String'First + 3) = "SAYT" then
               Type_Of_Command := Send_Are_You_There_Command;
            elsif Command_String (Command_String'First .. Command_String'First + 3) = "SB  " then
               Type_Of_Command := Send_Break_Command;
            elsif Command_String (Command_String'First .. Command_String'First + 3) = "SE  " then
               Type_Of_Command := Send_Escape_Command;
            elsif Command_String (Command_String'First .. Command_String'First + 3) = "SEC " then
               Type_Of_Command := Send_Erase_Character_Command;
            elsif Command_String (Command_String'First .. Command_String'First + 3) = "SEL " then
               Type_Of_Command := Send_Erase_Line_Command;
            elsif Command_String (Command_String'First .. Command_String'First + 3) = "SIP " then
               Type_Of_Command := Send_Interrupt_Process_Command;
            elsif Command_String (Command_String'First .. Command_String'First + 3) = "SS  " then
               Type_Of_Command := Send_Sync_Command;
            elsif Command_String (Command_String'First .. Command_String'First + 3) = "TC  " then
               Type_Of_Command := Translate_CR_Output_Command;
            elsif Command_String (Command_String'First .. Command_String'First + 3) = "TCO " then
               Type_Of_Command := Translate_CR_Output_Command;
            elsif Command_String (Command_String'First .. Command_String'First + 3) = "TCI " then
               Type_Of_Command := Translate_CR_Input_Command;
            elsif Command_String (Command_String'First .. Command_String'First + 3) = "QTC " then
               Type_Of_Command := Quit_Translate_CR_Output_Command;
            elsif Command_String (Command_String'First .. Command_String'First + 3) = "QTCO" then
               Type_Of_Command := Quit_Translate_CR_Output_Command;
            elsif Command_String (Command_String'First .. Command_String'First + 3) = "QTCI" then
               Type_Of_Command := Quit_Translate_CR_Input_Command;
            else
               Type_Of_Command := Bad_Command;
            end if;
            Debug_Io.Put_Line ("end determine command type");
         exception
            when E : others =>
               Debug_Io.Put_Exception ("DETERMINE_COMMAND_TYPE", E);
               raise;
         end Determine_Command_Type;


         procedure Convert_To_String (
               Bytes : in     Buffer_Area;
               Size  : in     Buffer_Index;
               Str   :    out String;
               Len   :    out Natural;
               Ok    :    out Boolean)
         is
            Index    : Buffer_Index := Buffer_Area'First;
            StrIndex : Natural      := Str'First;
         begin
            if Size > 0 then
               Ok := True;
               while Index <= Buffer_Area'First + Size - 1 and  StrIndex <= Str'Last loop
                  if Bytes (Index) > 16#7F# then -- error
                     Ok := False;
                     exit;
                  end if;
                  Str (StrIndex) := Character'Val (Bytes (Index));
                  Index    := Index + 1;
                  StrIndex := StrIndex + 1;
               end loop;
            else
               Ok := False;
            end if;
            Len := Natural (Size);
         end Convert_To_String;

      begin -- process_command_buffer
         Debug_Io.Put_Line ("begin process_command_buffer");
         Ucb.Partial_Command_Data.Get_First (Command_Bytes, Command_Size);
         Convert_To_String (Command_Bytes, Command_Size, Command_String, Command_Length, Successful);
         if Successful then
            Debug_Io.Put_Line ("parse_for_semantics");
            Debug_Io.Put ("command string = ");
            Debug_Io.Put_Line (Command_String (1 .. Command_Length));
            Debug_Io.Put ("Length = ");
            Debug_Io.Put_Line (Command_Length);
            Determine_Command_Type (Command_String, Command_Length, Type_Of_Command);
         else
            Type_Of_Command := Bad_Command;
         end if;

         case Type_Of_Command is

            -- transport level commands
            when Open_Command =>
               Debug_Io.Put_Line ("Making virtual open call");
               declare
                  Virtual_Open : Virtual_Transport.Virtual_Service_Type (Virtual_Transport.Virtual_Open);
               begin
                  Virtual_Open.Address := Open_Address;
                  Virtual_Transport.Virtual_Service_Call (Ucb, Virtual_Open);
               end;

            when Help_Command =>
               Debug_Io.Put_Line ("Help");
               Write_To_Terminal (VT, "");
               Write_To_Terminal (VT, "Valid Telnet commands:");
               Write_To_Terminal (VT, "   Open [ Host_name | Host_ip_address ]");
               Write_To_Terminal (VT, "   Close");
               Write_To_Terminal (VT, "   Reset");
               Write_To_Terminal (VT, "   Negotiate Options");
               Write_To_Terminal (VT, "   Reset Options");
               Write_To_Terminal (VT, "   [ Quit ] Echo [ Local | Remote ]");
               Write_To_Terminal (VT, "   [ Quit ] Binary [ Local | Remote ]");
               Write_To_Terminal (VT, "   [ Quit ] Suppress Goahead [ Local | Remote ]");
               Write_To_Terminal (VT, "   [ Quit ] Translate CR [ Input | Output ]");
               Write_To_Terminal (VT, "   Send End Record");
               Write_To_Terminal (VT, "   Send Status Request");
               Write_To_Terminal (VT, "   Send Status Update");
               Write_To_Terminal (VT, "   Send Abort Output");
               Write_To_Terminal (VT, "   Send Are You There");
               Write_To_Terminal (VT, "   Send Break");
               Write_To_Terminal (VT, "   Send Escape");
               Write_To_Terminal (VT, "   Send Erase Character");
               Write_To_Terminal (VT, "   Send Erase Line");
               Write_To_Terminal (VT, "   Send Interrupt Process");
               Write_To_Terminal (VT, "   Send Synch");
               Write_To_Terminal (VT, "");

            when Close_Command =>
               Debug_Io.Put_Line ("Making virutal close call");
               declare
                  Virtual_Close : Virtual_Transport.Virtual_Service_Type (Virtual_Transport.Virtual_Close);
               begin
                  Virtual_Transport.Virtual_Service_Call (Ucb, Virtual_Close);
               end;

            when Reset_Command =>
               Debug_Io.Put_Line ("Making virtual reset call");
               declare
                  Virtual_Abort : Virtual_Transport.Virtual_Service_Type (Virtual_Transport.Virtual_Abort);
               begin
                  Virtual_Transport.Virtual_Service_Call (Ucb, Virtual_Abort);
               end;

            when Negotiate_Options_Command =>
               Debug_Io.Put_Line ("Making negotiate options call");
               Option_Negotiation.Negotiate_Desired_Options (VT);

            when Reset_Options_Command =>
               Debug_Io.Put_Line ("Making reset options call");
               Option_Negotiation.Reset_All_Options (VT);

            -- TELNET commands
            when Send_Status_Update_Command =>
               Option_Negotiation.Send_Status (VT);

            when Send_Status_Request_Command =>
               Command_Bytes (Buffer_Area'First + 0) := T_IAC;
               Command_Bytes (Buffer_Area'First + 1) := T_SB;
               Command_Bytes (Buffer_Area'First + 2) := Telnet_Options.Code (Telnet_Options.Status);
               Command_Bytes (Buffer_Area'First + 3) := 1;
               Command_Bytes (Buffer_Area'First + 4) := T_IAC;
               Command_Bytes (Buffer_Area'First + 5) := T_SE;
               Virtual_Transport.Send_Data (Ucb, Command_Bytes, 6, Urgent => False);

            when Echo_Local_Command =>
               Option_Negotiation.Request_Local_Option_Enable (VT, Telnet_Options.Echo);

            when Echo_Remote_Command =>
               Option_Negotiation.Request_Remote_Option_Enable (VT, Telnet_Options.Echo);

            when Quit_Echo_Local_Command =>
               Option_Negotiation.Demand_Local_Option_Disable (VT, Telnet_Options.Echo);

            when Quit_Echo_Remote_Command =>
               Option_Negotiation.Demand_Remote_Option_Disable (VT, Telnet_Options.Echo);

            when Binary_Local_Command =>
               Option_Negotiation.Request_Local_Option_Enable (VT, Telnet_Options.Binary_Transmission);

            when Binary_Remote_Command =>
               Option_Negotiation.Request_Remote_Option_Enable (VT, Telnet_Options.Binary_Transmission);

            when Quit_Binary_Local_Command =>
               Option_Negotiation.Demand_Local_Option_Disable (VT, Telnet_Options.Binary_Transmission);

            when Quit_Binary_Remote_Command =>
               Option_Negotiation.Demand_Remote_Option_Disable (VT, Telnet_Options.Binary_Transmission);

            when Suppress_Ga_Local_Command =>
               Option_Negotiation.Request_Local_Option_Enable (VT, Telnet_Options.Suppress_Go_Ahead);

            when Suppress_Ga_Remote_Command =>
               Option_Negotiation.Request_Remote_Option_Enable (VT, Telnet_Options.Suppress_Go_Ahead);

            when Quit_Suppress_Ga_Local_Command =>
               Option_Negotiation.Demand_Local_Option_Disable (VT, Telnet_Options.Suppress_Go_Ahead);

            when Quit_Suppress_Ga_Remote_Command =>
               Option_Negotiation.Demand_Remote_Option_Disable (VT, Telnet_Options.Suppress_Go_Ahead);

            when Send_Abort_Output_Command =>
               Command_Bytes (Buffer_Area'First + 0) := T_IAC; -- page 14 of RFC 854
               Command_Bytes (Buffer_Area'First + 1) := T_AO;
               Virtual_Transport.Send_Data (Ucb, Command_Bytes, 2, Urgent => False);

            when Send_Are_You_There_Command =>
               Command_Bytes (Buffer_Area'First + 0) := T_IAC; -- page 14 of RFC 854
               Command_Bytes (Buffer_Area'First + 1) := T_AYT;
               Virtual_Transport.Send_Data (Ucb, Command_Bytes, 2, Urgent => False);

            when Send_Break_Command =>
               Command_Bytes (Buffer_Area'First + 0) := T_IAC; -- page 14 of RFC 854
               Command_Bytes (Buffer_Area'First + 1) := T_BRK;
               Virtual_Transport.Send_Data (Ucb, Command_Bytes, 2, Urgent => False);

            when Send_Escape_Command =>
               Command_Bytes (Buffer_Area'First + 0) := Ucb.Escape_Char;
               Virtual_Transport.Send_Data (Ucb, Command_Bytes, 1, Urgent => False);

            when Send_Erase_Character_Command =>
               Command_Bytes (Buffer_Area'First + 0) := T_IAC; -- page 14 of RFC 854
               Command_Bytes (Buffer_Area'First + 1) := T_EC;
               Virtual_Transport.Send_Data (Ucb, Command_Bytes, 2, Urgent => False);

            when Send_Erase_Line_Command =>
               Command_Bytes (Buffer_Area'First + 0) := T_IAC; -- page 14 of RFC 854
               Command_Bytes (Buffer_Area'First + 1) := T_EL;
               Virtual_Transport.Send_Data (Ucb, Command_Bytes, 2, Urgent => False);

            when Send_End_Record_Command =>
               Command_Bytes (Buffer_Area'First + 0) := T_IAC; -- page 14 of RFC 854
               Command_Bytes (Buffer_Area'First + 1) := T_EOR;
               Virtual_Transport.Send_Data (Ucb, Command_Bytes, 2, Urgent => False);

            when Send_Interrupt_Process_Command =>
               Command_Bytes (Buffer_Area'First + 0) := T_IAC; -- page 14 of RFC 854
               Command_Bytes (Buffer_Area'First + 1) := T_IP;
               Virtual_Transport.Send_Data (Ucb, Command_Bytes, 2, Urgent => False);

            when Send_Sync_Command =>
               -- RJH : Have to use two sends, or IAC does not get marked as Urgent (on Windows)
               Command_Bytes (Buffer_Area'First + 0) := T_IAC; -- page 14 of RFC 854
               Virtual_Transport.Send_Data (Ucb, Command_Bytes, 1, Urgent => True);
               Command_Bytes (Buffer_Area'First + 0) := T_DM;
               -- Data Mark must be accompanied by a TCP urgent notification
               Virtual_Transport.Send_Data (Ucb, Command_Bytes, 1, Urgent => True);

            when Translate_CR_Output_Command =>
               Ucb.CR_To_CRLF_On_Output := True;

            when Translate_CR_Input_Command =>
               Ucb.CR_To_CRLF_On_Input := True;

            when Quit_Translate_CR_Output_Command =>
               Ucb.CR_To_CRLF_On_Output := False;

            when Quit_Translate_CR_Input_Command =>
               Ucb.CR_To_CRLF_On_Input := False;

            when Bad_Command =>
               Write_To_Terminal (VT, "Unrecognized telnet command");

            when Null_Command =>
               null;

         end case;

         Debug_Io.Put_Line ("end process_command_buffer");
      exception
         when E : others =>
            Debug_Io.Put_Exception ("PROCESS_COMMAND_BUFFER", E);
            raise;
      end Process_Command_Buffer;

   begin -- process partial command
      if Char /= CR then
         Add_Char_To_Command_Buffer (Ucb, Char);
      else
         Telnet_Terminal.Output_To_Terminal (VT, LF); -- RJH added this
         Process_Command_Buffer (VT);
         Ucb.Partial_Command := False;
      end if; -- end of line?
   exception
      when E : others =>
         Debug_Io.Put_Exception ("PROCESS_PARTIAL_COMMAND", E);
         raise;
   end Process_Partial_Command;


   procedure Put_Character_In_Data_Buffer (
         VT   : in out Virtual_Terminal;
         Char : in     Eight_Bits)
   is
      Ucb : User_Control_Block := Get_UCB (VT);
   begin
      if not Ucb.Terminal_Data.Full then
         Ucb.Terminal_Data.Put_Last (Char);
      else -- error
         null; -- TBD (just "lose" it for now)
      end if;
   exception
      when E : others =>
         Debug_Io.Put_Exception ("PUT_CHARACTER_IN_DATA_BUFFER", E);
         raise;
   end Put_Character_In_Data_Buffer;


   procedure Send_Data_Buffer (
         VT   : in out Virtual_Terminal)
   is
      Ucb  : User_Control_Block := Get_UCB (VT);
      Data : Buffer_Area;
      Size : Buffer_Index := 0;
   begin
      Ucb.Ga_Received := False;
      Ucb.Terminal_Data.Get_First (Data, Size);
      Virtual_Transport.Send_Data (Ucb, Data, Size, Urgent => False);
   exception
      when E : others =>
         Debug_Io.Put_Exception ("SEND_DATA_BUFFER", E);
         raise;
   end Send_Data_Buffer;


   procedure Send_Data (
         VT     : in out Virtual_Terminal;
         Data   : in     Buffer_Area;
         Size   : in     Buffer_Index;
         Urgent : in     Boolean)
   is
      Ucb  : User_Control_Block := Get_UCB (VT);
   begin
      Virtual_Transport.Send_Data (Ucb, Data, Size, Urgent);
   exception
      when E : others =>
         Debug_Io.Put_Exception ("SEND_DATA", E);
         raise;
   end Send_Data;


end Terminal_To_Transport;
