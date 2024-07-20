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
with Ada.Exceptions;

package Debug_Io is

   use Telnet_Types;
   use Ada.Exceptions;

   procedure Put_Exception (
      Text    : in     String;
      E       : in     Ada.Exceptions.Exception_Occurrence);

   procedure Put (
         Item : in     Character); 

   procedure Put (
         Item : in     String); 

   procedure Put (
         Item : in     Buffer_Index); 

   procedure Put (
         Item : in     Sixteen_Bits); 

   procedure Put (
         Item : in     ThirtyTwo_Bits); 

   procedure Put (
         Item : in     Eight_Bits); 

   procedure Put_Line (
         Item : in     Character); 

   procedure Put_Line (
         Item : in     String); 

   procedure Put_Line (
         Item : in     Buffer_Index); 

   procedure Put_Line (
         Item : in     Sixteen_Bits); 

   procedure Put_Line (
         Item : in     ThirtyTwo_Bits); 

   procedure Put_Line (
         Item : in     Eight_Bits); 

   procedure Open_Debug_Disk_File; 

   procedure Close_Debug_Disk_File; 

   function Debug_Disk_File_Is_Open return Boolean; 

   -- user could store existing destination, set his own temporary one, and
   -- restore the origional destination at any point to redirect debug info.
   -- NOTE : ATTEMPTING TO WRITE TO THE DISK FILE WHEN IT IS NOT OPEN IS ERRONEOUS.

   type Debug_Destination_Type is 
         (None,                 
          Crt_Only,             
          Debug_Disk_File_Only, 
          Crt_And_Disk); 

   Destination : Debug_Destination_Type := None;  

end Debug_Io;

