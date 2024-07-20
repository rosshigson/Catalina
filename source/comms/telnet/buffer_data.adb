-------------------------------------------------------------------------------
--             This file is part of the Ada Terminal Emulator                --
--               (Terminal_Emulator, Term_IO and Redirect)                   --
--                               package                                     --
--                                                                           --
--                             Version 0.6                                   --
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
with Debug_Io;

package body Buffer_Data is

   use Debug_Io;

   protected body Buffer_Manager is

      procedure Init is
         New_Buffer : Data_Buffer_Ptr;
      begin
         -- create NUMBER_OF_BUFFERS new buffers
         for I in 1 .. NUMBER_OF_BUFFERS loop
            New_Buffer := new Data_Buffer;
            New_Buffer.Free := True;
            New_Buffer.Next := Head;
            Head  := New_Buffer;
            Count := Count + 1;
         end loop;
         Debug_Io.Put ("BUFFER_DATA: THE NUMBER OF BUFFERS IS NOW ");
         Debug_Io.Put_Line (Count);
      exception
         when Storage_Error =>
            Debug_Io.Put_Line ("BUFFER_DATA: OUT OF ROOM TO INITIALIZE BUFFERS");
         when others =>
            Debug_Io.Put_Line ("BUFFER_DATA: ERROR IN INITIALIZE BUFFERS");
      end Init;

      procedure Free (Buffer : in out Data_Buffer_Ptr)
      is
      begin
         if Buffer.Free then
            Debug_Io.Put_Line ("BUFFER_DATA: FREE CALLED ON ALREADY FREE BUFFER");
         else
            Count := Count + 1;
            Debug_Io.Put ("BUFFER_DATA: FREEING A BUFFER. NUMBER OF FREE BUFFERS IS ");
            Debug_Io.Put_Line (Count);
            Buffer.Free := True;
            Buffer.Next := Head;
            Head := Buffer;
            Buffer := null; -- return a null pointer
         end if;
      exception
         when others =>
            Put_Line ("BUFFER_DATA: ERROR IN BUFFREE");
            Buffer := null;
      end Free;

      procedure Get (Buffer :    out Data_Buffer_Ptr)
      is
      begin
         Buffer := Head;
         if Head /= null then
            Head := Head.Next;
         end if;
         if Buffer /= null then
            Buffer.Free := False;
         else
            Debug_Io.Put_Line ("BUFFER_DATA: OUT_OF_FREE_BUFFERS");
         end if;
         if Count /= 0 then
            Count := Count - 1;
         end if;
         if Count /= 0 then
            Debug_Io.Put ("BUFFER_DATA: GETTING A BUFFER. NUMBER OF FREE BUFFERS IS ");
            Debug_Io.Put_Line (Count);
         else
            Debug_Io.Put_Line ("BUFFER_DATA: NO FREE BUFFERS ON BUFFER GET");
         end if;
      exception
         when others =>
            Debug_Io.Put_Line ("BUFFER_DATA: ERROR IN BUFFER GET");
            Buffer := null;
      end Get;

   end Buffer_Manager;

end Buffer_Data;

