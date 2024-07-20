with Term_IO; use Term_IO;

procedure Demo_Term_IO
is
   pragma Linker_Options ("-mwindows");

   Term : File_Type;

   Line : String (1 .. 80);
   Last : Natural;

   -- EraseLine: Send the ANSI control sequence to erase the current line
   procedure EraseLine (File : in File_Type := Term) is
   begin
      Put (File, ASCII.ESC & "[2K");
   end EraseLine;

   -- BoldFlash: Send the ANSI control sequence for bold and flashing text
   procedure BoldFlash (File : in File_Type := Term) is
   begin
      Put (File, ASCII.ESC & "[5;1m");
   end BoldFlash;

   -- Normal: Send the ANSI control sequence for normal text
   procedure Normal (File : in File_Type := Term) is
   begin
      Put (File, ASCII.ESC & "[0m");
   end Normal;

   -- Proceed: Print a message and wait for a space to be typed
   procedure Proceed (File : in File_Type := Term) is
      Char : Character := ASCII.NUL;
   begin
      BoldFlash (File);
      Put (File, "(press the space bar to proceed)");
      Normal (File);
      loop
         Get (File, Char);
         exit when Char = ' ';
      end loop;
      EraseLine (File);
      Put_Line (File, "");
   end Proceed;

   -- MarkTheSpot: Put a cross at the current ouput location
   procedure MarkTheSpot (File : in File_Type := Term) is
   begin
      BoldFlash (File);
      Put (File, "x <- HERE !!  ");
      Normal (File);
   end MarkTheSpot;

begin -- Demo_Term_IO

   -- Demo non-strict terminal first. When using non-strict semantics, the main
   -- difference between using an input terminal and an output terminal is how
   -- the terminal handles Skip_Line - output terminals write lines, whereas
   -- input terminals read lines. We do this test with an output terminal. All
   -- interaction is done via the terminal, since when using non-strict semantics
   -- you can always both read and write from the terminal regardless of whether
   -- it was opened as an input or output terminal.

   Open (
      Term,
      Out_File,
      "Non-strict output terminal",
      "TERM_IO NoStrict fg=white bg=blue screen=80,25 buffer=100 font=""courier""");

   Put_Line (Term, "Welcome. This is a non-strict output terminal.");

   Proceed;
   Put_Line (Term, "The form options of this terminal are: ");
   Put_Line (Term, Form (Term));
   Proceed;

   Put_Line (Term, "Skipping two lines of text.");
   Skip_Line (Term, 2);

   Put_Line (Term, "Ready to set line 12 and column 12.");
   Proceed;
   Set_Line (Term, 12);
   Set_Col (Term, 12);
   MarkTheSpot;
   Proceed;

   Put_Line (Term, "Ready to set line 2 and column 2.");
   Proceed;
   Set_Line (Term, 2);
   Set_Col (Term, 2);
   MarkTheSpot;
   Proceed;

   EraseLine;
   Put_Line (Term, "");
   EraseLine;
   Put_Line (Term, "Ready to perform new page.");
   EraseLine;
   Proceed;
   New_Page (Term);

   Put_Line (Term, "Ready to set screen size to 15 lines by 40 columns.");
   Proceed;
   EraseLine;
   Put_Line (Term, "");
   Set_Page_Length (Term, 15);
   Set_Line_Length (Term, 40);
   Put_Line (Term, "The screen should now be 15 lines by 40 columns.");
   Proceed;

   Put_Line (Term, "Now type in 3 lines of text - they will be echoed to standard output.");
   for i in 1 .. 3 loop
      Get_Line (Term, Line, Last);
      Put_Line (Line (1 .. Last));
   end loop;

   Put_Line (Term, "Closing this non-strict terminal. A strict output terminal will then open.");
   Proceed;
   Close (Term);

   -- Demo strict output terminals. When using Strict semantics, output terminals
   -- cannot be read from. So we use StdIn/StdOut to interact with the user.
   -- Also, setting the line and column less than the current line and column
   -- performs an implicit new page.

   Open (
      Term,
      Out_File,
      "Strict output terminal",
      "TERM_IO Strict fg=orange bg=dark_green screen=80,25 buffer=100");

   Put_Line ("A strict output terminal window should now be open.");
   Put_Line (Term, "This is a strict output terminal.");
   Put_Line (Term, "See the standard input and output windows for futher instructions.");

   Put_Line ("Ready to display form options.");
   Proceed (Standard_Input);
   Put_Line (Term, "");
   Put_Line (Term, "The form options of this terminal are: ");
   Put_Line (Term, Form (Term));
   Put_Line ("The form options should be on display.");
   Proceed (Standard_Input);

   Put_Line ("Ready to set line 12 and column 12.");
   Proceed (Standard_Input);
   Set_Line (Term, 12);
   Set_Col (Term, 12);
   MarkTheSpot;
   Put_Line ("The ""x"" should be at position line 12 and column 12.");
   Proceed (Standard_Input);

   Put_Line ("Ready to set line 2 and column 2.");
   Proceed (Standard_Input);
   Set_Line (Term, 2);
   Set_Col (Term, 2);
   MarkTheSpot;
   Put_Line ("The ""x"" should be at line 2 and column 2. The screen will have been cleared.");
   Proceed (Standard_Input);

   Put_Line ("Ready to perform new page.");
   Proceed (Standard_Input);
   New_Page (Term);

   Put_Line ("Ready to set screen size to 15 lines by 40 columns.");
   Proceed (Standard_Input);
   Set_Page_Length (Term, 15);
   Set_Line_Length (Term, 40);
   Put_Line ("The screen should now be 15 lines by 40 column.s");
   Proceed (Standard_Input);

   Put_Line ("Closing this strict output terminal. A strict input terminal will then open.");
   Proceed (Standard_Input);
   Close (Term);

   -- Demo strict input terminals. When using Strict semantics, input terminals
   -- cannot be written to. So we use StdIn/StdOut to interact with the user.
   -- Also, setting the line and column requires input from the user. Finally,
   -- the line and page size cannot be changed.

   Open (
      Term,
      In_File,
      "Strict input terminal",
      "TERM_IO Strict fg=yellow bg=dark_red screen=80,25 buffer=100");
   Put_Line ("A strict input terminal window should now be open.");
   Proceed (Standard_Input);

   Put_Line ("The form options of that terminal are: ");
   Put_Line (Form (Term));
   Proceed (Standard_Input);

   Put_Line ("Ready to skip two lines of text.");
   Proceed (Standard_Input);
   Put_Line ("(you have to type at least 2 lines in the input terminal window)");
   Skip_Line (Term, 2);

   Put_Line ("Ready to set line 12 and column 12.");
   Proceed (Standard_Input);
   Put_Line ("(you have to type suitable lines/characters in the input terminal window)");
   Set_Line (Term, 12);
   Put_Line ("The input terminal is now at line 12.");
   Set_Col (Term, 12);
   Put_Line ("The input terminal is now at column 12.");

   Put_Line ("Ready to set line 2 and column 2.");
   Proceed (Standard_Input);
   Put_Line ("(you have to type ENTER, then CTRL+L, then suitable lines/characters in the input terminal window)");
   Set_Line (Term, 2);
   Put_Line ("The input terminal is now at line 2.");
   Set_Col (Term, 2);
   Put_Line ("The input terminal is now at column 2.");

   Put_Line ("Now type 3 lines of text in the input terminal window - they will be echoed to standard error.");
   for i in 1 .. 3 loop
      Get_Line (Term, Line, Last);
      Put_Line (Standard_Error, Line (1 .. Last));
   end loop;

   Put_Line ("Closing the strict input terminal. The program will then read from standard input.");
   Proceed (Standard_Input);
   Close (Term);

   Put_Line ("Enter a line of text (in the standard input window).");
   Put_Line ("It will be echoed to standard input, standard output and standard error.");
   Get_Line (Line, Last);
   Put_Line (Standard_Input,  "Standard Input  : Your text was: " & Line (1 .. Last) & ".");
   Put_Line (Standard_Output, "Standard Output : Your text was: " & Line (1 .. Last) & ".");
   Put_Line (Standard_Error,  "Standard Error  : Your text was: " & Line (1 .. Last) & ".");
   Put_Line ("Done - the program will terminate when the standard windows are closed.");

exception
   when others =>
      Put_Line (Standard_Error, "Oops ! An exception occurred in the program.");
      Put_Line (Standard_Error, "The program will terminate when the standard windows are closed.");
end Demo_Term_IO;
