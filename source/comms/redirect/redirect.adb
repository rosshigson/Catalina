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
with Ada.Command_Line;
with Ada.Strings.Unbounded;
with Text_IO;

with Terminal_Types;
with Terminal_Emulator;
with Terminal_Emulator.Line_Editor;
with Terminal_Emulator.Option_Parser;

with Interfaces.C;

with Win32;
with Win32.Winnt;
with Win32.Windef;
with Win32.Winbase;
with Win32.Winuser;
with Win32.Wincon;
with Win32.Winerror;

with Win32_Support;

with Protection;
with GetClass;

with GWindows;
with Gwindows.GStrings;
with Gwindows.Message_Boxes;

function Redirect return Integer is

   use Terminal_Types;
   use Terminal_Emulator;
   use Win32.Winuser;
   use Win32.Winbase;
   use Ada.Strings.Unbounded;

   use type Win32.BOOL;
   use type System.Address;
   use type Interfaces.C.unsigned_long;
   use type Interfaces.C.unsigned_short;

   package IC  renames Interfaces.C;
   package ACL renames Ada.Command_Line;
   package OP  renames Terminal_Emulator.Option_Parser;
   package WS  renames Win32_Support;
   package WNT renames Win32.Winnt;
   package WBS renames Win32.Winbase;

   -- Notes on Redirect:
   -- ==================
   --
   -- The "redirect" program is intended to be used to execute another
   -- program, redirecting that programs standard input, output and
   -- error to a terminal window. The program whose I/O is redirected
   -- can be a windows mode or console mode application, provided it
   -- is "well behaved" when using pipes as I/O. Not all Microsoft
   -- applications are "well behaved". One of the most notable
   -- exceptions is the command shell "command.com". This program is
   -- not at all well behaved. By contrast, "cmd.exe" is well behaved.
   --
   -- In the resulting terminal window, the redirected programs input
   -- (or output) can be viewed, edited, selected, copied, pasted,
   -- printed or saved to a file.
   --
   -- Programs that use the Windows console mode to do their I/O cannot
   -- be redirected. Only programs that use their standard input, output
   -- and error files can be redirected. Fortunately, direct use of the
   -- Windows console is rare.
   --
   -- Redirect has a wide range of configuration options, which can be
   -- set from within the program or from the command line. For example,
   -- try:
   --    redirect /virtualrows=5000 /fg=yellow /bg=green cmd.exe /Y
   --
   -- The redirected program has full access to the terminal capabilities
   -- provided by the Terminal_Emulator program, and can use all supported
   -- ANSI control sequences. Therefore, redirect also provides an
   -- environment for executing console mode programs that were designed
   -- to work under the ANSI.SYS device driver that existed under
   -- Windows 95/98, but which is not supported under Windows NT. See
   -- the documentation on the Terminal_Emulator package for details of
   -- the supported ANSI control sequences.
   --
   -- In addition, redirect provides facilities to perform printing,
   -- selection, cut and paste, mouse support, command line editing,
   -- filename completion and command history. These are closer in
   -- style to those facilities provided by Xterm and UNIX shell
   -- programs than those provided by the Windows command shell, and
   -- furthermore are available for use by user written applications
   -- - even very simple ones. See the "minimal" example provided for
   -- a bare bones program that makes full use of these facilities to
   -- provide a very simple but very functional command shell.
   --
   -- The redirect program can also be used as a filter. If no command
   -- is specified to be executed, the program simply accepts data from
   -- standard input, echoes it in a terminal window, and also puts the
   -- data to standard output. This can be very useful for capturing
   -- large volumes of output in a window with full cut/paste/load/save
   -- capabilities. For example, try something like:
   --    dir | redirect | sort | redirect | find ".exe"
   -- However, see the notes on Console vs Window mode, below.
   --
   --
   -- Special notes on Windows NT/2000:
   -- =================================
   -- 1. When redirecting "cmd.exe", the command extensions introduced
   --    in Windows NT may need to be disabled - i.e. use "cmd.exe /Y"
   --    rather than "cmd.exe" or "cmd.exe /X". If command extensions
   --    are enabled, Windows mode applications such as "notepad", (as
   --    opposed to console mode applications such as "mem") may not
   --    display their window until ENTER is pressed several times
   --    in the terminal window.
   --
   -- 2. Never use "command.com" with redirect. Always use "cmd.exe".
   --    The command.com shell does not work properly with redirected
   --    I/O.
   --
   --
   -- Special notes on Windows 95/98:
   -- ===============================
   -- 1. Under Windows 95/98, the environment variable "pathext" is not
   --    created automatically. So before starting redirect, execute the
   --    following command (or something similar):
   --       set pathext=.bat;.exe;.com
   --    Without this, command completion will not work correctly.
   --
   -- 2. The windows 95/98 command interpreter ("command.com") does NOT
   --    work properly with redirected I/O (e.g. when started using
   --    "redirect command.com"). Obtain a copy of "cmd.exe" from a
   --    later version of Windows (sometimes known as "Win95Cmd.exe").
   --    This program works well enough with redirected I/O, although
   --    it has a few other limitations under Windows 95/98.
   --
   -- 3. On Windows 95/98, underlined text may not be drawn correctly.
   --    This appears to be when Windows simulates an underlined font by
   --    drawing a line underneath a non-underlined font. In this case
   --    Windows sometimes draws the underline outside the bounding
   --    size of the non-underlined character - and it gets overwritten
   --    when the character below the underlined character is drawn. It
   --    is difficult to detect precisely when this will occur, and it
   --    may occurs with only some sizes of the same font. If the text
   --    underline is not visible, or seems to appear and disappear
   --    (e.g. when the cursor is moved over the character, forcing it
   --    to be redrawn) then try a different font size or a different
   --    font. The problem does not seem to occur on Windows NT.
   --
   --
   -- Console vs Window mode:
   -- =======================
   -- By default, redirect is a windows mode application. However, this
   -- has implications when redirection is applied to redirect itself,
   -- and redirect is either the first or the last in a sequence of
   -- redirected commands.
   -- For example, the following command produces no final output when
   -- entered in the windows command shell "cmd.exe":
   --    "help | redirect"
   -- This occurs because redirect does not get given a valid output
   -- file handle for standard output. It is not obvious whether this is
   -- a deliberate design decision or a Windows bug, but it is due to the
   -- fact that redirect is linked as a windows mode application. It is
   -- worth noting that the same command DOES work as expected if executed
   -- from within a command shell that is already redirected (e.g. invoked
   -- as "redirect cmd.exe"). Redirect can be turned into a console mode
   -- application (by commenting out the pragma below), in which case
   -- redirection of redirect itself correctly produces the final output
   -- in all cases. But it also causes redirect to open a console in cases
   -- where it is neither necessary nor desirable (e.g. if started using
   -- the Windows "Start -> Run..." command, rather than from within an
   -- existing command shell.
   --
   pragma Linker_Options ("-mwindows");      -- NOTE: If removing this ...
   WINDOWS_MODE  : constant Boolean := True; -- ... set this to False

   DEBUG                 : constant Boolean := False;

   MAX_COMMAND_LINE      : constant := 1024;
   MAX_IO_SIZE           : constant := 1024;
   MAX_RETRIES           : constant := 100;  -- times to retry waiting for things
   RETRY_TIME            : constant := 0.01; -- time to wait on each retry
   CRLF                  : constant String := ASCII.CR & ASCII.LF;
   DEFAULT_DIR_COMMAND   : constant String := "cd";
   DEFAULT_PATH_COMMAND  : constant String := "echo %path%";
   DEFAULT_EXTN_COMMAND  : constant String := "echo %pathext%";
   DEFAULT_VIRTUAL_SIZE  : constant := 1000;
   UNICODE_TEST_LENGTH   : constant := 6;    -- minimum length of data for Unicode test

   task type StdIn_Task is
      pragma Priority (System.Default_Priority - 1);
      entry Start;
   end StdIn_Task;
   type StdIn_Task_Access is access StdIn_Task;

   task type StdErr_Task is
      pragma Priority (System.Default_Priority - 1);
   end StdErr_Task;
   type StdErr_Task_Access is access StdErr_Task;

   task type StdOut_Task is
      pragma Priority (System.Default_Priority  - 1);
   end StdOut_Task;
   type StdOut_Task_Access is access StdOut_Task;

   CmdLine        : String (1 .. MAX_COMMAND_LINE + 1); -- space for null terminator
   CmdLen         : Natural;
   Parser         : OP.Parser_Type;
   Parsed         : Boolean;
   ParsePos       : Natural;
   Added          : Boolean;
   WideReversed   : Boolean := False;

   Console        : aliased Boolean := True;
   NamedPipes     : aliased Boolean := False;
   Insert         : aliased Boolean := True;
   Edit           : aliased Boolean := True;
   Completion     : aliased Boolean := True;
   CompletionChar : aliased Natural := 0;
   EraseLineChar  : aliased Natural := 0;
   HistorySize    : aliased Natural := 100;
   HighPriority   : aliased Boolean := False;
   CookOut        : aliased Boolean := False;
   CookIn         : aliased Boolean := False;
   Unicode        : aliased Boolean := False; -- True to receive Unicode from captive process
   XMitUnicode    : aliased Boolean := False; -- True to send Unicode to captive process
   DirCommand     : aliased String (1 .. OP.MAX_OPTION_STRING);
   DirCommandLen  : Natural := 0;
   PathCommand    : aliased String (1 .. OP.MAX_OPTION_STRING);
   PathCommandLen : Natural := 0;
   ExtnCommand    : aliased String (1 .. OP.MAX_OPTION_STRING);
   ExtnCommandLen : Natural := 0;

   RedirectStdIn  : aliased WS.Win32_Handle := INVALID_HANDLE_VALUE;
   RedirectStdOut : aliased WS.Win32_Handle := INVALID_HANDLE_VALUE;
   RedirectStdErr : aliased WS.Win32_Handle := INVALID_HANDLE_VALUE;

   CaptiveStdIn   : WS.Win32_Handle := INVALID_HANDLE_VALUE;
   CaptiveStdOut  : WS.Win32_Handle := INVALID_HANDLE_VALUE;
   CaptiveStdErr  : WS.Win32_Handle := INVALID_HANDLE_VALUE;

   StdOut_Handler : StdOut_Task_Access;
   StdErr_Handler : StdErr_Task_Access;
   StdIn_Handler  : StdIn_Task_Access;

   Term           : Terminal;
   MyID           : WS.Win32_ProcessId;
   CaptiveID      : WS.Win32_ProcessId;
   CaptivePHandle : WS.Win32_Handle;
   CaptiveTHandle : WS.Win32_Handle;

   CharsReceived  : Natural                   := 0;
   OutputSem      : Protection.Mutex;
   SaveOutput     : Boolean                   := False;
   OutputLen      : Natural                   := 0;
   Output         : String (1 .. MAX_IO_SIZE);
   SavePrompt     : Boolean                   := False;
   FirstPrompt    : Boolean                   := False;
   PromptLen      : Natural                   := 0;
   Prompt         : String (1 .. MAX_IO_SIZE);
   PromptReceived : Boolean                   := False;

   BoolResult     : Win32.BOOL;


   -- CookOutput : Do output cooking on the string (if the CookOut option
   --              is set) and then send it to the terminal. Specifically,
   --              LFs are converted into CRLFs. The original string is left
   --              unmodified.
   --              Convert Unicode strings to ANSI before calling this procedure.
   procedure CookOutput (
      Term : in out Terminal;
      Line : in     String)
   is
      Start  : Natural := Line'First;
      Finish : Natural := Line'First;
   begin
      if CookOut then
         -- translate LFs into CRLFs
         while Start <= Line'Last loop
            while Finish < Line'Last
            and then Line (Finish) /= ASCII.LF loop
               Finish := Finish + 1;
            end loop;
            if Line (Finish) = ASCII.LF then
               if Finish > Start then
                  Put (Term, Line (Start .. Finish - 1));
               end if;
               Put (Term, CRLF);
            else
               Put (Term, Line (Start .. Finish));
            end if;
            Start  := Finish + 1;
            Finish := Start;
         end loop;
      else
         -- no cooking
         Put (Term, Line);
      end if;
   end CookOutput;


   -- CookInput : Do input cooking on the string (if the CookIn option is set).
   --             Specifically, CRs are translated to LFs. The original string
   --             is modified.
   --             Convert Unicode strings to ANSI before calling this procedure.
   procedure CookInput (
      Term : in out Terminal;
      Line : in out String)
   is
   begin
      if CookIn then
         -- translate all CRs to LFs
         for i in Line'First .. Line'Last loop
            if Line (i) = ASCII.CR then
               Line (i) := ASCII.LF;
            end if;
         end loop;
      end if;
   end CookInput;


   -- IsWideReversed : identify whether C wide chars will appear reversed
   --                  when loaded from an array of bytes into a String on
   --                  this machine - this will affect the way Unicode is
   --                  encoded/decoded.
   function IsWideReversed
      return Boolean
   is
      type Mod16 is mod 2**16;
      for Mod16'Size use 16;
      type WideString (which : Boolean := True) is record
         case which is
            when True =>
               Wide : Mod16;
            when False =>
               Str  : String (1 .. 2);
         end case;
      end record;
      pragma pack (WideString);
      pragma Unchecked_Union (WideString);

      Example : WideString := (Which => False, Str => "12");

   begin
      return Example.Wide mod 256 = Character'Pos ('1');
   end IsWideReversed;


   -- AnsiToUnicode : Convert an ANSI string to a Unicode String.
   --                 Actually only supports ASCII16 - just inserts
   --                 nulls before (or after) each character.
   function AnsiToUnicode (
         Ansi : in String)
      return String
   is
      Unicode : String (1 .. 2 * Ansi'Length);
   begin
      if WideReversed then
         for i in 1 .. Ansi'Length loop
            Unicode (2 * i - 1) := Ansi (Ansi'First + i - 1);
            Unicode (2 * i)     := ASCII.NUL;
         end loop;
      else
         for i in 1 .. Ansi'Length loop
            Unicode (2 * i - 1) := ASCII.NUL;
            Unicode (2 * i)     := Ansi (Ansi'First + i - 1);
         end loop;
      end if;
      return Unicode;
   end AnsiToUnicode;


   -- UnicodeToAnsi : Convert a Unicode string to an ANSI String.
   --                 Acually only supports ASCII16 - just extracts
   --                 every second character. Should really check
   --                 for specific Unicode characters.
   function UnicodeToAnsi (
         Unicode : in String)
      return String
   is
      Ansi : String (1 .. Unicode'Length / 2);
   begin
      if WideReversed then
         for i in 1 .. Unicode'Length / 2 loop
            Ansi (i) := Unicode (Unicode'First + (2 * (i - 1)));
         end loop;
      else
         for i in 1 .. Unicode'Length / 2 loop
            Ansi (i) := Unicode (Unicode'First + (2 * (i - 1) + 1));
         end loop;
      end if;
      return Ansi;
   end UnicodeToAnsi;


   -- AtCR : Return True if the string Str (1 .. Pos) is
   --        terminated by a CR. Works for Unicode or
   --        ANSI strings, as indicated.
   function AtCR (
         Str     : in String;
         Pos     : in Natural;
         Unicode : in Boolean)
      return Boolean
   is
   begin
      if Unicode then
         if WideReversed then
            if Pos >= Str'First + 1 then
               return Pos mod 2 = 0
               and Str (Pos - 1) = ASCII.CR and Str (Pos) = ASCII.NUL;
            else
               return False;
            end if;
         else
            if Pos >= Str'First + 1 then
               return Pos mod 2 = 0
               and Str (Pos - 1) = ASCII.NUL and Str (Pos) = ASCII.CR;
            else
               return False;
            end if;
         end if;
      else
         if Pos >= Str'First then
            return Str (Pos) = ASCII.CR;
         else
            return False;
         end if;
      end if;
   end AtCR;


   -- AtLF : Return True if the string Str (1 .. Pos) is
   --        terminated by a LF. Works for Unicode or
   --        ANSI strings, as indicated.
   function AtLF (
         Str     : in String;
         Pos     : in Natural;
         Unicode : in Boolean)
      return Boolean
   is
   begin
      if Unicode then
         if WideReversed then
            if Pos >= Str'First + 1 then
               return Pos mod 2 = 0
               and Str (Pos - 1) = ASCII.LF and Str (Pos) = ASCII.NUL;
            else
               return False;
            end if;
         else
            if Pos >= Str'First + 1 then
               return Pos mod 2 = 0
               and Str (Pos - 1) = ASCII.NUL and Str (Pos) = ASCII.LF;
            else
               return False;
            end if;
         end if;
      else
         if Pos >= Str'First then
            return Str (Pos) = ASCII.LF;
         else
            return False;
         end if;
      end if;
   end AtLF;


   -- AtCRLF : Return True if the string Str (1 .. Pos) is
   --          terminated by a CRLF. Works for Unicode or
   --          ANSI strings, as indicated.
   function AtCRLF (
         Str     : in String;
         Pos     : in Natural;
         Unicode : in Boolean)
      return Boolean
   is
   begin
      if Unicode then
         if WideReversed then
            if Pos >= Str'First + 3 then
               return Pos mod 2 = 0
               and Str (Pos - 3) = ASCII.CR and Str (Pos - 2) = ASCII.NUL
               and Str (Pos - 1) = ASCII.LF and Str (Pos)     = ASCII.NUL;
            else
               return False;
            end if;
         else
            if Pos >= Str'First + 3 then
               return Pos mod 2 = 0
               and Str (Pos - 3) = ASCII.NUL and Str (Pos - 2) = ASCII.CR
               and Str (Pos - 1) = ASCII.NUL and Str (Pos)     = ASCII.LF;
            else
               return False;
            end if;
         end if;
      else
         if Pos > Str'First + 1 then
            return Str (Pos - 1) = ASCII.CR and Str (Pos) = ASCII.LF;
         else
            return False;
         end if;
      end if;
   end AtCRLF;


   -- StdOut_Task : This task looks after StdOut of a captive process.
   --               Any data the captive process writes to StdOut is
   --               read by this task. The task can echo the output
   --               to the terminal, or save it in a buffer. Saving
   --               output is required when we execute command we want
   --               hidden from the user. This task can also be asked
   --               to save output that looks like a prompt, and can
   --               subsequently compare received output against the
   --               saved prompt. This is used when we execute commands,
   --               and want to know when the command looks like it
   --               has completed. This task coordinates its activities
   --               with StdIn_Task by use of the OutputSem sempaphore.

   task body StdOut_Task
   is
      Char       : Character := Ascii.NUL;
      ReadBuff   : IC.Char_Array (1 .. MAX_IO_SIZE);
      ReadStr    : String (1 .. MAX_IO_SIZE);
      ReadSize   : aliased Win32.ULONG;
      Size       : Natural;
      BoolResult : Win32.BOOL;
      PeekResult : Win32.BOOL;
      Pos        : Natural;
      LocalPromptLen  : Natural                   := 0;
      LocalPrompt     : String (1 .. MAX_IO_SIZE);
   begin
      loop
         if NamedPipes then
            BoolResult := ConnectNamedPipe (RedirectStdOut, null);
         end if;
         loop
            begin
               BoolResult := ReadFile (
                  RedirectStdOut,
                  ReadBuff'Address,
                  MAX_IO_SIZE,
                  ReadSize'Unchecked_Access,
                  null);
               Size := Natural (ReadSize);
               if Size > 0 then
                  -- keep count of character received - beware of overflow
                  if CharsReceived <= Natural'Last - Size then
                     CharsReceived := CharsReceived + Size;
                  else
                     CharsReceived := Size;
                  end if;
                  for I in 1 .. ReadSize loop
                     ReadStr (Natural (I)) := Character (ReadBuff (IC.Size_T (I)));
                  end loop;
                  if DEBUG then
                     Text_IO.Put_Line ("READ : " & ReadStr (1 .. Size));
                  end if;
                  -- see if there is more output waiting, and
                  -- read it if we have room left for it
                  loop
                     ReadSize := 0;
                     delay 0.0;
                     PeekResult := PeekNamedPipe (
                        RedirectStdOut,
                        System.Null_Address,
                        0,
                        null,
                        ReadSize'Unchecked_Access,
                        null);
                     if ReadSize /= 0 and then Size + Natural (ReadSize) < MAX_IO_SIZE then
                        -- there is more output waiting and we have room, so read it
                        BoolResult := ReadFile (
                           RedirectStdOut,
                           ReadBuff'Address,
                           MAX_IO_SIZE,
                           ReadSize'Unchecked_Access,
                           null);
                        for I in 1 .. ReadSize loop
                           ReadStr (Size + Natural (I)) := Character (ReadBuff (IC.Size_T (I)));
                        end loop;
                        Size := Size + Natural (ReadSize);
                        if DEBUG then
                           Text_io.Put_Line ("READ : " & ReadStr (1 .. Size));
                        end if;
                     else
                        exit;
                     end if;
                  end loop;
                  if Edit then
                     -- line editing enabled, so we aquire semaphore
                     -- to avoid interfering with the StdIn task - if
                     -- we have not been asked to save the output we
                     -- receive, the semaphore is released after the
                     -- output has been echoed. If we have been asked
                     -- to save the output we receive, the semaphore
                     -- will be released by the StdIn task when it has
                     -- finished processing the saved output.
                     OutputSem.Acquire;
                     PromptReceived := False;
                     -- if the received data is long enough, perform
                     -- a check to set the Unicode flag if we are
                     -- receiving Unicode output from the captive
                     -- process
                     if Size >= UNICODE_TEST_LENGTH
                     and then WS.IsUnicode (ReadStr (1 .. Size)) then
                        Unicode := True;
                     end if;
                     if ReadSize = 0 then
                        -- there was no more output waiting, so this may be a
                        -- prompt -- to be a prompt, the string must not be
                        -- terminated by CR or CRLF
                        if not AtCRLF (ReadStr, Size, Unicode)
                        and not AtCR (ReadStr, Size, Unicode) then
                           -- go backwards until we get to the beginning of the
                           -- output or find a CR or LF, which would indicate
                           -- the beginning of a prompt
                           Pos := Size;
                           while Pos > 0
                           and then not AtCR (ReadStr, Pos, Unicode)
                           and then not AtLF (ReadStr, Pos, Unicode) loop
                              if Unicode and Pos >= 2 then
                                 -- step backward by 2 for Unicode characters
                                 Pos := Pos - 2;
                              else
                                 -- step backward by 1
                                 Pos := Pos - 1;
                              end if;
                           end loop;
                           if SavePrompt and Size - Pos > 0 then
                              -- we have been asked to save the prompt we receive
                              PromptLen  := Size - Pos;
                              Prompt (1 .. PromptLen) := ReadStr (Pos + 1 .. Size);
                              if DEBUG then
                                 Text_IO.Put_Line ("PROMPT : " & Prompt (1 .. PromptLen));
                              end if;
                              SavePrompt := False;
                              LocalPromptLen := PromptLen;
                              LocalPrompt(1 .. PromptLen) := Prompt(1 .. PromptLen);
                           end if;
                           if DEBUG then
                              Text_IO.Put_Line ("COMPARE WITH : " & Prompt (1 .. PromptLen));
                           end if;
                           if PromptLen > 0 and PromptLen <= Size then
                              -- now check if we have received the prompt
                              if Prompt (1 .. PromptLen) = ReadStr (Size - PromptLen + 1 .. Size) then
                                 if DEBUG then
                                    Text_IO.Put_Line ("PROMPT!");
                                 end if;
                                 PromptReceived := True;
                              end if;
                           end if;
                        end if;
                     end if;
                     if SaveOutput then
                        -- we have been asked to save the output, so save it
                        -- instead of echoing it and do not release the semaphore
                        if OutputLen + Size < MAX_IO_SIZE then
                           Output (OutputLen + 1 .. OutputLen + Size) := ReadStr (1 .. Size);
                           OutputLen := OutputLen + Size;
                        else
                           if DEBUG then
                              Put (Term, "Output Lost" & CRLF);
                           end if;
                        end if;
                     else
                        -- we are not saving the output, so echo it to the terminal
                        -- and release the semaphore
                        if Unicode and WS.IsUnicode (ReadStr (1 .. Size)) then
                           -- convert Unicode output to ANSI string for terminal
                           CookOutput (Term, UnicodeToAnsi (ReadStr (1 .. Size)));
                        else
                           CookOutput (Term, ReadStr (1 .. Size));
                        end if;
                        OutputLen := 0;
                        OutputSem.Release;
                     end if;
                  else
                     -- line editing not enabled, so echo the output to the terminal
                     if Unicode and WS.IsUnicode (ReadStr (1 .. Size)) then
                        -- convert Unicode string to ANSI string for terminal
                        CookOutput (Term, UnicodeToAnsi (ReadStr (1 .. Size)));
                     else
                        CookOutput (Term, ReadStr (1 .. Size));
                     end if;
                  end if;
               end if;
               if BoolResult = Win32.FALSE then
                  -- delay here to avoid monopolizing CPU in cases where
                  -- the process has no StdOut, or closes it while we
                  -- are still active
                  delay 1.0;
                  exit;
               end if;
            exception
               when others =>
                  if DEBUG then
                     Put (Term, "StdOut_Task Exception" & CRLF);
                  end if;
                  exit;
            end;
         end loop;
         if NamedPipes then
            BoolResult := DisconnectNamedPipe (RedirectStdOut);
         end if;
      end loop;
   end StdOut_Task;


   -- StdErr_Task : This task looks after StdErr of a captive process.
   --               Any data the captive process writes to StdErr is
   --               read by this task. The task simply echos the output
   --               to the terminal.
   task body StdErr_Task
   is
      Char         : Character := Ascii.NUL;
      ReadBuff     : IC.Char_Array (1 .. MAX_IO_SIZE);
      ReadStr      : String (1 .. MAX_IO_SIZE);
      ReadSize     : aliased Win32.ULONG;
      Size         : Natural;
      BoolResult   : Win32.BOOL;
   begin -- StdErr_Task
      loop
         if NamedPipes then
            BoolResult := ConnectNamedPipe (RedirectStdErr, null);
         end if;
         loop
            begin
               BoolResult := ReadFile (
                  RedirectStdErr,
                  ReadBuff'Address,
                  MAX_IO_SIZE,
                  ReadSize'Unchecked_Access,
                  null);
               Size := Natural (ReadSize);
               if Size > 0 then
                  for I in 1 .. ReadSize loop
                     ReadStr (Natural (I)) := Character (ReadBuff (IC.Size_T (I)));
                  end loop;
                  if Unicode and WS.IsUnicode (ReadStr (1 .. Size)) then
                     -- convert Unicode string to ANSI string for terminal
                     CookOutput (Term, UnicodeToAnsi (ReadStr (1 .. Size)));
                  else
                     CookOutput (Term, ReadStr (1 .. Size));
                  end if;
               end if;
               if BoolResult = Win32.FALSE then
                  if DEBUG then
                     Put (Term, "StdErr_Task read failed ... "
                          & "(error = " & Win32.DWORD'Image (GetLastError) & ")" &  CRLF);
                  end if;
                  -- delay here to avoid monopolizing CPU in cases where
                  -- the process has no StdErr, or closes it while we
                  -- are still active
                  delay 1.0;
                  exit;
               end if;
            exception
               when others =>
                  if DEBUG then
                     Put (Term, "StdErr_Task Exception" & CRLF);
                  end if;
                  exit;
            end;
         end loop;
         if NamedPipes then
            BoolResult := DisconnectNamedPipe (RedirectStdErr);
         end if;
      end loop;
   end StdErr_Task;


   -- StdIn_Task : This task looks after StdIn of a captive process.
   --              Data read from the terminal is written to StdIn.
   --              Special processing is performed if we elect to use
   --              the line editor - we can execute commands either
   --              normally (so the user sees it and the results) or
   --              hidden (so the user never sees either the command
   --              or the result). When using the line editor, we keep
   --              track of when the terminal is displaying the prompt,
   --              indicating a command can be sent, and we can ask the
   --              StdOut_Task to save the output of commands for us.
   task body StdIn_Task
   is

      Char       : Character  := Ascii.NUL;
      BoolResult : Win32.BOOL;
      Line       : String (1 .. MAX_IO_SIZE + CRLF'Length); -- space for CR/LF
      LineLen    : Natural    := 0;
      TermChar   : Character  := Ascii.NUL;
      Ready      : Boolean;

      -- IgnoreEcho : Check the command against the output, and return
      --              the position of the first non-echoed character.
      --              Makes appropriate compensations for Unicode cases.
      --              Note that if the output consists of only the echo
      --              of the command, the result will be Output'Last + 1.
      function IgnoreEcho (
            Command : in String;
            Output  : in String)
         return Natural
      is
         Start : Natural := Output'First;
      begin
         if XMitUnicode = Unicode then
            -- Command and Output will both be Unicode or not Unicode -
            -- in either case we can compare them directly
            if Output'Length >= Command'Length
            and then Output (Output'First .. Output'First + Command'Length - 1) = Command then
               Start := Output'First + Command'Length;
            end if;
         elsif XMitUnicode then
            -- Command will be Unicode, but Output will not -
            -- convert command to ANSI before comparing
            if Output'Length >= Command'Length/2
            and then Output (Output'First .. Output'First + Command'Length/2 - 1) = UnicodeToAnsi (Command) then
               Start := Output'First + Command'Length/2;
            end if;
         elsif Unicode then
            -- Output will be Unicode, but Command will not -
            -- convert Output to ANSI before comparing
            if Output'Length >= Command'Length * 2
            and then UnicodeToAnsi (Output (Output'First .. Output'First + Command'Length*2 - 1)) = Command then
               Start := Output'First + Command'Length * 2;
            end if;
         end if;
         return Start;
      end IgnoreEcho;

      -- ExecuteHiddenCommand : Execute a command hidden from the user - i.e.
      --                        send the command to the captive process and
      --                        ask the StdOut_Task to collect the results
      --                        without displaying them. We wait for the
      --                        results ourselves, and return them. Only
      --                        commands that result in a single line of
      --                        output should be executed as "hidden". This
      --                        function is mainly used when we have to get
      --                        information from the captive process, such
      --                        as the current directory, path or extension
      --                        list.
      procedure ExecuteHiddenCommand (
            Command   : in     String;
            Result    : in out String;
            ResultLen : in out Natural)
      is
         OutSize   : aliased Win32.ULONG;
         Written   : Win32.BOOL;
         -- Flushed   : Win32.BOOL;
         Retries   : Natural;
         Start     : Natural;
         Count     : Natural;
         SawOutput : Boolean     := False;
      begin
         OutputLen      := 0;
         SaveOutput     := True;
         PromptReceived := False;
         if FirstPrompt then
            FirstPrompt := False;
            SavePrompt  := True;
         else
            SavePrompt  := False;
         end if;

         Written := WriteFile (
            RedirectStdIn,
            Command'Address,
            Win32.DWORD (Command'Length),
            OutSize'Unchecked_Access,
            null);
         -- Flushed := FlushFileBuffers (RedirectStdIn);
         if Written /= 0 then
            Retries := 0;
            loop
               if Retries >= MAX_RETRIES then
                  exit;
               else
                  Retries := Retries + 1;
               end if;
               if OutputLen > 0 then
                  -- ignore the saved output buffer if the only thing in
                  -- it is an echo of the command.
                  Start := IgnoreEcho (Command, Output (1 .. OutputLen));
                  if Start <= OutputLen then
                     -- other stuff in there, so save everything up to
                     -- the next CR, or the end of the saved output buffer
                     Count := 0;
                     -- output is everything up to the next CR, or
                     -- to the end of the saved output buffer
                     while Start + Count <= OutputLen
                     and Count < Result'Length loop
                        if AtCR (Output, Start + Count, Unicode) then
                           exit;
                        end if;
                        Result (Count + 1) := Output (Start + Count);
                        Count := Count + 1;
                     end loop;
                     ResultLen := Count;
                     SawOutput := True;
                  end if;
                  if SawOutput and PromptReceived then
                     if ResultLen > 0 then
                        if Unicode and WS.IsUnicode (Result (Result'First .. Result'First + ResultLen - 1)) then
                           Result (Result'First .. Result'First + ResultLen/2 - 1)
                              := UnicodeToAnsi (Result (Result'First .. Result'First + ResultLen - 1));
                           ResultLen := ResultLen/2;
                        end if;
                     end if;
                     exit;
                  end if;
                  OutputSem.Release;
               end if;
               delay RETRY_TIME;
            end loop;
         else
            ResultLen := 0;
         end if;
         OutputLen  := 0;
         SaveOutput := False;
         OutputSem.Release;
      end ExecuteHiddenCommand;

      -- ExecuteNormalCommand : Execute a command normally - i.e. send the
      --                        command to the captive process and echo
      --                        any results sent by the captive process
      --                        on the terminal. We try to detect and avoid
      --                        displaying the echo of the command itself,
      --                        since that should already be on display on
      --                        the terminal as entered by the user.
      function ExecuteNormalCommand (
            Command : in     String)
         return Boolean
      is

         OutSize : aliased Win32.ULONG;
         Written : Win32.BOOL;
         -- Flushed : Win32.BOOL;
         Retries : Natural;
         Start   : Natural;

      begin
         OutputLen      := 0;
         SaveOutput     := True;
         CharsReceived  := 0;
         PromptReceived := False;
         if FirstPrompt then
            FirstPrompt := False;
         end if;
         SavePrompt  := True;
         PromptLen      := 0;
         Written := WriteFile (
            RedirectStdIn,
            Command'Address,
            Win32.DWORD (Command'Length),
            OutSize'Unchecked_Access,
            null);
         -- Flushed := FlushFileBuffers (RedirectStdIn);
         if Written /= 0 then
            Retries := 0;
            loop
               if Retries >= MAX_RETRIES then
                  exit;
               else
                  Retries := Retries + 1;
               end if;
               if OutputLen > 0 then
                  -- done if the only thing in the saved output buffer is
                  -- the echo of the command
                  Start := IgnoreEcho (Command, Output (1 .. OutputLen));
                  if Start <= OutputLen then
                     -- other stuff in there, so echo everything up to
                     -- the end of the saved output buffer
                     if Unicode then
                        -- convert Unicode string to ANSI string for terminal
                        CookOutput (Term, UnicodeToAnsi (Output (Start .. OutputLen)));
                     else
                        CookOutput (Term, Output (Start .. OutputLen));
                     end if;
                  end if;
                  exit;
               end if;
               delay RETRY_TIME;
            end loop;
         end if;
         OutputLen  := 0;
         SaveOutput := False;
         OutputSem.Release;
         if CharsReceived > 0 and not PromptReceived then
            -- wait awhile to see if we receive prompt
            Retries := 0;
            loop
               if Retries >= MAX_RETRIES then
                  exit;
               else
                  Retries := Retries + 1;
               end if;
               if PromptReceived then
                  exit;
               end if;
               delay RETRY_TIME;
            end loop;
         end if;

         return Written /= 0;

      end ExecuteNormalCommand;

      -- GetPath : Get the current path. This is required for line editing.
      --           We accomplish this by executing a hidden command, assuming
      --           the captive process is a command interpreter. If it is not,
      --           we should disable file completion, and this function will
      --           never be called (option "/nocompletion"). The default
      --           command can be overridden (option "/pathcommand")
      procedure GetPath (
            Path    : in out String;
            PathLen : in out Natural)
      is
      begin
         if XMitUnicode then
            -- convert the command to Unicode
            ExecuteHiddenCommand (
               AnsiToUnicode (PathCommand (1 .. PathCommandLen)), Path, PathLen);
            if PathLen > 0 then
               if Unicode and Ws.IsUnicode (Path (Path'First .. Path'First + PathLen - 1)) then
                  -- convert the response to ANSI
                  Path (Path'First .. Path'First + PathLen/2) := UnicodeToAnsi (Path (Path'First .. Path'First + PathLen - 1));
                  PathLen := PathLen / 2;
               end if;
            end if;
         else
            ExecuteHiddenCommand (PathCommand (1 .. PathCommandLen), Path, PathLen);
         end if;
      end GetPath;

      -- GetDir : Get the current directory. This is required for line editing.
      --          We accomplish this by executing a hidden command, assuming
      --          the captive process is a command interpreter. If it is not,
      --          we should disable file completion, and this function will
      --          never be called (option "/nocompletion"). The default
      --          command can be overridden (option "/dircommand")
      procedure GetDir (
            Dir    : in out String;
            DirLen : in out Natural)
      is
      begin
         if XMitUnicode then
            -- convert the command to Unicode
            ExecuteHiddenCommand (
               AnsiToUnicode (DirCommand (1 .. DirCommandLen)), Dir, DirLen);
            if DirLen > 0 then
               if Unicode and Ws.IsUnicode (Dir (Dir'First .. Dir'First + DirLen - 1)) then
                  -- convert the response to ANSI
                  Dir (Dir'First .. Dir'First + DirLen/2 - 1) := UnicodeToAnsi (Dir (Dir'First .. Dir'First + DirLen - 1));
                  DirLen := DirLen / 2;
               end if;
            end if;
         else
            ExecuteHiddenCommand (DirCommand (1 .. DirCommandLen), Dir, DirLen);
         end if;
      end GetDir;

      -- GetExtn : Get the current list of etensions. This is required for
      --           line editing. We accomplish this by executing a hidden
      --           command, assuming the captive process is a command
      --           interpreter. If it is not, we should disable file
      --           completion, and this function will never be called
      --           (option "/nocompletion"). The default command can be
      --           overridden (option "/extncommand")
      procedure GetExtn (
            Extn    : in out String;
            ExtnLen : in out Natural)
      is
      begin
         if XMitUnicode then
            -- convert the command to Unicode
            ExecuteHiddenCommand (
               AnsiToUnicode (ExtnCommand (1 .. ExtnCommandLen)), Extn, ExtnLen);
            if ExtnLen > 0 then
               if Unicode and Ws.IsUnicode (Extn (Extn'First .. Extn'First + ExtnLen - 1)) then
                  -- convert the response to ANSI
                  Extn (Extn'First .. Extn'First + ExtnLen/2 - 1) := UnicodeToAnsi (Extn (Extn'First .. Extn'First + ExtnLen - 1));
                  ExtnLen := ExtnLen / 2;
               end if;
            end if;
         else
            ExecuteHiddenCommand (ExtnCommand (1 .. ExtnCommandLen), Extn, ExtnLen);
         end if;
      end GetExtn;

      -- StdIn_Editor : Instantiate a line editor for editing input intended
      --                for the captive process. Assumes the captive process
      --                is a command interpreter. If not, we should not use
      --                the line editing facility (option "/noedit"), or at
      --                least disable file completion (option "/nocompletion").
      package StdIn_Editor
         is new Terminal_Emulator.Line_Editor (GetDir, GetPath, GetExtn);

      Editor             : StdIn_Editor.Command_Line_Editor;
      CaptiveStatus      : aliased Win32.DWORD;
      QueriedTermination : Boolean := False;
      CaptiveTerminated  : Boolean := False;
      Retries            : Natural;

      -- CheckCaptiveProcess : See if the captive process is still alive. If
      --                       not, ask the user if they want to terminate the
      --                       program (they may not want to if they want to
      --                       leave the output on display in the terminal).
      procedure CheckCaptiveProcess is
         use Gwindows.Message_Boxes;
      begin
         if CaptiveID /= 0 and not QueriedTermination then
            BoolResult := GetExitCodeProcess (
               CaptivePHandle,
               CaptiveStatus'Unchecked_Access);
            if BoolResult /= Win32.FALSE and then CaptiveStatus /= STILL_ACTIVE then
               if DEBUG then
                  Put (Term, "Command terminated ..."
                       & "(status = " & Win32.DWORD'Image (CaptiveStatus)
                       & ")" &  CRLF);
               end if;
               CaptiveTerminated := True;
            end if;
            if CaptiveTerminated then
               if Message_Box (
                     "Redirected application terminated",
                     "The command ' "
                      & GWindows.GStrings.To_GString_From_String (CmdLine (ParsePos .. CmdLen))
                      & "' has terminated. Do you want to close the window ?",
                     Yes_No_Box)
               = Yes then
                  -- Should really be more graceful, but ...
                  BoolResult := CloseHandle (CaptiveTHandle);
                  BoolResult := CloseHandle (CaptivePHandle);
                  ExitProcess (0);
               end if;
               QueriedTermination := True;
            end if;
         end if;
      end CheckCaptiveProcess;

   begin -- StdIn_Task
      loop
         if NamedPipes then
            BoolResult := ConnectNamedPipe (RedirectStdIn, null);
         end if;
         accept Start;
         -- we wait for things to stabilize, and to capture the
         -- prompt - we start when we receive any characters
         Retries := 0;
         loop
            delay RETRY_TIME;
            if Retries >= 10 * MAX_RETRIES then
               exit;
            else
               Retries := Retries + 1;
            end if;
            if CharsReceived > 0 then
               exit;
            end if;
         end loop;
         Retries := 0;
         loop
            delay RETRY_TIME;
            if Retries >= MAX_RETRIES then
               exit;
            else
               Retries := Retries + 1;
            end if;
            if PromptLen > 0 then
               exit;
            end if;
         end loop;

         if Edit then
            -- Using the line editor - send edited lines to the captive process
            StdIn_Editor.New_Editor (
               Editor,
               Term,
               CaptiveID,
               Insert => Insert,
               Completion => Completion,
               CompletionChar => Character'Val (CompletionChar),
               EraseLineChar => Character'Val (EraseLineChar),
               History => (HistorySize /= 0),
               Histmax => HistorySize);
            loop
               begin
                  -- get an edited line
                  StdIn_Editor.Edit (Editor, Line, LineLen, TermChar);
                  if TermChar = ASCII.CR then
                     if CookIn then
                        -- add an LF to the end of the line
                        Line (LineLen + 1) := ASCII.LF;
                        LineLen := LineLen + 1;
                        -- echo LF
                        Put (Term, ASCII.LF);
                     else
                        -- add a CRLF to the end of the line
                        Line (LineLen + 1 .. LineLen + CRLF'Length) := CRLF;
                        LineLen := LineLen + CRLF'Length;
                        -- echo CRLF
                        Put (Term, CRLF);
                     end if;
                  end if;
                  -- write edited line (including LF or CRLF) to the captive process
                  if LineLen > 0 then
                     if XMitUnicode then
                        -- convert ANSI string to Unicode before executing
                        declare
                           UnicodeLine : String := AnsiToUnicode (Line (1 .. LineLen));
                        begin
                           LineLen := UnicodeLine'Length;
                           Line (1 .. LineLen) := UnicodeLine;
                        end;
                     end if;
                     if not ExecuteNormalCommand (Line (1 .. LineLen)) then
                        if DEBUG then
                           Put (Term, "StdIn_Task write failed ..."
                                & "(error = " & Win32.DWORD'Image (GetLastError)
                                & ")" &  CRLF);
                        end if;
                        exit;
                     end if;
                  end if;
               exception
                  when others =>
                     if DEBUG then
                        Put (Term, "StdIn_Task Exception" & CRLF);
                     end if;
                     exit;
               end;
               -- check the captive process is still alive
               CheckCaptiveProcess;
            end loop;
         else
            -- not using line editor - send characters to the captive process as received
            declare
               OutSize : aliased Win32.ULONG;
               Written : Win32.BOOL;
               -- Flushed : Win32.BOOL;
            begin
               loop
                  LineLen := 0;
                  loop
                     Get (Term, Line (LineLen + 1));
                     LineLen := LineLen + 1;
                     Peek (Term, TermChar, Ready);
                     exit when LineLen = MAX_IO_SIZE or not Ready;
                  end loop;
                  -- cook the input line, and echo it if we have been requested to do to
                  CookInput (Term, Line (1 .. LineLen));
                  -- send the characters to the captive process
                  if XMitUnicode then
                     -- convert ANSI string to Unicode before sending
                     declare
                        UnicodeLine : String := AnsiToUnicode (Line (1 .. LineLen));
                     begin
                        LineLen := UnicodeLine'Length;
                        Line (1 .. LineLen) := UnicodeLine;
                     end;
                  end if;
                  Written := WriteFile (
                     RedirectStdIn,
                     Line'Address,
                     Win32.DWORD (LineLen),
                     OutSize'Unchecked_Access,
                     null);
                  -- Flushed := FlushFileBuffers (RedirectStdIn);
                  -- check the captive process is still alive, and if not ask
                  -- the user if they want to shut down the program
                  CheckCaptiveProcess;
               end loop;
            exception
               when others =>
                  if DEBUG then
                     Put (Term, "StdIn_Task Exception" & CRLF);
                  end if;
                  exit;
            end;
         end if;
         if NamedPipes then
            BoolResult := DisconnectNamedPipe (RedirectStdIn);
         end if;
      end loop;
   end StdIn_Task;


   -- HideConsole : Console mode programs need a console, even though we
   --               are redirecting their input and output, so allocate
   --               a console and then hide it. Note that we have to
   --               title the console something unique, and then use
   --               EnumWindows to find it.
   procedure HideConsole
   is
      Title          : constant String := "Redirect" & Win32.DWORD'Image (MyID);
      TitleCName     : aliased IC.Char_Array := IC.TO_C (Title);
      ConsoleWindow  : Win32.Windef.HWND;
   begin
      BoolResult := Win32.Wincon.SetConsoleTitle (
         TitleCName (TitleCName'First)'Unchecked_Access);
      if BoolResult = Win32.FALSE then
         Put (Term, "Failed to set Console title (error = "
            & Win32.DWORD'Image (GetLastError) & ")" & CRLF);
      end if;
      GetClass.Title := To_Unbounded_String (Title);
      for i in 1 .. 3 loop
         -- there is a timing problem here in Windows 98 which means that we
         -- may not find the window on the first attempt, so we delay a bit
         -- and retry a couple of times.
         BoolResult := Win32.Winuser.EnumWindows (GetClass.Callback'Access, 0);
         exit when GetClass.Class /= Null_Unbounded_String;
         delay 0.1;
      end loop;
      -- now hide the console window
      declare
         ClassCName : aliased IC.Char_Array := IC.TO_C (To_String (GetClass.Class));
      begin
         ConsoleWindow := Win32.WinUser.FindWindow (
            ClassCName (ClassCName'First)'Unchecked_Access,
            TitleCName (TitleCName'First)'Unchecked_Access);
         if ConsoleWindow = INVALID_HANDLE_VALUE
         or ConsoleWindow = System.Null_Address then
            WS.Beep;
            if DEBUG then
               Put (Term, "Failed to locate console: Title = '"
                  & To_String (GetClass.Title)
                  & "', Class = '"
                  & To_String (GetClass.Class)
                  & "'" & CRLF);
            end if;
         else
            BoolResult := Win32.Winuser.ShowWindow (ConsoleWindow, SW_HIDE);
            BoolResult := Win32.Winuser.ShowWindow (ConsoleWindow, SW_HIDE);
         end if;
      end;
   end HideConsole;

begin -- Redirect

   -- get this programs process id (used for creating pipe names)
   MyID := GetCurrentProcessID;

   -- find out whether C wide chars will appear reversed (for Unicode handling)
   WideReversed := IsWideReversed;

   -- Set up terminal with initial options. Note that command line options
   -- may then change things. For this reason we initially create the window
   -- as not visible and only make it visible after processing all command
   -- line options.
   Open (Term,"Redirect",
      MainMenu => Yes,
      OptionMenu => Yes,
      AdvancedMenu => No,
      Columns => 80,
      Rows => 24,
      VirtualRows => 24,
      Font => "Lucida Console",
      Size => 9,
      Visible => No);
   SetKeyOptions (Term,
      ExtendedKeys => Yes,
      CursorKeys => No);
   SetOtherOptions (Term,
      AutoLFonCR => No,
      UpDownMoveView => No,
      PageMoveView => Yes,
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

   -- Create an options parser and set it up to parse the options that
   -- are unique to this program.
   -- Note that the "Insert" option here is for the command line editor,
   -- not the terminal window. This will override the default insert
   -- option, which therefore cannot be specified on the command line.

   OP.CreateParser (Parser, Term, 17, '/'); -- 17 new options:
   OP.AddOption (Parser, "Insert",       3, OP.Bool_Option,  Added, Bool => Insert'Unchecked_Access);
   OP.AddOption (Parser, "Edit",         4, OP.Bool_Option,  Added, Bool => Edit'Unchecked_Access);
   OP.AddOption (Parser, "Completion",   9, OP.Bool_Option,  Added, Bool => Completion'Unchecked_Access);
   OP.AddOption (Parser, "CompleteChar", 9, OP.Num_Option,   Added, Num1 => CompletionChar'Unchecked_Access);
   OP.AddOption (Parser, "EraseChar",    3, OP.Num_Option,   Added, Num1 => EraseLineChar'Unchecked_Access);
   OP.AddOption (Parser, "NamedPipes",   5, OP.True_Option,  Added, Bool => NamedPipes'Unchecked_Access);
   OP.AddOption (Parser, "AnonPipes",    4, OP.False_Option, Added, Bool => NamedPipes'Unchecked_Access);
   OP.AddOption (Parser, "History",      4, OP.Num_Option,   Added, Num1 => HistorySize'Unchecked_Access);
   OP.AddOption (Parser, "High",         4, OP.Bool_Option,  Added, Bool => HighPriority'Unchecked_Access);
   OP.AddOption (Parser, "CookOut",      5, OP.Bool_Option,  Added, Bool => CookOut'Unchecked_Access);
   OP.AddOption (Parser, "CookIn",       5, OP.Bool_Option,  Added, Bool => CookIn'Unchecked_Access);
   OP.AddOption (Parser, "Unicode",      1, OP.Bool_Option,  Added, Bool => Unicode'Unchecked_Access);
   OP.AddOption (Parser, "XMitUnicode",  1, OP.Bool_Option,  Added, Bool => XMitUnicode'Unchecked_Access);
   OP.AddOption (Parser, "DirCommand",   3, OP.Str_Option,   Added, Str =>  DirCommand'Unchecked_Access);
   OP.AddOption (Parser, "PathCommand",  4, OP.Str_Option,   Added, Str =>  PathCommand'Unchecked_Access);
   OP.AddOption (Parser, "ExtnCommand",  4, OP.Str_Option,   Added, Str =>  ExtnCommand'Unchecked_Access);
   OP.AddOption (Parser, "Console",      3, OP.Bool_Option,  Added, Bool => Console'Unchecked_Access);

   -- Set up initial values of dir, path and extn commands.
   -- Must be null terminated.
   DirCommand (1 .. DEFAULT_DIR_COMMAND'Length + 1)
      := DEFAULT_DIR_COMMAND & ASCII.NUL;
   PathCommand (1 .. DEFAULT_PATH_COMMAND'Length + 1)
      := DEFAULT_PATH_COMMAND & ASCII.NUL;
   ExtnCommand (1 .. DEFAULT_EXTN_COMMAND'Length + 1)
      := DEFAULT_EXTN_COMMAND & ASCII.NUL;

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
         -- argument was not a valid option string, so this
         -- (and all remaining command line arguments) are
         -- treated as a command to be executed
         exit;
      end if;
   end loop;
   OP.DeleteParser (Parser);

   -- Make sure completion and erase line character are valid. If not,
   -- set them to zero, indicating the line editor should use its own
   -- defaults.
   if not (CompletionChar in 0 .. Character'Pos (Character'Last)) then
      CompletionChar := 0;
   end if;
   if not (EraseLineChar in 0 .. Character'Pos (Character'Last)) then
      EraseLineChar := 0;
   end if;

   -- Calculate lengths of dir, path and extn commands. The default
   -- commands may have been overridden on the command line. Also,
   -- we have to add a CRLF to each of them
   DirCommandLen := 0;
   while DirCommandLen < OP.MAX_OPTION_STRING
   and then DirCommand (DirCommandLen + 1) /= ASCII.NUL loop
      DirCommandLen := DirCommandLen + 1;
   end loop;
   if DirCommandLen <= OP.MAX_OPTION_STRING - 2 then
      DirCommand (DirCommandLen + 1) := ASCII.CR;
      DirCommand (DirCommandLen + 2) := ASCII.LF;
      DirCommandLen := DirCommandLen + 2;
   end if;
   PathCommandLen := 0;
   while PathCommandLen < OP.MAX_OPTION_STRING
   and then PathCommand (PathCommandLen + 1) /= ASCII.NUL loop
      PathCommandLen := PathCommandLen + 1;
   end loop;
   if PathCommandLen <= OP.MAX_OPTION_STRING - 2 then
      PathCommand (PathCommandLen + 1) := ASCII.CR;
      PathCommand (PathCommandLen + 2) := ASCII.LF;
      PathCommandLen := PathCommandLen + 2;
   end if;
   ExtnCommandLen := 0;
   while ExtnCommandLen < OP.MAX_OPTION_STRING
   and then ExtnCommand (ExtnCommandLen + 1) /= ASCII.NUL loop
      ExtnCommandLen := ExtnCommandLen + 1;
   end loop;
   if ExtnCommandLen <= OP.MAX_OPTION_STRING - 2 then
      ExtnCommand (ExtnCommandLen + 1) := ASCII.CR;
      ExtnCommand (ExtnCommandLen + 2) := ASCII.LF;
      ExtnCommandLen := ExtnCommandLen + 2;
   end if;

   -- make the terminal window visible
   SetWindowOptions (Term, Visible => Yes, Active => Yes);

   -- Now see what mode we should be in ...
   if ParsePos < CmdLen then

      -- There are arguments left, indicating a command to
      -- be executed. In this mode, we run the command
      -- specified by the remaining arguments, redirecting
      -- StdIn, StdOut and StdErr to the terminal window.

      if WINDOWS_MODE then
         -- Create a console if requested. Console mode programs need
         -- a console, even though we are redirecting their input and
         -- output. They will create one if they do not inherit one,
         -- so allocate a new console and then hide it, unless we are
         -- already a console mode application ourselves.
         if Console then
            BoolResult := Win32.Wincon.AllocConsole;
            HideConsole;
            -- the console we just created and hid will have stolen
            -- the focus, so get it back
            SetWindowOptions (Term, Visible => Yes, Active => Yes);
         end if;
      end if;

      -- Make this program high priority if requested
      if HighPriority then
         WS.SetHighPriority;
      end if;

      -- use the command line as part of the terminal title
      SetTitleOptions (
         Term,
         Set => Yes,
         Title => "Redirect => " & CmdLine (ParsePos .. CmdLen));

      if NamedPipes then
         -- use named pipes
         declare
            StdInName   : String := "\\.\pipe\StdIn" & Win32.DWORD'Image (MyID);
            StdOutName  : String := "\\.\pipe\StdOut" & Win32.DWORD'Image (MyID);
            StdErrName  : String := "\\.\pipe\StdErr" & Win32.DWORD'Image (MyID);
            StdInCName  : aliased IC.Char_Array := IC.TO_C (StdInName);
            StdOutCName : aliased IC.Char_Array := IC.TO_C (StdOutName);
            StdErrCName : aliased IC.Char_Array := IC.TO_C (StdErrName);
            Security    : aliased SECURITY_ATTRIBUTES;
         begin
            -- create pipes for captive process
            WS.CreateNamedPipe (RedirectStdIn, StdInName, PIPE_ACCESS_OUTBOUND);
            if RedirectStdIn = INVALID_HANDLE_VALUE then
               Put (Term, "Failed to create StdIn Pipe" & CRLF);
               ACL.Set_Exit_Status (1);
               return 1;
            end if;
            WS.CreateNamedPipe (RedirectStdOut, StdOutName, PIPE_ACCESS_INBOUND);
            if RedirectStdOut = INVALID_HANDLE_VALUE then
               Put (Term, "Failed to create StdOut Pipe" &  CRLF);
               ACL.Set_Exit_Status (1);
               return 1;
            end if;
            WS.CreateNamedPipe (RedirectStdErr, StdErrName, PIPE_ACCESS_INBOUND);
            if RedirectStdErr = INVALID_HANDLE_VALUE then
               Put (Term, "Failed to create StdErr Pipe" &  CRLF);
               ACL.Set_Exit_Status (1);
               return 1;
            end if;

            -- create inheritable files for the captive process
            -- to use as standard input, output and error
            Security.nLength := Security_Attributes'Size/System.Storage_Unit;
            Security.lpSecurityDescriptor := System.Null_Address;
            Security.bInheritHandle := Win32.TRUE;

            CaptiveStdIn := CreateFile (
               StdInCName (StdInCName'First)'Unchecked_Access,
               WNT.GENERIC_READ,
               WNT.FILE_SHARE_READ,
               Security'Unchecked_Access,
               Win32.Winbase.OPEN_EXISTING,
               WNT.FILE_ATTRIBUTE_NORMAL 
                  + WBS.FILE_FLAG_WRITE_THROUGH 
                  + WBS.FILE_FLAG_NO_BUFFERING,
               System.Null_Address);
            if CaptiveStdIn = INVALID_HANDLE_VALUE then
               Put (Term, "CreateFile failed for " & StdInName & CRLF);
               ACL.Set_Exit_Status (1);
               return 1;
            end if;

            CaptiveStdOut := CreateFile (
               StdOutCName (StdOutCName'First)'Unchecked_Access,
               WNT.GENERIC_WRITE,
               WNT.FILE_SHARE_WRITE,
               Security'Unchecked_Access,
               Win32.Winbase.OPEN_EXISTING,
               WNT.FILE_ATTRIBUTE_NORMAL 
                  + WBS.FILE_FLAG_WRITE_THROUGH 
                  + WBS.FILE_FLAG_NO_BUFFERING,
               System.Null_Address);
            if CaptiveStdOut = INVALID_HANDLE_VALUE then
               Put (Term, "CreateFile failed for " & StdOutName & CRLF);
               ACL.Set_Exit_Status (1);
               return 1;
            end if;

            CaptiveStdErr := CreateFile (
               StdErrCName (StdErrCName'First)'Unchecked_Access,
               WNT.GENERIC_WRITE,
               WNT.FILE_SHARE_WRITE,
               Security'Unchecked_Access,
               Win32.Winbase.OPEN_EXISTING,
               WNT.FILE_ATTRIBUTE_NORMAL 
                  + WBS.FILE_FLAG_WRITE_THROUGH 
                  + WBS.FILE_FLAG_NO_BUFFERING,
               System.Null_Address);
            if CaptiveStdErr = INVALID_HANDLE_VALUE then
               Put (Term, "CreateFile failed for " & StdErrName & CRLF);
               ACL.Set_Exit_Status (1);
               return 1;
            end if;
         end;

      else
         -- use anonymous pipes
         declare
            TempHandle  : WS.Win32_Handle;
         begin
            -- create file handles to each end of the anonymous pipe -
            -- the handles are created as inheritable, so we duplicate
            -- the handles of the ends we want to hang on to (making
            -- them non-inheritable) and close the inheritable ones.
            WS.CreateAnonPipe (CaptiveStdIn, TempHandle);
            if CaptiveStdIn = INVALID_HANDLE_VALUE
            or TempHandle = INVALID_HANDLE_VALUE then
               Put (Term, "Failed to create StdIn Pipes" & CRLF);
               ACL.Set_Exit_Status (1);
               return 1;
            end if;
            BoolResult := DuplicateHandle (
               GetCurrentProcess,
               TempHandle,
               GetCurrentProcess,
               RedirectStdIn'Unchecked_Access,
               0,
               Win32.FALSE,
               WNT.DUPLICATE_CLOSE_SOURCE or WNT.DUPLICATE_SAME_ACCESS);
            if BoolResult = Win32.FALSE then
               Put (Term, "Failed to duplicate StdIn handle" & CRLF);
               ACL.Set_Exit_Status (1);
               return 1;
            end if;

            WS.CreateAnonPipe (TempHandle, CaptiveStdOut);
            if CaptiveStdOut = INVALID_HANDLE_VALUE
            or TempHandle = INVALID_HANDLE_VALUE then
               Put (Term, "Failed to create StdOut Pipes" & CRLF);
               ACL.Set_Exit_Status (1);
               return 1;
            end if;
            BoolResult := DuplicateHandle (
               GetCurrentProcess,
               TempHandle,
               GetCurrentProcess,
               RedirectStdOut'Unchecked_Access,
               0,
               Win32.FALSE,
               WNT.DUPLICATE_CLOSE_SOURCE or WNT.DUPLICATE_SAME_ACCESS);
            if BoolResult = Win32.FALSE then
               Put (Term, "Failed to duplicate StdOut handle" & CRLF);
               ACL.Set_Exit_Status (1);
               return 1;
            end if;

            WS.CreateAnonPipe (TempHandle, CaptiveStdErr);
            if CaptiveStdErr = INVALID_HANDLE_VALUE
            or TempHandle = INVALID_HANDLE_VALUE then
               Put (Term, "Failed to create StdErr Pipes" & CRLF);
               ACL.Set_Exit_Status (1);
               return 1;
            end if;
            BoolResult := DuplicateHandle (
               GetCurrentProcess,
               TempHandle,
               GetCurrentProcess,
               RedirectStdErr'Unchecked_Access,
               0,
               Win32.FALSE,
               WNT.DUPLICATE_CLOSE_SOURCE or WNT.DUPLICATE_SAME_ACCESS);
            if BoolResult = Win32.FALSE then
               Put (Term, "Failed to duplicate StdErr handle" & CRLF);
               ACL.Set_Exit_Status (1);
               return 1;
            end if;
         end;

      end if;

      -- create the I/O handler tasks
      StdIn_Handler  := new StdIn_Task;
      StdOut_Handler := new StdOut_Task;
      StdErr_Handler := new StdErr_Task;

      -- create the captive process
      WS.CreateProcess (
         CmdLine (ParsePos .. CmdLen),
         CaptivePHandle,
         CaptiveTHandle,
         CaptiveId,
         Hide => False,
         StdIn => CaptiveStdIn,
         StdOut => CaptiveStdOut,
         StdErr => CaptiveStdErr);
      if CaptiveId = 0 then
         Put (Term, "Could not start command '" & CmdLine (ParsePos .. CmdLen) & "'" & CRLF);
      end if;

      -- close local copies of the captive's handles, leaving
      -- the only open copies those inherited by the captive
      BoolResult := CloseHandle (CaptiveStdIn);
      BoolResult := CloseHandle (CaptiveStdOut);
      BoolResult := CloseHandle (CaptiveStdErr);

      -- start input processing (output and error processing
      -- start automatically). Save the first output prompt.
      SavePrompt  := True;
      FirstPrompt := True;
      StdIn_Handler.Start;

   else

      -- There are no arguments left indicating a
      -- command to execute, so in this mode we just
      -- display anything arriving on StdIn on the
      -- terminal window, and also copy it to StdOut
      -- so that we can be used as a filter program.

      -- Make this program high priority if requested
      if HighPriority then
         WS.SetHighPriority;
      end if;

      declare
         ReadBuff    : IC.Char_Array (1 .. MAX_IO_SIZE);
         ReadStr     : String (1 .. MAX_IO_SIZE);
         ReadSize    : aliased Win32.ULONG;
         Size        : Natural;
         WriteSize   : aliased Win32.ULONG;
         WriteResult : Win32.BOOL;
         ReadResult  : Win32.BOOL;
         BoolResult  : Win32.BOOL;
         --Flushed     : Win32.BOOL;
         StdIn       : aliased WS.Win32_Handle := INVALID_HANDLE_VALUE;
         StdOut      : aliased WS.Win32_Handle := INVALID_HANDLE_VALUE;
      begin
         -- Get standard input - we should be able to just do this:
         --    StdIn := GetStdHandle (STD_INPUT_HANDLE);
         -- but this sometimes returns an invalid handle, which we
         -- don't detect intul we start to use it. So instead, we
         -- duplicate the handle, which tells us immediately if it is
         -- a valid handle or not.
         BoolResult := DuplicateHandle (
            GetCurrentProcess,
            GetStdHandle (STD_INPUT_HANDLE),
            GetCurrentProcess,
            StdIn'Unchecked_Access,
            0,
            Win32.FALSE,
            WNT.DUPLICATE_CLOSE_SOURCE or WNT.DUPLICATE_SAME_ACCESS);
         if BoolResult = WIN32.FALSE then
            if DEBUG then
               Put (Term, "Standard Input duplicate handle failed  (error = "
                  & Win32.DWORD'Image (GetLastError) & ")" &  CRLF);
            end if;
            StdIn := INVALID_HANDLE_VALUE;
         end if;
         -- Get standard output - we should be able to just do this:
         --    StdOut := GetStdHandle (STD_OUTPUT_HANDLE);
         -- but we can't (see comment above).
         BoolResult := DuplicateHandle (
            GetCurrentProcess,
            GetStdHandle (STD_OUTPUT_HANDLE),
            GetCurrentProcess,
            StdOut'Unchecked_Access,
            0,
            Win32.FALSE,
            WNT.DUPLICATE_CLOSE_SOURCE or WNT.DUPLICATE_SAME_ACCESS);
         if BoolResult = WIN32.FALSE then
            if DEBUG then
               Put (Term, "Standard Output duplicate handle failed  (error = "
                  & Win32.DWORD'Image (GetLastError) & ")" &  CRLF);
            end if;
            StdOut := INVALID_HANDLE_VALUE;
         end if;
         if StdIn /= INVALID_HANDLE_VALUE then
            -- read from standard input and write to standard output
            SetTitleOptions (
               Term,
               Set => Yes,
               Title => "Redirect => copy standard input to standard output");
            loop
               begin
                  ReadResult := ReadFile (
                     StdIn,
                     ReadBuff'Address,
                     MAX_IO_SIZE,
                     ReadSize'Unchecked_Access,
                     null);
                  Size := Natural (ReadSize);
                  if Size > 0 then
                     for I in 1 .. ReadSize loop
                        ReadStr (Natural (I)) := Character (ReadBuff (IC.Size_T (I)));
                     end loop;
                     if Unicode and WS.IsUnicode (ReadStr (1 .. Size)) then
                        -- convert Unicode string to ANSI string for terminal
                        Put (Term, UnicodeToAnsi (ReadStr (1 .. Size)));
                     else
                        Put (Term, ReadStr (1 .. Size));
                     end if;
                     if StdOut /= INVALID_HANDLE_VALUE then
                        WriteResult := WriteFile (
                           StdOut,
                           ReadBuff'Address,
                           ReadSize,
                           WriteSize'Unchecked_Access,
                           null);
                        -- Flushed := FlushFileBuffers (StdOut);
                        if WriteResult = Win32.FALSE then
                           if DEBUG then
                              Put (Term, "Standard Output write failed  (error = "
                                 & Win32.DWORD'Image (GetLastError) & ")" &  CRLF);
                           end if;
                        end if;
                     end if;
                  else
                     -- End-of-file (ReadResult = TRUE) or broken pipe can
                     -- occur when the input process terminates. Other errors
                     -- should be treated as failures. In any case, we exit.
                     if ReadResult = Win32.FALSE
                     and GetLastError /= Win32.Winerror.ERROR_BROKEN_PIPE then
                        if DEBUG then
                           Put (Term, "Standard Input read failed  (error = "
                              & Win32.DWORD'Image (GetLastError) & ")" &  CRLF);
                        end if;
                     end if;
                     exit;
                  end if;
                  -- Also exit if the terminal has been closed
                  if Closed (Term) then
                     exit;
                  end if;
               exception
                  when others =>
                     if DEBUG then
                        Put (Term, "Redirect Exception" & CRLF);
                     end if;
                     exit;
               end;
            end loop;
         else
            -- read from keyboard and write to standard output
            SetTitleOptions (
               Term,
               Set => Yes,
               Title => "Redirect => copy keyboard to standard output");
            loop
               begin
                  Get (Term, ReadStr (1));
                  Put (Term, ReadStr (1));
                  if XMitUnicode then
                     -- convert character to Unicode for output
                     ReadStr (1 .. 2) := AnsiToUnicode (ReadStr (1 .. 1));
                     ReadBuff (1) := Interfaces.C.char (ReadStr (1));
                     ReadBuff (2) := Interfaces.C.char (ReadStr (2));
                     ReadSize := 2;
                  else
                     ReadBuff (ReadBuff'First) := Interfaces.C.char (ReadStr (1));
                     ReadSize := 1;
                  end if;
                  if StdOut /= INVALID_HANDLE_VALUE then
                     WriteResult := WriteFile (
                        StdOut,
                        ReadBuff'Address,
                        ReadSize,
                        WriteSize'Unchecked_Access,
                        null);
                     -- Flushed := FlushFileBuffers (StdOut);
                     if WriteResult = Win32.FALSE then
                        if DEBUG then
                           Put (Term, "Standard Output write failed  (error = "
                              & Win32.DWORD'Image (GetLastError) & ")" &  CRLF);
                        end if;
                     end if;
                  end if;
                  -- Exit if the terminal has been closed
                  if Closed (Term) then
                     exit;
                  end if;
               exception
                  when others =>
                     if DEBUG then
                        Put (Term, "Redirect Exception" & CRLF);
                     end if;
                     exit;
               end;
            end loop;
         end if;
         if StdIn /= INVALID_HANDLE_VALUE then
            ReadResult := CloseHandle (StdIn);
         end if;
         if StdOut /= INVALID_HANDLE_VALUE then
            ReadResult := CloseHandle (StdOut);
         end if;
      end;

   end if;

   -- Now just wait for terminal window to be closed -
   -- not very elegant to do this by polling, but ...
   loop
      delay 0.25;
      if Closed (Term) then
         exit;
      end if;
   end loop;

   -- terminate the captive process (if there is one)
   if CaptiveID /= 0 then
      if (TerminateProcess (CaptivePHandle, 0) = 0) then
         if DEBUG then
            Text_IO.Put_Line ("TerminateProcess failed "
                 & "(error = " & Win32.DWORD'Image (GetLastError) & ")" & CRLF);
         end if;
      end if;
      BoolResult := CloseHandle (CaptiveTHandle);
      BoolResult := CloseHandle (CaptivePHandle);
   end if;
   ExitProcess (0);
   return 0;

exception
   when others =>
      WS.Beep;
      ExitProcess (0);
      return 0;
end Redirect;
