with Terminal_Types;
with Terminal_Emulator;

procedure Hello_World is

   pragma Linker_Options ("-mwindows");

   use Terminal_Types;
   use Terminal_Emulator;

   Term : Terminal;
   Char : Character;

   begin
      Open (Term);
      SetKeyOptions (Term, SetSize => Yes, Size => 10);
      Put (Term, ASCII.ESC & "[12;32HHello, World !");
      Get (Term, Char);
      Close (Term);

end Hello_World;
