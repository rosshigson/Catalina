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

with Sockets;
with Telnet_Types;
with Buffer_Data;
with Protected_Buffer;
pragma Elaborate_All (Protected_Buffer);

package Actual_Transport is

   use Telnet_Types;
   use Buffer_Data;
   use Sockets;

   -----------------------------------------------------------------------------
   --This package contains all the data abstractions and operations necessary --
   --to support the User/TCP interface and TCP/lower-level interface.         --
   --The enumerated type ACTION represents the type of request primitive      --
   --that is sent by the upper layer or lower layer protocols.                --
   -----------------------------------------------------------------------------

   type Status_Type is 
         (Connection_Open,   
          Connection_Closed, 
          Opening,           
          Closing); 

   type User_Action is
         (No_User_Action,
          Connection_Closing,
          Ok_On_Abort,
          Buffer_For_User,
          Tcb_Pointer_And_State,
          Connection_Reset,
          Ok_On_Close,
          Connection_Now_Open,
          Timed_Out,
          Permission_Denied,
          Address_In_Use,
          Cannot_Assign_Address,
          Not_Supported,
          Operation_In_Progress,
          Bad_File_Descriptor,
          Connection_Refused,
          Bad_Address,
          Interrupted_System_Call,
          Bad_Argument,
          Input_Output_Error,
          Already_Connected,
          Message_Too_Long,
          Network_Unreachable,
          Out_Of_Buffer_Space,
          Protocol_Not_Available,
          Endpoint_Not_Connected,
          Resource_Unavailable,
          Unknown_Host,
          Host_Lookup_Failure,
          No_Address_For_Host,
          Unknown_Error);
          

   type User_Message (Event : User_Action := No_User_Action) is
   record
      case Event is
         when Buffer_For_User =>
            Urgent      : Boolean          := False;
            Data_Buffer : Data_Buffer_Ptr;
         when others =>
            null;
      end case;
   end record;

   type Transport_Action is 
         (No_Transport_Action,
          Transport_Open,
          Transport_Send,
          Transport_Abort,
          Transport_Close); 

   type Open_Params is 
      record 
         Address     : Address_Type   := No_Address;  
         Active      : Boolean        := True;  
         Buffer_Size : Thirtytwo_Bits := 0;  
         Timeout     : Sixteen_Bits   := 0;  
      end record; 

   type Send_Params is 
      record 
         Urgent        : Boolean          := False;  
         Timeout       : Sixteen_Bits     := 0;  
         Data_Buffer   : Data_Buffer_Ptr;  
      end record; 

   -- Real_Transport responds to message which are associated with a type of 
   -- event. The data abstraction of Trasnport_Message creates the appropiate 
   -- message for the given event
   type Transport_Message (Event : Transport_Action := No_Transport_Action) is
   record
      case Event is
         when Transport_Send =>
            Send_Parameters : Send_Params;
         when Transport_Open  =>
            Open_Parameters : Open_Params;
         when others =>
            null;
      end case;
   end record;

   type Transport_Type is limited private;

   procedure Start (
         Transport : in out Transport_Type;
         Signal    : in     Signal_Access);

   procedure Stop (
         Transport : in out Transport_Type);

   function Stopped (
         Transport : in     Transport_Type)
      return Boolean;

   function Normal_Message_Available (
         Transport : in     Transport_Type)
      return Boolean;
   --This procedure returns true if there are messages from TCP.

   procedure Get_Normal_Message (
         Transport : in out Transport_Type;
         User_Msg  : in out User_Message); 
   --This procedure obtains a message in a queue from TCP.

   procedure Unget_Normal_Message (
         Transport : in out Transport_Type;
         User_Msg  : in out User_Message); 
   --This procedure ungets a message in a queue from TCP.

   function Urgent_Message_Available (
         Transport : in     Transport_Type)
      return Boolean; 
   --This procedure returns true if there are messages from TCP.

   procedure Get_Urgent_Message (
         Transport : in out Transport_Type;
         User_Msg  : in out User_Message); 
   --This procedure obtains a message in a queue from TCP.

   procedure Unget_Urgent_Message (
         Transport : in out Transport_Type;
         User_Msg  : in out User_Message); 
   --This procedure ungets a message in a queue from TCP.

   procedure Send_Transport_Message (
         Transport : in out Transport_Type;
         Trans_Msg : in out Transport_Message); 
   --This procedure is used to put a message for TCP.

   type User_Message_Array is array (Natural range <>) of User_Message;

   package Protected_Message_Buffer 
   is new Protected_Buffer (
      User_Message,
      Natural,
      User_Message_Array,
      NUMBER_OF_BUFFERS);

   type User_Message_Buffer_Type is new Protected_Message_Buffer.Buffer_Type;
   

private

   task type Transport_Task_Type is

      entry Start (
               Identity : in out Transport_Type;
               Signal   : in     Signal_Access);
      
      entry Stop;
      
      entry Send_Transport_Message (
               Trans_Msg : in out Transport_Message); 
         
   end Transport_Task_Type;


   type Transport_Record is record
      Status          : Status_Type      := Connection_Closed;
      Active          : Boolean          := False; 
      Channel         : Channel_Type     := No_Channel;
      Selector        : Selector_Type; 
      Transport_Task  : Transport_Task_Type;
      Urgent_Messages : User_Message_Buffer_Type;
      Normal_Messages : User_Message_Buffer_Type;
   end record;

   type Transport_Type is access Transport_Record;
   

end Actual_Transport;

