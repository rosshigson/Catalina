/*
 * Simple program to test the effects of various Catalina symbols and payload 
 * or Comms options that affect line termination behaviour (i.e. CR and LF).
 *
 * Depending on where it originated (i.e. Unix, MacOS, Windows) a C program
 * may use CR, LF or CRLF as the line terminator, and expect the ENTER (aka 
 * RETURN) key to generate either a CR or LF. This program can assist in
 * determining suitable payload or Comms options that allow the program 
 * to be run unmodified, or perhaps just by defining a Catalina symbol during 
 * the program compilation,
 *
 * This program must be run in a terminal emulator with a screen width of 80 
 * columns - the program will test whether this is the case. It expects a 
 * vt100 compatible terminal emulator.
 *
 * The relevant payload options that affect CR and LF processing are:
 *   -q1  (ignore CR)
 *   -q2  (ignore LF)
 *   -q4  (CR to LF on input)
 *   -q8  (LF to CR on input)
 *   -q16 (CR to LF on output)
 *   -q32 (CR and LF move cursor, even if otherwise ignored)
 * These are the command line options, But the menu can be used to set these 
 * options from within payload. Press CTRL-A to open the menu (his requires 
 * that 'Ctrl key shortcuts' have been disabled in the Command line window 
 * properties).
 * 
 * Other payload options that can affect how this program behaves are:
 *   -g cols, rows (cols must be 80!)
 *   -i
 *   -I (e.g. -I vt100)
 *
 * The relevant Comms options that can affect CR and LF processing are:
 *   Wrap
 *   Do not process CR
 *   Do not process LF
 *   Use LF as EOL
 *   Auto LF on CR
 *   Auto CR on LF
 * These are all in the Advanced options dialog box.
 *
 * The relevant Catalina symbols are as follows:
 *   CR_ON_LF (any program)
 *   NO_CR_TO_LF (any program)
 *   NO_LINENOISE (Catalyst only)
 *   VT100 (Catalyst, xvi and some Catalyst utilities)
 * These should be specified using -C on the Catalina command line 
 * (e.g. -C CR_ON_LF)
 *
 */
#include <hmi.h>
#include <hmi.h>

int PressToContinue() {
   k_clear();
   t_string(1, "Press ENTER ...");
   return k_wait();
}

void ClearScreen()
{
   t_string(1, "\033c"); // = ESC c = RIS (Reset Initial State) on VT100
   t_string(1, "\033[?7h"); // = ESC [ ? 7 h = Wrap around mode on VT100
}

void main() {
   int ch1, ch2;
   int unused;
   int i;

   _waitsec(1);

   while (1) {
      k_clear();
      ClearScreen();

      t_string(1, "Ensure text wrap is enabled if you do not see any text below this line.         ");
      t_string(1, "                                                                                ");
      t_string(1, "Test 1 - screen width check ...                                                 ");
      t_string(1, "                                                                                ");
      t_string(1, "  ******                                                                        ");
      t_string(1, "  *    *                                                                        ");
      t_string(1, "  *    *                                                                        ");
      t_string(1, "  ******                                                                        ");
      t_string(1, "                                                                                ");
      t_string(1, "If you see a rectangular box above then the screen is 80 columns wide.          ");
      t_string(1, "If not, then you should adjust your screen size before proceeding.              ");
      t_string(1, "                                                                                ");

      PressToContinue();
      ClearScreen();
      t_string(1, "Test 2 - 'carriage return' processing ...                                       ");
      t_string(1, "                                                                                ");
      t_string(1, "If you see THIS then CR is NOT processed correctly. \r");
      t_string(1, "If you see ONLY THIS then CR is processed correctly.                            ");
      t_string(1, "                                                                                ");
      t_string(1, "If you see more than one line above, then CR is NOT processed correctly.        ");
      t_string(1, "Try ignoring it (e.g. for payload add -q1).                                     ");
      t_string(1, "                                                                                ");
      t_string(1, "If CR is already being ignored but STILL does not work enable moving the cursor ");
      t_string(1, "On CR and LF even if they are being ignored (e.g. in payload add -q32).         ");
      t_string(1, "                                                                                ");

      PressToContinue();
      ClearScreen();
      t_string(1, "Test 3 - 'new line' processing ...                                              ");
      t_string(1, "                                                                                ");
      t_string(1, "If you see no text below (apart from 'Press ENTER ...' then 'new line' is NOT   ");
      t_string(1, "processed correctly. The most likely cause is that 'new line' generates both    ");
      t_string(1, "CR and LF, and one or the other (or both) should be ignored (e.g. for payload   ");
      t_string(1, "add -q1 and/or -q2)                                                             ");
      t_string(1, "                                                                                ");
      t_string(1, "If you see THIS then 'new line' is being processed correctly.\n");
      t_string(1, "\n");

      PressToContinue();
      ClearScreen();
      t_string(1, "Test 4 - 'line feed' processing ...                                             ");
      t_string(1, "                                                                                ");
      t_string(1, "Line 1. \n");
      t_string(1, "Line 2. \n");
      t_string(1, "                                                                                ");
      t_string(1, "If Line 1 and Line 2 appear on the same line then LF is being ignored.          ");
      t_string(1, "                                                                                ");
      t_string(1, "If the two lines have an empty line between them, then it is likely that the    ");
      t_string(1, "line terminator is CR LF and both LF and CR are being interpreted as moving     ");
      t_string(1, "to the next line. To inhibit this, ignore the LF (e.g. for payload add -q2).    ");
      t_string(1, "                                                                                ");
      t_string(1, "If neither line appears then it is likely that 'newline' is CR LF and the CR    ");
      t_string(1, "should be ignored (e.g. for payload add -q1).                                   ");
      t_string(1, "                                                                                ");
      t_string(1, "If Line 2 does not start in column 1 then the terminal emulator may expect      ");
      t_string(1, "CR LF but the program is sending only LF - so look for an 'auto CR on LF'       ");
      t_string(1, "(or similar) option in the VT100 terminal emulator and enable it.               ");
      t_string(1, "                                                                                ");

      PressToContinue();
      ClearScreen();
      t_string(1, "Test 5 - ENTER key processing ...                                               ");
      t_string(1, "                                                                                ");
      k_clear();
      t_string(1, "Press ENTER ... ");
      ch1 = k_wait();
      ch2 = -1;
      for (i = 0; i < 10000; i++) {
        if (k_ready()) {
          ch2 = k_get();
          break;
        }
      }
      if (ch2 >= 0) {
         t_string(1, "ENTER sends ");
         t_integer(1, ch1);
         t_string(1, " and ");
         t_integer(1, ch2);
         t_string(1, ". ");
      }
      else {
         t_string(1, "ENTER sends ");
         t_integer(1, ch1);
         t_string(1, ". ");
      }
      k_clear();

      t_string(1, "\n");
      t_string(1, "                                                                                ");
      t_string(1, "If ENTER returns anything other than a single '10', then it may need adjusting  ");
      t_string(1, "for progams that expect to see an LF (e.g. in payload add -q16). In a vt100     ");
      t_string(1, "emulator try 'use LF as EOL' (or similar).                                      ");
      t_string(1, "                                                                                ");

      PressToContinue();
      ClearScreen();
   }
}
