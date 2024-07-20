--::::::::::
--screen.adb
--::::::::::
with Term_IO;
package body Screen is

  -- simple ANSI terminal emulator
  -- Michael Feldman, The George Washington University
  -- July, 1995

  -- These procedures will work correctly only if the actual
  -- terminal is ANSI compatible. ANSI.SYS on a DOS machine
  -- will suffice.

  package Int_IO is new Term_IO.Integer_IO (Num => Integer);

  procedure Beep is
  begin
    Term_IO.Put (Item => ASCII.BEL);
  end Beep;

  procedure ClearScreen is
  begin
    Term_IO.Put (Item => ASCII.ESC);
    Term_IO.Put (Item => "[2J");
  end ClearScreen;

  procedure MoveCursor (To: in Position) is
  begin                                                
    Term_IO.New_Line;
    Term_IO.Put (Item => ASCII.ESC);
    Term_IO.Put ("[");
    Int_IO.Put (Item => To.Row, Width => 1);
    Term_IO.Put (Item => ';');
    Int_IO.Put (Item => To.Column, Width => 1);
    Term_IO.Put (Item => 'f');
  end MoveCursor;  

end Screen;
