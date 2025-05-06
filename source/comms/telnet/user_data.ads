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
with Telnet_Options;
with Protected_Buffer;
with Actual_Transport;

package User_Data is

   use Telnet_Types;
   use Telnet_Options;

   -- **********************  USER SPECIFICATION  ****************************
   -- 
   -- This package contains the defintions of the option tables, user buffers
   -- and state information. 
   -- 
   -- ************************************************************************

   type Name_Type (MAX : Thirtytwo_Bits) is 
      record
         Name : String (1 .. MAX) := (others => ' ');
         Size : Natural := 0;
      end record;

   package Protected_Data_Buffer 
   is new Protected_Buffer (
      Eight_Bits,
      Buffer_Index,
      Buffer_Type,
      MAXIMUM_BUFFER_SIZE);

   type Data_Buffer_Type is new Protected_Data_Buffer.Buffer_Type;

   type Transport_Buffers_Type is 
      record 
         Messages    : Data_Buffer_Type;  
         Normal_Data : Data_Buffer_Type;
         Urgent_Data : Data_Buffer_Type;
      end record; 


   type Control_Block_Type is -- (contains state information etc. for a user)
      record 
         Port                    : Port_Type                         := DEFAULT_PORT;
         Active                  : Boolean                           := False;  
         Mode                    : Mode_Type                         := Mode_None;
         Debug                   : Debug_Type                        := Debug_None;
         Transport               : Actual_Transport.Transport_Type;
         Signal                  : aliased Signal_Type; 
         -- Signal                  : aliased Signal_Type (Auto_Reset => True, Once_Only => True); 
         Connected               : Boolean                           := False;  
         Ga_Sent                 : Boolean                           := False;
         Ga_Received             : Boolean                           := False;
         Synch_Is_In_Progress    : Boolean                           := False;
         Escape_Char             : Eight_Bits                        := DEFAULT_ESCAPE_CHAR;
         Last_Normal_Char_Was_CR : Boolean                           := False;
         Last_Urgent_Char_Was_CR : Boolean                           := False;
         CR_To_CRLF_On_Output    : Boolean                           := False;
         CR_To_CRLF_On_Input     : Boolean                           := False;
         Partial_Command         : Boolean                           := False;  
         Partial_Command_Data    : Data_Buffer_Type;  
         Terminal_Data           : Data_Buffer_Type;  
         Terminal_Name           : Name_Type (40)                    := 
            (Max => 40, Name => "UNKNOWN                                 ", Size =>7);
         Host_Name               : Name_Type (255);
         Options                 : Option_Tables_Type;  
         Transport_Data          : Transport_Buffers_Type;  
      end record;

   type User_Control_Block is access Control_Block_Type; 


   -------------------------------------------------------
   -- state information manipulation functions/procedures:
   -------------------------------------------------------
   
   procedure Initialize (
         Ucb : in out User_Control_Block); 
   

   procedure Wait (
         Ucb : in out User_Control_Block);
   

   procedure Signal (
         Ucb : in out User_Control_Block);


end User_Data;
