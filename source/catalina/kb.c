#if defined(_WIN32) || defined(_WIN64) || defined(WIN32) || defined(WIN64)

#include <conio.h>
#include <windows.h>

//#include <stdio.h>

int my_echo(int state) {
    int old_state = 0;
    HANDLE hStdIn = GetStdHandle(STD_INPUT_HANDLE);

    if (hStdIn == INVALID_HANDLE_VALUE) {
        return -1;
    }

    /* Get console mode */
    DWORD mode;
    if (!GetConsoleMode(hStdIn, &mode)) {
        return -1;
    }

    old_state = ((mode & ENABLE_ECHO_INPUT) != 0);

    if (state) {
        if (!SetConsoleMode(hStdIn, mode | ENABLE_ECHO_INPUT)) {
            return -1;
        }
    }
    else {
        if (!SetConsoleMode(hStdIn, mode & ~((DWORD) ENABLE_ECHO_INPUT))) {
            return -1;
        }
    }

    return old_state;
}

#define ESC 0x1b

static char keybuff[3]; // can store up to 3 keys
static char stored = 0; // number of keys stored in keybuff

int my_getkey(void) {
   int ch;

   if (stored > 0) {
      // return a stored key
      ch = keybuff[0];
      // move stored keys down
      keybuff[0] = keybuff[1];
      keybuff[1] = keybuff[2];
      stored--;
      //printf("returning %02x\n", ch);
      return ch;
   }
   ch = _getch() &0xFF;
   if ((ch != 0) && (ch != 0xe0)) {
      // ordinary key - just return it
      //printf("returning %02x\n", ch);
      return ch;
   }
   // special key - next char is windows scan code
   // (NOTE - THESE SCAN CODES ARE FOR THE EXTENDED ASCII KEYBOARD)
   ch = _getch();
   //printf("scan code = %02x\n", ch);
   switch (ch) {
      // function keys
      case 0x3b: // f1
         ch = ESC;
         keybuff[0] = 0x4f;
         keybuff[1] = 0x50;
         stored = 2;
         break;
      case 0x3c: // f2
         ch = 0x0a;
         break;
      case 0x3d: // f3
         ch = 0x0b;
         break;
      case 0x3e: // f4
         ch = 0x0c;
         break;
      case 0x3f: // f5
         ch = 0x0a;
         break;
      case 0x40: // f6
         ch = 0x0e;
         break;
      case 0x41: // f7
         ch = 0x0f;
         break;
      case 0x42: // f8
         ch = 0x10;
         break;
      case 0x43: // f9
         ch = 0x11;
         break;
      case 0x44: // f10
         ch = 0x12;
         break;
      case 0x85: // f11
         ch = 0x13;
         break;
      case 0x86: // f12 (also ctrl+page up)
         ch = 0x14;
         break;
      case 0x54: // shift+f1
         ch = 0x15;
         break;
      case 0x55: // shift+f2
         ch = 0x16;
         break;
      case 0x56: // shift+f3
         ch = 0x17;
         break;
      case 0x57: // shift+f4
         ch = 0x18;
         break;
      case 0x58: // shift+f5
         ch = 0x19;
         break;
      case 0x59: // shift+f6
         ch = 0x1a;
         break;
      case 0x5a: // shift+f7
         ch = 0x1b;
         break;
      case 0x5b: // shift+f8
         ch = 0x1c;
         break;
      case 0x5c: // shift+f9
         ch = 0x1d;
         break;
      case 0x5d: // shift+f10
         ch = 0x1e;
         break;
      case 0x87: // shift+f11
         ch = 0x1f;
         break;
      case 0x88: // shift+f12
         ch = 0x20;
         break;
      case 0x5e: // ctrl+f1
         ch = ESC;
         keybuff[0] = 0x4f;
         keybuff[1] = 0x50;
         stored = 2;
         break;
      case 0x5f: // ctrl+f2
         ch = 0x0a;
         break;
      case 0x60: // ctrl+f3
         ch = 0x0b;
         break;
      case 0x61: // ctrl+f4
         ch = 0x0c;
         break;
      case 0x62: // ctrl+f5
         ch = 0x0a;
         break;
      case 0x63: // ctrl+f6
         ch = 0x0e;
         break;
      case 0x64: // ctrl+f7
         ch = 0x0f;
         break;
      case 0x65: // ctrl+f8
         ch = 0x10;
         break;
      case 0x66: // ctrl+f9
         ch = 0x11;
         break;
      case 0x67: // ctrl+f10
         ch = 0x12;
         break;
      case 0x89: // ctrl+f11
         ch = 0x13;
         break;
      case 0x8a: // ctrl+f12
         ch = 0x14;
         break;
      case 0x68: // alt+f1
         ch = ESC;
         keybuff[0] = 0x4f;
         keybuff[1] = 0x50;
         stored = 2;
         break;
      case 0x69: // alt+f2
         ch = 0x0a;
         break;
      case 0x6a: // alt+f3
         ch = 0x0b;
         break;
      case 0x6b: // alt+f4
         ch = 0x0c;
         break;
      case 0x6c: // alt+f5
         ch = 0x0a;
         break;
      case 0x6d: // alt+f6
         ch = 0x0e;
         break;
      case 0x6e: // alt+f7
         ch = 0x0f;
         break;
      case 0x6f: // alt+f8
         ch = 0x10;
         break;
      case 0x70: // alt+f9
         ch = 0x11;
         break;
      case 0x71: // alt+f10
         ch = 0x12;
         break;
      case 0x8b: // alt+f11
         ch = 0x13;
         break;
      case 0x8c: // alt+f12
         ch = 0x14;
         break;
      // cursor keys
      case 0x48: // up
         ch = ESC;
         keybuff[0] = '[';
         keybuff[1] = 'A';
         stored = 2;
         break;
      case 0x50: // down
         ch = ESC;
         keybuff[0] = '[';
         keybuff[1] = 'B';
         stored = 2;
         break;
      case 0x4b: // left
         ch = ESC;
         keybuff[0] = '[';
         keybuff[1] = 'D';
         stored = 2;
         break;
      case 0x4d: // right
         ch = ESC;
         keybuff[0] = '[';
         keybuff[1] = 'C';
         stored = 2;
         break;
      case 0x8d: // ctrl+up
         ch = ESC;
         keybuff[0] = '[';
         keybuff[1] = 'A';
         stored = 2;
         break;
      case 0x91: // ctrl+down
         ch = ESC;
         keybuff[0] = '[';
         keybuff[1] = 'B';
         stored = 2;
         break;
      case 0x73: // ctrl+left
         ch = ESC;
         keybuff[0] = '[';
         keybuff[1] = 'D';
         stored = 2;
         break;
      case 0x74: // ctrl+right
         ch = ESC;
         keybuff[0] = '[';
         keybuff[1] = 'C';
         stored = 2;
         break;
      case 0x52: // insert
         ch = ESC;
         keybuff[0] = '[';
         keybuff[1] = 'C';
         stored = 2;
         break;
      case 0x53: // delete
         ch = 0x08;
         break;
      case 0x47: // home
         ch = ESC;
         keybuff[0] = '[';
         keybuff[1] = '1';
         keybuff[2] = '~';
         stored = 3;
         break;
      case 0x4f: // end
         ch = ESC;
         keybuff[0] = '[';
         keybuff[1] = '4';
         keybuff[2] = '~';
         stored = 3;
         break;
      case 0x49: // page up
         ch = ESC;
         keybuff[0] = '[';
         keybuff[1] = '5';
         keybuff[2] = '~';
         stored = 3;
         break;
      case 0x51: // page down
         ch = ESC;
         keybuff[0] = '[';
         keybuff[1] = '6';
         keybuff[2] = '~';
         stored = 3;
         break;
      case 0x92: // ctrl+insert
         ch = 0x4b;
         break;
      case 0x93: // ctrl+delete
         ch = 0x08;
         break;
      case 0x77: // ctrl+home
         ch = ESC;
         keybuff[0] = '[';
         keybuff[1] = '1';
         keybuff[2] = '~';
         stored = 3;
         break;
         break;
      case 0x75: // ctrl+end
         ch = ESC;
         keybuff[0] = '[';
         keybuff[1] = '5';
         keybuff[2] = '~';
         stored = 3;
         break;
      //case 0x86: // ctrl+page up
         //ch = ESC;
         //keybuff[0] = '[';
         //keybuff[1] = '6';
         //keybuff[2] = '~';
         //stored = 3;
         //break;
      case 0x76: // ctrl+page down
         ch = ESC;
         keybuff[0] = '[';
         keybuff[1] = '4';
         keybuff[2] = '~';
         stored = 3;
         break;
      case 0xa2: // alt+insert
         // just return scan code
         break;
      case 0xa3: // alt+delete
         // just return scan code
         break;
      case 0x97: // alt+home
         // just return scan code
         break;
      case 0x9f: // alt+end
         // just return scan code
         break;
      case 0x99: // alt+page up
         // just return scan code
         break;
      case 0xa1: // alt+page down
         // just return scan code
         break;
      case 0x95: // ctrl+keypad /
         ch = 0x2f;
         break;
      default:
         // don't know, but we have to return something non-zero, so return '~'
         ch = 0x7e; 
   }
   //printf("returning %02x\n", ch);
   return ch;
}

int my_kbhit(void) {
   if (stored > 0) {
      return 1;
   }
   return _kbhit();
}

#else

#include <termios.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdio.h>
 
int my_echo(int state) {
   struct termios t;
   int old_state;
 
   if (tcgetattr(STDIN_FILENO, &t) != 0) {
      return -1;
   }

   old_state = ((t.c_lflag & ECHO) == ECHO);

   if (state) {
      t.c_lflag |= ECHO;
   }
   else {
      t.c_lflag &= ~ECHO;
   }
   if (tcsetattr(STDIN_FILENO, TCSANOW, &t) != 0) {
      return -1;
   }

   return old_state;
}

int my_getkey(void) {
   return getchar();
}

int my_kbhit(void) {
   struct termios oldt, newt;
   int ch;
   int oldf;
 
   tcgetattr(STDIN_FILENO, &oldt);
   newt = oldt;
   newt.c_lflag &= ~(ICANON | ECHO | IEXTEN);
   tcsetattr(STDIN_FILENO, TCSANOW, &newt);
   oldf = fcntl(STDIN_FILENO, F_GETFL, 0);
   fcntl(STDIN_FILENO, F_SETFL, oldf | O_NONBLOCK);
 
   ch = getchar();
 
   tcsetattr(STDIN_FILENO, TCSANOW, &oldt);
   fcntl(STDIN_FILENO, F_SETFL, oldf);
 
   if(ch != EOF) {
      ungetc(ch, stdin);
      return 1;
   }
 
   return 0;
}

#endif

