with Terminal_Types;
with Terminal_Emulator;

procedure Demo_Regions is

   use Terminal_Types;
   use Terminal_Emulator;

   pragma Linker_Options ("-mwindows");

   Background : constant String := "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890!@#$%^&*()<>?][{}-";
   Term       : Terminal;
   Char       : Character;
   Regions    : Integer := 0;
   Smooth     : Boolean := True;

   -- ToggleRegions : Turn on or off the use of scroll regions
   procedure ToggleRegions is
      Cols : Natural := 0;
      Rows : Natural := 0;
   begin
      Regions := (Regions + 1) mod 3;
      if Regions = 1 then
         SetRegionSize (Term, 40, 10);
         SetRegionBase (Term, 20, 5);
         SetScrollOptions (Term, Region => Yes);
         SetPos (Term, 22, 10);
         Put (Term, "Small Region enabled       ");
      elsif Regions = 2 then
         SetRegionBase (Term, 0, 0);
         GetScreenSize (Term, Cols, Rows);
         SetRegionSize (Term, Cols, Rows);
         SetScrollOptions (Term, Region => Yes);
         SetPos (Term, 22, 10);
         Put (Term, "Full Screen Region enabled ");
      else
         SetScrollOptions (Term, Region => No);
         SetPos (Term, 22, 10);
         Put (Term, "Region disabled            ");
      end if;
   end ToggleRegions;

   -- ToggleSmoothScroll : Turn on or off the use of smooth scroll
   procedure ToggleSmoothScroll is
   begin
      Smooth := not Smooth;
      if Smooth then
         SetScrollOptions (Term, Smooth => Yes);
         SetPos (Term, 22, 11);
         Put (Term, "Smooth scroll enabled ");
      else
         SetScrollOptions (Term, Smooth => No);
         SetPos (Term, 22, 11);
         Put (Term, "Smooth scroll disabled");
      end if;
   end ToggleSmoothScroll;

begin

   Open (Term,
      "Demonstration of Regions",
      VirtualRows => 70,
      Rows => 25,
      Columns => 80,
      Font => "Lucida Console",
      Size => 12,
      MainMenu => Yes,
      AdvancedMenu => Yes);
   SetScrollOptions (Term,
      Vertical => Yes,
      Horizontal => Yes);
   SetMouseOptions (Term, MouseCursor => Yes);
   SetKeyOptions (Term, CursorKeys => Yes);
   SetCursorOptions (Term, Visible => Yes, Flashing => Yes);
   SetFgColor (Term, Orange);
   SetBgColor (Term, Gray);
   SetBufferColors (Term, Current => Yes);
   SetEditingOptions (Term, Wrap => Yes);
   ClearBuffer (Term);
   SetAnsiOptions (Term, OnInput => Yes, OnOutput => No);

   -- put some background text on the screen
   SetPos (Term, 0, 0);
   for i in 1 .. 25 loop
      Put (Term, Background (i + 1 .. 80));
      Put (Term, Background (1 .. i));
   end loop;
   SetViewBase (Term);
   SetScreenBase (Term);

   SetPos (Term, 22, 9);
   SetFgColor (Term, Black);
   SetBgColor (Term, Green);

   Put (Term, "Press TAB to start");
   loop
      Get (Term, Char);
      exit when Char = ASCII.HT;
   end loop;

      ToggleRegions;
      ToggleSmoothScroll;

   loop

      -- shift and scroll the region or screen area, depending on whether
      -- regions are enabled or disabled. The area dances around, and ends
      -- up back where it started. The delays are just for effect
      Scroll (Term, 1);
      delay 0.1;
      Shift (Term, 1);
      delay 0.1;
      Scroll (Term, -2);
      delay 0.1;
      Shift (Term, -2);
      delay 0.1;
      Scroll (Term, 1);
      delay 0.1;
      Shift (Term, 1);
      delay 0.1;

      SetPos (Term, 22, 7);
      Put (Term, "FF to exit, TAB to try again  ");
      SetPos (Term, 22, 8);
      Put (Term, "CTRL-R to toggle use of region");
      SetPos (Term, 22, 9);
      Put (Term, "CTRL-S to toggle smooth scroll");
      loop
         Get (Term, Char);
         exit when Char = ASCII.HT or Char = ASCII.FF;
         if Char = ASCII.DC2 then -- CTRL+R
            ToggleRegions;
         end if;
         if Char = ASCII.DC3 then -- CTRL+S
            ToggleSmoothScroll;
         end if;
      end loop;

      exit when Char = ASCII.FF;

   end loop;

   Close (Term);
end Demo_Regions;
