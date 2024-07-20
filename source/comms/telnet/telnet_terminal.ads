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

with Telnet_Types;
with User_Data;
with Terminal_Emulator;

package Telnet_Terminal is

   use Telnet_Types;
   use Terminal_Emulator;

   -- The Virtual_Terminal type represents a Network Virtual Terminal, with a 
   -- keyboard for input and a printer (screen) for output.
   type Virtual_Terminal is private;

   
   -- Create : create a new virtual terminal. If the terminal doesn't exist 
   --          already, create and open a new one.
   procedure Create (
         VT   : in out Virtual_Terminal;
         Term : in     Access_Terminal := null);


   procedure Set_Default_Port (
         VT           : in out Virtual_Terminal;
         Default_Port : in     Natural);


   procedure Set_Escape_Char (
         VT          : in out Virtual_Terminal;
         Escape_Char : in     Natural);
         

   procedure Set_Terminal_Name (
         VT   : in out Virtual_Terminal;
         Name : in     String);

         
   procedure Set_Connection_Type (
         VT     : in out Virtual_Terminal;
         Active : in     Boolean);


   procedure Set_Host_Name (
         VT   : in out Virtual_Terminal;
         Name : in     String);

         
   procedure Set_Debug_Type (
         VT    : in out Virtual_Terminal;
         Debug : in     Debug_Type);

         
   procedure Start (
         VT : in out Virtual_Terminal);

   
   -- Close : close a virtual terminal when no longer needed   
   procedure Close (
         VT : in out Virtual_Terminal);
 

   -- Closed : return True if virtual terminal has been closed   
   function Closed (
         VT : in     Virtual_Terminal)
      return Boolean;
 
   -- Get_Ucb : get a virtual terminals user_control_block (null if not found).
   function Get_Ucb (
         VT : in     Virtual_Terminal)
      return User_Data.User_Control_Block;
        

   --**********************  USER SPECIFICATION  *******************************
   --
   -- This package implements the interface between telnet and the process
   --  using telnet. The interface is on a character by character basis and
   --  is buffered. The "user process" is referred to as the NVT (network
   --  virtual terminal) and could be an applications process (FTP,SMTP,etc)
   --  or a terminal-handler.
   --

   ---------------------  procedure specifications  ----------------------------

   --- telnet's side of the interface:

   function There_Is_Terminal_Input (
         VT : in     Virtual_Terminal) 
     return Boolean; 

   -- ***********************  USER SPECIFICATION  *************************
   --
   -- This function returns true if there are unprocessed characters in the
   -- NVT keyboard buffer.
   -------------------------------------------------------------------------



   procedure Get_Terminal_Input (
         VT   : in out Virtual_Terminal; 
         Char :    out Eight_Bits); 

   -- ***********************  USER SPECIFICATION  *************************
   --
   -- This procedure will return the next unprocessed character from the
   -- NVT keyboard buffer.
   -------------------------------------------------------------------------



   function Terminal_Will_Accept_Output (
         VT : in     Virtual_Terminal) 
     return Boolean; 

   -- ***********************  USER SPECIFICATION  *************************
   --
   -- This function returns true if there is room for a character in the
   -- NVT printer buffer.
   -------------------------------------------------------------------------


   procedure Output_To_Terminal (
         VT   : in out Virtual_Terminal; 
         Char : in     Eight_Bits); 

   -- ***********************  USER SPECIFICATION  *************************
   --
   -- This procedure will output a character to the NVT printer buffer.
   -- If there is no room in the buffer the character will be lost.
   -- It is the caller's responsibility to make sure there is room in the 
   -- buffer.
   -------------------------------------------------------------------------

private

   type Virtual_Terminal_Record;


   type Virtual_Terminal is access Virtual_Terminal_Record;


   task type Terminal_Reader_Type is
      
      entry Start (Identity : in Virtual_Terminal);

   end Terminal_Reader_Type;
   

   task type Telnet_Controller_Type is

      entry Start (VT : in     Virtual_Terminal);
      
   end Telnet_Controller_Type;
   

   type Virtual_Terminal_Record is record
      Ucb        : User_Data.User_Control_Block;
      Term       : Access_Terminal;
      Reader     : Terminal_Reader_Type;
      Key_Data   : User_Data.Data_Buffer_Type;
      Controller : Telnet_Controller_Type;
   end record;

end Telnet_Terminal;

