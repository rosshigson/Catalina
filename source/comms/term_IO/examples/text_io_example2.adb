with Term_IO; use Term_IO;
with Term_IO.Integer_Text_IO; use Term_IO.Integer_Text_IO;
with Term_IO.Float_Text_IO; use Term_IO.Float_Text_IO;
procedure Text_IO_Example is
   pragma Linker_Options ("-mwindows");
   type Color is (red, blue, green);
   package Color_Io is new Enumeration_Io (Color); use Color_Io;
   X : Float;
   Last : Positive;
   Col : Color;
begin
   Put_Line ("The following should be a five in base two:");
   Put (5, Width => 7, Base => 2);
   New_Line;
   Get ("  23.4567 ", X, Last);
   Put_Line ("The following should be 2.34567E+01");
   Put (X);
   New_Line;
   Put_Line ("The following should be RED");
   Put (red, Set => Upper_Case);
   New_Line;
   loop
      Put ("Enter an integer: ");
      Get (X);
      Put ("Your integer was: ");
      Put (X);
      New_Line;
      Put ("Enter a float: ");
      Get (X);
      Put ("Your float was: ");
      Put (X);
      New_Line;
      Put ("Enter a color: ");
      Get (Col);
      Put ("Your Color was: ");
      Put (Col, Set => Upper_Case);
      New_Line;
   end loop;
exception
   when others =>
      Put (" Oops !!! ");
end Text_IO_Example;
