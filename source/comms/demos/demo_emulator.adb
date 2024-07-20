with Terminal_Types;
with Terminal_Emulator;
with Terminal_Emulator.Option_Parser;
with Ada.Command_Line;

procedure Demo_Emulator is

   use Terminal_Types;
   use Terminal_Emulator;

   package OP  renames Terminal_Emulator.Option_Parser;
   package ACL renames Ada.Command_Line;

   pragma Linker_Options ("-mwindows");

   CRLF         : constant String := ASCII.CR & ASCII.LF;

   Term         : Terminal_Emulator.Terminal;
   Char         : Character;
   Col          : Natural := 0;
   Row          : Natural := 0;

   Bold         : Option := No;
   Inverse      : Option := No;
   Italic       : Option := No;
   Underline    : Option := No;
   Flashing     : Option := No;
   Strikeout    : Option := No;
   ScrollBar    : Option := No;

   Fixed        : Boolean := False;
   Arial        : Boolean := False;
   FontChanged  : Boolean := False;
   StyleChanged : Boolean := False;

   -- Toggle : Toggle an option
   procedure Toggle (Opt : in out Option) is
   begin
      if Opt = Yes then
         Opt := No;
      else
         Opt := Yes;
      end if;
   end Toggle;

   -- DisplayHelp : Display help message
   procedure DisplayHelp is
   begin
      Put (Term, CRLF);
      Put (Term, "Simple Terminal emulator" & CRLF & CRLF);
      Put (Term, "CTRL-A : toggle Arial font" & CRLF);
      Put (Term, "CTRL-X : toggle FixedSys font" & CRLF);
      Put (Term, "CTRL-Y : toggle vertical scroll bar" & CRLF);
      Put (Term, "CTRL-B : toggle bold text" & CRLF);
      Put (Term, "CTRL-I : toggle italic text" & CRLF);
      Put (Term, "CTRL-S : toggle strikeout text" & CRLF);
      Put (Term, "CTRL-U : toggle underline text" & CRLF);
      Put (Term, "CTRL-V : toggle inverse text" & CRLF);
      Put (Term, "CTRL-F : toggle flashing text" & CRLF);
      Put (Term, "CTRL-T : perform screen dump" & CRLF);
      Put (Term, "CTRL-L : perform form feed (clear screen)" & CRLF);
      Put (Term, CRLF);
      Put (Term, "CTRL-G : Display this Help" & CRLF);
      Put (Term, CRLF);
   end DisplayHelp;

   -- ParseArguments : Parse options in the command line arguments
   procedure ParseArguments
   is
      CmdLine  : String (1 .. 1000);
      CmdLen   : Natural := 0;
      Parsed   : Boolean := False;
      ParsePos : Natural := 1;
      Parser   : OP.Parser_Type;
   begin
      -- Parse any options in the command line arguments. To do
      -- this we collect all the aruments into a single line, since
      -- Ada does not parse strings containing spaces properly
      for I in 1 .. ACL.Argument_Count loop
         if CmdLen >= CmdLine'Last then
            exit;
         end if;
         for J in 1 .. ACL.Argument (I)'Length loop
            if CmdLen >= CmdLine'Last then
               exit;
            end if;
            CmdLine (CmdLen + 1) := ACL.Argument (I) (J);
            CmdLen := CmdLen + 1;
         end loop;
         CmdLine (CmdLen + 1) := ' ';
         CmdLen := CmdLen + 1;
      end loop;

      OP.CreateParser (Parser, Term, LeadChar => '/');
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

   end ParseArguments;

begin
   -- Open a terminal window. Note that we initially create
   -- the window as not visible, then set the default options
   -- we want. Then we parse the command line (which may
   -- override these defaults). Then we make the window visible.
   -- This is done so that the window first appears in the
   -- desired state, and doesn't keep changing every time we
   -- parse a new command line option.
   Open (Term,
      "A simple terminal demonstation",
      Columns => 80,
      Rows => 25,
      VirtualRows => 60,
      Font => "Lucida Console",
      Size => 10,
      Visible => No);

   -- set various options - largely a matter of taste
   SetOutputFgColor (Term, Green);
   SetOutputBgColor (Term, Dark_Blue);
   SetBufferColors (Term, Current => Yes);
   ClearBuffer (Term);
   SetEditingOptions (Term, Echo => No, Wrap => Yes);
   SetKeyOptions (Term, CursorKeys => Yes);
   SetOtherOptions (Term,
      AutoLFonCR => Yes,
      UpDownMoveView => Yes,
      LeftRightWrap => Yes,
      LeftRightScroll => Yes,
      PageMoveView => Yes);
   SetMouseOptions (Term, MouseCursor => Yes);
   SetMenuOptions (Term, AdvancedMenu => Yes);
   SetOutputStyle (Term,
      Bold => No,
      Italic => No,
      Underline => No,
      Strikeout => No);
   SetCursorOptions (Term, Visible => Yes, Flashing => Yes);
   SetPasteOptions (Term, ToBuffer => No, ToKeyboard => Yes);

   -- now parse any options given as arguments on the command line
   ParseArguments;
   -- now make the window visible
   SetWindowOptions (Term, Visible => Yes);

   DisplayHelp;

   loop

      -- Just read a character, interpreting any that we have assigned
      -- a special meaning to, or echo the character on the terminal.
      -- Note we never exit the loop - the program will be shut down
      -- only when the terminal window is closed by the user.

      Get (Term, Char);
      case Char is

         when ASCII.SOH => -- CTRL-A
            Arial := not Arial;
            Fixed := False;
            FontChanged := True;

         when ASCII.CAN => -- CTRL-X
            Fixed := not Fixed;
            Arial := False;
            FontChanged := True;

         when ASCII.EM => -- CTRL-Y
            Toggle (ScrollBar);
            SetScrollOptions (Term, Vertical => ScrollBar);

         when ASCII.STX => -- CTRL-B
            Toggle (Bold);
            StyleChanged := True;

         when ASCII.HT => -- CTRL-I
            Toggle (Italic);
            StyleChanged := True;

         when ASCII.DC3 => -- CTRL-S
            Toggle (Strikeout);
            StyleChanged := True;

         when ASCII.NAK => -- CTRL-U
            Toggle (Underline);
            StyleChanged := True;

         when ASCII.SYN => -- CTRL-V
            Toggle (Inverse);
            StyleChanged := True;

         when ASCII.ACK => -- CTRL-F
            Toggle (Flashing);
            StyleChanged := True;

         when ASCII.BEL => -- CTRL-G
            DisplayHelp;

         when ASCII.DC4 => -- CTRL-T
            GetScreenSize (Term, Col, Row);
            declare
               Scrape : String (1 .. Col * Row);
               ScrapeLen    : Natural;
            begin
               GetInputPos (Term, Col, Row);
               ScrapeLen := Scrape'Length;
               ScreenDump (Term, Col, Row, Scrape, ScrapeLen);
               Put (Term, ASCII.FF);
               Put (Term, Scrape (1 .. ScrapeLen));
            end;

         when others =>
            Put (Term, Char);

      end case;

      if StyleChanged then
         -- user requested an attribute change, so implement the change
         SetStyle (
            Term,
            Bold => Bold,
            Italic => Italic,
            Underline => Underline,
            Strikeout => Strikeout,
            Flashing => Flashing,
            Inverse => Inverse);
         StyleChanged := False;
      end if;

      if FontChanged then
         -- user requested a font change, so implement the change
         if Fixed then
            SetFontByName (Term, SetName => Yes, Font => "FixedSys");
         elsif Arial then
            SetFontByName (Term, SetName => Yes, Font => "Arial");
         else
            SetFontByName (Term, SetName => Yes, Font => "Lucida Console");
         end if;
         FontChanged := False;
      end if;

   end loop;

end Demo_Emulator;
