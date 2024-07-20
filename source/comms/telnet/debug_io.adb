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
-- with Text_Io;
with Term_IO;

package body Debug_Io is

   package Text_IO renames Term_IO; use Term_Io;

   Debug_Filename              : constant String (1 .. 13)  := "DEBUGFILE.TXT";  
   Debug_Output_File           :          Text_Io.File_Type;  
   Output_File                 :          Text_Io.File_Mode := Text_Io.Out_File;  
   The_Debug_Disk_File_Is_Open :          Boolean           := False;  

   package Count_Io     is new Text_Io.Integer_Io (Buffer_Index);
   package Sixteen_Io   is new Text_Io.Integer_Io (Sixteen_Bits);
   package Thirtytwo_Io is new Text_Io.Integer_Io (Thirtytwo_Bits);
   package Eight_Io     is new Text_Io.Modular_Io (Eight_Bits);

   procedure Put_Exception (
      Text    : in     String;
      E       : in     Ada.Exceptions.Exception_Occurrence)
   is
   begin
      Text_IO.Put_Line (Text & " : " & Exception_Name (E) & ": " & Exception_Message (E));
   end Put_Exception;


   procedure Screening_Put (
         Item : in     Character)
   is 
   begin
      if Item = Ascii.Cr then
         Text_Io.Put ("<CR>"); -- display logical cr so won't mess up printer
      else
         Text_Io.Put (Item);
      end if;
   exception
      when E : others =>
         Debug_Io.Put_Exception ("SCREENING_PUT", E);
         raise;
   end Screening_Put;


   procedure Screening_Put (
         Debug_File : in     Text_Io.File_Type; 
         Item       : in     Character)
   is 
   begin
      if Item = Ascii.Cr then
         Text_Io.Put (Debug_File, "<CR>");
         -- display logical cr so won't 
      else
         Text_Io.Put (Debug_File, Item);
      end if;
   exception
      when E : others =>
         Debug_Io.Put_Exception ("SCREENING_PUT (File)", E);
         raise;
   end Screening_Put;


   procedure Put (
         Item : in     Character)
   is 
   begin
      case Destination is
         when Crt_Only =>
            Screening_Put (Item);
         when Debug_Disk_File_Only =>
            Screening_Put (Debug_Output_File, Item);
         when Crt_And_Disk =>
            Screening_Put (Item);
            Screening_Put (Debug_Output_File, Item);
         when None =>
            null;
      end case;
   exception
      when E : others =>
         Debug_Io.Put_Exception ("PUT (Character)", E);
         raise;
   end Put;


   procedure Put (
         Item : in     String)
   is 
      Buf : String (1 .. 4 * Item'Length);       -- arbitrary length (allow for "expansion") 

      Buf_Ptr : Thirtytwo_Bits range 0 .. 4 * Item'Length := 0;  
   begin
      -- Calls to text_io are expensive, do processing here to reduce calls
      -- by printing strings and not individual characters.
      if Destination = None then
         return;
      end if;
      for Index in Item'range loop -- check for printer control char
         if Item (Index) = Ascii.Cr then -- replace ASCII.CR with "<CR>"
            Buf (Buf_Ptr + 1 .. Buf_Ptr + 4) := "<CR>";
            Buf_Ptr := Buf_Ptr + 4;
         else
            Buf_Ptr := Buf_Ptr + 1;
            Buf (Buf_Ptr) := Item (Index);
         end if;
      end loop;
      if Buf_Ptr > 0 then
         declare
            -- handle strings > 132 so text_io does not get constraint error

            Start : Thirtytwo_Bits := 1;  
            Stop  : Thirtytwo_Bits := 79;  
         begin
            loop
               if Stop > Buf_Ptr then
                  case Destination is
                     when Crt_Only =>
                        Text_IO.Put (Buf (Start .. Buf_Ptr));
                     when Debug_Disk_File_Only =>
                        Text_Io.Put (Debug_Output_File, Buf (Start .. Buf_Ptr));
                     when Crt_And_Disk =>
                        Text_Io.Put (Buf (Start .. Buf_Ptr));
                        Text_Io.Put (Debug_Output_File, Buf (Start .. Buf_Ptr));
                     when None =>
                        null;
                  end case;
                  exit;
               else
                  case Destination is
                     when Crt_Only =>
                        Text_Io.Put_Line (Buf (Start .. Stop));
                     when Debug_Disk_File_Only =>
                        Text_Io.Put_Line (Debug_Output_File, Buf (Start .. Stop));
                     when Crt_And_Disk =>
                        Text_Io.Put_Line (Buf (Start .. Stop));
                        Text_Io.Put_Line (Debug_Output_File, Buf (Start .. Stop));
                     when None =>
                        null;
                  end case;
                  Start := Start + 79;
                  Stop := Stop + 79;
               end if; -- < 79 characters ?
            end loop;
         end;
      end if; 
   exception
      when E : others =>
          Debug_Io.Put_Exception ("PUT (String)", E);
         raise;
   end Put;


   procedure Put (
         Item : in     Sixteen_Bits)
   is 
   begin
      case Destination is
         when Crt_Only =>
            Sixteen_Io.Put (Item);
         when Debug_Disk_File_Only =>
            Sixteen_Io.Put (Debug_Output_File, Item);
         when Crt_And_Disk =>
            Sixteen_Io.Put (Item);
            Sixteen_Io.Put (Debug_Output_File, Item);
         when None =>
            null;
      end case;
   exception
      when E : others =>
         Debug_Io.Put_Exception ("PUT (Sixteen)", E);
         raise;
   end Put;

   procedure Put (
         Item : in     Thirtytwo_Bits)
   is 
   begin
      case Destination is
         when Crt_Only =>
            Thirtytwo_Io.Put (Item);
         when Debug_Disk_File_Only =>
            Thirtytwo_Io.Put (Debug_Output_File, Item);
         when Crt_And_Disk =>
            Thirtytwo_Io.Put (Item);
            Thirtytwo_Io.Put (Debug_Output_File, Item);
         when None =>
            null;
      end case;
   exception
      when E : others =>
         Debug_Io.Put_Exception ("PUT (Thirtytwo)", E);
         raise;
   end Put;

   procedure Put (
         Item : in     Buffer_Index)
   is 
   begin
      case Destination is
         when Crt_Only =>
            Count_Io.Put (Item);
         when Debug_Disk_File_Only =>
            Count_Io.Put (Debug_Output_File, Item);
         when Crt_And_Disk =>
            Count_Io.Put (Item);
            Count_Io.Put (Debug_Output_File, Item);
         when None =>
            null;
      end case;
   exception
      when E : others =>
         Debug_Io.Put_Exception ("PUT (Buffer_Index)", E);
         raise;
   end Put;


   procedure Put (
         Item : in     Eight_Bits)
   is 
   begin
      case Destination is
         when Crt_Only =>
            Eight_Io.Put (Item);
         when Debug_Disk_File_Only =>
            Eight_Io.Put (Debug_Output_File, Item);
         when Crt_And_Disk =>
            Eight_Io.Put (Item);
            Eight_Io.Put (Debug_Output_File, Item);
         when None =>
            null;
      end case;
   exception
      when E : others =>
         Debug_Io.Put_Exception ("PUT (Eight)", E);
         raise;
   end Put;


   procedure Put_Line (
         Item : in     Character)
   is 
   begin
      Put (Item);
      case Destination is
         when Crt_Only =>
            Text_Io.New_Line;
         when Debug_Disk_File_Only =>
            Text_Io.New_Line (Debug_Output_File);
         when Crt_And_Disk =>
            Text_Io.New_Line;
            Text_Io.New_Line (Debug_Output_File);
         when None =>
            null;
      end case;
   exception
      when E : others =>
         Debug_Io.Put_Exception ("PUT_LINE (Character)", E);
         raise;
   end Put_Line;


   procedure Put_Line (
         Item : in     String)
   is 
   begin
      if Destination = None then
         return;
      end if;
      Put (Item);
      case Destination is
         when Crt_Only =>
            Text_Io.New_Line;
         when Debug_Disk_File_Only =>
            Text_Io.New_Line (Debug_Output_File);
         when Crt_And_Disk =>
            Text_Io.New_Line;
            Text_Io.New_Line (Debug_Output_File);
         when None =>
            null;
      end case;
   exception
      when E : others =>
         Debug_Io.Put_Exception ("PUT_LINE (String)", E);
         raise;
   end Put_Line;


   procedure Put_Line (
         Item : in     Sixteen_Bits)
   is 
   begin
      case Destination is
         when Crt_Only =>
            Sixteen_Io.Put (Item);
            Text_Io.New_Line;
         when Debug_Disk_File_Only =>
            Sixteen_Io.Put (Debug_Output_File, Item);
            Text_Io.New_Line (Debug_Output_File);
         when Crt_And_Disk =>
            Sixteen_Io.Put (Item);
            Sixteen_Io.Put (Debug_Output_File, Item);
            Text_Io.New_Line;
            Text_Io.New_Line (Debug_Output_File);
         when None =>
            null;
      end case;
   exception
      when E : others =>
         Debug_Io.Put_Exception ("PUT_LINE (Sixteen)", E);
         raise;
   end Put_Line;

   procedure Put_Line (
         Item : in     Thirtytwo_Bits)
   is 
   begin
      case Destination is
         when Crt_Only =>
            Thirtytwo_Io.Put (Item);
            Text_Io.New_Line;
         when Debug_Disk_File_Only =>
            Thirtytwo_Io.Put (Debug_Output_File, Item);
            Text_Io.New_Line (Debug_Output_File);
         when Crt_And_Disk =>
            Thirtytwo_Io.Put (Item);
            Thirtytwo_Io.Put (Debug_Output_File, Item);
            Text_Io.New_Line;
            Text_Io.New_Line (Debug_Output_File);
         when None =>
            null;
      end case;
   exception
      when E : others =>
         Debug_Io.Put_Exception ("PUT_LINE (Thirtytwo)", E);
         raise;
   end Put_Line;

   procedure Put_Line (
         Item : in     Buffer_Index)
   is 
   begin
      case Destination is
         when Crt_Only =>
            Count_Io.Put (Item);
            Text_Io.New_Line;
         when Debug_Disk_File_Only =>
            Count_Io.Put (Debug_Output_File, Item);
            Text_Io.New_Line (Debug_Output_File);
         when Crt_And_Disk =>
            Count_Io.Put (Item);
            Count_Io.Put (Debug_Output_File, Item);
            Text_Io.New_Line;
            Text_Io.New_Line (Debug_Output_File);
         when None =>
            null;
      end case;
   exception
      when E : others =>
         Debug_Io.Put_Exception ("PUT_LINE (Buffer_Index)", E);
         raise;
   end Put_Line;


   procedure Put_Line (
         Item : in     Eight_Bits)
   is 
   begin
      case Destination is
         when Crt_Only =>
            Eight_Io.Put (Item);
            Text_Io.New_Line;
         when Debug_Disk_File_Only =>
            Eight_Io.Put (Debug_Output_File, Item);
            Text_Io.New_Line (Debug_Output_File);
         when Crt_And_Disk =>
            Eight_Io.Put (Item);
            Eight_Io.Put (Debug_Output_File, Item);
            Text_Io.New_Line;
            Text_Io.New_Line (Debug_Output_File);
         when None =>
            null;
      end case;
   exception
      when E : others =>
         Debug_Io.Put_Exception ("PUT_LINE (Eight)", E);
         raise;
   end Put_Line;


   procedure Open_Debug_Disk_File
   is 
   begin
      Text_Io.Create (Debug_Output_File, Output_File, Debug_Filename);
      The_Debug_Disk_File_Is_Open := True;
   exception
      when E : others =>
         Debug_Io.Put_Exception ("OPEN_DEBUG_DISK_FILE", E);
         raise;
   end Open_Debug_Disk_File;


   procedure Close_Debug_Disk_File
   is 
   begin
      Text_Io.Close (Debug_Output_File);
      The_Debug_Disk_File_Is_Open := False;
   exception
      when E : others =>
         Debug_Io.Put_Exception ("CLOSE_DEBUG_DISK_FILE", E);
         raise;
   end Close_Debug_Disk_File;


   function Debug_Disk_File_Is_Open return Boolean
   is 
   begin
      return The_Debug_Disk_File_Is_Open;
   end Debug_Disk_File_Is_Open;


end Debug_Io;

