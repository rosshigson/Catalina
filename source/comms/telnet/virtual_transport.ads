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
with User_Data;
with Telnet_Types;

package Virtual_Transport is

   use Telnet_Types;
   use User_Data;

   -- ************************  USER SPECIFICATION  ****************************
   --
   -- A procedure will convert the desired transport level service call to the 
   -- proper syntax for the actual transport level inplementation (TCP) and
   -- have the transport level process that service call.  It will provide
   -- functions to determine if there are messages and input available from the 
   -- transport level. It will get messages and input from the actual transport
   -- level.  Messages are considered to be information from the local
   -- transport level as apposed to input from the transport level which is
   -- simply relayed data from the remote connection.
   -- 
   -- *************************************************************************

   type Service_Call_Type is 
         (Virtual_Open,    
          Virtual_Send,    
          Virtual_Close,   
          Virtual_Abort); 

   type Virtual_Service_Type (Service_Call : Service_Call_Type) is 
   record
      case Service_Call is

         when Virtual_Send =>
            Data   : Buffer_Area;
            Size   : Buffer_Index;
            Urgent : Boolean;

         when Virtual_Open =>
            Address : Address_Type;

         when others =>
            null;

      end case;
   end record;


   procedure Do_Passive_Open (
         Ucb : in out User_Control_Block);


   procedure Check_For_Message (
         Ucb     : in out User_Control_Block;
         Message :    out Boolean);
   -- **********************  USER SPECIFICATION  ***************************
   --
   -- Returns Message true if there is a message available from the transport 
   -- level.  A message is considered to be information originating at the 
   -- local transport level.
   --------------------------------------------------------------------------


   procedure Check_For_Input  (
         Ucb   : in out User_Control_Block;
         Input :    out Boolean);
   -- **********************  USER SPECIFICATION  ***************************
   --
   -- Returns Input true if there is data available from the remote TELNET.
   --------------------------------------------------------------------------


   procedure Get_Message (
         Ucb     : in out User_Control_Block;
         Message :    out Buffer_Area; 
         Size    :    out Buffer_Index); 
   -- **********************  USER SPECIFICATION  ***************************
   --
   -- This procedure returns the next message from the local transport level. 
   -- A message is considered to be information originating at the local 
   -- transport level.
   --------------------------------------------------------------------------


   procedure Get_Input (
         Ucb    : in out User_Control_Block;
         Input  :    out Eight_Bits; 
         Urgent :    out Boolean); 
   -- **********************  USER SPECIFICATION  ***************************
   --
   -- This procedure returns the next data item relayed from the remote
   -- telnet and indicates if it is urgent.
   --------------------------------------------------------------------------


   procedure Send_Data (
         Ucb    : in out User_Control_Block;
         Data   : in     Buffer_Area; 
         Size   : in     Buffer_Index;
         Urgent : in     Boolean); 
   -- **********************  USER SPECIFICATION  ***************************
   --
   -- This procedure sends data to the remote TELNET by presenting it to the
   -- local transport level as data and indicating if it is urgent. 
   --------------------------------------------------------------------------


   procedure Store_Message (
         Ucb     : in out User_Control_Block;
         Message : in     String);
   -- **********************  USER SPECIFICATION  ***************************
   --
   -- This procedure stores a string as a message to the transport level.
   --------------------------------------------------------------------------
         
   procedure Virtual_Service_Call (
         Ucb          : in out User_Control_Block;
         Service      : in     Virtual_Service_Type); 
   -- *************************  USER SPECIFICATION  ************************
   --
   -- The transport level service call is converted into the syntax
   -- for a call to the actual transport level and that service is
   -- requested.  The user's APL buffers and state information are used.
   --------------------------------------------------------------------------

end Virtual_Transport;
