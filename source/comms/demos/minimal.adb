with Text_IO;
with Win32_Support;

procedure Minimal is

   -- Notes on Minimal:
   -- =================
   --
   -- Minimal is a "bare bones" example of a program that could be used
   -- as a complete command interpreter with the help of the "redirect"
   -- program (i.e. started as "redirect minimal").
   --
   -- Redirect performs all the screen and I/O handling, including full
   -- command line editing, command history and filename completion.
   --
   -- All this minimal program has to do is read lines from its standard
   -- input, interpret the lines as commands, and write any results to
   -- standard output. Errors can be written to standard error as well.
   --
   -- To work with the command line editing and filename completion
   -- implemented by redirect, the program must provide commands to allow
   -- redirect to retrieve the current directory, the current path list,
   -- and the current list of extensions that represent commands. By
   -- default, redirect uses the commands "cd", "echo %path%" and
   -- "echo %pathext%", which are the commands that would perform the
   -- corresponding functions in the Windows command interpreter. These
   -- defaults can be changed via command line arguments to redirect,
   -- but the functions have to exist, so we just use the defaults here.
   --
   -- The minimal program therefore implements the following commands:
   --
   --    cd          : print current directory
   --    echo %name% : echo environment variable "name"
   --
   -- In practice, (since it is trivially easy) this program also
   -- implements the following commands:
   --
   --    cd name     : change directory to "name"
   --    echo string : echo an arbitrary string
   --    exit        : terminate the program
   --    help        : print a helpful message
   --
   -- Anything else is assumed to be a command to be executed, and the
   -- minimal program just passes the string to "CreateProcess". All
   -- created processes inherit this programs standard input, output
   -- and error, and so their I/O will also be managed by redirect. Both
   -- console and windows mode commands can be executed (try "calc" and
   -- "mem"). Batch files can also be executed if the ".bat" extension
   -- is included. Remember that there are NO built-in commands other
   -- than those listed above, so commands like "dir" and "type" will
   -- not work. However, try "command.com /k dir" (Windows 95/98) or
   -- "cmd.exe /k dir" (Windows NT/2000), just to get a feel for what
   -- is possible - then go ahead and implement them as built-ins !.
   --
   -- While neither the redirect program nor this program need to use
   -- the Windows console mode, a console will be created as needed by
   -- any console mode commands that are executed. This can be bit of
   -- a nuisance, since these consoles obscure the screen for no benefit.
   -- To avoid this, redirect normally creates a single "hidden" console
   -- for the use of all subsequently executed console mode processes.
   -- Hoewever, this behaviour can be modified by using the "/noconsole"
   -- command line option to the redirect program, and/or uncommenting
   -- the following pragma in this program (and recompiling !):
   --
   -- pragma Linker_Options ("-mwindows");
   --
   -- Experiment with the various combinations to see the effect.
   --
   -- Special notes on Windows 95/98:
   -- ===============================
   -- 1. Under Windows 95/98, the environment variable "pathext" is not
   --    created automatically. So before starting redirect, execute the
   --    following command (or something similar):
   --
   --    set pathext=.bat;.exe;.com
   --
   -- 2. The windows 95/98 command interpreter ("command.com") does NOT
   --    work properly with redirected I/O (e.g. when started using
   --    "redirect command.com"). Obtain a copy of "cmd.exe" from a
   --    later version of Windows (sometimes known as "Win95Cmd.exe").
   --    This program works well enough with redirected I/O, although
   --    it has a few other limitations under Windows 95/98.
   --
   -- Other notes:
   -- ============
   -- Redirect provides options to address issues with programs that use
   -- (or expect) unexpected line terminations, such as LF in place of CR:
   --
   --   /CookOut : translate output LFs to CR LF
   --   /CookIn  : translate input CRs to LFs
   --
   -- If the program does not behave as expected, or the output is garbled
   -- try adding these options to the redirect command - e.g.
   --
   --   redirect /cookout minimal.exe

   use Text_IO;

   package WS renames Win32_Support;

   MAX_BUFFER_LENGTH : constant := 1024;

   -- SetDir : Set current directory.
   procedure SetDir (Dir : in String)
   is
      Ok  : Boolean := False;
   begin
      WS.SetCurrentDirectory (Dir, Ok);
      if not Ok then
         Put_Line ("Error : Couldn't set directory to " & Dir);
      end if;
   end SetDir;

   -- GetDir : Get current directory.
   function GetDir
      return String
   is
      Dir : String (1 .. MAX_BUFFER_LENGTH);
      Len : Natural := 0;
      Ok  : Boolean;
   begin
      WS.GetCurrentDirectory (Dir, Len, Ok);
      if not Ok then
         return "Error : Couldn't get current directory";
      else
         return Dir (1 .. Len);
      end if;
   end GetDir;

   -- Echo : If the parameter is of the form "%name%", print the
   --        value of environment variable "name". Otherwise
   --        just print the argument.
   procedure Echo (Str : in String)
   is
      Val : String (1 .. MAX_BUFFER_LENGTH);
      Len : Natural := 0;
      Ok  : Boolean := False;
   begin
      if Str'Length > 2 then
         if Str (Str'First) = '%' and Str (Str'Last) = '%' then
            WS.GetEnvironmentVariable (
               Str (Str'First + 1 .. Str'Last - 1), Val, Len, Ok);
            if not Ok then
               Put_Line ("Error : Couldn't read environment variable " & Str);
            else
               Put_Line (Val (1 .. Len));
            end if;
            return;
         end if;
      end if;
      Put_Line (Str);
   end Echo;

   -- Help : Print a helpful message.
   procedure Help
   is
   begin
      Put_Line ("");
      Put_Line ("The built-in commands are:");
      Put_Line (" cd [dir]             : Show current directory or change to directory");
      Put_Line (" echo %name% | string : Show named environment variable, or echo string");
      Put_Line (" exit                 : Exit this program");
      Put_Line (" help                 : Display this message");
      Put_Line ("");
      Put_Line ("Any other input is executed as an external command");
      Put_Line ("");
   end Help;

   -- Execute : Execute the argument as a command.
   procedure Execute (Command : in String)
   is
      use type WS.Win32_ProcessId;

      ProcessID : WS.Win32_ProcessId;
      PHandle   : WS.Win32_Handle;
      THandle   : WS.Win32_Handle;

   begin
      WS.CreateProcess (
         Command,
         PHandle,
         THandle,
         ProcessID,
         Hide => False,
         Infinite => True,
         CreateFlags => 0);
      if ProcessID = 0 then
         Put_Line ("Error : Couldn't execute command " & Command);
         Put_Line ("Try ""help"" for a list of commands");
      else
         WS.WaitForProcess (PHandle);
      end if;
   end Execute;

   Line : String (1 .. MAX_BUFFER_LENGTH);
   Last : Natural;

begin -- Minimal

   Put_Line ("MINIMAL ADA COMMAND INTERPRETER v1.0");
   Put_Line ("  Copyright (c) 2003 Ross Higson ");
   Put_Line ("");

   loop

      Put (GetDir & ">");
      Text_IO.Get_Line (Line, Last);
      if Last > 0 then
         if Last >= 4 and then Line (1 .. 4) = "exit" then
            exit;
         elsif Last >= 4 and then Line (1 .. 4) = "help" then
            Help;
         elsif Last >= 2 and then Line (1 .. 2) = "cd" then
            if Last > 3 and then Line (3) = ' ' then
               SetDir (Line (4 .. Last));
            else
               Put_Line (GetDir);
            end if;
         elsif Last >= 4 and then Line (1 .. 4) = "echo" then
            if Last > 5 and then Line (5) = ' ' then
               Echo (Line (6 .. Last));
            end if;
         else
            Execute (Line (1 .. Last));
            Put_Line ("");
         end if;
      end if;

   end loop;

end Minimal;
