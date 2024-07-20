with Terminal_Types;
with Terminal_Emulator;

procedure Demo_Cursors is

   use Terminal_Types;
   use Terminal_Emulator;

   pragma Linker_Options ("-mwindows");

   Term : Terminal;

   CRLF : constant String := ASCII.CR & ASCII.LF;

   -- RainbowBox : draw a multicolored box using the output
   --              cursor - must be explicitly started, then
   --              continues forever
   task RainbowBox  is
      entry Start;
   end RainbowBox;

   task body RainbowBox is

      procedure DrawBox is
      begin
         for i in 20 .. 60 loop
            Put (Term, '*', i, 7);
         end loop;
         for j in 7 .. 14 loop
            Put (Term, '*', 60, j);
         end loop;
         for i in reverse 20 .. 60 loop
            Put (Term, '*', i, 14);
         end loop;
         for j in reverse 7 .. 14 loop
            Put (Term, '*', 20, j);
         end loop;
      end DrawBox;

   begin
      accept Start;
      loop
         SetFgColor (Term, Red);
         DrawBox;
         SetFgColor (Term, Yellow);
         DrawBox;
         SetFgColor (Term, Blue);
         DrawBox;
         SetFgColor (Term, Green);
         DrawBox;
      end loop;
      -- Close (Term);
   end RainbowBox;

begin
      -- open the terminal - enable all menus, but don't display the
      -- menus initially (the user can use the context menu to display
      -- them if required). Note that we use the "stock font" version
      -- of the "Open" procedure, which means we will get a default
      -- GUI font, and we will not be able to resize it. There is no
      -- particular reason for this - it's just a demo.
      Open (Term, "Demonstration of separate Input and Output Cursors",
         VirtualRows => 75,
         MainMenu => No,
         OptionMenu => Yes,
         AdvancedMenu => Yes,
         ContextMenu => Yes);

      -- since we never read from the terminal, it is best to disable
      -- the keyboard buffer. Otherwise it will fill up and beep.
      SetKeyOptions (Term, SetSize => Yes, CursorKeys => Yes, Size => 0);
      SetPasteOptions (Term, ToKeyboard => No, ToBuffer => Yes);

      -- set up the cursor options - these affect the input cursor only
      SetCursorOptions (Term, Visible => Yes, Flashing => Yes);
      SetCursorColor (Term, Color => Magenta);

      -- set various other options - largely a matter of taste
      SetScrollOptions (Term, Vertical => Yes, OnOutput => No);
      SetMouseOptions (Term, MouseCursor => Yes);
      SetSizingOptions (Term, Mode => Size_View);
      SetAnsiOptions (Term, OnInput => No, OnOutput => No);
      SetEditingOptions (Term, Echo => Yes, Wrap => Yes);
      SetOtherOptions (Term,
         UpDownMoveView => Yes,
         LeftRightWrap => Yes,
         LeftRightScroll => No,
         CombinedCursor => No,
         CombinedStyle => No);

      -- use some lines just to make it obvious we can scroll
      -- the view up or down, just to illustrate the effect
      SetBufferColors (Term, Green, Dark_Blue);
      ClearBuffer (Term);
      SetFgColor (Term, Yellow);
      SetBgColor (Term, Dark_Blue);
      for i in 1 .. 74 loop
         Put (Term, ASCII.LF);
      end loop;
      SetViewBase (Term, Row => 25);
      SetScreenBase (Term, Row => 25);

      -- output some explanatory text - note that
      -- "Put" always uses the output cursor
      SetOutputPos (Term, 0, 0);
      Put (Term, "This demo shows the effect of having separate input and output cursors," & CRLF);
      Put (Term, "with separate input and output styles." & CRLF & CRLF);
      Put (Term, "Type some text. You can use the mouse or cursor keys to move the cursor." & CRLF);
      Put (Term, "The visible magenta cursor is the input cursor - your text appears there." & CRLF);
      Put (Term, "The rainbow box is drawn with the output cursor, which is always invisible.");

      -- start drawing the box with the output
      -- cursor - the task just draws forever
      RainbowBox.Start;

      -- now explicitly set up the input cursor - any
      -- text typed will be echoed by the terminal
      SetInputPos (Term, 40, 10);
      SetInputFgColor (Term, Green);
      SetInputBgColor (Term, Dark_Green);

      -- nothing more to do - we will terminate when the user close the terminal

end Demo_Cursors;
