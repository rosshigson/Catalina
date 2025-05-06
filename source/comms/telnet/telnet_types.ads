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

with Ada.Streams;
with Sockets;
with Protection;

package Telnet_Types is

   use Ada.Streams;

   MAXIMUM_BUFFER_SIZE : constant := 4096;    -- maximum size of a datagram
                                              -- (must be >= 576)
                                              -- increased to 4096 for ESP8266 serial bridge

   DEFAULT_PORT        : constant := 23;     -- default port for Telnet

   DEFAULT_ESCAPE_CHAR : constant := Character'Pos (ASCII.GS); -- CTRL+]

   -- charcacter mode or line mode (in telnet, used to negotiate mode, but for
   -- the ESP8266 is used to override negotiations and force character mode)
   type Mode_Type is (
      Mode_None,           -- no mode set
      Mode_Character,      -- implies remote Suppress_Go_Ahead and remote Echo
      Mode_Line);          -- line mode
                      
   -- do not confuse this with the "Debug_Io" debugging - this type is used by telnet itself
   type Debug_Type is (
      Debug_None,          -- don't print debug messages or information
      Debug_Data,          -- print all data received or sent
      Debug_Options,       -- print messages about option negotiations
      Debug_Controls,      -- print messages about options and standard control functions
      Debug_All);          -- print all messages, and also output other debugging info

   subtype Port_Type       is Sockets.Port_Type;

   No_Port : constant Port_Type := Sockets.No_Port;
   
   subtype Channel_Type    is Sockets.Socket_Type;
   
   No_Channel : constant Channel_Type := Sockets.No_Socket;

   subtype Address_Type    is Sockets.Sock_Addr_Type;

   No_Address : constant Address_Type := Sockets.No_Sock_Addr;

   subtype Thirtytwo_Bits  is Integer; -- GNAT-specific
   subtype Sixteen_Bits    is Short_Integer; -- GNAT-specific
   subtype Eight_Bits      is Ada.Streams.Stream_Element;

   subtype Buffer_Type     is Ada.Streams.Stream_Element_Array; 

   subtype Buffer_Index    is Ada.Streams.Stream_Element_Offset;

   subtype Buffer_Area     is Buffer_Type (0 ..  MAXIMUM_BUFFER_SIZE - 1);

   -- The following causes problems when we try use the corresponding
   -- access type under GNAT 3.14:
   --
   -- type Signal_Type is new Protection.Semaphore;
   --
   -- so we do the following instead (and make some other internal changes):
   --
   type Signal_Type is record
      Signal : Protection.Semaphore (Auto_Reset => True, Once_Only => False);
   end record;

   type Signal_Access      is access all Signal_Type;

   CR     : constant Eight_Bits := Character'Pos (ASCII.CR);
   LF     : constant Eight_Bits := Character'Pos (ASCII.LF);
   BELL   : constant Eight_Bits := Character'Pos (ASCII.BEL);
   BS     : constant Eight_Bits := Character'Pos (ASCII.BS);
   DEL    : constant Eight_Bits := Character'Pos (ASCII.DEL);

   T_EOR  : constant Eight_Bits := 239; -- End of Record
   T_SE   : constant Eight_Bits := 240; -- End Subnegotiation parameters
   T_NOP  : constant Eight_Bits := 241; -- No operation
   T_DM   : constant Eight_Bits := 242; -- Data Mark
   T_BRK  : constant Eight_Bits := 243; -- Break
   T_IP   : constant Eight_Bits := 244; -- Interrupt Process
   T_AO   : constant Eight_Bits := 245; -- Abort Output
   T_AYT  : constant Eight_Bits := 246; -- Are You There
   T_EC   : constant Eight_Bits := 247; -- Erase Character
   T_EL   : constant Eight_Bits := 248; -- Erase Line
   T_GA   : constant Eight_Bits := 249; -- Go Ahead
   T_SB   : constant Eight_Bits := 250; -- Beginning Subnegotiation parameters
   T_WILL : constant Eight_Bits := 251; -- Will Do (see telnet_options)
   T_WONT : constant Eight_Bits := 252; -- Won't Do (see telnet_options)
   T_DO   : constant Eight_Bits := 253; -- Do (see telnet_options)
   T_DONT : constant Eight_Bits := 254; -- Don't (see telnet_options)
   T_IAC  : constant Eight_Bits := 255; -- interpret as command
   

end Telnet_Types;
