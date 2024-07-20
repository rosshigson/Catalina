-------------------------------------------------------------------------------
--             This file is part of the Ada Terminal Emulator                --
--               (Terminal_Emulator, Term_IO and Redirect)                   --
--                               package                                     --
--                                                                           --
--                             Version 2.2                                   --
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

with System;
with Ada.Streams;
with Buffer_Data;
with Debug_Io;
with Telnet_Package;
with Telnet_Options;
with Terminal_Types;
with User_Data.Dump_State;
with Sockets; -- for open
with Virtual_Transport; -- for open

package body Telnet_Terminal is

   use Ada.Streams;

   use Terminal_Types;
   use Terminal_Emulator;
   use User_Data;
   use Telnet_Options;
   use Buffer_Data;
   use User_Data.Dump_State;

   CRLF : constant String := ASCII.CR & ASCII.LF;


   -- *************************  BODY SPECIFICATION  ***************************
   --
   -- This package manages buffers which are tied to the process/user terminal
   -- "I/O" device.  For example, keyboard input is stored in the keyboard_
   -- input_buffer.  Then, the Presentation Protocol Layer can retrieve
   -- characters from that buffer and pass them back to the Application Protocol
   -- Layer when that layer asks for the characters.  Similar processing
   -- occurs for the printer_output_buffer.  The APL could ask the PPL to send
   -- a character out to the NVT_printer; the PPL would put the character into
   -- the printer_output_buffer and this character would eventually be
   -- "printed" on the nvt printer.  Also procedures exist to store and retrieve
   -- these buffers in their entirety.
   --
   -- **************************************************************************

   task body Terminal_Reader_Type is
      Myself : Virtual_Terminal;
      Ch     : Character;
      Ready  : Boolean;
   begin
      loop
         accept Start (Identity : in Virtual_Terminal)
         do
            Myself := Identity;
         end Start;
         loop
            if Closed (Myself.Term.all) then
               exit;
            else
               begin
                  Terminal_Emulator.Get (Myself.Term.all, Ch);
                  If not Myself.Key_Data.Full then
                     Myself.Key_Data.Put_Last (Character'Pos (Ch));
                     loop
                        Terminal_Emulator.Peek (Myself.Term.all, Ch, Ready);
                        exit when not Ready or Myself.Key_Data.Full;
                        Terminal_Emulator.Get (Myself.Term.all, Ch);
                        Myself.Key_Data.Put_Last (Character'Pos (Ch));
                     end loop;
                     Signal (Myself.Ucb);
                  else
                     -- TBD : for now just lose it
                     null;
                  end if;
               exception
                  when others =>
                     exit;
               end;
            end if;
         end loop;
      end loop;
   end Terminal_Reader_Type;


   task body Telnet_Controller_Type is

      MyVT         : Virtual_Terminal;
      MyUcb        : User_Control_Block;
      Open_Address : Address_Type := No_Address;
      NameOk       : Boolean;

   begin
      Buffer_Manager.Init;

      accept Start (VT : in     Virtual_Terminal)
      do
         MyVT := VT;
      end Start;

      MyUcb := Get_Ucb (MyVT);

      if MyUcb.Active then
         -- set default option negotiation for active terminals
         Telnet_Package.Request_Remote_To_Do_Option (Suppress_Go_Ahead, MyVT);
         Telnet_Package.Request_To_Do_Option (Suppress_Go_Ahead, MyVT);
         Telnet_Package.Request_Remote_To_Do_Option (Echo, MyVT);
         Telnet_Package.Request_To_Do_Option (Terminal_Type, MyVT);
         -- Telnet_Package.Request_Remote_To_Do_Option (Binary_Transmission, MyVT);
         -- Telnet_Package.Request_To_Do_Option (Binary_Transmission, MyVT);
         Telnet_Package.Request_Remote_To_Do_Option (Status, MyVT);
         Telnet_Package.Request_To_Do_Option (Status, MyVT);
      else
         -- set default option negotiation for passive terminals
         Telnet_Package.Request_Remote_To_Do_Option (Suppress_Go_Ahead, MyVT);
         Telnet_Package.Request_To_Do_Option (Suppress_Go_Ahead, MyVT);
         Telnet_Package.Request_Remote_To_Do_Option (Terminal_Type, MyVT);
         Telnet_Package.Request_To_Do_Option (Echo, MyVT);
         -- Telnet_Package.Request_Remote_To_Do_Option (Binary_Transmission, MyVT);
         -- Telnet_Package.Request_To_Do_Option (Binary_Transmission, MyVT);
      end if;

      if MyUcb.Active and MyUcb.Host_Name.Size /= 0 then
         Debug_Io.Put_Line ("attempting automatic open");
         begin
            -- see if host name is a raw IP address
            Open_Address.Addr := Sockets.Inet_Addr (
               MyUcb.Host_Name.Name (1 .. Natural (MyUcb.Host_Name.Size)));
            NameOk := True;
         exception
            when others =>
               NameOk := False;
         end;
         if not NameOk then
            -- else look it up by name
            begin
               Open_Address.Addr := Sockets.Addresses (
                  Sockets.Get_Host_By_Name (
                     MyUcb.Host_Name.Name (1 .. Natural (MyUcb.Host_Name.Size))));
               NameOk := True;
            exception
               when others =>
                  NameOk := False;
            end;
         end if;
         if NameOk then
            Open_Address.Port := MyUcb.Port;
         end if;
         Debug_Io.Put_Line ("opening ... " & Sockets.Image (Open_Address));
         declare
            Virtual_Open : Virtual_Transport.Virtual_Service_Type (Virtual_Transport.Virtual_Open);
         begin
            Virtual_Open.Address := Open_Address;
            Virtual_Transport.Virtual_Service_Call (MyUcb, Virtual_Open);
         exception
            when E : others =>
               Debug_Io.Put_Exception ("AUTOMATIC_OPEN", E);
         end;
         Debug_Io.Put_Line ("end automatic open" & Sockets.Image (Open_Address));
      end if;

      Debug_Io.Put_Line ("<<<<<<<  INITIAL STATE OF TELNET  >>>>>>>>>");
      Dump_All (MyUcb);

      Debug_Io.Put_Line ("beginning calls to telnet");

      loop

         Debug_Io.Put_Line (" ");
         Debug_Io.Put (".................. calling telnet ..................");
         Debug_Io.Put_Line (" ");


         Telnet_Package.Telnet (MyVT); -- perform telnet processing

         Debug_Io.Put_Line (" ");
         Debug_Io.Put ("................ end call to telnet ................");
         Debug_Io.Put_Line (" ");

         Dump_All (MyUcb);

         Wait (MyUcb); -- wait for message/data from terminal or transport

      end loop;
   exception
      when E : others =>
         Debug_Io.Put_Exception ("TELNET_TASK", E);
   end Telnet_Controller_Type;


   procedure Create (
         VT   : in out Virtual_Terminal;
         Term : in     Access_Terminal := null)
   is
   begin
      if VT = null then
         VT := new Virtual_Terminal_Record;
         VT.Ucb := new Control_Block_Type;
      end if;
      if VT.Term /= null and then Term /= null then
         Terminal_Emulator.Close (VT.Term.all);
      end if;
      if Term /= null then
         VT.Term := Term;
      else
         VT.Term := new Terminal_Emulator.Terminal;
      end if;
      Terminal_Emulator.Open (VT.Term.all);
      -- bump up terminal task priority so it is higher than the telnet tasks
      Terminal_Emulator.SetPriority(VT.Term.all, System.Default_Priority + 1);
      VT.Reader.Start (VT);
      -- reset the user control block and keyboard buffer
      User_Data.Initialize (VT.Ucb);
      VT.Key_Data.Reset;
      -- reset terminal window options
      Terminal_Emulator.SetMenuOptions (
         VT.Term.all,
         AdvancedMenu => Yes);
      Terminal_Emulator.SetEditingOptions (
         VT.Term.all,
         Echo => No);
   end Create;


   procedure Set_Default_Port (
         VT           : in out Virtual_Terminal;
         Default_Port : in     Natural)
   is
   begin
      if VT /= null and then VT.Ucb /= null then
         VT.Ucb.Port := Port_Type (Default_Port);
      end if;
   end Set_Default_Port;


   procedure Set_Escape_Char (
         VT          : in out Virtual_Terminal;
         Escape_Char : in     Natural)
   is
   begin
      if VT /= null and then VT.Ucb /= null then
         VT.Ucb.Escape_Char := Eight_Bits (Escape_Char);
      end if;
   end Set_Escape_Char;


   procedure Set_Terminal_Name (
         VT   : in out Virtual_Terminal;
         Name : in     String)
   is
      Size : Natural;
   begin
      if VT /= null and then VT.Ucb /= null then
         Size := Natural'Min (VT.Ucb.Terminal_Name.Name'Length, Name'Length);
         VT.Ucb.Terminal_Name.Size := Size;
         VT.Ucb.Terminal_Name.Name (1 .. Size) := Name (Name'First .. Name'First + Size - 1);
      end if;
   end Set_Terminal_Name;


   procedure Set_Connection_Type (
         VT     : in out Virtual_Terminal;
         Active : in     Boolean)
   is
   begin
      if VT /= null and then VT.Ucb /= null then
         VT.Ucb.Active := Active;
      end if;
   end Set_Connection_Type;


   procedure Set_Host_Name (
         VT   : in out Virtual_Terminal;
         Name : in     String)
   is
      Size : Natural;
   begin
      if VT /= null and then VT.Ucb /= null then
         Size := Natural'Min (VT.Ucb.Host_Name.Name'Length, Name'Length);
         VT.Ucb.Host_Name.Size := Size;
         VT.Ucb.Host_Name.Name (1 .. Size) := Name (Name'First .. Name'First + Size - 1);
      end if;
   end Set_Host_Name;


   procedure Set_Debug_Type (
         VT    : in out Virtual_Terminal;
         Debug : in     Debug_Type)
   is
   begin
      if VT /= null and then VT.Ucb /= null then
         VT.Ucb.Debug := Debug;
         if Debug = Debug_All then
            -- Debug_Io.Destination := Debug_Io.None;
            Debug_Io.Destination := Debug_Io.Crt_Only;
            -- Debug_Io.Destination := Debug_Io.Crt_And_Disk;
            -- Debug_Io.Open_Debug_Disk_File;
         end if;
      end if;
   end Set_Debug_Type;


   procedure Start (
         VT : in out Virtual_Terminal)
   is
   begin
      if VT /= null and then VT.Ucb /= null then
         if VT.Ucb.Escape_Char /= 0 then
            Terminal_Emulator.Put ( VT.Term.all, CRLF & "Escape character is ");
            if VT.Ucb.Escape_Char < 16#40# then
               Terminal_Emulator.Put (
                  VT.Term.all,
                  "^" & Character'Val (VT.Ucb.Escape_Char + 16#40#) & CRLF & CRLF);
            else
               Terminal_Emulator.Put (
                  VT.Term.all,
                  Character'Val (VT.Ucb.Escape_Char) & CRLF & CRLF);
            end if;
         else
            Terminal_Emulator.Put ( VT.Term.all, CRLF & "Escape character disabled " & CRLF & CRLF);
         end if;
         VT.Controller.Start (VT);
      end if;
   end Start;


   procedure Close (
         VT : in out Virtual_Terminal)
   is
   begin
      if VT /= null and then VT.Ucb /= null then
         Terminal_Emulator.Close (VT.Term.all);
         User_Data.Initialize (VT.Ucb);
         VT.Key_Data.Reset;
      end if;
   end Close;


   -- Closed : return True if virtual terminal has been closed
   function Closed (
         VT   : in     Virtual_Terminal)
      return Boolean
   is
   begin
      if VT /= null then
         return Terminal_Emulator.Closed (VT.Term.all);
      else
         return True;
      end if;
   end Closed;


   function Get_Ucb (
         VT   : in     Virtual_Terminal)
      return User_Control_Block
   is
   begin
      if VT /= null  then
         return VT.Ucb;
      else
         return null;
      end if;
   end Get_Ucb;


   function There_Is_Terminal_Input (
         VT : in     Virtual_Terminal)
     return Boolean
   is
   begin
      if VT /= null then
         return not VT.Key_Data.Empty;
      end if;
      return False;
   end There_Is_Terminal_Input;


   procedure Get_Terminal_Input (
         VT   : in out Virtual_Terminal;
         Char :    out Eight_Bits)
   is
      Temp_Char : Eight_Bits := 0;
   begin
      if VT /= null then
         VT.Key_Data.Get_First (Temp_Char);
      end if;
      Char := Temp_Char;
   end Get_Terminal_Input;


   function Terminal_Will_Accept_Output (
         VT : in     Virtual_Terminal)
     return Boolean
   is
   begin
      if VT /= null then
         return not Terminal_Emulator.Closed (VT.Term.all);
      else
         return False;
      end if;
   end Terminal_Will_Accept_Output;


   procedure Output_To_Terminal (
         VT   : in out Virtual_Terminal;
         Char : in     Eight_Bits)
   is
   begin
      if VT /= null then
         Terminal_Emulator.Put (VT.Term.all, Character'Val (Char));
      end if;
   end Output_To_Terminal;


end Telnet_Terminal;
