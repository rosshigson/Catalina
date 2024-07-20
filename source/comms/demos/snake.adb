with Terminal_Types;
with Terminal_Emulator;
with Terminal_Emulator.Option_Parser;
with Win32_Support;

with Ada.Numerics.Float_Random;
with Ada.Command_Line;

procedure Snake is

   use Terminal_Types;
   use Terminal_Emulator;

   package AR  renames Ada.Numerics.Float_Random;
   package OP  renames Terminal_Emulator.Option_Parser;
   package ACL renames Ada.Command_Line;
   package WS  renames Win32_Support;

   -- Notes on snake:
   -- ---------------
   -- Use the command line option "/NoWingdings" f you do not have the
   -- Wingdings font installed. If you see the snake drawn with Is, Js,
   -- Ks and ls instead of nice smiley faces and dots, then you do not
   -- have Wingdings.

   pragma Linker_Options ("-mwindows");

   type Direction_Type is (left, right, up, down);

   type Position_Type is record
      Col : Natural;
      Row : Natural;
   end record;

   INITIAL_LENGTH    : constant := 5;
   WINNING_TARGET    : constant := 25;
   MAXIMUM_LENGTH    : constant := INITIAL_LENGTH + WINNING_TARGET;
   INITIAL_DELAY     : constant := 0.25;
   DELAY_EROSION     : constant := 0.9;
   EGG_COLOR         : constant Color_Type := Green;
   HEAD_COLOR        : constant Color_Type := Red;
   BODY_COLOR        : constant Color_Type := Yellow;
   TEXT_COLOR        : constant Color_Type := Green;
   SCREEN_COLOR      : constant Color_Type := Dark_Blue;
   CRLF              : constant String := ASCII.CR & ASCII.LF;

   Wingdings         : aliased Boolean := True;

   Term              : Terminal;

   Snake             : array (0 .. MAXIMUM_LENGTH - 1) of Position_Type;
   Head              : Natural        := 0;
   BodyLength        : Natural        := 0;
   Direction         : Direction_Type := left;
   Dead              : Boolean        := False;
   Egg               : Position_Type  := (0, 0);
   DelayTime         : Duration       := INITIAL_DELAY;

   Key               : Special_Key_Type;
   Modifier          : Modifier_Key_Type;
   Char              : Character;
   KeyUsed           : Boolean;
   Generator         : AR.Generator;

   HeadChar          : Character;
   BodyChar          : Character;
   HappyChar         : Character;
   SadChar           : Character;

   -- GameScreen : set the fonts, screen size etc to play the game
   procedure GameScreen is
   begin
      ClearScreen (Term);
      if Wingdings then
         SetFontByName (Term, SetName => Yes, Font => "Wingdings");
         HeadChar  := 'K'; -- normal face
         HappyChar := 'J'; -- happy face
         SadChar   := 'L'; -- sad face
         BodyChar  := 'l'; -- dot
      else
         HeadChar  := '@';
         HappyChar := 'O';
         SadChar   := 'X';
         BodyChar  := '*';
      end if;
      SetScreenSize (Term, Columns => 40, Rows => 40);
      SetViewSize (Term, Columns => 40, Rows => 40);
   end GameScreen;

   -- TextScreen : set the fonts, screen size etc to display normal text
   procedure TextScreen is
   begin
      ClearScreen (Term);
      if Wingdings then
         SetFontByName (Term, SetName => Yes, Font => "Terminal");
      end if;
      SetScreenSize (Term, Columns => 60, Rows => 20);
      SetViewSize (Term, Columns => 60, Rows => 20);
   end TextScreen;

   -- ShowInstructions : show some information about the game.
   procedure ShowInstructions
   is
   begin
      SetOutputFgColor (Term, TEXT_COLOR);
      SetOutputPos (Term, 0, 0);
      Put (Term, "A snake game." & CRLF & CRLF);
      Put (Term, "Use the cursor keys to change the snake direction." & CRLF & CRLF);
      Put (Term, "Eat the eggs to make your snake get longer and faster." & CRLF & CRLF);
      Put (Term, "Don't run into the edges of the window or over yourself." & CRLF & CRLF);
      Put (Term, "Eat" & Natural'Image (WINNING_TARGET) & " eggs to win !." & CRLF & CRLF);
      Put (Term, "Press any key to begin ...");
      Get (Term, Char);
      ClearScreen (Term);
   end ShowInstructions;

   -- InitializeSnake : Set up the snake to its initial values, and draw it.
   procedure InitializeSnake is
      MaxCol   : Natural := 0;
      MaxRow   : Natural := 0;
      Position : Position_Type;
      Char     : Character;
   begin
      Dead       := False; -- it lives !
      Direction  := left;
      Head       := 0;
      BodyLength := INITIAL_LENGTH;
      DelayTime  := INITIAL_DELAY;
      GetScreenSize (Term, MaxCol, MaxRow);
      Position := (MaxCol / 2, MaxRow / 2);
      SetOutputFgColor (Term, HEAD_COLOR);
      Char := HeadChar; -- first position is head
      for i in 0 .. INITIAL_LENGTH - 1 loop
         Snake (Head + i) := Position;
         Put (Term, Char, Column => Position.Col, Row => Position.Row);
         SetOutputFgColor (Term, BODY_COLOR);
         Char := BodyChar;
         Position.Col := Position.Col + 1;
      end loop;
      BodyLength := INITIAL_LENGTH;
      SetTitleOptions (Term, Set => Yes, Title => "Snake Game");
   end InitializeSnake;

   -- InitializeEgg : Set up an egg, and draw it. Make sure the egg
   --                 is not on the snake anywhere.
   procedure InitializeEgg is
      MaxCol  : Natural := 0;
      MaxRow  : Natural := 0;
      Ok      : Boolean;
   begin
      GetScreenSize (Term, MaxCol, MaxRow);
      loop
         Egg.Col := Natural (Float (MaxCol - 1) * Float (AR.Random (Generator)));
         Egg.Row := Natural (Float (MaxRow - 1) * Float (AR.Random (Generator)));
         Ok := True;
         for i in 0 .. BodyLength loop
            if Egg = Snake ((Head + i) mod MAXIMUM_LENGTH) then
               Ok := False;
            end if;
         end loop;
         if Ok then
            exit;
         end if;
      end loop;
      SetOutputStyle (Term, Flashing => Yes);
      SetOutputFgColor (Term, EGG_COLOR);
      Put (Term, HappyChar, Column => Egg.Col, Row => Egg.Row);
      SetOutputStyle (Term, Flashing => No);
   end InitializeEgg;

   -- DrawSnake : draw the snake - check for changes in direction,
   --             or whether it has run into a wall, or over itself.
   --             If it eats an egg, make the snake longer and faster.
   task DrawSnake  is
      entry Start;
   end DrawSnake;

   task body DrawSnake
   is
      NewHead : Position_Type;
      OldTail : Position_Type;
      MaxCol  : Natural := 0;
      MaxRow  : Natural := 0;
      Dies    : Boolean;

   begin
      loop
         accept Start;
         loop
            Dies := False;
            GetScreenSize (Term, MaxCol, MaxRow);
            NewHead := Snake (Head);
            OldTail := Snake ((Head + BodyLength - 1) mod MAXIMUM_LENGTH);
            case Direction is
               when left =>
                  if NewHead.Col = 0 then
                     Dies := True; -- hit a wall
                  else
                     NewHead.Col := NewHead.Col - 1;
                  end if;
               when right =>
                  if NewHead.Col >= MaxCol - 1 then
                     Dies := True; -- hit a wall
                  else
                     NewHead.Col := NewHead.Col + 1;
                  end if;
               when up =>
                  if NewHead.Row = 0 then
                     Dies := True; -- hit a wall
                  else
                     NewHead.Row := NewHead.Row - 1;
                  end if;
               when down =>
                  if NewHead.Row >= MaxRow - 1 then
                     Dies := True; -- hit a wall
                  else
                     NewHead.Row := NewHead.Row + 1;
                  end if;
            end case;
            -- indicate we have seen and actioned the key
            KeyUsed := True;
            if not Dies then
               -- make sure snake has not run over itself
               for i in 0 .. BodyLength loop
                  if NewHead = Snake ((Head + i) mod MAXIMUM_LENGTH) then
                     Dies := True; -- ran over our own tail
                  end if;
               end loop;
            end if;
            if Dies then
               -- awwwww ! - put the poor snake out of its misery
               SetOutputFgColor (Term, HEAD_COLOR);
               if Wingdings then
                  Put (Term, SadChar,  Column => NewHead.Col, Row => NewHead.Row);
               else
                  Put (Term, "BANG!",  Column => NewHead.Col, Row => NewHead.Row);
               end if;
               WS.Beep;
               delay 0.5;
               SetOutputFgColor (Term, TEXT_COLOR);
               TextScreen;
               Put (Term,
                  "Your snake ate"
                     & Natural'Image (BodyLength - INITIAL_LENGTH)
                     & " eggs before it died.",
                  Column => 0, Row => 0);
               Put (Term, "Press any key to start again.", Column => 0, Row => 1);
               Dead := True;
               exit;
            else
               -- hooray ! - see if we reached an egg
               if NewHead = Egg then
                  -- eat the egg
                  SetOutputFgColor (Term, EGG_COLOR);
                  if Wingdings then
                     Put (Term, SadChar,  Column => Egg.Col, Row => Egg.Row);
                     SetOutputFgColor (Term, HEAD_COLOR);
                     Put (Term, HappyChar,  Column => Snake (Head).Col, Row => Snake (Head).Row);
                     delay 0.25;
                  else
                     Put (Term, "GULP!", Column => Egg.Col, Row => Egg.Row, Move => No);
                     delay 0.25;
                     Put (Term, "     ", Column => Egg.Col, Row => Egg.Row, Move => No);
                  end if;
                  -- increase body length
                  BodyLength := BodyLength + 1;
                  -- see if we have reached maximum body length
                  if BodyLength >= MAXIMUM_LENGTH then
                     TextScreen;
                     Put (Term, "YOU ARE THE WINNER !", Column => 0, Row => 0);
                     Put (Term, "Press any key to start again.", Column => 0, Row => 1);
                     Dead := True; -- shoot the snake to start again
                     exit;
                  else
                     -- erode the delay (make game faster)
                     DelayTime  := DelayTime * DELAY_EROSION;
                     -- draw a new egg
                     InitializeEgg;
                     -- update the title with number of eggs consumed
                     SetTitleOptions (Term,
                        Set => Yes,
                        Title => "Snake Game -" & Natural'Image (BodyLength - INITIAL_LENGTH));
                  end if;
               else
                  -- no egg - erase old tail
                  Put (Term, ' ', Column => OldTail.Col, Row => OldTail.Row);
               end if;
               -- redraw old head as part of body
               SetOutputFgColor (Term, BODY_COLOR);
               Put (Term, BodyChar, Column => Snake (Head).Col, Row => Snake (Head).Row);
               -- draw new head
               SetOutputFgColor (Term, HEAD_COLOR);
               Put (Term, HeadChar, Column => NewHead.Col, Row => NewHead.Row);
               Head := (Head + MAXIMUM_LENGTH - 1) mod MAXIMUM_LENGTH;
               Snake (Head) := NewHead;
            end if;
            delay DelayTime;
         end loop;
      end loop;
   end DrawSnake;

   -- ParseArguments : Parse options in the command line arguments.
   --                  Note the addition of the new option "/Wingdings"
   procedure ParseArguments
   is
      CmdLine  : String (1 .. 1000);
      CmdLen   : Natural := 0;
      Parsed   : Boolean := False;
      ParsePos : Natural := 1;
      Parser   : OP.Parser_Type;
      Added    : Boolean;
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

      OP.CreateParser (Parser, Term, ExtraOptions => 1, LeadChar => '/');
      OP.AddOption (Parser, "Wingdings", 4, OP.Bool_Option, Added, Bool => Wingdings'Unchecked_Access);
      while ParsePos > 0 and ParsePos <= CmdLen loop
         -- attempt to parse the argument
         OP.Parse (Parser, CmdLine (1 .. CmdLen), ParsePos, ParsePos, Parsed);
         if not Parsed then
            -- argument was not a valid option string
            SetWindowOptions (Term, Visible => Yes);
            Put (Term, "Invalid option """ & CmdLine (ParsePos .. CmdLen) & """" & CRLF);
            Put (Term, "Press any key to begin ...");
            Get (Term, Char);
            exit;
         end if;
      end loop;
      OP.DeleteParser (Parser);

   end ParseArguments;

begin
   -- open the terminal - enable all menu items, but don't display the
   -- window menus initially (the user can use the context menu to display
   -- them if required). Parse any command line arguments before making
   -- the window visible
   Open (Term,
      --  "Snake Game",
      Font => "Terminal",
      CharSet => GDO.DEFAULT_CHARSET,
      Size => 10,
      Rows => 20,
      Columns => 60,
      MainMenu => No,
      OptionMenu => Yes,
      AdvancedMenu => Yes,
      ContextMenu => Yes,
      Visible => Yes);
   ParseArguments;
   SetWindowOptions (Term, Visible => Yes);

   -- we want to be able to read cursor keys, so enable extended keys -
   -- this means we have to use GetExtended to read from the terminal
   SetKeyOptions (Term,
      SetSize => Yes,
      Size => 10,
      CursorKeys => No,
      ExtendedKeys => Yes);
   SetPasteOptions (Term, ToKeyboard => No, ToBuffer => No);

   -- set up the cursor options - input cursor not visible
   SetCursorOptions (Term, Visible => No, Flashing => No);

   -- set various other options - largely a matter of taste
   SetScrollOptions (Term, Vertical => No, Horizontal => No, OnOutput => No);
   SetMouseOptions (Term, MouseCursor => No, MouseSelects => No);
   SetSizingOptions (Term, Mode => Size_Fonts);
   SetAnsiOptions (Term, OnInput => No, OnOutput => No);
   SetEditingOptions (Term, Echo => No, Wrap => No);
   SetOtherOptions (Term, CombinedCursor => Yes, CombinedStyle => Yes);

   -- set up initial buffer colors
   SetOutputFgColor (Term, TEXT_COLOR);
   SetOutputBgColor (Term, SCREEN_COLOR);
   SetBufferColors (Term, Current => Yes);
   ClearBuffer (Term);

   -- reset the random number generator, show the instructions
   AR.Reset (Generator);
   TextScreen;
   ShowInstructions;

   -- now start the game
   GameScreen;
   InitializeSnake;
   InitializeEgg;
   DrawSnake.Start;

   -- wait for the user to press keys. Note that KeyUsed provides
   -- a primitive means of ensuring each key press is been seen by
   -- the DrawSnake task. This is so we don't miss keystrokes when
   -- the user is typing ahead fast - essentially, we don't read the
   -- next key until the last one has been processed, make use of the
   -- key buffers abilty to buffer up keystrokes.
   loop
      begin
         -- Note: if we are currently reading, we get a tasking
         -- error when the user closes the terminal, so we abort
         -- the DrawSnake task if we get any exceptions and exit
         GetExtended (Term, Special => Key, Modifier => Modifier, Char => Char);
      exception
         when others =>
            abort DrawSnake;
            exit;
      end;
      -- decode the special key, and set direction if it is a cursor key
      case Key is
         when Up_Key =>
            if Direction /= up then
               KeyUsed   := False;
               Direction := up;
            end if;
         when Down_Key =>
            if Direction /= down then
               KeyUsed   := False;
               Direction := down;
            end if;
         when Left_Key =>
            if Direction /= left then
               KeyUsed   := False;
               Direction := left;
            end if;
         when Right_Key =>
            if Direction /= right then
               KeyUsed   := False;
               Direction := right;
            end if;
         when others =>
            -- not a cursor key - ignore it
            null;
      end case;
      if Closed (Term) then
         -- user has closed the window, so abort
         -- the DrawSnake task and exit
         abort DrawSnake;
         exit;
      elsif Dead then
         -- splat ! - restart the game
         GameScreen;
         InitializeSnake;
         InitializeEgg;
         DrawSnake.Start;
      else
         delay 0.0;
         -- wait a bit to ensure the key has been seen before
         -- reading another - but don't wait forever (just in
         -- case the DrawSnake task has terminated for some
         -- reason)
         for i in 1 .. Integer (INITIAL_DELAY * 100.0) loop
            exit when KeyUsed;
            delay 0.01;
         end loop;
      end if;
   end loop;

exception
   when others =>
      WS.Beep;
      abort DrawSnake;
      if not Closed (Term) then
         Close (Term);
      end if;
end Snake;
