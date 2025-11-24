#if defined(_WIN32) || defined(_WIN64) || defined(WIN32) || defined(WIN64)

#include <conio.h>
#include <windows.h>

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

int my_getkey(void) {
   return _getch();
}

int my_kbhit(void) {
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

