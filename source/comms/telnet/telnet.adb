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
with System;
with Ada.Command_Line;
with Interfaces.C;
with Ada.Strings.Maps;
with Ada.Strings.Maps.Constants;
with Ada.Strings.Fixed;

with Terminal_Types;
with Terminal_Emulator;
with Terminal_Emulator.Option_Parser;

with Win32;
with Win32.Winbase;
with Win32_Support;

with Telnet_Types;
with Telnet_Terminal;
with Telnet_Options;
with Option_Negotiation;

function Telnet return Integer is

   use Terminal_Types;
   use Terminal_Emulator;
   use Win32.Winbase;
   use Ada.Strings.Fixed;
   use Ada.Strings.Maps;
   use Ada.Strings.Maps.Constants;

   use type Win32.BOOL;
   use type Win32.DWORD;
   use type Win32.BYTE;
   use type System.Address;
   use type Interfaces.C.unsigned_long;
   use type Interfaces.C.unsigned_short;

   package OP  renames Terminal_Emulator.Option_Parser;
   package ACL renames Ada.Command_Line;
   package IC  renames Interfaces.C;
   package WS  renames Win32_Support;
   package ON  renames Option_Negotiation;
   package TO  renames Telnet_Options;

   -- Notes on Telnet:
   -- ==================
   --
   -- The "Telnet" program is intended to allow the use of a terminal
   -- window as a Network Virtual Terminal. It adds new telnet related 
   -- options:
   -- "/client", "/server", "/host", "/port", "/debug", 
   -- "/terminal", "/escape", "/binary", etc
   --
   -- For example, try:
   --
   --    telnet /port=23 /host=gigantor /debug=options
   --
   -- The telnet terminal window has full access to the terminal 
   -- capabilities provided by the Terminal_Emulator program, and 
   -- can use all supported ANSI control sequences.
   --
    
   pragma Linker_Options ("-mwindows");

   CRLF                  : constant String  := ASCII.CR & ASCII.LF;

   MAX_COMMAND_LINE      : constant := 1024;
   DEFAULT_VIRTUAL_SIZE  : constant := 1000;
   DEFAULT_TELNET_PORT   : constant := 23;
   DEFAULT_TERMINAL_NAME : constant String := "DEC-VT100";
   DEFAULT_HOST_NAME     : constant String := "localhost";

   type Binary_Type is
      (Binary_Default,
       Binary_None,
       Binary_Input,
       Binary_Output,
       Binary_Both);

   Term         : aliased Terminal;
   VT           : Telnet_Terminal.Virtual_Terminal;

   CmdLine      : String (1 .. MAX_COMMAND_LINE + 1); -- space for null terminator
   CmdLen       : Natural;
   Parser       : Terminal_Emulator.Option_Parser.Parser_Type;
   Parsed       : Boolean;
   ParsePos     : Natural;
   Added        : Boolean;

   HighPriority : aliased Boolean := False;
   Port         : aliased Natural          := DEFAULT_TELNET_PORT;
   Escape       : aliased Natural          := Natural'Last;
   Client       : aliased Boolean          := True;
   HostStr      : aliased OP.String_Result := (others => ASCII.NUL);
   TerminalStr  : aliased OP.String_Result := (others => ASCII.NUL);
   DebugStr     : aliased OP.String_Result := (others => ASCII.NUL);
   DebugOpt     : Telnet_Types.Debug_Type  := Telnet_Types.Debug_None;
   BinaryStr    : aliased OP.String_Result := (others => ASCII.NUL);
   BinaryOpt    : Binary_Type              := Binary_Default;

   StrLast      : Natural;


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
         or Str (Last + 1) = ASCII.HT then
            exit;
         end if;
         Last := Last + 1;
      end loop;
      return Last;
   end;

   
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
   

   -- DecodeDebug : Decode a debug option string
   function DecodeDebug (Str : in String) 
      return Telnet_Types.Debug_Type 
   is
      Last : Natural := Str'First;
   begin
      Last := FindLastChar (Str);
      if Last = Str'First then
         return Telnet_Types.Debug_None;
      elsif Str (Str'First .. Last) = "none" then
         return Telnet_Types.Debug_None;
      elsif Str (Str'First .. Last) = "data" then
         return Telnet_Types.Debug_Data;
      elsif Str (Str'First .. Last) = "options" then
         return Telnet_Types.Debug_Options;
      elsif Str (Str'First .. Last) = "controls" then
         return Telnet_Types.Debug_Controls;
      elsif Str (Str'First .. Last) = "all" then
         return Telnet_Types.Debug_All;
      else
         Put (Term, "Invalid debug option """ & Str & """ - defaulting to None" & CRLF);
         return Telnet_Types.Debug_None;
      end if;
   end DecodeDebug;


   -- DecodeBinary : Decode a binary option string
   function DecodeBinary (Str : in String) 
      return Binary_Type 
   is
      Last : Natural := Str'First;
   begin
      Last := FindLastChar (Str);
      if Last = Str'First then
         return Binary_Default;
      elsif Str (Str'First .. Last) = "none" then
         return Binary_None;
      elsif Str (Str'First .. Last) = "input" then
         return Binary_Input;
      elsif Str (Str'First .. Last) = "output" then
         return Binary_Output;
      elsif Str (Str'First .. Last) = "both" then
         return Binary_Both;
      else
         Put (Term, "Invalid binary option """ & Str & """ - using default" & CRLF);
         return Binary_Default;
      end if;
   end DecodeBinary;


begin -- Telnet

   -- Set up terminal with initial options. Note that command line options
   -- may then change things. For this reason we initially create the window
   -- as not visible and only make it visible after processing all command
   -- line options.
   Open (Term,
      "Telnet",
      MainMenu => Yes,
      OptionMenu => Yes,
      AdvancedMenu => Yes,
      Columns => 80,
      Rows => 25,
      VirtualRows => 25,
      Font => "Lucida Console",
      Size => 9,
      Visible => No);
   SetKeyOptions (Term,
      ExtendedKeys => No,
      CursorKeys => No);
   SetOtherOptions (Term,
      AutoLFonCR => No,
      UpDownMoveView => No,
      PageMoveView => No,
      HomeEndMoveView => No);
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
   -- default to VT100 emulation
   SetAnsiOptions (Term, Mode => VT100);

   -- Create an options parser and set it up to parse the options that
   -- are unique to this program.

   OP.CreateParser (Parser, Term, 9, '/'); -- 9 new options:
   OP.AddOption (Parser, "Port",     3, OP.Num_Option,   Added, Num1 => Port'Unchecked_Access);
   OP.AddOption (Parser, "Host",     3, OP.Str_Option,   Added, Str  => HostStr'Unchecked_Access);
   OP.AddOption (Parser, "High",     4, OP.Bool_Option,  Added, Bool => HighPriority'Unchecked_Access);
   OP.AddOption (Parser, "Client",   3, OP.True_Option,  Added, Bool => Client'Unchecked_Access);
   OP.AddOption (Parser, "Server",   3, OP.False_Option, Added, Bool => Client'Unchecked_Access);
   OP.AddOption (Parser, "Escape",   3, OP.Num_Option,   Added, Num1 => Escape'Unchecked_Access);
   OP.AddOption (Parser, "Debug",    3, OP.Str_Option,   Added, Str  => DebugStr'Unchecked_Access);
   OP.AddOption (Parser, "Binary",   3, OP.Str_Option,   Added, Str  => BinaryStr'Unchecked_Access);
   OP.AddOption (Parser, "Terminal", 3, OP.Str_Option,   Added, Str  => TerminalStr'Unchecked_Access);

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
         -- Put (Term, "Invalid option """ & CmdLine (ParsePos .. CmdLen) & """" & CRLF);
         -- assume it is a host name
         HostStr (1 .. CmdLen - ParsePos + 1) := CmdLine (ParsePos .. CmdLen);
         HostStr (CmdLen - ParsePos + 2) := ASCII.NUL;
         exit;
      end if;
   end loop;
   OP.DeleteParser (Parser);

   -- Make this program high priority if requested
   if HighPriority then
      WS.SetHighPriority;
   end if;

   -- make the terminal window visible
   SetWindowOptions (Term, Visible => Yes, Active => Yes);

   if Client then
      SetTitleOptions (Term, Set => Yes, Title => "Client Telnet");
   else
      SetTitleOptions (Term, Set => Yes, Title => "Sever Telnet");
   end if;
   
   Telnet_Terminal.Create (VT, Term'unchecked_access);

   Telnet_Terminal.Set_Connection_Type (VT, Active => Client);

   Telnet_Terminal.Set_Default_Port (VT, Default_Port => Port);

   DebugOpt := DecodeDebug (DebugStr);
   Telnet_Terminal.Set_Debug_Type (VT, Debug => DebugOpt);

   BinaryOpt := DecodeBinary (BinaryStr);
   if BinaryOpt /= Binary_Default then
      if BinaryOpt = Binary_None then
         ON.Demand_Local_Option_Disable ( VT, TO.Binary_Transmission);
         ON.Demand_Remote_Option_Disable (VT, TO.Binary_Transmission);
      else
         if BinaryOpt = Binary_Input or BinaryOpt = Binary_Both then
            ON.Request_Remote_Option_Enable (VT, TO.Binary_Transmission);
         end if;
         if BinaryOpt = Binary_Output or BinaryOpt = Binary_Both then
            ON.Request_Local_Option_Enable (VT, TO.Binary_Transmission);
         end if;
      end if;
   end if;
   
   StrLast := FindLastChar (TerminalStr);
   if StrLast /= TerminalStr'First then
      Telnet_Terminal.Set_Terminal_Name (VT, Name => TerminalStr (1 .. StrLast));
   else
      Telnet_Terminal.Set_Terminal_Name (VT, Name => DEFAULT_TERMINAL_NAME);
   end if;

   StrLast := FindLastChar (HostStr);
   if StrLast /= HostStr'First then
      Telnet_Terminal.Set_Host_Name (VT, Name => HostStr (1 .. StrLast));
      if Client then
         SetTitleOptions (Term, Set => Yes, Title => "Client Telnet, Host = " & HostStr (1 .. StrLast));
      else
         SetTitleOptions (Term, Set => Yes, Title => "Server Telnet, Host = " & HostStr (1 .. StrLast));
      end if;
   else
      if Client then
         Put (Term, "No Host specified - defaulting to " & DEFAULT_HOST_NAME & CRLF);
         SetTitleOptions (Term, Set => Yes, Title => "Client Telnet, Host = " & DEFAULT_HOST_NAME);
      end if;
      Telnet_Terminal.Set_Host_Name (VT, Name => DEFAULT_HOST_NAME);
   end if;

   if Escape in 0 .. 255 then
      Telnet_Terminal.Set_Escape_Char (VT, Escape_Char => Escape);
   elsif Escape /= Natural'Last then
      Put (Term, "Invalid escape character specified" & CRLF);
   end if;

   Telnet_Terminal.Start (VT);

   -- Now just wait for terminal window to be closed -
   -- not very elegant to do this by polling, but ...
   loop
      delay 0.25;
      if Telnet_Terminal.Closed (VT) then
         exit;
      end if;
   end loop;

   ExitProcess (0);
   return 0;

exception
   when others =>
      WS.Beep;
      ExitProcess (0);
      return 0;
end Telnet;
