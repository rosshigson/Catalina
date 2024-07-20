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
with Ada.Exceptions;
with Ada.Unchecked_Deallocation;
with Sockets;
pragma Elaborate_All (Sockets);
with Sockets.Constants;
with Protection;
with Debug_Io;
pragma Elaborate_All (Debug_Io);

package body Actual_Transport is

   use Ada.Exceptions;
   use Ada.Streams;
   use Sockets;

   -- use Text_IO;
   use Debug_IO;

   -- The following are used only for passive connects:

   Passive_Port    : Telnet_Types.Port_Type := Telnet_Types.No_Port;
   Passive_Channel : Channel_Type;
   Passive_Mutex   : Protection.Mutex;


   procedure Convert_To_User_Msg (
      E        : in     Ada.Exceptions.Exception_Occurrence;
      User_Msg : in out User_Message) 
   is
   begin
      case Sockets.Resolve_Exception (E) is 
            
         when Sockets.Permission_Denied =>
            User_Msg := (Event => Permission_Denied);

         when Sockets.Address_Already_In_Use =>
            User_Msg := (Event => Address_In_Use);
            
         when Sockets.Cannot_Assign_Requested_Address =>
            User_Msg := (Event => Cannot_Assign_Address);
            
         when Sockets.Address_Family_Not_Supported_By_Protocol =>
            User_Msg := (Event => Not_Supported);
            
         when Sockets.Operation_Already_In_Progress =>
            User_Msg := (Event => Operation_In_Progress);
            
         when Sockets.Bad_File_Descriptor =>
            User_Msg := (Event => Bad_File_Descriptor);
            
         when Sockets.Connection_Refused =>
            User_Msg := (Event => Connection_Refused);
            
         when Sockets.Bad_Address =>
            User_Msg := (Event => Bad_Address);

         when Sockets.Operation_Now_In_Progress =>
            User_Msg := (Event => Operation_In_Progress);

         when Sockets.Interrupted_System_Call =>
            User_Msg := (Event => Interrupted_System_Call);

         when Sockets.Invalid_Argument =>
            User_Msg := (Event => Bad_Argument);

         when Sockets.Input_Output_Error =>
            User_Msg := (Event => Input_Output_Error);

         when Sockets.Transport_Endpoint_Already_Connected =>
            User_Msg := (Event => Already_Connected);

         when Sockets.Message_Too_Long =>
            User_Msg := (Event => Message_Too_Long);

         when Sockets.Network_Is_Unreachable =>
            User_Msg := (Event => Network_Unreachable);

         when Sockets.No_Buffer_Space_Available =>
            User_Msg := (Event => Out_Of_Buffer_Space);

         when Sockets.Protocol_Not_Available =>
            User_Msg := (Event => Protocol_Not_Available);
            
         when Sockets.Transport_Endpoint_Not_Connected =>
            User_Msg := (Event => Endpoint_Not_Connected);
            
         when Sockets.Operation_Not_Supported =>
            User_Msg := (Event => Not_Supported);
            
         when Sockets.Protocol_Not_Supported =>
            User_Msg := (Event => Not_Supported);
            
         when Sockets.Socket_Type_Not_Supported =>
            User_Msg := (Event => Not_Supported);
            
         when Sockets.Connection_Timed_Out =>
            User_Msg := (Event => Timed_Out);
            
         when Sockets.Resource_Temporarily_Unavailable =>
            User_Msg := (Event => Resource_Unavailable);
            
         when Sockets.Unknown_Host =>
            User_Msg := (Event => Unknown_Host);
            
         when Sockets.Host_Name_Lookup_Failure =>
            User_Msg := (Event => Host_Lookup_Failure);
            
         when Sockets.Unknown_Server_Error =>
            User_Msg := (Event => Unknown_Error);
            
         when Sockets.Cannot_Resolve_Error =>
            User_Msg := (Event => Unknown_Error);

         when others =>
            User_Msg := (Event => No_User_Action); -- FIX MISSING ERRORS!!!
            
      end case;
   end Convert_To_User_Msg;


   procedure Start (
         Transport : in out Transport_Type;
         Signal    : in     Signal_Access)
   is
   begin
      if Transport = null then
         Transport := new Transport_Record;
      end if;
      Transport.Transport_Task.Start (Transport, Signal);
   end Start;


   procedure Stop (
         Transport : in out Transport_Type)
   is
   begin
      if Transport /= null then
         Transport.Transport_Task.Stop;
      end if;
   end Stop;


   function Stopped (
         Transport : in     Transport_Type)
      return Boolean
   is
   begin
      if Transport = null 
      or else Transport.Transport_Task'Terminated 
      or else not Transport.Transport_Task'Callable then
         return True;
      else
         return False;
      end if;
   end Stopped;


   function Normal_Message_Available (
         Transport : in     Transport_Type)
      return Boolean
   is
   begin
      if Transport /= null then
         return not Transport.Normal_Messages.Empty;
      else
         return False;
      end if;
   end Normal_Message_Available;


   procedure Get_Normal_Message (
         Transport : in out Transport_Type;
         User_Msg  : in out User_Message)
   is
   begin
      if Transport /= null then
         if not Transport.Normal_Messages.Empty then
            Transport.Normal_Messages.Get_First (User_Msg);
         end if;
      end if;
   end Get_Normal_Message;


   procedure UnGet_Normal_Message (
         Transport : in out Transport_Type;
         User_Msg  : in out User_Message)
   is
   begin
      if Transport /= null then
         if not Transport.Normal_Messages.Full then
            Transport.Normal_Messages.Put_First (User_Msg);
         end if;
      end if;
   end UnGet_Normal_Message;


   function Urgent_Message_Available (
         Transport : in     Transport_Type)
      return Boolean
   is
   begin
      if Transport /= null then
         return not Transport.Urgent_Messages.Empty;
      else
         return False;
      end if;
   end Urgent_Message_Available;


   procedure Get_Urgent_Message (
         Transport : in out Transport_Type;
         User_Msg  : in out User_Message)
   is
   begin
      if Transport /= null then
         if not Transport.Urgent_Messages.Empty then
            Transport.Urgent_Messages.Get_First (User_Msg);
         end if;
      end if;
   end Get_Urgent_Message;


   procedure UnGet_Urgent_Message (
         Transport : in out Transport_Type;
         User_Msg  : in out User_Message)
   is
   begin
      if Transport /= null then
         if not Transport.Urgent_Messages.Full then
            Transport.Urgent_Messages.Put_First (User_Msg);
         end if;
      end if;
   end UnGet_Urgent_Message;


   procedure Send_Transport_Message (
         Transport : in out Transport_Type;
         Trans_Msg : in out Transport_Message)
   is
   begin
      if Transport /= null then
         Transport.Transport_Task.Send_Transport_Message (Trans_Msg);
      end if;
   end Send_Transport_Message;

   
   procedure Transport_Wait (
         Transport : in     Transport_Type;
         Urgent    : in out Boolean;
         Normal    : in out Boolean)
   is
      Read_Set   : Socket_Set_Type;
      Write_Set  : Socket_Set_Type;
      Except_Set : Socket_Set_Type;
      Status     : Selector_Status;
   begin
      Urgent := False;
      Normal := False;
      Set (Except_Set, Transport.Channel);
      Set (Read_Set, Transport.Channel);
      begin
         Check_Selector (Transport.Selector, Read_Set, Write_Set, Except_Set, Status);
      exception
         when E : others =>
            Debug_Io.Put_Exception ("TRANSPORT_WAIT 2 ", E);
      end;
      if Status = Completed then
         if Is_Set (Except_Set, Transport.Channel) then
            Urgent := True;
         end if;
         if Is_Set (Read_Set, Transport.Channel) then
            Normal := True;
         end if;
      end if;
      Empty (Read_Set);
      Empty (Except_Set);
   end Transport_Wait;


   procedure Transport_Read (
         Transport : in out Transport_Type;
         User_Msg  : in out User_Message;
         Urgent    : in     Boolean)
   is 

      Receive_Buffer : Buffer_Area;  
      Receive_Size   : Buffer_Index;  
      Receive_Last   : Ada.Streams.Stream_Element_Offset;
      Buffer         : Data_Buffer_Ptr;
      Ok             : Boolean := True;
      Flags          : Request_Flag_Type;

   begin
      -- assume we return nothing to user
      User_Msg := (Event => No_User_Action);
      Buffer_Manager.Get (Buffer);
      if Buffer /= null then
         begin
            Put_Line ("TRANSPORT_READ : channel " & Image (Transport.Channel));
            if Urgent then
               Put_Line ("TRANSPORT_READ : urgent read");
               Flags := Process_Out_Of_Band_Data;
               Receive_Socket (Transport.Channel, Receive_Buffer, Receive_Last, Flags);
               Receive_Size := Receive_Last - Receive_Buffer'First + 1;
               Put_Line ("TRANSPORT_READ : urgent read completed");
               User_Msg := (Event => Buffer_For_User, Data_Buffer => null, Urgent => True);
            else
               Put_Line ("TRANSPORT_READ : non-urgent read");
               Flags := No_Request_Flag;
               Receive_Socket (Transport.Channel, Receive_Buffer, Receive_Last, Flags);
               Receive_Size := Receive_Last - Receive_Buffer'First + 1;
               Put_Line ("TRANSPORT_READ : non-urgent read completed");
               User_Msg := (Event => Buffer_For_User, Data_Buffer => null, Urgent => False);
            end if;
            if Receive_Size = 0 then
               -- connection reset by peer
               Put_Line ("TRANSPORT_READ (Receive) : connection reset by peer ?");
               User_Msg := (Event => Connection_Reset);
               Transport.Status := Connection_Closed;
               Ok := False;
            end if;
         exception
            when E : others =>
               -- Debug_Io.Put_Exception ("TRANSPORT_READ (Receive)", E);
               Convert_To_User_Msg (E, User_Msg);
               if User_Msg.Event = Timed_Out or User_Msg.Event = Unknown_Error then
                  Transport.Status := Connection_Closed;
               end if;
               Buffer_Manager.Free (Buffer);
               return;
         end;
         case User_Msg.Event is
            when Buffer_For_User =>
               Buffer.Data := Receive_Buffer;
               Buffer.Size := Receive_Size;
               User_Msg.Data_Buffer := Buffer;
            when Ok_On_Abort | Connection_Reset | Ok_On_Close | Timed_Out =>
               Buffer_Manager.Free (Buffer);
               --connection closed: aborted; reset; 
               --connection timeout; delete mailbox
               begin
                  Transport.Status := Connection_Closed;
                  Sockets.Close_Socket (Transport.Channel);
               exception
                  when E : others =>
                     -- Debug_Io.Put_Exception ("TRANSPORT_READ (Close)", E);
                     Convert_To_User_Msg (E, User_Msg);
                     if User_Msg.Event = Timed_Out or User_Msg.Event = Unknown_Error then
                        Transport.Status := Connection_Closed;
                     end if;
                     return;
               end;
            when others =>
               Buffer_Manager.Free (Buffer);
         end case;
      else
         Put_Line ("TRANSPORT_READ : no buffers available (not fatal) - delaying");
         delay 1.0;
      end if;
   end Transport_Read;


   procedure Transport_Write (
         Transport  : in out Transport_Type;
         Trans_Msg  : in out Transport_Message;
         User_Msg   : in out User_Message; 
         Request_Ok :    out Boolean) is 

      Channel         : Channel_Type;  
      Client          : Channel_Type;  
      Transmit_Buffer : Buffer_Area;  
      Transmit_Size   : Buffer_Index;
      Transmit_Last   : Ada.Streams.Stream_Element_Offset;
      Ok              : Boolean := True;
      Flags           : Request_Flag_Type; 

   begin
      -- assume we return nothing to user
      User_Msg := (Event => No_User_Action);

      case Trans_Msg.Event is
            
         when Transport_Open =>
            Put_Line ("TRANSPORT_WRITE : OPEN");
            declare
               Local_Addr  : Address_Type;  
               Remote_Addr : Address_Type;  
            begin
               if Trans_Msg.Open_Parameters.Active then
                  -- do an active open
                  Transport.Active := True;
                  Local_Addr.Addr  := Addresses (Get_Host_By_Name (Host_Name), 1);
                  Local_Addr.Port  := Any_Port;
                  Remote_Addr      := Trans_Msg.Open_Parameters.Address;
                  Create_Socket (Channel);
                  Set_Socket_Option (
                     Channel,
                     Socket_Level,
                     (Reuse_Address, True));
                  Set_Socket_Option (
                     Channel,
                     Socket_Level,
                     (Send_Buffer, Trans_Msg.Open_Parameters.Buffer_Size));
                  Set_Socket_Option (
                     Channel,
                     Socket_Level,
                     (Receive_Buffer, Trans_Msg.Open_Parameters.Buffer_Size));
                  Bind_Socket (Channel, Local_Addr);
                  Connect_Socket (Channel, Remote_Addr);
                  Transport.Channel := Channel;
                  Transport.Status  := Connection_Open;
                  -- return message to user
                  User_Msg := (Event => Connection_Now_Open);
               else
                  -- do a passive open
                  Transport.Active := False;
                  Local_Addr := Trans_Msg.Open_Parameters.Address;
                  -- always use the local host for passive open
                  Local_Addr.Addr := Addresses (Get_Host_By_Name (Host_Name), 1);
                  begin 
                     Passive_Mutex.Acquire;
                     if Passive_Port = Telnet_Types.No_Port then
                        -- no passive port set up yet, so do so now using
                        -- the local port specified in this open call
                        Passive_Port := Local_Addr.Port;
                        Create_Socket (Passive_Channel);
                        Set_Socket_Option (
                           Passive_Channel,
                           Socket_Level,
                           (Reuse_Address, True));
                        Set_Socket_Option (
                           Passive_Channel,
                           Socket_Level,
                           (Send_Buffer, Trans_Msg.Open_Parameters.Buffer_Size));
                        Set_Socket_Option (
                           Passive_Channel,
                           Socket_Level,
                           (Receive_Buffer, Trans_Msg.Open_Parameters.Buffer_Size));
                        Bind_Socket (Passive_Channel, Local_Addr);
                        Listen_Socket (Passive_Channel);
                     end if;
                     Passive_Mutex.Release;
                  exception
                     when E : others =>
                        Passive_Mutex.Release;
                        -- Debug_Io.Put_Exception ("TRANSPORT_WRITE (Passive Open)", E);
                        Convert_To_User_Msg (E, User_Msg);
                        if User_Msg.Event = Timed_Out or User_Msg.Event = Unknown_Error then
                           Transport.Status := Connection_Closed;
                        end if;
                        Ok := False;
                  end;
                  if Ok then
                     -- accept a connection to the passive socket
                     Accept_Socket (Passive_Channel, Client, Remote_Addr);
                     Transport.Channel   := Client;
                     Transport.Status    := Connection_Open;
                     -- return message to user
                     User_Msg := (Event => Connection_Now_Open);
                  end if;
               end if;
            exception
               when E : others =>
                  -- Debug_Io.Put_Exception ("TRANSPORT_WRITE (Open)", E);
                  Convert_To_User_Msg (E, User_Msg);
                  if User_Msg.Event = Timed_Out or User_Msg.Event = Unknown_Error then
                     Transport.Status := Connection_Closed;
                  end if;
                  Ok := False;
            end;
            if not Ok then
               Put_Line ("TRANSPORT_WRITE (Open) : Could not create tcp channel");
            end if;

         when Transport_Send =>
            Put_Line ("TRANSPORT_WRITE (Send) : Channel " & Image (Transport.Channel));
            if Trans_Msg.Send_Parameters.Data_Buffer /= null then
               Transmit_Buffer := Trans_Msg.Send_Parameters.Data_Buffer.Data;
               Transmit_Size   := Trans_Msg.Send_Parameters.Data_Buffer.Size; 
               Buffer_Manager.Free (Trans_Msg.Send_Parameters.Data_Buffer);
               begin
                  if Trans_Msg.Send_Parameters.Urgent then
                     Put_Line ("TRANSPORT_WRITE (Send) : urgent data");
                     Flags := Process_Out_Of_Band_Data;                  else
                     Put_Line ("TRANSPORT_WRITE (Send) : not urgent data");
                     Flags := No_Request_Flag;
                  end if;
                  Send_Socket (
                     Transport.Channel,
                     Transmit_Buffer (Transmit_Buffer'First .. Transmit_Buffer'First + Transmit_Size - 1),
                     Transmit_Last,
                     Flags);
                  if Transmit_Last < Transmit_Buffer'First then
                     -- connection reset by peer
                     Put_Line ("TRANSPORT_WRITE (Send) : connection reset by peer ?");
                     Transport.Status := Connection_Closed;
                     User_Msg := (Event => Connection_Reset);
                     Ok := False;
                  end if;
               exception
                  when E : others =>
                     -- Debug_Io.Put_Exception ("TRANSPORT_WRITE (Send)", E);
                     Convert_To_User_Msg (E, User_Msg);
                     if User_Msg.Event = Timed_Out or User_Msg.Event = Unknown_Error then
                        Transport.Status := Connection_Closed;
                     end if;
                     Ok := False;
               end;
            else
               Put_Line ("TRANSPORT_WRITE (Send) : No data to send");
            end if;

         when Transport_Close =>
            Put_Line ("TRANSPORT_WRITE (Close) : Channel " & Image (Transport.Channel));
            begin
               Shutdown_Socket (Transport.Channel);
               Close_Socket (Transport.Channel);
               Transport.Status  := Connection_Closed;
               -- return message to user
               User_Msg := (Event => OK_On_Close);
               Ok := True;
            exception
               when E : others =>
                  -- Debug_Io.Put_Exception ("TRANSPORT_WRITE (Close)", E);
                  Convert_To_User_Msg (E, User_Msg);
                  if User_Msg.Event = Unknown_Error then
                     -- we get this when socket is already closed (e.g. reset by peer)
                     Transport.Status := Connection_Closed;
                     User_Msg := (Event => OK_On_Close);
                     Ok := True;
                  else
                     Ok := False;
                  end if;
            end;
   
         when Transport_Abort =>
            Put_Line ("TRANSPORT_WRITE (Abort) : Channel " & Image (Transport.Channel));
            begin
               Close_Socket (Transport.Channel);
               Transport.Status  := Connection_Closed;
               -- return message to user
               User_Msg := (Event => OK_On_Abort);
            exception
               when E : others =>
                  -- Debug_Io.Put_Exception ("TRANSPORT_WRITE (Abort)", E);
                  Convert_To_User_Msg (E, User_Msg);
                  if User_Msg.Event = Timed_Out or User_Msg.Event = Unknown_Error then
                     Transport.Status := Connection_Closed;
                  end if;
                  Ok := False;
            end;

         when No_Transport_Action =>
            null;
            
      end case;
      
      Request_Ok := Ok;
      
   exception
      when E : others =>
         Debug_Io.Put_Exception ("TRANSPORT_WRITE", E);
         Request_Ok := False;
   end Transport_Write;


   task body Transport_Task_Type 
   is
      
      task type Reader_Type;

      type Access_Reader_Type is access Reader_Type;
      
      procedure Free 
      is new Ada.Unchecked_Deallocation (Reader_Type, Access_Reader_Type);

      Started           : Boolean := False;
      MySelf            : Transport_Type;
      MySignal          : Signal_Access;
      MyReader          : Access_Reader_Type;
         
      task body Reader_Type 
      is
         Message : User_Message;
         Urgent  : Boolean;
         Normal  : Boolean;
      begin
         Put_Line ("TRANSPORT_TASK (Reader): starting");
         begin
            Create_Selector (Myself.Selector);
         exception
            when E : others =>
               Debug_Io.Put_Exception ("TRANSPORT_TASK (Reader) 1 ", E);
         end;
         loop
            begin
               Put_Line ("TRANSPORT_TASK (Reader): Waiting for messages");
               Message := (Event => No_User_Action);
               Urgent  := False;
               Normal  := false;
               begin
                  Transport_Wait (Myself, Urgent, Normal);
               exception
                  when E : others =>
                     Debug_Io.Put_Exception ("TRANSPORT_TASK (Reader) 2 ", E);
                     delay 0.1;
               end;
               if Urgent then
                  Put_Line ("TRANSPORT_TASK (Reader): Reading urgent message");
                  Transport_Read (Myself, Message, True);
                  Put_Line ("TRANSPORT_TASK (Reader): Read urgent message");
               elsif Normal then
                  Put_Line ("TRANSPORT_TASK (Reader): Reading normal message");
                  Transport_Read (Myself, Message, False);
                  Put_Line ("TRANSPORT_TASK (Reader): Read normal message");
               end if;
               if Message.Event /= No_User_Action then
                  -- we read a message
                  if Message.Event = Buffer_For_User and then Message.Urgent then
                     Myself.Urgent_Messages.Put_Last (Message);
                  else
                     Myself.Normal_Messages.Put_Last (Message);
                  end if;
                  -- signal to indicate a new message is waiting
                  if MySignal /= null then
                     MySignal.Signal.Signal;
                  end if;
               end if;
               if Myself.Status /= Connection_Open then
                  Put_Line ("TRANSPORT_TASK (Reader): stopping");
                  exit;
               end if;
            exception
               when E : others =>
                  Debug_Io.Put_Exception ("TRANSPORT_TASK (Reader) 3 ", E);
                  delay 0.1;
            end;
            -- before starting another read, make sure there are at least 
            -- three available spaces in each message queue - one for read, 
            -- one for write and one for unget
            if Myself.Urgent_Messages.Space < 3 
            or Myself.Normal_Messages.Space < 3 then
               Put_Line ("TRANSPORT_TASK (Reader): queues full (non-fatal) - delaying");
               loop
                  if MySignal /= null then
                     MySignal.Signal.Signal;
                  end if;
                  delay 1.0;
                  exit when Myself.Urgent_Messages.Space >= 3 
                        and Myself.Normal_Messages.Space >= 3;
               end loop;
            end if;
         end loop;
         begin
            Close_Selector (Myself.Selector);
         exception
            when E : others =>
               Debug_Io.Put_Exception ("TRANSPORT_TASK (Reader) 4 ", E);
         end;
      end Reader_Type;

      procedure Start_Reader is
      begin
         if MyReader = null then
            MyReader := new Reader_Type;
         elsif MyReader.all'Terminated then
            begin
               Free (MyReader);
            exception
               when others =>
                  null;
            end;
            MyReader := new Reader_Type;
         end if;
      end Start_Reader;
      
      procedure Stop_Reader is
      begin
         Put_Line ("TRANSPORT_TASK (Stop Reader): Stopping reader");
         if MyReader /= null then
            Myself.Status := Connection_Closed;
            begin
               Abort_Selector (Myself.Selector);
            exception
               when E : others =>
                  Debug_Io.Put_Exception ("TRANSPORT_TASK (Stop Reader) ", E);
            end;
            begin
               abort MyReader.all;
            exception
               when others =>
                  null;
            end;
            begin
               Free (MyReader);
            exception
               when others =>
                  null;
            end;
            MyReader := null;
         end if;
      end Stop_Reader;

   begin
      loop
         select 
            accept Start (Identity : in out Transport_Type;
                          Signal   : in     Signal_Access)
            do
               Started := True;
               -- set up my identity
               MySelf   := Identity;
               MySignal := Signal;
               -- clear my buffers
               Myself.Urgent_Messages.Reset (Raise_Errors_As_Exceptions => True);
               Myself.Normal_Messages.Reset (Raise_Errors_As_Exceptions => True);
            end Start;
         or
            accept Stop
            do
               if Started then
                  Stop_Reader;
               else
                  Put_Line ("TRANSPORT_TASK (Stop): not started");
               end if;
            end Stop;
         or
            accept Send_Transport_Message (
                      Trans_Msg : in out Transport_Message) 
            do
               if Started then
                  declare
                     Ok       : Boolean;
                     User_Msg : User_Message;
                  begin
                     Put_Line ("TRANSPORT_TASK (Send): Writing message");
                     Transport_Write (Myself, Trans_Msg, User_Msg, Ok);
                     Put_Line ("TRANSPORT_TASK (Send): Wrote message");
                     if Ok and Myself.Status = Connection_Open then
                        -- ensure there is a reader running
                        Start_Reader;
                     end if;
                     if User_Msg.Event /= No_User_Action then
                        if User_Msg.Event = Buffer_For_User and then User_Msg.Urgent then
                           Myself.Urgent_Messages.Put_Last (User_Msg);
                        else
                           Myself.Normal_Messages.Put_Last (User_Msg);
                        end if;
                        -- signal that a message is waiting
                        if MySignal /= null then
                           MySignal.Signal.Signal;
                           -- MySignal.Signal;
                        end if;
                     end if;
                     if Myself.Status /= Connection_Open then
                        -- ensure there is no reader running
                        Stop_Reader;
                     end if;
                  exception
                     when E : others =>
                        Debug_Io.Put_Exception ("TRANSPORT_TASK (Send)", E);
                  end;
               else
                  Put_Line ("TRANSPORT_TASK (Send): not started");
               end if;
            end Send_Transport_Message;
         end select;
         -- before accepting another call, make sure there are at least 
         -- three available spaces in each message queue - one for read, 
         -- one for write and one for unget
         if Myself.Urgent_Messages.Space < 3 
         or Myself.Normal_Messages.Space < 3 then
            Put_Line ("TRANSPORT_TASK (Writer): queues full (non-fatal) - delaying");
            loop
               if MySignal /= null then
                  MySignal.Signal.Signal;
               end if;
               delay 1.0;
               exit when Myself.Urgent_Messages.Space >= 3 
                     and Myself.Normal_Messages.Space >= 3;
            end loop;
         end if;
      end loop;
   exception
      when E : others =>
         Debug_Io.Put_Exception ("TRANSPORT_TASK", E);
   end Transport_Task_Type;
      

begin
   Initialize;
exception 
   when E : others =>
      Debug_Io.Put_Exception ("ACTUAL_TRANSPORT_LEVEL", E);
end Actual_Transport;
