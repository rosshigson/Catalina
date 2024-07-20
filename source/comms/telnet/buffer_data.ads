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

package Buffer_Data is

   use Telnet_Types;

   NUMBER_OF_BUFFERS : constant := 20; -- arbitrary, but must be > 3

   type Data_Buffer;

   type Data_Buffer_Ptr is access Data_Buffer; 

   type Data_Buffer is 
      record 
         Free  : Boolean           := False; -- used to avoid freeing free buffer
         Data  : Buffer_Area;  
         Size  : Buffer_Index;  
         Next  : Data_Buffer_Ptr;  
      end record;

   protected Buffer_Manager 
   is
      -- This subprogram is called when the system is intialize to
      -- create a finite number of buffers.
      procedure Init;
      
      -- This subprogram frees a buffer to be used again.
      -- Change buffer status to free and place it on a free list
      -- of buffers.
      procedure Free (Buffer   : in out Data_Buffer_Ptr);
      
      -- This subprogram obtains a buffer to be used.
      procedure Get  (Buffer   :    out Data_Buffer_Ptr);
      
   private
      Count : Thirtytwo_Bits  := 0;  
      Head  : Data_Buffer_Ptr := null;    -- The pointer to the head of the buffer free  

   end Buffer_Manager;

end Buffer_Data;
     

