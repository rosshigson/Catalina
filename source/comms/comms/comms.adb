-------------------------------------------------------------------------------
--             This file is part of the Ada Terminal Emulator                --
--               (Terminal_Emulator, Term_IO and Redirect)                   --
--                               package                                     --
--                                                                           --
--                             Version 2.9                                   --
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
with Ada.Command_Line;
with Interfaces.C;
with Ada.Strings.Maps;
with Ada.Strings.Maps.Constants;
with Ada.Strings.Fixed;
with Ada.Real_Time;
with Terminal_Types;
with Terminal_Emulator;
with Terminal_Emulator.Option_Parser;

with Win32;
with Win32.Winnt;
with Win32.Winbase;
with Win32_Support;

with Protection;

function Comms return Integer is

   use Terminal_Types;
   use Terminal_Emulator;
   use Win32.Winbase;
   use Ada.Strings.Fixed;
   use Ada.Strings.Maps;
   use Ada.Strings.Maps.Constants;
   use Ada.Real_Time;

   use type Win32.BOOL;
   use type Win32.DWORD;
   use type Win32.BYTE;
   use type System.Address;
   use type Interfaces.C.unsigned_short;

   package OP  renames Terminal_Emulator.Option_Parser;
   package ACL renames Ada.Command_Line;
   package IC  renames Interfaces.C;
   package WS  renames Win32_Support;
   package WNT renames Win32.Winnt;

   -- Notes on Comms:
   -- ==================
   --
   -- The "Comms" program is intended to allow the use of a comms
   -- port (e.g. COM1) as a the input and output to a terminal
   -- window. It adds new communications related options:
   -- "/com", "/baud", "/stopbits", "/databits", "/parity",
   -- "/rts", "/dtr", "/cts", "/dsr", "/xin", "/xout"
   --
   -- For example, try:
   --
   --    comms /virtualrows=5000 /fg=yellow /bg=green /port=1
   --
   -- The comms terminal window has full access to the terminal
   -- capabilities provided by the Terminal_Emulator program, and
   -- can use all supported ANSI control sequences.
   --
   -- Notes on Windows NT:
   --
   -- 1. Windows NT is unable to read and write at the same
   --    time. Attempts to do so result in one or the other
   --    being blocked. Therefore, by default we use a mutex to
   --    serialize read and write calls. Windows 95/98 can read
   --    and write at the same time, so we can use the option
   --    "/nomutex".
   --

   pragma Linker_Options ("-mwindows");

   DEBUG                 : constant Boolean := True;

   CRLF                  : constant String  := ASCII.CR & ASCII.LF;

   MAX_COMMAND_LINE      : constant := 1024;
   MAX_TX_SIZE           : constant := 2048;
   MAX_RX_SIZE           : constant := 2048;
   DEFAULT_PASTE_GROUP   : constant := 15;  -- suit small keybuffer HMI options
   DEFAULT_PASTE_DELAY   : constant := 200; -- suit 230400 baud (increase for lower baud rates)
   DEFAULT_PASTE_SIZE    : constant := 2048;
   DEFAULT_VIRTUAL_SIZE  : constant := 1000;
   DEFAULT_COMM_PORT     : constant := 1;
   DEFAULT_BAUD_RATE     : constant String := "230400";
   DEFAULT_STOPBITS      : constant String := "1";
   DEFAULT_DATABITS      : constant String := "8";
   DEFAULT_PARITY        : constant String := "none";
   DEFAULT_IO_BUFSIZE    : constant := 64; -- input and output buffer size

   task type TX_Task is
      entry Start;
   end TX_Task;
   type TX_Task_Access is access TX_Task;

   task type RX_Task is
      entry Start;
   end RX_Task;
   type RX_Task_Access is access RX_Task;

   Term         : Terminal;

   CmdLine      : String (1 .. MAX_COMMAND_LINE + 1); -- space for null terminator
   CmdLen       : Natural;
   Parser       : Terminal_Emulator.Option_Parser.Parser_Type;
   Parsed       : Boolean;
   ParsePos     : Natural;
   Added        : Boolean;

   Port         : aliased Natural := 0;
   Rts          : aliased Boolean := False; -- disable RTS handshaking
   Dtr          : aliased Boolean := False; -- disable DTR handshaking
   Cts          : aliased Boolean := False; -- disable CTS flow control
   Dsr          : aliased Boolean := False; -- disable DSR flow control
   XIn          : aliased Boolean := False; -- disable Xon/Xoff input flow control
   XOut         : aliased Boolean := False; -- disable Xon/Xoff output flow control
   Mutex        : aliased Boolean := True;  -- use mutex to avoid I/O blocking
   CommsPort    : aliased WS.Win32_Handle := INVALID_HANDLE_VALUE;
   CommsMutex   : aliased Protection.Mutex;
   CommName     : aliased OP.String_Result := (others => ASCII.NUL);
   BaudRate     : aliased OP.String_Result := (others => ASCII.NUL);
   Parity       : aliased OP.String_Result := (others => ASCII.NUL);
   StopBits     : aliased OP.String_Result := (others => ASCII.NUL);
   DataBits     : aliased OP.String_Result := (others => ASCII.NUL);
   HighPriority : aliased Boolean := False;
   PasteSize    : aliased Natural := DEFAULT_PASTE_SIZE;
   PasteGroup   : aliased Natural := DEFAULT_PASTE_GROUP;
   PasteDelayMs : aliased Natural := DEFAULT_PASTE_DELAY;
   PasteDelay   : Duration := 0.0;
   LockScreen   : aliased Boolean := False; -- lock screen and view

   RX_Handler   : RX_Task_Access;
   TX_Handler   : TX_Task_Access;

   Last_Rx      : Time    := Time_First;

   -- RX_Task : This task looks after receiving from a serial port.
   --           Any data received from the serial port is echoed
   --           to the terminal window.
   --
   task body RX_Task
   is
      BoolResult : Win32.BOOL;
      ReadBuff   : IC.char_array (1 .. MAX_RX_SIZE);
      ReadStr    : String (1 .. MAX_RX_SIZE);
      ReadSize   : aliased Win32.ULONG;
      Size       : Natural;
   begin
      accept Start;
      loop
         begin
            -- read from the serial port
            -- note that the mutex is required for Windows NT, which
            -- blocks if a read and write are simultaneously active
            if Mutex then
               CommsMutex.Acquire;
            end if;
            BoolResult := ReadFile (
               CommsPort,
               ReadBuff'Address,
               MAX_RX_SIZE,
               ReadSize'Unchecked_Access,
               null);
            if Mutex then
               CommsMutex.Release;
            end if;
            Size := Natural (ReadSize);
            if Size > 0 then
               if Pasting (Term) then
                  Last_Rx := Clock;
               end if;
               for I in 1 .. ReadSize loop
                  ReadStr (Natural (I)) := Character (ReadBuff (IC.size_t (I)));
               end loop;
               -- send to the terminal
               Put (Term, ReadStr (1 .. Size));
            end if;
            if BoolResult = Win32.FALSE then
               -- delay here to avoid monopolizing CPU in cases where
               -- the process has no RX, or the serial port is closed
               -- while this task is still active
               delay 0.1;
            end if;
         exception
            when others =>
               if DEBUG then
                  Put (Term, "RX_Task Exception" & CRLF);
               end if;
               exit;
         end;
      end loop;
   end RX_Task;

   -- TX_Task : This task looks after transmitting to a serial port.
   --           Any data read from the terminal window is written to
   --           the serial the port.
   --
   task body TX_Task
   is
      Line       : String (1 .. MAX_TX_SIZE + CRLF'Length); -- space for CR/LF
      LineLen    : Natural;
      TermChar   : Character;
      Ready      : Boolean;
      OutSize    : aliased Win32.ULONG;
      Written    : Win32.BOOL;
      Flushed    : Win32.BOOL;
      Elapsed    : Time_Span;
      ElapsedMs  : Integer := 0;
      pragma Warnings (Off, Flushed);
   begin
      accept Start;
      loop
         begin
            loop
               LineLen := 0;
               -- read from the terminal
               loop
                  Peek (Term, TermChar, Ready);
                  exit when not Ready;
                  if Pasting (Term) then
                     exit when LineLen = PasteGroup;
                  else
                     exit when LineLen = MAX_TX_SIZE;
                  end if;
                  Get (Term, Line (LineLen + 1));
                  LineLen := LineLen + 1;
               end loop;
               if LineLen > 0 then
                  -- send the characters to the serial port
                  -- note that the mutex is required for Windows NT, which
                  -- blocks if a read and write are simultaneously active
                  if Mutex then
                     CommsMutex.Acquire;
                  end if;
                  Last_Rx := Time_First;
                  Written := WriteFile (
                     CommsPort,
                     Line'Address,
                     Win32.DWORD (LineLen),
                     OutSize'Unchecked_Access,
                     null);
                  if Written = Win32.FALSE then
                     -- delay here to avoid monopolizing CPU in cases where
                     -- the the serial port is closed while this task is
                     -- still active
                     delay 1.0;
                  else
                     Flushed := FlushFileBuffers (CommsPort);
                  end if;
                  if Mutex then
                     CommsMutex.Release;
                  end if;
               end if;
               if Pasting (Term) then
                  loop
                     delay 0.01; -- 10ms
                     if Last_Rx /= Time_First then
                        Elapsed := Clock - Last_Rx;
                        ElapsedMs := Integer (To_Duration (Elapsed) * 1000);
                        exit when ElapsedMs > PasteDelayMs;
                     else
                        delay PasteDelay;
                     end if;
                  end loop;
                  if ElapsedMs > 1000 then
                     -- not pasting if more than 1 second since last Rx
                     NotPasting (Term);
                  end if;
               else
                  -- avoid monopolizing cpu if we have nothing to transmit
                  delay 0.01; -- 10ms
               end if;
            end loop;
         exception
            when others =>
               if DEBUG then
                  Put (Term, "TX_Task Exception" & CRLF);
               end if;
               exit;
         end;
      end loop;
   end TX_Task;

   -- SetDefault : set a null terminated value into the string.
   procedure SetDefault (
         Str : in out String;
         Val : in     String)
   is
   begin
      Str (Str'First .. Str'First + Val'Length) := Val & ASCII.NUL;
   end SetDefault;

   -- FindLastChar : find last contiguous non-space char in string
   function FindLastChar (
         Str : in String)
      return Natural
   is
      Last : Natural := Str'First;
   begin
      loop
         if Last = Str'Last then
            exit;
         end if;
         if Str (Last + 1) = ASCII.NUL
         or Str (Last + 1) = ' '
         or Str (Last + 1) = ASCII.HT
         then
            exit;
         end if;
         Last := Last + 1;
      end loop;
      return Last;
   end FindLastChar;

   -- CompareNoCase : Compare two strings, ignoring case.
   function CompareNoCase (
         Str1 : in     String;
         Str2 : in     String)
     return Boolean
   is
   begin
      return Translate (Str1, Lower_Case_Map)
           = Translate (Str2, Lower_Case_Map);
   end CompareNoCase;

   -- DecodeBaudRate : Decode a baud rate string - any standard rate
   function DecodeBaudRate (Str : in String)
      return Win32.DWORD
   is
      Last : Natural := Str'First;
   begin
      Last := FindLastChar (Str);
      if Str (Str'First .. Last) = "110" then
         return CBR_110;
      elsif Str (Str'First .. Last) = "300" then
         return CBR_300;
      elsif Str (Str'First .. Last) = "600" then
         return CBR_600;
      elsif Str (Str'First .. Last) = "1200" then
         return CBR_1200;
      elsif Str (Str'First .. Last) = "2400" then
         return CBR_2400;
      elsif Str (Str'First .. Last) = "4800" then
         return CBR_4800;
      elsif Str (Str'First .. Last) = "9600" then
         return CBR_9600;
      elsif Str (Str'First .. Last) = "14400" then
         return CBR_14400;
      elsif Str (Str'First .. Last) = "19200" then
         return CBR_19200;
      elsif Str (Str'First .. Last) = "38400" then
         return CBR_38400;
      elsif Str (Str'First .. Last) = "56000" then
         return CBR_56000;
      elsif Str (Str'First .. Last) = "57600" then
         return CBR_57600;
      elsif Str (Str'First .. Last) = "115200" then
         return CBR_115200;
      elsif Str (Str'First .. Last) = "128000" then
         return CBR_128000;
      elsif Str (Str'First .. Last) = "230400" then
         return CBR_230400;
      elsif Str (Str'First .. Last) = "256000" then
         return CBR_256000;
      else
         return WNT.MAXDWORD;
      end if;
   end DecodeBaudRate;

   -- DecodeParity : Decode a parity string - even, odd, mark, space, none.
   function DecodeParity (Str : in String)
      return Win32.BYTE
   is
      Last : Natural := Str'First;
   begin
      Last := FindLastChar (Str);
      if CompareNoCase (Str (Str'First .. Last), "none") then
         return NOPARITY;
      elsif CompareNoCase (Str (Str'First .. Last), "even") then
         return EVENPARITY;
      elsif CompareNoCase (Str (Str'First .. Last), "odd") then
         return ODDPARITY;
      elsif CompareNoCase (Str (Str'First .. Last), "mark") then
         return MARKPARITY;
      elsif CompareNoCase (Str (Str'First .. Last), "space") then
         return SPACEPARITY;
      else
         return WNT.MAXBYTE;
      end if;
   end DecodeParity;

   -- DecodeCommName : Decode Comm name - i.e. "nn" => nn, and "COMnn" => nn
   function DecodeCommName (Str : in String)
      return Natural
   is
      Last : Natural := Str'First;
      port : Natural := 0;
   begin
      Last := FindLastChar (Str);
      if ((Last - Str'First) >= 3) and CompareNoCase (Str (Str'First .. Str'First + 2), "com") then
         return Natural'Value (Str (Str'First + 3 .. Last));
      else
         begin
            port := Natural'Value (Str (Str'First .. Last));
            if port = 0 then
               return DEFAULT_COMM_PORT;
            end if;
            return port;
         end;
      end if;
      exception
      when others =>
         return DEFAULT_COMM_PORT;
   end DecodeCommName;

   -- DecodStopBits : Decode a stop bits string - only 1 or 2 supported
   function DecodeStopBits (Str : in String)
      return Win32.BYTE
   is
      Last : Natural := Str'First;
   begin
      Last := FindLastChar (Str);
      if CompareNoCase (Str (Str'First .. Last), "1") then
         return ONESTOPBIT;
      elsif CompareNoCase (Str (Str'First .. Last), "2") then
         return TWOSTOPBITS;
      else
         return WNT.MAXBYTE;
      end if;
   end DecodeStopBits;

   -- DecodDataBits : Decode a data bits string - only 7 or 8 supported
   function DecodeDataBits (Str : in String)
      return Win32.BYTE
   is
      Last : Natural := Str'First;
   begin
      Last := FindLastChar (Str);
      if CompareNoCase (Str (Str'First .. Last), "8") then
         return 8;
      elsif CompareNoCase (Str (Str'First .. Last), "7") then
         return 7;
      else
         return WNT.MAXBYTE;
      end if;
   end DecodeDataBits;

   procedure OpenCommsPort (
        CommsPort : in out WS.Win32_Handle;
        Port : in Integer)
   is
      PortStr    : constant String
         := Ada.Strings.Fixed.Trim (Natural'Image (Port), Ada.Strings.Both);
      PortName   : aliased IC.char_array := IC.To_C ("\\.\COM" & PortStr);
      Timeouts   : aliased COMMTIMEOUTS;
      DeviceDCB  : aliased DCB;
      BoolResult : Win32.BOOL;
   begin
      CommsPort := CreateFile (
         PortName (PortName'First)'Unchecked_Access,
         WNT.GENERIC_READ or WNT.GENERIC_WRITE,
         0,
         null,
         OPEN_EXISTING,
         0,
         System.Null_Address);
      if CommsPort /= INVALID_HANDLE_VALUE then
         -- set the timeouts - note the small Read timeout
         -- is necessary because we cannot Read and Write
         -- simultaneousy under Windows NT, and the infinite
         -- Write timeout is necessary for XON/XOFF support.
         Timeouts.ReadIntervalTimeout         := 0;
         Timeouts.ReadTotalTimeoutMultiplier  := 0;
         Timeouts.ReadTotalTimeoutConstant    := 50;
         Timeouts.WriteTotalTimeoutMultiplier := 0;
         Timeouts.WriteTotalTimeoutConstant   := 0;
         BoolResult := SetCommTimeouts (CommsPort, Timeouts'Unchecked_Access);
         if BoolResult = Win32.FALSE then
            Put (Term, "Unable to set comms timeouts - using current defaults" & CRLF);
         end if;
         -- set the buffer sizes
         BoolResult := SetupComm (CommsPort, DEFAULT_IO_BUFSIZE, DEFAULT_IO_BUFSIZE);
         if BoolResult = Win32.FALSE then
            Put (Term, "Unable to set comms buffer sizes - using current defaults" & CRLF);
         end if;
         -- set the comms parameters
         BoolResult := GetCommState (CommsPort, DeviceDCB'Unchecked_Access);
         if BoolResult = Win32.FALSE then
            Put (Term, "Unable to get comms parameters" & CRLF);
         end if;
         DeviceDCB.fNull := Win32.FALSE;
         if Rts then
            DeviceDCB.fRtsControl := RTS_CONTROL_HANDSHAKE;
         else
            DeviceDCB.fRtsControl := RTS_CONTROL_DISABLE;
         end if;
         if Dtr then
            DeviceDCB.fDtrControl := DTR_CONTROL_HANDSHAKE;
         else
            DeviceDCB.fDtrControl := DTR_CONTROL_DISABLE;
         end if;
         if Cts then
            DeviceDCB.fOutxCtsFlow := Win32.TRUE;
         else
            DeviceDCB.fOutxCtsFlow := Win32.FALSE;
         end if;
         if Dsr then
            DeviceDCB.fOutxDsrFlow := Win32.TRUE;
         else
            DeviceDCB.fOutxDsrFlow := Win32.FALSE;
         end if;
         if XIn then
            DeviceDCB.fInX := Win32.TRUE;
         else
            DeviceDCB.fInX := Win32.FALSE;
         end if;
         if XOut then
            DeviceDCB.fOutX := Win32.TRUE;
         else
            DeviceDCB.fOutX := Win32.FALSE;
         end if;
         if XIn or XOut then
            -- set up for XON/XOFF
            DeviceDCB.XonChar  := IC.char (ASCII.DC1);
            DeviceDCB.XoffChar := IC.char (ASCII.DC3);
            DeviceDCB.XonLim   := DEFAULT_IO_BUFSIZE / 4;
            DeviceDCB.XoffLim  := DEFAULT_IO_BUFSIZE / 2;
            DeviceDCB.fTXContinueOnXoff := Win32.TRUE;
         end if;
         DeviceDCB.BaudRate := DecodeBaudRate (BaudRate);
         if DeviceDCB.BaudRate = WNT.MAXDWORD then
            Put (Term, "Invalid baud rate - using " & DEFAULT_BAUD_RATE & CRLF);
            DeviceDCB.BaudRate := DecodeBaudRate (DEFAULT_BAUD_RATE);
         end if;
         DeviceDCB.Parity := DecodeParity (Parity);
         if DeviceDCB.Parity = WNT.MAXBYTE then
            Put (Term, "Invalid parity - using " & DEFAULT_PARITY & CRLF);
            DeviceDCB.Parity := DecodeParity (DEFAULT_PARITY);
         end if;
         DeviceDCB.StopBits := DecodeStopBits (StopBits);
         if DeviceDCB.StopBits = WNT.MAXBYTE then
            Put (Term, "Invalid parity - using " & DEFAULT_STOPBITS & CRLF);
            DeviceDCB.StopBits := DecodeStopBits (DEFAULT_STOPBITS);
         end if;
         DeviceDCB.ByteSize := DecodeDataBits (DataBits);
         if DeviceDCB.ByteSize = WNT.MAXBYTE then
            Put (Term, "Invalid parity - using " & DEFAULT_DATABITS & CRLF);
            DeviceDCB.ByteSize := DecodeDataBits (DEFAULT_DATABITS);
         end if;
         BoolResult := SetCommState (CommsPort, DeviceDCB'Unchecked_Access);
         if BoolResult = Win32.FALSE then
            if DEBUG then
               Put (Term, "SetCommState failed ... "
                    & "(error = " & Win32.DWORD'Image (GetLastError) & ")" &  CRLF);
            end if;
            Put (Term, "Unable to set comms parameters - using current defaults" & CRLF);
         end if;
      end if;
   end OpenCommsPort;

   procedure CloseCommPort (CommsPort : in out WS.Win32_Handle)
   is
      Result : Win32.BOOL;
   begin
      Result := CloseHandle (CommsPort);
      if Result = Win32.TRUE then
         CommsPort := INVALID_HANDLE_VALUE;
      else
         declare
            PortStr    : constant String
              := Ada.Strings.Fixed.Trim (Natural'Image (Port), Ada.Strings.Both);
         begin
            Put (Term, "Failed to close port COM" & PortStr & CRLF);
         end;
      end if;
   end CloseCommPort;

begin -- Comms

   -- Set up terminal with initial options. Note that command line options
   -- may then change things. For this reason we initially create the window
   -- as not visible and only make it visible after processing all command
   -- line options.
   Open (Term,
      "Comms",
      MainMenu => No,
      TransferMenu => Yes,
      OptionMenu => Yes,
      AdvancedMenu => Yes,
      Columns => 80,
      Rows => 24,
      VirtualRows => 24,
      Font => "Lucida Console",
      Size => 9,
         Visible => No);

   -- Create an options parser and set it up to parse the options that
   -- are unique to this program.

   OP.CreateParser (Parser, Term, 17, '/'); -- 13 new options:
   OP.AddOption (Parser, "Com",       3, OP.Str_Option,  Added, Str  => CommName'Unchecked_Access);
   OP.AddOption (Parser, "Rts",       3, OP.Bool_Option, Added, Bool => Rts'Unchecked_Access);
   OP.AddOption (Parser, "Dtr",       3, OP.Bool_Option, Added, Bool => Dtr'Unchecked_Access);
   OP.AddOption (Parser, "Cts",       3, OP.Bool_Option, Added, Bool => Cts'Unchecked_Access);
   OP.AddOption (Parser, "Dsr",       3, OP.Bool_Option, Added, Bool => Dsr'Unchecked_Access);
   OP.AddOption (Parser, "XIn",       2, OP.Bool_Option, Added, Bool => XIn'Unchecked_Access);
   OP.AddOption (Parser, "XOut",      2, OP.Bool_Option, Added, Bool => XOut'Unchecked_Access);
   OP.AddOption (Parser, "Mutex",     2, OP.Bool_Option, Added, Bool => Mutex'Unchecked_Access);
   OP.AddOption (Parser, "BaudRate",  4, OP.Str_Option,  Added, Str  => BaudRate'Unchecked_Access);
   OP.AddOption (Parser, "Parity",    3, OP.Str_Option,  Added, Str  => Parity'Unchecked_Access);
   OP.AddOption (Parser, "StopBits",  4, OP.Str_Option,  Added, Str  => StopBits'Unchecked_Access);
   OP.AddOption (Parser, "DataBits",  4, OP.Str_Option,  Added, Str  => DataBits'Unchecked_Access);
   OP.AddOption (Parser, "High",      4, OP.Bool_Option, Added, Bool => HighPriority'Unchecked_Access);
   OP.AddOption (Parser, "PasteSize", 6, OP.Num_Option,  Added, Num1 => PasteSize'Unchecked_Access);
   OP.AddOption (Parser, "PasteGroup", 6, OP.Num_Option,  Added, Num1 => PasteGroup'Unchecked_Access);
   OP.AddOption (Parser, "PasteDelay", 6, OP.Num_Option,  Added, Num1 => PasteDelayMs'Unchecked_Access);
   OP.AddOption (Parser, "LockScreen", 4, OP.Bool_Option,  Added, Bool => LockScreen'Unchecked_Access);

   -- set default values for string comms options
   SetDefault (BaudRate, DEFAULT_BAUD_RATE);
   SetDefault (StopBits, DEFAULT_STOPBITS);
   SetDefault (DataBits, DEFAULT_DATABITS);
   SetDefault (Parity,   DEFAULT_PARITY);

   -- set default options (may be overrriden by command line arguments)
   SetOtherOptions (Term,
      AutoLFonCR => No,
      UpDownMoveView => No,
      PageMoveView => No,
      HomeEndMoveView => No,
      LockScreenAndView => No);
   SetScrollOptions (Term, Vertical => Yes);
   SetMouseOptions (Term, MouseCursor => No);
   SetSizingOptions (Term, Sizing => Yes, Mode => Size_Fonts);
   SetCursorOptions (Term, Visible => Yes, Flashing => Yes);
   SetFgColor (Term, Green);
   SetBgColor (Term, Dark_Blue);
   SetBufferColors (Term, Current => Yes);
   SetVirtualSize (Term, DEFAULT_VIRTUAL_SIZE);
   SetEditingOptions (Term, Echo => No, Wrap => Yes);
   SetPasteOptions (Term, ToBuffer => No, ToKeyboard => Yes);

   -- Parse any options in the command line arguments. To do
   -- this we collect all the aruments into a single line, since
   -- Ada does not parse strings containing spaces properly
   CmdLen := 0;
   for I in 1 .. ACL.Argument_Count loop
      if CmdLen >= MAX_COMMAND_LINE then
         exit;
      end if;
      for J in 1 .. ACL.Argument (I)'Length loop
         if CmdLen >= MAX_COMMAND_LINE then
            exit;
         end if;
         CmdLine (CmdLen + 1) := ACL.Argument (I) (J);
         CmdLen := CmdLen + 1;
      end loop;
      CmdLine (CmdLen + 1) := ' ';
      CmdLen := CmdLen + 1;
   end loop;
   CmdLine (CmdLen + 1) := ASCII.NUL;

   ParsePos := 1;
   while ParsePos > 0 and ParsePos <= CmdLen loop
      -- attempt to parse the argument
      OP.Parse (Parser, CmdLine (1 .. CmdLen), ParsePos, ParsePos, Parsed);
      if not Parsed then
         -- argument was not a valid option string
         Put (Term, "Invalid option """ & CmdLine (ParsePos .. CmdLen) & """" & CRLF);
         exit;
      end if;
   end loop;
   OP.DeleteParser (Parser);

   -- key options that may have been set on the command line
   PasteDelay := Duration (Float (PasteDelayMs) / 1000.0);
   SetKeyOptions (Term,
      ExtendedKeys => No,
      CursorKeys => No,
      SetSize => Yes,
      Size => PasteSize);

   -- other options that may have been set on the command line
   if LockScreen then
      SetOtherOptions (Term, LockScreenAndView => Yes);
   else
      SetOtherOptions (Term, LockScreenAndView => No);
   end if;

   -- make the terminal window visible
   SetWindowOptions (Term, Visible => Yes, Active => Yes);

   -- Make this program high priority if requested
   if HighPriority then
      WS.SetHighPriority;
   end if;

   Port := DecodeCommName (CommName);

   if Port in 1 .. 99 then
      -- open the comms port
      OpenCommsPort (CommsPort, Port);
      if CommsPort /= INVALID_HANDLE_VALUE then
         SetCommsPort (Term, CommsPort, CommsMutex'Unchecked_Access);
         SetMenuOptions (Term,
                         MainMenu => Yes,
                         TransferMenu => Yes,
                         OptionMenu => Yes,
                         AdvancedMenu => Yes,
                         ContextMenu => Yes);
         -- create the I/O handler tasks
         RX_Handler := new RX_Task;
         TX_Handler := new TX_Task;
         RX_Handler.Start;
         TX_Handler.Start;
      else
         declare
            PortStr    : constant String
              := Ada.Strings.Fixed.Trim (Natural'Image (Port), Ada.Strings.Both);
         begin
            Put (Term, "Failed to open port COM" & PortStr & CRLF);
         end;
      end if;
   else
      Put (Term, "Only ports COM1 .. COM99 are supported" & CRLF);
   end if;

   -- Now just wait for terminal window to be closed -
   -- not very elegant to do this by polling, but ...
   loop
      delay 0.25;
      if Closed (Term) then
         exit;
      end if;
   end loop;

   CloseCommPort (CommsPort);
   ExitProcess (0);
   return 0;

exception
   when others =>
      WS.Beep;
      ExitProcess (0);
      return 0;
end Comms;
