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
with Text_Io;
with Debug_Io;
with Buffer_Data;
with Actual_Transport;
with Sockets; -- only for debug printing of address
with Telnet_Options;

package body Virtual_Transport is

   use Ada.Streams;
   use Buffer_Data;
   use Actual_Transport;
   use Telnet_Options;


   procedure Do_Passive_Open (
         Ucb : in out User_Control_Block)
   is
      Open_Parameters : Open_Params;
      Transport_Msg   : Transport_Message;
      Passive_Addr    : Address_Type := No_Address;
   begin
      Debug_Io.Put_Line ("in passive open routine");
      if not Ucb.Connected then
         Debug_Io.Put_Line ("will attempt passive open");
         Passive_Addr.Port := Ucb.Port;
         User_Data.Initialize (Ucb); -- reset to initial values
         Open_Parameters := (
            Address     => Passive_Addr,        -- will use local host, specified port
            Active      => False,               -- must be False for Passive Open
            Buffer_Size => MAXIMUM_BUFFER_SIZE, -- should be MAXIMUM_BUFFER_SIZE
            Timeout     => 255);                -- arbitrary (not currently used)
         Transport_Msg := (Transport_Open, Open_Parameters);
         if Stopped (Ucb.Transport) then
            Start (Ucb.Transport, Ucb.Signal'access);
         end if;
         Send_Transport_Message (Ucb.Transport, Transport_Msg);
         Ucb.Active := False;
      else
         Debug_Io.Put_Line ("connection already open");
      end if;
      Debug_Io.Put_Line ("end passive open");
   end Do_Passive_Open;


   function There_Is_Normal_Transport_Input (
         Ucb : in     User_Control_Block)
      return Boolean
   is
   begin
      return Normal_Message_Available (Ucb.Transport);
   end There_Is_Normal_Transport_Input;


   function There_Is_Urgent_Transport_Input (
         Ucb : in     User_Control_Block)
      return Boolean
   is
   begin
      return Urgent_Message_Available (Ucb.Transport);
   end There_Is_Urgent_Transport_Input;


   function There_Is_Any_Transport_Input (
         Ucb : in     User_Control_Block)
      return Boolean
   is
   begin
      return  There_Is_Urgent_Transport_Input (Ucb)
      or else There_Is_Normal_Transport_Input (Ucb);
   end There_Is_Any_Transport_Input;


   procedure Store_Message (
         Ucb     : in out User_Control_Block;
         Message : in     String)
   is
   begin
      if Ucb.Transport_Data.Messages.Space >= Message'Length + 2 then
         for i in Message'Range loop
            Ucb.Transport_Data.Messages.Put_Last (Character'Pos (Message (i)));
         end loop;
         Ucb.Transport_Data.Messages.Put_Last (LF);
         Ucb.Transport_Data.Messages.Put_Last (CR);
         Signal (Ucb);
      else
         Debug_Io.Put_Line ("STORE_MESSAGE : no room for message :" & Message);
      end if;
   exception
      when E : others =>
         Debug_Io.Put_Exception ("STORE_MESSAGE", E);
         raise;
   end Store_Message;


   procedure Process_Transport_Input (
         Ucb : in out User_Control_Block)
   is
      User_Msg : User_Message;

   begin
      User_Msg := (Event => No_User_Action);
      Debug_Io.Put_Line ("in process_transport_input");
      if Urgent_Message_Available (Ucb.Transport) then
         Get_Urgent_Message (Ucb.Transport, User_Msg);
      elsif Normal_Message_Available (Ucb.Transport) then
         Get_Normal_Message (Ucb.Transport, User_Msg);
      end if;
      Debug_Io.Put ("msg = ");
      Debug_Io.Put_Line (Sixteen_Bits (User_Action'Pos (User_Msg.Event)));
      case User_Msg.Event is
         when No_User_Action =>
            null;
         when Connection_Closing =>
            -- close sent from remote
            Store_Message (Ucb, "connection closing");
            Ucb.Connected := False;
            declare
               Close : Virtual_Service_Type (Virtual_Close);
            begin
               Virtual_Service_Call (Ucb, Close);
            end;
         when Ok_On_Abort =>
            Store_Message (Ucb, "connection aborted");
            Ucb.Connected := False;
         when Buffer_For_User =>
            declare
               Urgent : Boolean       := User_Msg.Urgent;
               Size   : Buffer_Index  := User_Msg.Data_Buffer.Size;
               Char   : Eight_Bits;
            begin
               if Urgent then
                  Debug_Io.Put_Line ("URGENT data msg");
                  Debug_Io.Put ("size =");
                  Debug_Io.Put_Line (Size);
                  if Size > 0 then
                     if Ucb.Transport_Data.Urgent_Data.Space >= Size then
                        for Index in Buffer_Area'First .. Buffer_Area'First + Size - 1 loop
                           Char := User_Msg.Data_Buffer.Data (Index);
                           if Ucb.Debug = Debug_All then
                              Debug_Io.Put ("rcvd urgent <");
                              Debug_Io.Put (Char);
                              Debug_Io.Put_Line (">");
                           elsif Ucb.Debug = Debug_Data then
                              Text_Io.Put ("rcvd urgent <");
                              Text_Io.Put (Eight_Bits'Image (Char));
                              Text_Io.Put_Line (">");
                           end if;
                           if Ucb.Options.Remote_In_Effect (Binary_Transmission) then
                              -- no end-of-line translation
                              Ucb.Transport_Data.Urgent_Data.Put_Last (Char);
                           else
                              -- if last char was CR, ignore next char if it is not an LF
                              -- (according to the telnet protocol, the next char must be
                              -- either an LF or a NULL). If the next char is NULL, insert
                              -- an LF if indicated by the CR_To_CRLF_On_Input flag.
                              if Ucb.Last_Urgent_Char_Was_CR then
                                 -- EXPECTING A CR TO BE FOLLOWED BY EITHER AN LF OR A NULL
                                 -- CAUSES PROBLEMS WITH IMPROPER TELNET IMPLENETATIONS, SO
                                 -- THIS ...
                                 -- if Char = LF then
                                    -- Ucb.Transport_Data.Urgent_Data.Put_Last (LF);
                                    -- if Ucb.Debug = Debug_All then
                                       -- Debug_Io.Put_Line ("stored as urgent data");
                                    -- end if;
                                 -- elsif Char = 0 and Ucb.CR_To_CRLF_On_Input then
                                    -- Ucb.Transport_Data.Urgent_Data.Put_Last (LF);
                                    -- if Ucb.Debug = Debug_All then
                                       -- Debug_Io.Put (" code = <LF> (inserted)");
                                       -- Debug_Io.Put_Line ("stored as urgent data");
                                    -- end if;
                                 -- end if;
                                 -- ... CHANGED TO THIS ...
                                 if Char = 0 then
                                    -- a CR followed by a NUL
                                    if Ucb.CR_To_CRLF_On_Input then
                                       -- translate CR to CRLF
                                       Ucb.Transport_Data.Urgent_Data.Put_Last (LF);
                                       if Ucb.Debug = Debug_All then
                                          Debug_Io.Put_Line ("rcvd urgent <LF> (inserted)");
                                       elsif Ucb.Debug = Debug_Data then
                                          Text_Io.Put_Line ("rcvd urgent <LF> (inserted)");
                                       end if;
                                    end if;
                                 elsif Char = LF then
                                    -- a CR followed by an LF
                                    Ucb.Transport_Data.Urgent_Data.Put_Last (Char);
                                 else
                                    -- a CR followed by a non-LF
                                    if Ucb.CR_To_CRLF_On_Input then
                                       -- translate CR to CRLF
                                       Ucb.Transport_Data.Urgent_Data.Put_Last (LF);
                                       if Ucb.Debug = Debug_All then
                                          Debug_Io.Put_Line ("rcvd urgent <LF> (inserted)");
                                       elsif Ucb.Debug = Debug_Data then
                                          Text_Io.Put_Line ("rcvd urgent <LF> (inserted)");
                                       end if;
                                    end if;
                                    Ucb.Transport_Data.Urgent_Data.Put_Last (Char);
                                 end if;
                                 -- ... TO HERE
                              else
                                 Ucb.Transport_Data.Urgent_Data.Put_Last (Char);
                              end if;
                              if Char = CR then
                                 Ucb.Last_Urgent_Char_Was_CR := True;
                              else
                                 Ucb.Last_Urgent_Char_Was_CR := False;
                              end if;
                           end if;
                        end loop;
                        Buffer_Manager.Free (User_Msg.Data_Buffer);
                     else
                        Debug_Io.Put_Line ("URGENT data msg cannot be processed yet - ungetting it");
                        Unget_Urgent_Message (Ucb.Transport, User_Msg);
                     end if;
                  end if;
               else
                  Debug_Io.Put_Line ("NORMAL data msg");
                  Debug_Io.Put ("size =");
                  Debug_Io.Put_Line (Size);
                  if Size > 0 then
                     if Ucb.Transport_Data.Normal_Data.Space >= Size then
                        for Index in Buffer_Area'First .. Buffer_Area'First + Size - 1 loop
                           Char := User_Msg.Data_Buffer.Data (Index);
                           if Ucb.Debug = Debug_All then
                              Debug_Io.Put ("rcvd <");
                              Debug_Io.Put (Char);
                              Debug_Io.Put_Line (">");
                           elsif Ucb.Debug = Debug_Data then
                              Text_Io.Put ("rcvd <");
                              Text_Io.Put (Eight_Bits'Image (Char));
                              Text_Io.Put_Line (">");
                           end if;
                           if Ucb.Options.Remote_In_Effect (Binary_Transmission) then
                              -- no end-of-line translation
                              Ucb.Transport_Data.Normal_Data.Put_Last (Char);
                           else
                              -- if last char was CR, ignore next char if it is not an LF
                              -- (according to the telnet protocol, the next char must be
                              -- either an LF or a NULL). If the next char is NULL, insert
                              -- an LF if indicated by the CR_To_CRLF_On_Input flag.
                              if Ucb.Last_Normal_Char_Was_CR then
                                 -- EXPECTING A CR TO BE FOLLOWED BY EITHER AN LF OR A NULL
                                 -- CAUSES PROBLEMS WITH IMPROPER TELNET IMPLENETATIONS, SO
                                 -- THIS ...
                                 -- if Char = LF then
                                    -- Ucb.Transport_Data.Normal_Data.Put_Last (LF);
                                    -- if Ucb.Debug = Debug_All then
                                       -- Debug_Io.Put_Line ("stored as normal data");
                                    -- end if;
                                 -- elsif Char = 0 and Ucb.CR_To_CRLF_On_Input then
                                    -- Ucb.Transport_Data.Normal_Data.Put_Last (LF);
                                    -- if Ucb.Debug = Debug_All then
                                       -- Debug_Io.Put (" code = <LF> (inserted)");
                                       -- Debug_Io.Put_Line ("stored as normal data");
                                    -- end if;
                                 -- end if;
                                 -- ... CHANGED TO THIS ...
                                 if Char = 0 then
                                    -- a CR followed by a NUL
                                    if Ucb.CR_To_CRLF_On_Input then
                                       -- translate CR to CRLF
                                       Ucb.Transport_Data.Normal_Data.Put_Last (LF);
                                       if Ucb.Debug = Debug_All then
                                          Debug_Io.Put_Line ("rcvd <LF> (inserted)");
                                       elsif Ucb.Debug = Debug_Data then
                                          Text_Io.Put_Line ("rcvd <LF> (inserted)");
                                       end if;
                                    end if;
                                 elsif Char = LF then
                                    -- a CR followed by an LF
                                    Ucb.Transport_Data.Normal_Data.Put_Last (Char);
                                 else
                                    -- a CR followed by a non-LF
                                    if Ucb.CR_To_CRLF_On_Input then
                                       -- translate CR to CRLF
                                       Ucb.Transport_Data.Normal_Data.Put_Last (LF);
                                       if Ucb.Debug = Debug_All then
                                          Debug_Io.Put_Line ("rcvd <LF> (inserted)");
                                       elsif Ucb.Debug = Debug_Data then
                                          Text_Io.Put_Line ("rcvd <LF> (inserted)");
                                       end if;
                                    end if;
                                    Ucb.Transport_Data.Normal_Data.Put_Last (Char);
                                 end if;
                                 -- ... TO HERE
                              else
                                 Ucb.Transport_Data.Normal_Data.Put_Last (Char);
                              end if;
                              if Char = CR then
                                 Ucb.Last_Normal_Char_Was_CR := True;
                              else
                                 Ucb.Last_Normal_Char_Was_CR := False;
                              end if;
                           end if;
                        end loop;
                        Buffer_Manager.Free (User_Msg.Data_Buffer);
                     else
                        Debug_Io.Put_Line ("NORMAL data msg cannot be processed yet - ungetting it");
                        UnGet_Normal_Message (Ucb.Transport, User_Msg);
                     end if;
                  end if;
               end if;
            end;
         when Connection_Reset =>
            Store_Message (Ucb, "connection reset by other host");
            Ucb.Connected := False;
            declare
               Close : Virtual_Service_Type (Virtual_Close);
            begin
               Virtual_Service_Call (Ucb, Close);
            end;
         when Ok_On_Close =>
            Store_Message (Ucb, "connection closed");
            Ucb.Connected := False;
         when Connection_Now_Open =>
            Debug_Io.Put_Line ("connection open msg detected");
            Ucb.Connected := True;
            Debug_Io.Put_Line ("communication_state is connection_established");
            Store_Message (Ucb, "connection open");
         when Timed_Out =>
            Store_Message (Ucb, "connection timed out");
            Ucb.Connected := False;
            declare
               Close : Virtual_Service_Type (Virtual_Close);
            begin
               Virtual_Service_Call (Ucb, Close);
            end;
         when Permission_Denied =>
            Store_Message (Ucb, "permission_denied");
         when Address_In_Use =>
            Store_Message (Ucb, "address already in use");
         when Cannot_Assign_Address =>
            Store_Message (Ucb, "cannot assign requested address");
         when Not_Supported =>
            Store_Message (Ucb, "address family or request not supported");
         when Operation_In_Progress =>
            Store_Message (Ucb, "operation in progress");
         when Bad_File_Descriptor =>
            Store_Message (Ucb, "bad file descriptor");
         when Connection_Refused =>
            Store_Message (Ucb, "connection refused");
         when Bad_Address =>
            Store_Message (Ucb, "bad address");
         when Interrupted_System_Call =>
            Store_Message (Ucb, "interrupted system call");
         when Bad_Argument =>
            Store_Message (Ucb, "bad argument");
         when Input_Output_Error =>
            Store_Message (Ucb, "input output error");
         when Already_Connected =>
            Store_Message (Ucb, "endpoint already connected");
         when Message_Too_Long =>
            Store_Message (Ucb, "message too long");
         when Network_Unreachable =>
            Store_Message (Ucb, "network unreachable");
         when Out_Of_Buffer_Space =>
            Store_Message (Ucb, "out of buffer space");
         when Protocol_Not_Available =>
            Store_Message (Ucb, "protocol not available");
         when Endpoint_Not_Connected =>
            Store_Message (Ucb, "endpoint not connected");
         when Resource_Unavailable =>
            Store_Message (Ucb, "resource unavailable");
         when Unknown_Host =>
            Store_Message (Ucb, "unknown host");
         when Host_Lookup_Failure =>
            Store_Message (Ucb, "host lookup failure");
         when No_Address_For_Host =>
            Store_Message (Ucb, "no address for host");
         when Unknown_Error =>
            Store_Message (Ucb, "unknown error - assumed fatal");
            Ucb.Connected := False;
            declare
               Close : Virtual_Service_Type (Virtual_Close);
            begin
               Virtual_Service_Call (Ucb, Close);
            end;
         when others =>
            Debug_Io.Put ("unknown user msg detected, event=");
            Debug_Io.Put_Line (Sixteen_Bits (User_Action'Pos (User_Msg.Event)));
      end case;
      Debug_Io.Put_Line ("end process_transport_input");
   exception
      when E : others =>
         Debug_Io.Put_Exception ("PROCESS_TRANSPORT_INPUT", E);
         raise;
   end Process_Transport_Input;

   --------------------------- END LOCAL SUBPROGRAMS ---------------------------

   procedure Check_For_Message (
         Ucb     : in out User_Control_Block;
         Message :    out Boolean)
   is
      Have_Message : Boolean;
   begin
      Have_Message := not Ucb.Transport_Data.Messages.Empty;
      if not Have_Message
      and There_Is_Any_Transport_Input (Ucb) then
         -- we currently have no messages, but there are
         -- transport messages available, so process them
         -- and see if that generates any messages
         Process_Transport_Input (Ucb);
      end if;
      Message := not Ucb.Transport_Data.Messages.Empty;
   end Check_For_Message;


   procedure Check_For_Input (
         Ucb   : in out User_Control_Block;
         Input :    out Boolean)
   is
      Have_Urgent : Boolean;
      Have_Normal : Boolean;
   begin
      -- see if we have any urgent input already
      Have_Urgent := not Ucb.Transport_Data.Urgent_Data.Empty;
      Have_Normal := not Ucb.Transport_Data.Normal_Data.Empty;
      if not Have_Urgent
      and There_Is_Urgent_Transport_Input (Ucb) then
         -- we currently have no urgent input but there are
         -- urgent messages waiting to be processed
         Process_Transport_Input (Ucb);
         Have_Urgent := not Ucb.Transport_Data.Urgent_Data.Empty;
         Have_Normal := not Ucb.Transport_Data.Normal_Data.Empty;
      end if;
      -- see if we have any urgent or normal input yet
      if not Have_Urgent and not Have_Normal
      and There_Is_Normal_Transport_Input (Ucb) then
         -- we currently have no urgent or normal input but
         -- there are normal messages waiting to be processed
         Process_Transport_Input (Ucb);
         Have_Normal := not Ucb.Transport_Data.Normal_Data.Empty;
         Have_Urgent := not Ucb.Transport_Data.Urgent_Data.Empty;
      end if;
      Input := Have_Urgent or Have_Normal;
   end Check_For_Input;


   procedure Get_Message (
         Ucb     : in out User_Control_Block;
         Message :    out Buffer_Area;
         Size    :    out Buffer_Index)
   is
      There_Is_A_Message : Boolean := False;
      Index              : Buffer_Index := Message'First;
      Char               : Eight_Bits := 0;
   begin
      Check_For_Message (Ucb, There_Is_A_Message);
      while There_Is_A_Message and Index < MAXIMUM_BUFFER_SIZE loop
         Ucb.Transport_Data.Messages.Get_First (Char);
         if Char = CR then
            -- end of message
            There_Is_A_Message := False;
         else
            Check_For_Message (Ucb, There_Is_A_Message);
         end if;
         Message (Index) := Char;
         Index := Index + 1;
      end loop;
      Size := Index - Message'First;
   exception
      when E : others =>
         Debug_Io.Put_Exception ("GET_MESSAGE", E);
         raise;
   end Get_Message;


   procedure Get_Input (
         Ucb    : in out User_Control_Block;
         Input  :    out Eight_Bits;
         Urgent :    out Boolean)
   is
      There_Is_Input : Boolean    := False;
      Temp_Input     : Eight_Bits := 0;
   begin
      Check_For_Input (Ucb, There_Is_Input);
      if There_Is_Input then
         if not Ucb.Transport_Data.Urgent_Data.Empty then
            Ucb.Transport_Data.Urgent_Data.Get_First (Temp_Input);
            Urgent := True;
         else
            Ucb.Transport_Data.Normal_Data.Get_First (Temp_Input);
            Urgent := False;
         end if;
      end if;
      Input := Temp_Input;
   exception
      when E : others =>
         Debug_Io.Put_Exception ("GET_INPUT", E);
         raise;
   end Get_Input;


   procedure Send_Data (
         Ucb    : in out User_Control_Block;
         Data   : in     Buffer_Area;
         Size   : in     Buffer_Index;
         Urgent : in     Boolean)
   is
      Send : Virtual_Service_Type (Virtual_Send);
   begin
      Send.Urgent := Urgent;
      Send.Size   := Size;
      Send.Data   := Data;
      Virtual_Service_Call (Ucb, Send);
   exception
      when E : others =>
         Debug_Io.Put_Exception ("SEND_DATA", E);
         raise;
   end Send_Data;


   procedure Virtual_Service_Call (
         Ucb        : in out User_Control_Block;
         Service    : in     Virtual_Service_Type)
   is
      Transport_Msg : Transport_Message;
   begin
      Debug_Io.Put_Line ("begin virtual_service_call");
      if Stopped (Ucb.Transport) then
         Start (Ucb.Transport, Ucb.Signal'access);
      end if;

      case Service.Service_Call is

         when Virtual_Open =>
            Debug_Io.Put_Line ("processing virtual open call");
            if Ucb.Connected then
               Debug_Io.Put_Line ("already connected");
               Store_Message (Ucb, "already connected");
            else
               Debug_Io.Put_Line ("processing open call");
               Debug_Io.Put ("addr =");
               Debug_Io.Put_Line (Sockets.Image (Service.Address));
               declare
                  Open_Parameters  : Open_Params;
               begin
                  User_Data.Initialize (Ucb); -- reset to initial values
                  Open_Parameters := (
                     Address     => Service.Address,
                     Active      => True,     -- active open call
                     Buffer_Size => MAXIMUM_BUFFER_SIZE,
                     Timeout     => 15);
                  Transport_Msg := (Transport_Open, Open_Parameters);
                  Send_Transport_Message (Ucb.Transport, Transport_Msg);
                  Ucb.Active  := True;
               end;
            end if;
            Debug_Io.Put_Line ("end virtual open call");

         when Virtual_Send =>
            Debug_Io.Put_Line ("processing virtual send call");
            declare
               Buffer    : Data_Buffer_Ptr;
               Send_Data : Send_Params;
               Urgent    : Boolean               := False;  -- not urgent
               Time_Out  : constant Sixteen_Bits := 15; -- arbitrary
               Dst_Index : Buffer_Index          := Buffer_Area'First;
               Src_Index : Buffer_Index          := Buffer_Area'First;
            begin
               if not Ucb.Connected then
                  Debug_Io.Put_Line ("not connected");
                  Store_Message (Ucb, "not connected");
               else
                  if Service.Size > 0 then
                     Debug_Io.Put ("size =");
                     Debug_Io.Put_Line (Service.Size);
                     Urgent := Service.Urgent;
                     while Src_Index < Buffer_Area'First + Service.Size loop
                        Buffer_Manager.Get (Buffer);
                        if Buffer = null then
                           Store_Message (Ucb, "out of buffers");
                           exit;
                        else
                           while Src_Index < Buffer_Area'First + Service.Size loop
                              Buffer.Data (Dst_Index) := Service.Data (Src_Index);
                              Dst_Index := Dst_Index + 1;
                              if Ucb.Debug = Debug_All then
                                 Debug_Io.Put ("send <");
                                 Debug_Io.Put (Service.Data (Src_Index));
                                 Debug_Io.Put_Line (">");
                              elsif Ucb.Debug = Debug_Data then
                                 Text_Io.Put ("send <");
                                 Text_Io.Put (Eight_Bits'Image (Service.Data (Src_Index)));
                                 Text_Io.Put_Line (">");
                              end if;
                              if not Ucb.Options.Local_In_Effect (Binary_Transmission) then
                                 -- perform CR translation - see RFC 854 page 11,12
                                 -- note that a CR already followed by an LF or NULL
                                 -- is not translated - it is assumed to be correct
                                 -- already
                                 if Service.Data (Src_Index) = CR then
                                    if Src_Index = Buffer_Area'First + Service.Size - 1
                                    or else (Service.Data (Src_Index + 1) /= LF
                                             and Service.Data (Src_Index + 1) /= 0) then
                                       if Ucb.CR_To_CRLF_On_Output then
                                          -- translate CR into CR/LF
                                          Buffer.Data (Dst_Index) := LF;
                                          Dst_Index := Dst_Index + 1;
                                          if Ucb.Debug = Debug_All then
                                             Debug_Io.Put_Line ("send <LF> (inserted)");
                                          elsif Ucb.Debug = Debug_Data then
                                             Text_Io.Put_Line ("send <LF> (inserted)");
                                          end if;
                                       else
                                          -- translate CR into CR/NULL
                                          Buffer.Data (Dst_Index) := 0;
                                          Dst_Index := Dst_Index + 1;
                                          if Ucb.Debug = Debug_All then
                                             Debug_Io.Put_Line ("send <NULL> (inserted)");
                                          elsif Ucb.Debug = Debug_Data then
                                             Text_Io.Put_Line ("send <LF> (inserted)");
                                          end if;
                                       end if;
                                    end if;
                                 end if;
                              end if;
                              Src_Index := Src_Index + 1;
                           end loop;
                           Buffer.Size := Dst_Index - Buffer_Area'First;
                           Send_Data := (Urgent, Time_Out, Buffer);
                           Transport_Msg := (Transport_Send, Send_Data);
                           Send_Transport_Message (Ucb.Transport, Transport_Msg);
                        end if;
                     end loop;
                  end if;
               end if;
            end;
            Debug_Io.Put_Line ("end virtual send call");

         when Virtual_Close =>
            Debug_Io.Put_Line ("processing virtual close call");
            if not Ucb.Connected then
               Debug_Io.Put_Line ("not connected");
               Store_Message (Ucb, "not connected");
            else
               Transport_Msg := (Event => Transport_Close);
               Send_Transport_Message (Ucb.Transport, Transport_Msg);
            end if;
            Debug_Io.Put_Line ("end virtual close call");

         when Virtual_Abort =>
            Debug_Io.Put_Line ("processing virtual abort call");
            if not Ucb.Connected then
               Debug_Io.Put_Line ("not connected");
               Store_Message (Ucb, "not connected");
            else
               Transport_Msg := (Event => Transport_Abort);
               Send_Transport_Message (Ucb.Transport, Transport_Msg);
            end if;
            Debug_Io.Put_Line ("end virtual abort call");

      end case;

      Debug_Io.Put_Line ("end virtual_service_call");

   exception
      when E : others =>
         Debug_Io.Put_Exception ("VIRTUAL_SERVICE_CALL", E);
         raise;
   end Virtual_Service_Call;


end Virtual_Transport;
