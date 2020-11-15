/*
 * test time functions
 */

#include <catalina_hmi.h>
#include <stdlib.h>
#include <time.h>

void t_getint(char *str, int *result) {
   int val = 0;
   char c;

   t_string(1, str);
   while (1) {
      c = k_wait() & 0xff;
      t_char(1, c);
      if ((c < '0') || (c > '9')) {
         *result = val;
         t_char (1, '\n');
         return;
      }
      val = val * 10 + c - '0';
   }
}

int main(void) {
   clock_t  clock_now;
   time_t   time_now;
   time_t   time_then;
   struct   tm *component_time;
   struct   tm my_time;
   char     ascii_time[30];
   char     ch;
   int      tmp;


   t_string(1, "Test time functions\n");
   t_string(1, "time zone is set to ");
   t_string(1, getenv("TZ"));
   clock_now = clock();
   t_string(1, "\n\nclock() = ");
   t_hex(1, clock_now);
   time_now = time(&time_then);
   t_string(1, "\ntime()  = ");
   t_hex(1, time_now);
   while (1) {
      t_string(1, "\n\nPress 't' to set time\n");
      t_string(1, "Press 'a' to display ascii times\n");
      t_string(1, "Press 'c' to display time continuously\n");
      t_string(1, "Press any other key for binary time\n");
      ch = k_wait() & 0xff;
      if (ch == 't') {
         t_getint("Enter day (dd):", &my_time.tm_mday);
         t_getint("Enter month (mm):", &tmp);
         my_time.tm_mon = tmp - 1;
         t_getint("Enter year (yyyy):", &tmp);
         my_time.tm_year = tmp - 1900;
         t_getint("Enter hour (hh):", &my_time.tm_hour);
         t_getint("Enter min (mm):", &my_time.tm_min);
         t_getint("Enter sec (ss):", &my_time.tm_sec);
         t_char(1, '\n');
         time_now = mktime(&my_time);
         component_time = localtime(&time_now);
         t_string(1, asctime(component_time));
         rtc_settime(time_now);
      }
      else if (ch == 'a') {
         time_now = time(&time_then);
         component_time = gmtime(&time_then);
         t_string(1,"\nascii time = ");
         t_string(1, asctime(component_time));
         component_time = gmtime(&time_then);
         t_string(1,"local time = ");
         t_string(1, asctime(component_time));
         t_string(1,"ctime time = ");
         t_string(1, ctime(&time_then));
      }
      else if (ch == 'c') {
         t_char(1, '\f');
         while (!k_ready()) {
            t_setpos(1, 7, 6);
            time_now = time(&time_then);
            component_time = gmtime(&time_then);
            t_string(1, asctime(component_time));
         }
      }
      else {
         clock_now = clock();
         t_string(1, "\nclock() = ");
         t_hex(1, clock_now);
         time_now = time(&time_then);
         t_string(1, "\ntime()  = ");
         t_hex(1, time_now);
      }

   }

   return 0;
}

