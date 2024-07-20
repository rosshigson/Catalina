--  tef.adb
--  a simple test to use the non-generic elementary function package and call 
--  the some trig functions. Similar to tgef.adb except here there is no 
--  instantiation of GEF (Generic ELementary Functions).

with Ada.Numerics.Elementary_Functions;
with Ada.Numerics; use Ada.Numerics;
with Term_IO;
procedure Tef is
   pragma Linker_Options ("-mwindows");
   Y : Float;
   P : Integer;
   subtype Line is String (1 .. 80);
   Filler  : Line := (others => ' ');
   Display : array (0 .. 24) of Line;
begin
   Term_IO.Set_Page_Length (Term_IO.Current_Output, 0);
   Term_IO.Put_Line ("Display of Sin, Cos and Arctan graphs");
   Term_IO.Put_Line ("Legend: Sin (O), Cos (X), Arctan (+)");


   for I in Display'range loop
      Display (I) := Filler;
   end loop;

   Display (10) := (1 .. 80 => '-');

   for I in 1 .. 20 loop
      Y := Elementary_Functions.Cos (Float (I) * Pi / 10.0);
      P := Integer (10.0 * Y) + 10;
      Display (P)(4 * I) := 'O';
      Y := Elementary_Functions.Sin (Float (I) * Pi / 10.0);
      P := Integer (10.0 * Y) + 10;
      Display (P)(4 * I) := 'X';
      Y := Elementary_Functions.Arctan (Float (I) * Pi / 10.0);
      P := Integer (10.0 * Y) + 10;
      Display (P)(4 * I) := '+';
   end loop;

   for I in  Display'range loop
      Term_IO.Put_Line (Display (I));
   end loop;

end Tef;
