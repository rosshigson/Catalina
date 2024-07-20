with Term_IO; use Term_IO;
procedure Hello is
   pragma Linker_Options ("-mwindows");
begin
   Put_Line ("Hello World. Welcome to GNAT");
end;
