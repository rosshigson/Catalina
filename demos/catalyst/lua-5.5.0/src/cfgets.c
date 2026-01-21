#include <stdio.h>
#include <stdint.h>
#include <hmi.h>

/*
 * catalina_fgets : a simple fgets replacement that adds line 
 *                  editing when used on stdin
 */

#define WINDOWS_EOL  0                // 1 = Windows style line termination

#if defined(__CATALINA_PC)||defined(__CATALINA_TTY)||defined(__CATALINA_TTY256)||defined(__CATALINA_SIMPLE)
#define SERIAL_HMI
#endif

char *catalina_fgets(char *s, int n, FILE *stream) {
   register char *ss = s;
   register int nn = n;
   register int ch;
   int x, y, x_y;

   if (stream != stdin) {
      // just use fgets
      return fgets(s, n, stream);
   }

   //k_clear();

   while (--nn) {
      // k_wait() translates EOT to -1
      if ((ch = k_wait()) == -1) {
         if (ss == s) {
            *ss = '\0';
            return NULL;
         }
         break;
      }
      else if ((ch == 8) || (ch == 127)) { // BS or DEL
#ifdef SERIAL_HMI
         t_char(1, 8);
#else
         x_y = t_getpos(1);
         x = x_y >> 8;
         y = x_y & 0xFF;
         if (x > 0) {
            x--;
            t_setpos(1, x, y);
            t_char(1, ' ');
            t_setpos(1, x, y);
         }
#endif
         if (ss > s) {
            ss--;
            nn++;
         }
      }
      else if ((ch == '\n') || (ch == '\r')) {
         *ss++ = ch;
#if WINDOWS_EOL
         t_char(1, '\r');
#endif
         t_char(1, '\n');
         break;
      }
      else {
         t_char(1, ch);
         *ss++ = ch;
      }
   }
   *ss = '\0';
   return s;
}

