with Terminal_Types;
with Terminal_Emulator;

procedure Demo_Multiple is

   use Terminal_Types;
   use Terminal_Emulator;

   pragma Linker_Options ("-mwindows");

   Background : constant String := "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890!@#$%^&*()<>?][{}-";

   ----------------------------------------
   -- Demo_1 - draw a box in many colors --
   ----------------------------------------

   task Demo_1;

   task body Demo_1 is
      Term : Terminal;

      procedure DrawBox is
      begin
         for i in 20 .. 60 loop
            Put (Term, '*', i, 10);
         end loop;
         for j in 11 .. 19 loop
            Put (Term, '*', 60, j);
         end loop;
         for i in reverse 20 .. 60 loop
            Put (Term, '*', i, 20);
         end loop;
         for j in reverse 11 .. 19 loop
            Put (Term, '*', 20, j);
         end loop;
      end DrawBox;

   begin
      Open (Term,
         "Separate cursors with combined style - try typing some text",
         VirtualRows => 75,
         MainMenu => Yes,
         AdvancedMenu => Yes);
      SetScrollOptions (Term, Vertical => Yes, OnOutput => No);
      SetCursorOptions (Term, Visible => Yes, Flashing => No);
      SetOtherOptions (Term,
         UpDownMoveView => Yes,
         LeftRightWrap => Yes,
         LeftRightScroll => Yes,
         CombinedCursor => No);
      SetMouseOptions (Term, MouseCursor => Yes);
      SetAnsiOptions (Term, OnInput => No, OnOutput => No);

      ClearBuffer (Term);
      SetPos (Term, 0, 0);
      SetFgColor (Term, White);
      SetBgColor (Term, Dark_Blue);
      SetBufferColors (Term, Current => Yes);
      ClearBuffer (Term);

      for i in 1 .. 75 loop
         Put (Term, ASCII.LF);
      end loop;

      SetViewBase (Term, 0, 25);
      SetScreenBase (Term, Row => 25);

      SetEditingOptions (Term, Echo => Yes);

      loop
         SetFgColor (Term, Red);
         DrawBox;
         SetFgColor (Term, Yellow);
         DrawBox;
         SetFgColor (Term, Blue);
         DrawBox;
         SetFgColor (Term, Green);
         DrawBox;
         ClearKeyboard (Term);
      end loop;
      -- Close (Term);
   end Demo_1;

   ------------------------------------------------
   -- Demo_2 - character output (draw asterisks) --
   ------------------------------------------------

   task Demo_2;

   task body Demo_2 is
      Term : Terminal;
      Char : Character;
      KeyPressed : Boolean := False;
   begin
      Open (Term,
         "Character output - press any key to terminate",
         MainMenu => No);
      SetFgColor (Term, Dark_Blue);
      SetBgColor (Term, Gray);
      SetBufferColors (Term, Current => Yes);
      SetEditingOptions (Term, Wrap => Yes, Echo => No);
      SetCursorOptions (Term, Visible => No);
      SetPos (Term, 0, 0);
      ClearBuffer (Term);
      SetAnsiOptions (Term, OnInput => No, OnOutput => No);
      loop
         for i in 1 .. 25 loop
            for j in 1 .. 80 loop
              Put (Term, '*');
            end loop;
            Peek (Term, Char, KeyPressed);
            exit when KeyPressed;
         end loop;
         delay 0.02;
         exit when KeyPressed;
         ClearBuffer (Term);
      end loop;
      delay 2.0;
      Close (Term);
   end Demo_2;

   --------------------------------------------
   -- Demo_3 - string output (draw strings)  --
   --------------------------------------------

   task Demo_3;

   task body Demo_3 is
      Term : Terminal;
      Char : Character;
      KeyPressed : Boolean := False;
   begin
      Open (Term,
         "String output - press any key to terminate",
         MainMenu => No,
         ContextMenu => No);
      SetFgColor (Term, Green);
      SetBgColor (Term, Dark_Blue);
      SetBufferColors (Term, Current => Yes);
      SetCursorOptions (Term, Visible => No);
      SetEditingOptions (Term, Echo => No, Wrap => Yes);
      SetAnsiOptions (Term, OnInput => No, OnOutput => No);
      SetPos (Term, 0, 0);
      ClearBuffer (Term);
      loop
         Put (Term, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ");
         Peek (Term, Char, KeyPressed);
         exit when KeyPressed;
      end loop;
      delay 2.0;
      Close (Term);
   end Demo_3;

   task Demo_4;

   -----------------------------
   -- Demo_3 - dumb terminal  --
   -----------------------------

   task body Demo_4 is
      Term : Terminal;
      Char : Character;
   begin
      Open (Term,
         "Dumb terminal - try typing some text",
         AdvancedMenu => Yes,
         Rows => 25,
         VirtualRows => 60,
         Font => "Lucida Console",
         Size => 10);
      SetPasteOptions (Term, ToKeyboard => No, ToBuffer => Yes);
      SetFgColor (Term, Green);
      SetBgColor (Term, Dark_Blue);
      SetBufferColors (Term, Current => Yes);
      ClearBuffer (Term);
      SetEditingOptions (Term, Echo => No, Wrap => Yes);
      SetOtherOptions (Term,
         LockScreenAndView => No,
         UpDownMoveView => Yes,
         LeftRightWrap => Yes,
         LeftRightScroll => Yes);
      SetKeyOptions (Term, CursorKeys => Yes);
      SetMouseOptions (Term, MouseCursor => Yes);
      SetStyle (Term,
         Bold => No,
         Italic => No,
         Underline => No,
         Strikeout => No);
      SetCursorOptions (Term, Visible => Yes, Flashing => Yes);
      loop
         Get (Term, Char);
         Put (Term, Char);
      end loop;
      -- Close (Term);
   end Demo_4;

   Term : Terminal;
   Char : Character;
   KeyPressed : Boolean := False;

begin -- Demo_Multiple
   Open (Term,
      VirtualRows => 70,
      Font => "Lucida Console",
      Size => 12,
      MainMenu => No,
      AdvancedMenu => Yes);

   -- set some options
   SetScrollOptions (Term, Vertical => Yes, Horizontal => Yes);
   SetMouseOptions (Term, MouseCursor => No);
   SetKeyOptions (Term, CursorKeys => Yes);
   SetCursorOptions (Term, Visible => Yes, Flashing => Yes);
   SetFgColor (Term, Orange);
   SetBgColor (Term, Gray);
   SetBufferColors (Term, Current => Yes);
   ClearBuffer (Term);
   SetEditingOptions (Term, Wrap => Yes);
   SetAnsiOptions (Term, OnInput => No, OnOutput => No);

   -- put some background text on the screen
   SetPos (Term, 0, 0);
   for i in 1 .. 25 loop
      Put (Term, Background (i + 1 .. 80));
      Put (Term, Background (1 .. i));
   end loop;
   SetViewBase (Term);
   SetScreenBase (Term);

   -- make some rows double height and double width
   for i in 1 .. 24 loop
      if i mod 2 = 1 then
         SetRowOptions (Term, i, Double_Width);
      end if;
   end loop;
   Put (Term, Background, Column => 0, Row => 19);
   Put (Term, Background, Column => 0, Row => 20);
   SetRowOptions (Term, 19, Double_Height_Upper);
   SetRowOptions (Term, 20, Double_Height_Lower);

   -- draw strings and stuff
   SetEditingOptions (Term, Wrap => No);
   SetTitleOptions (Term,
      Set => Yes,
      Title => "Font rendering demo (Wrap Off)");
   SetPos (Term, 5, 5);
   SetFgColor (Term, White);
   SetBgColor (Term, Pink);
   Put (Term,
      "This String " & ASCII.CR & ASCII.LF &
      "contains " & ASCII.LF & ASCII.LF &
      "non graphic characters.");
   delay 1.0;
   SetPos (Term, 10, 10);
   SetFgColor (Term, Blue);
   Put (Term, "This is a String. ");
   delay 1.0;
   SetFgColor (Term, Red);
   Put (Term, "Another String. ");
   delay 1.0;
   SetFgColor (Term, Green);
   Put (Term, "This should not WRAP..................");
   delay 1.0;
   SetPos (Term, 10, 11);
   SetFgColor (Term, Blue);
   Put (Term, "This is a String. ");
   delay 1.0;
   SetFgColor (Term, Red);
   Put (Term, "Another String. ");
   delay 1.0;
   SetFgColor (Term, Green);
   Put (Term, "This should not WRAP..................");
   delay 1.0;

   SetTitleOptions (Term,
      Set => Yes,
      Title => "Font rendering demo (Wrap On)");
   SetEditingOptions (Term, Wrap => Yes);
   SetPos (Term, 10, 12);
   SetStyle (Term, Bold => Yes);
   SetFgColor (Term, Blue);
   Put (Term, "This is a String. ");
   delay 1.0;
   SetFgColor (Term, Red);
   SetStyle (Term, Italic => Yes, Bold => No, Flashing => Yes);
   Put (Term, "Another String. ");
   delay 1.0;
   SetFgColor (Term, Green);
   SetStyle (Term, Bold => Yes, Italic => Yes, Flashing => No);
   Put (Term, "This should WRAP......................");
   delay 1.0;
   SetPos (Term, 10, 15);
   SetStyle (Term, Bold => Yes, Underline => Yes);
   SetFgColor (Term, Blue);
   Put (Term, "This is a String. ");
   delay 1.0;
   SetFgColor (Term, Red);
   SetStyle (Term, Italic => Yes, Bold => No, Flashing => Yes, Underline => Yes);
   Put (Term, "Another String. ");
   delay 1.0;
   SetFgColor (Term, Green);
   SetStyle (Term, Bold => Yes, Italic => Yes, Flashing => No, Underline => Yes);
   Put (Term, "This should WRAP......................");
   delay 1.0;
   SetStyle (Term, Bold => No, Italic => No, Underline => No, Strikeout => No);

   SetTitleOptions (Term,
      Set => Yes,
      Title => "Font rendering demo (Insert On)");
   SetEditingOptions (Term, Insert => Yes);
   SetPos (Term, 20, 11);
   SetFgColor (Term, White);
   SetBgColor (Term, Black);
   SetStyle (Term, Strikeout => Yes);
   Put (Term, " !INSERT! ");
   SetStyle (Term, Bold => No, Italic => No, Underline => No, Strikeout => No);
   delay 1.0;

   SetEditingOptions (Term, Insert => No, Wrap => Yes);
   SetTitleOptions (Term,
      Set => Yes,
      Title => "Font rendering demo (Insert off)");
   SetPos (Term, 70, 24);
   SetFgColor (Term, White);
   SetBgColor (Term, Black);
   Put (Term, "THIS SHOULD FORCE THE WINDOW TO SCROLL !!! ");
   delay 0.5;

   SetBgColor (Term, Dark_Green);
   SetFgColor (Term, Yellow);
   SetPos (Term, 0, 0);
   ClearToEOL (Term);
   Put (Term, "Hit a key to continue ...");

   ClearKeyboard (Term);
   SetMouseOptions (Term, MouseCursor => Yes);
   SetTitleOptions (Term,
      Set => Yes,
      Title => "Hit a key to continue ...");
   loop
      Peek (Term, Char, KeyPressed);
      exit when KeyPressed;
      delay 0.2;
   end loop;
   ClearKeyboard (Term);

   SetViewBase (Term);
   SetScreenBase (Term);
   SetTitleOptions (Term,
      Set => Yes,
      Title => "Scroll demo ...");
   SetEditingOptions (Term, Insert => No, Wrap => No);

   SetFgColor (Term, Yellow);
   SetBgColor (Term, Gray);
   ClearBuffer (Term);
   SetPos (Term, 35, 12);
   Put (Term, "Scrolling demo");
   Put (Term, "X", Column =>  0, Row =>  0);
   Put (Term, "X", Column => 79, Row =>  0);
   Put (Term, "X", Column =>  0, Row => 24);
   Put (Term, "X", Column => 79, Row => 24);
   delay 1.0;
   Scroll (Term, 1);
   SetFgColor (Term, Red);
   Put (Term, "X", Column =>  0, Row =>  0);
   Put (Term, "X", Column => 79, Row =>  0);
   Put (Term, "X", Column =>  0, Row => 24);
   Put (Term, "X", Column => 79, Row => 24);
   delay 1.0;
   Scroll (Term, 3);
   SetFgColor (Term, Green);
   Put (Term, "X", Column =>  0, Row =>  0);
   Put (Term, "X", Column => 79, Row =>  0);
   Put (Term, "X", Column =>  0, Row => 24);
   Put (Term, "X", Column => 79, Row => 24);
   delay 1.0;
   Scroll (Term, 5);
   SetFgColor (Term, Blue);
   Put (Term, "X", Column =>  0, Row =>  0);
   Put (Term, "X", Column => 79, Row =>  0);
   Put (Term, "X", Column =>  0, Row => 24);
   Put (Term, "X", Column => 79, Row => 24);
   delay 1.0;
   Scroll (Term, -9);

   SetViewBase (Term);
   SetScreenBase (Term);
   delay 2.0;
   SetTitleOptions (Term,
      Set => Yes,
      Title => "Character attributes demo");
   SetPos (Term, 0, 0);
   SetBgColor (Term, Dark_Blue);
   SetBufferColors (Term, Current => Yes);
   ClearBuffer (Term);
   SetFgColor (Term, Yellow);
   SetStyle (Term, Bold => No, Italic => No, Underline => No, Strikeout => No);
   SetEditingOptions (Term, Echo => No, Insert => No);
   Put (Term, "Normal font     > ");
   for i in 1 .. 20 loop
      Get (Term, Char);
      Put (Term, Char);
   end loop;
   SetPos (Term, 0, 1);
   SetFgColor (Term, Red);
   SetStyle (Term, Italic => Yes);
   Put (Term, "Italic only     > ");
   for i in 1 .. 20 loop
      Get (Term, Char);
      Put (Term, Char);
   end loop;
   SetPos (Term, 0, 2);
   SetFgColor (Term, Blue);
   SetStyle (Term, Bold => Yes, Italic => No);
   Put (Term, "Bold only       > ");
   for i in 1 .. 20 loop
      Get (Term, Char);
      Put (Term, Char);
   end loop;
   SetPos (Term, 0, 3);
   SetFgColor (Term, White);
   SetStyle (Term, Bold => Yes, Italic => Yes);
   Put (Term, "Bold Italic     > ");
   for i in 1 .. 20 loop
      Get (Term, Char);
      Put (Term, Char);
   end loop;

   ClearKeyboard (Term);
   SetTitleOptions (Term,
      Set => Yes,
      Title => "Cycling - Normal, Bold, Italic, Bold Italic (FF to exit) ...");
   Put (Term, ASCII.CR & ASCII.LF);
   SetBgColor (Term, White);
   SetFgColor (Term, Black);
   SetEditingOptions (Term, Echo => Yes, Wrap => Yes);
   Put (Term, "Cycle (FF exit) > ");
   loop
      SetStyle (Term, Bold => No, Italic => No, Underline => No, Strikeout => No);
      Get (Term, Char);
      exit when Char = ASCII.FF;
      SetStyle (Term, Bold => Yes);
      Get (Term, Char);
      exit when Char = ASCII.FF;
      SetStyle (Term, Italic => Yes, Bold => No);
      Get (Term, Char);
      exit when Char = ASCII.FF;
      SetStyle (Term, Bold => Yes, Italic => Yes);
      Get (Term, Char);
      exit when Char = ASCII.FF;
   end loop;

   Close (Term);

end Demo_Multiple;
