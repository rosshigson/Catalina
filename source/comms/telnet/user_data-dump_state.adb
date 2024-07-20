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
with Debug_Io;
with Telnet_Types;
with Telnet_Options;

package body User_Data.Dump_State is

   use Ada.Streams;
   use Telnet_Types;

   procedure Dump_Transport_Data (
         Ucb : in     User_Control_Block) is 
   begin
      Debug_Io.Put_Line (' ');
      Debug_Io.Put_Line ("TRANSPORT LEVEL BUFFERS");
      Debug_Io.Put_Line ("-----------------------");

      declare
         Size      : Buffer_Index := Ucb.Transport_Data.Messages.Count;
         Out_Buf   : String (1 .. MAXIMUM_BUFFER_SIZE);  
         Out_Ptr   : Thirtytwo_Bits range 0 .. MAXIMUM_BUFFER_SIZE := 0;  
         Char_Byte : Eight_Bits;  
      begin
         Debug_Io.Put_Line (' ');
         Debug_Io.Put_Line ("MESSAGE BUFFER");
         Debug_Io.Put ("size =");
         Debug_Io.Put_Line (Size);
         for i in 0 .. Size - 1 loop
            Char_Byte := Ucb.Transport_Data.Messages.Peek (i);
            if Char_Byte >= 16#20# and Char_Byte < 16#7F# then
               Out_Ptr := Out_Ptr + 1;
               Out_Buf (Out_Ptr) := Character'Val (Char_Byte);
            else
               Debug_Io.Put (Out_Buf (1..Out_Ptr));
               Out_Ptr := 0;
               Debug_Io.Put ('<');
               Debug_Io.Put (Char_Byte);
               Debug_Io.Put ('>');
            end if;
         end loop;
         Debug_Io.Put_Line (Out_Buf (1..Out_Ptr));
      exception
         when E : others =>
            Debug_Io.Put_Exception ("DUMP_TRANSPORT_DATA (Message)", E);
            raise;
      end;

      declare
         Size      : Buffer_Index := Ucb.Transport_Data.Urgent_Data.Count;
         Out_Buf   : String (1 .. MAXIMUM_BUFFER_SIZE);  
         Out_Ptr   : Thirtytwo_Bits range 0 .. MAXIMUM_BUFFER_SIZE := 0;  
         Char_Byte : Eight_Bits;  
      begin
         Debug_Io.Put_Line (' ');
         Debug_Io.Put_Line ("URGENT DATA BUFFER");
         Debug_Io.Put ("size =");
         Debug_Io.Put_Line (Size);
         for i in 0 .. Size - 1 loop
            Char_Byte := Ucb.Transport_Data.Urgent_Data.Peek (i);
            if Char_Byte >= 16#20# and Char_Byte < 16#7F# then
               -- printable
               Out_Ptr := Out_Ptr + 1;
               Out_Buf (Out_Ptr) := Character'Val (Char_Byte);
            else
               Debug_Io.Put (Out_Buf (1 .. Out_Ptr));
               Out_Ptr := 0;
               Debug_Io.Put ('<');
               Debug_Io.Put (Char_Byte);
               Debug_Io.Put ('>');
            end if;
         end loop;
         Debug_Io.Put_Line (Out_Buf (1 .. Out_Ptr));
      exception
         when E : others =>
            Debug_Io.Put_Exception ("DUMP_TRANSPORT_DATA (Urgent Data)", E);
            raise;
      end;
      
      declare
         Size      : Buffer_Index := Ucb.Transport_Data.Normal_Data.Count;
         Out_Buf   : String (1 .. MAXIMUM_BUFFER_SIZE);  
         Out_Ptr   : Thirtytwo_Bits range 0 .. MAXIMUM_BUFFER_SIZE := 0;  
         Char_Byte : Eight_Bits;  
      begin
         Debug_Io.Put_Line (' ');
         Debug_Io.Put_Line ("NORMAL DATA BUFFER");
         Debug_Io.Put ("size =");
         Debug_Io.Put_Line(Size);
         for i in 0 .. Size - 1 loop
            Char_Byte := Ucb.Transport_Data.Normal_Data.Peek (i);
            if Char_Byte >= 16#20# and Char_Byte < 16#7F# then
               -- printable
               Out_Ptr := Out_Ptr + 1;
               Out_Buf (Out_Ptr) := Character'Val (Char_Byte);
            else
               Debug_Io.Put (Out_Buf (1 .. Out_Ptr));
               Out_Ptr := 0;
               Debug_Io.Put ('<');
               Debug_Io.Put (Char_Byte);
               Debug_Io.Put ('>');
            end if;
         end loop;
         Debug_Io.Put_Line (Out_Buf (1 .. Out_Ptr));
      exception
         when E : others =>
            Debug_Io.Put_Exception ("DUMP_TRANSPORT_DATA (Normal Data)", E);
            raise;
      end;
   end Dump_Transport_Data;


   procedure Dump_Telnet_Option_Tables (
         Ucb : in     User_Control_Block)
   is 

      procedure Dump_Items_In_Table (
            Table : in     Telnet_Options.Option_Array_Type)
      is 
      begin
         for Option in Option_Type loop
            if Table (Option) then
               Debug_Io.Put (" " & Option_Type'Image (Option) & " ");
            end if;
         end loop;
      end Dump_Items_In_Table;

   begin
      Debug_Io.Put_Line (' ');
      Debug_Io.Put_Line ("TELNET OPTION TABLES");
      Debug_Io.Put_Line ("--------------------");

      Debug_Io.Put_Line (' ');
      Debug_Io.Put ("local options desired : ");
      Dump_Items_In_Table (Ucb.Options.Local_Desired);
      Debug_Io.Put_Line (' ');

      Debug_Io.Put_Line (' ');
      Debug_Io.Put ("remote options desired : ");
      Dump_Items_In_Table (Ucb.Options.Remote_Desired);
      Debug_Io.Put_Line (' ');

      Debug_Io.Put_Line (' ');
      Debug_Io.Put ("local options pending : ");
      Dump_Items_In_Table (Ucb.Options.Local_Pending);
      Debug_Io.Put_Line (' ');

      Debug_Io.Put_Line (' ');
      Debug_Io.Put ("remote options pending : ");
      Dump_Items_In_Table (Ucb.Options.Remote_Pending);
      Debug_Io.Put_Line (' ');

      Debug_Io.Put_Line (' ');
      Debug_Io.Put ("local options in effect : ");
      Dump_Items_In_Table (Ucb.Options.Local_In_Effect);
      Debug_Io.Put_Line (' ');

      Debug_Io.Put_Line (' ');
      Debug_Io.Put ("remote options in effect : ");
      Dump_Items_In_Table (Ucb.Options.Remote_In_Effect);
      Debug_Io.Put_Line (' ');

      Debug_Io.Put_Line (' ');
      Debug_Io.Put ("local option count : ");
      Debug_Io.Put_Line (Ucb.Options.Local_Count);
      Debug_Io.Put_Line (' ');

      Debug_Io.Put_Line (' ');
      Debug_Io.Put ("remote option count : ");
      Debug_Io.Put_Line (Ucb.Options.Remote_Count);
      Debug_Io.Put_Line (' ');

   exception
      when E : others =>
         Debug_Io.Put_Exception ("DUMP_TELNET_OPTION_TABLES", E);
         raise;
   end Dump_Telnet_Option_Tables;


   procedure Dump_User_Control_Block (
         Ucb : in     User_Control_Block)
   is 
   begin
      Debug_Io.Put_Line (' ');
      Debug_Io.Put_Line ("USER CONTROL BLOCK.");
      Debug_Io.Put_Line ("------------------");
      Debug_Io.Put_Line (' ');

      declare -- partial command buffer
         Size      : Buffer_Index := Ucb.Partial_Command_Data.Count;
         Out_Buf   : String (1 .. MAXIMUM_BUFFER_SIZE);  
         Out_Ptr   : Thirtytwo_Bits range 0 .. MAXIMUM_BUFFER_SIZE := 0;  
         Char_Byte : Eight_Bits;  
      begin
         Debug_Io.Put_Line ("COMMAND BUFFER");
         Debug_Io.Put ("size = ");
         Debug_Io.Put_Line (Size);
         for i in 0 .. Size - 1 loop
            Char_Byte := Ucb.Partial_Command_Data.Peek (i);
            if Char_Byte >= 16#20# and Char_Byte < 16#7F# then
               -- printable
               Out_Ptr := Out_Ptr + 1;
               Out_Buf (Out_Ptr) := Character'Val (Char_Byte);
            else -- print ascii code #
               Debug_Io.Put (Out_Buf (1 .. Out_Ptr));
               Out_Ptr := 0;
               Debug_Io.Put ('<');
               Debug_Io.Put (Char_Byte);
               Debug_Io.Put ('>');
            end if;
         end loop;
         Debug_Io.Put_Line (Out_Buf (1 .. Out_Ptr));

      exception
         when E : others =>
            Debug_Io.Put_Exception ("DUMP_USER_CONTROL_BLOCK (Command)", E);
            raise;
      end;

      declare -- terminal data buffer
         Size      : Buffer_Index := Ucb.Terminal_Data.Count;
         Out_Buf   : String (1 .. MAXIMUM_BUFFER_SIZE);  
         Out_Ptr   : Thirtytwo_Bits range 0 .. MAXIMUM_BUFFER_SIZE := 0;  
         Char_Byte : Eight_Bits;  
      begin
         Debug_Io.Put_Line (' ');
         Debug_Io.Put_Line ("TERMINAL DATA BUFFER");
         Debug_Io.Put ("size =");
         Debug_Io.Put_Line (Size);
         for i in 0 .. Size - 1 loop
            Char_Byte := Ucb.Terminal_Data.Peek (i);
            if Char_Byte >= 16#20# and Char_Byte < 16#7F# then
               -- printable
               Out_Ptr := Out_Ptr + 1;
               Out_Buf (Out_Ptr) := Character'Val (Char_Byte);
            else
               Debug_Io.Put (Out_Buf (1 .. Out_Ptr));
               Out_Ptr := 0;
               Debug_Io.Put ('<');
               Debug_Io.Put (Char_Byte);
               Debug_Io.Put ('>');
            end if;
         end loop;
         Debug_Io.Put_Line (Out_Buf (1 .. Out_Ptr));
      exception
         when E : others =>
            Debug_Io.Put_Exception ("DUMP_USER_CONTROL_BLOCK (Data)", E);
            raise;
      end;

      -- state information
      Debug_Io.Put_Line (' ');
      Debug_Io.Put_Line ("STATE INFORMATION.");
      Debug_Io.Put_Line ("------------------");
      Debug_Io.Put_Line (' ');

      Debug_Io.Put_Line ("connected = " & Boolean'Image (Ucb.Connected));

      Debug_Io.Put_Line ("partial_command = "& Boolean'Image (Ucb.Partial_Command));

      Debug_Io.Put_Line ("ga_sent = " & Boolean'Image (Ucb.Ga_Sent));

      Debug_Io.Put_Line ("ga_received = " & Boolean'Image (Ucb.Ga_Received));

      Debug_Io.Put_Line ("synch_is_in_progress = " & Boolean'Image (Ucb.Synch_Is_In_Progress));

      Debug_Io.Put_Line ("escape_char = " & Eight_Bits'Image (Ucb.Escape_Char));

      Debug_Io.Put_Line ("last_normal_char_was_CR = " & Boolean'Image (Ucb.Last_Normal_Char_Was_CR));

      Debug_Io.Put_Line ("last_urgent_char_was_CR = " & Boolean'Image (Ucb.Last_Urgent_Char_Was_CR));

      Debug_Io.Put_Line ("terminal_name = "& Ucb.Terminal_Name.Name (1 .. Natural (Ucb.Terminal_Name.Size)));

      Debug_Io.Put ("debug = ");
      case Ucb.Debug is
         when Debug_None =>
            Debug_Io.Put_Line ("none");
         when Debug_Data =>
            Debug_Io.Put_Line ("data");
         when Debug_Options =>
            Debug_Io.Put_Line ("options");
         when Debug_Controls =>
            Debug_Io.Put_Line ("controls");
         when Debug_All =>
            Debug_Io.Put_Line ("all");
      end case;

   exception
      when E : others =>
         Debug_Io.Put_Exception ("DUMP_USER_CONTROL_BLOCK", E);
         raise;
   end Dump_User_Control_Block;



   procedure Dump_All (
         Ucb : in     User_Control_Block) is 
   begin
      Debug_Io.Put_Line (' ');
      Debug_Io.Put_Line (".................  dump all start  ...................");
      Debug_Io.Put_Line (' ');

      Dump_Transport_Data (Ucb);
      Dump_Telnet_Option_Tables (Ucb);
      Dump_User_Control_Block (Ucb);

      Debug_Io.Put_Line (' ');
      Debug_Io.Put_Line ("eeeeeeeeeeeeeeeee  dump all end  eeeeeeeeeeeeeeeeeeeee");
      Debug_Io.Put_Line (' ');
   exception
      when E : others =>
         Debug_Io.Put_Exception ("DUMP_ALL", E);
         raise;
   end Dump_All;

end User_Data.Dump_State;
