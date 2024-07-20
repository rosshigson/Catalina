--  tgef.adb
--  a simple test to instantiate GEF and call the sin function.

with Ada.Numerics.Generic_Elementary_Functions;
with Ada.Numerics; use Ada.Numerics;
with Term_IO;
procedure Tgef is

   pragma Linker_Options ("-mwindows");
   package Flt_Io is new Term_IO.Float_Io (Float);

   package Elementary_Functions is new
                  Ada.Numerics.Generic_Elementary_Functions (Float);
   Y : Float;
   P : Integer;
   subtype Line is String (1 .. 80);
   Filler  : Line := (others => ' ');
   Display : array (0 .. 21) of Line;
begin
   Term_IO.Set_Page_Length (Term_IO.Current_Output, 0);

   for I in Display'range loop
      Display (I) := Filler;
   end loop;

   Display (10) := (1 .. 80 => '-');

   for I in 1 .. 20 loop
      Y := Elementary_Functions.Sin (Float (I) * Pi / 10.0);
      Flt_Io.Put (Y);
      Term_IO.Put (" <==");
      Term_IO.Put_Line (Integer'Image (I));
      P := Integer (10.0 * Y) + 10;
      Display (P)(4 * I) := '*';
   end loop;

   for I in  Display'range loop
      Term_IO.Put_Line (Display (I));
   end loop;

   Term_IO.Put_Line ("Tgef exiting");
end Tgef;
