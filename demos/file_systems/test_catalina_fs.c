#include <hmi.h>
#include <string.h>
#include <fs.h>

#ifdef __CATALINA_CLOCK 
#include <stdlib.h>
#include <time.h>
#endif

#define FILENAME_SIZE 256

// compile with -C CLOCK to enable the time functions - this is useful for
// testing the clock which is now part of the SD plugin - but it makes the
// resulting program too large for the SDCARD loader !

#ifdef __CATALINA_CLOCK      
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

void set_time() {
   struct   tm my_time = { 0 };
   time_t   time_now;
   struct   tm *component_time;
   int      tmp;

   t_getint("Enter day (dd):", &my_time.tm_mday);
   t_getint("Enter month (mm):", &tmp);
   my_time.tm_mon = tmp - 1;
   t_getint("Enter year (yyyy):", &tmp);
   my_time.tm_year = tmp - 1900;
   t_getint("Enter hour (hh):", &my_time.tm_hour);
   t_getint("Enter min (mm):", &my_time.tm_min);
   t_getint("Enter sec (ss):", &my_time.tm_sec);
   time_now = mktime(&my_time);
   component_time = localtime(&time_now);
   t_string(1, asctime(component_time));
   rtc_settime(time_now);
}

void print_time() {
   time_t   time_now;
   struct   tm *component_time;

   time_now = time(&time_now);
   component_time = gmtime(&time_now);
   t_string(1,"\nTime = ");
   t_string(1, asctime(component_time));
   }
#endif   

int main(void) {
   int my_file;
   FILEINFO my_info;
   char ch;
   char filename[FILENAME_SIZE+1];
   char filename2[FILENAME_SIZE+1];
   int i;
   char line[] = "What's my line?\n";

   t_string(1, "\nTesting Catalina file system\n");

   while (_mount(0, 0) != 0) {
      t_string(1, "mount failed - press a key to try again\n");
      k_wait();
   }

#ifdef __CATALINA_CLOCK
   set_time();
#endif      

   while (1) {
#ifdef __CATALINA_CLOCK
      print_time();
#endif      
      t_string(1, "\nEnter a directory name to create: ");
      for (i = 0; i < FILENAME_SIZE; i++) {
         ch = k_wait();
         if ((ch == '\n') || (ch == '\r')) {
            break;
         }
         else {
            filename[i] = ch;
            t_char(1, ch);
         }
      }
      filename[i] = '\0';
      t_char(1, '\n');
      if (strlen(filename) > 0) {
#ifdef __CATALINA_CLOCK
         print_time();
#endif      
         t_string(1, "\nCreating directory '");
         t_string(1, filename);
         t_string(1, "' ...\n");

         if (_create_directory(filename) == -1) {
            t_string(1, "\nCannot create directory\n");
         };
      }

      t_string(1, "\nEnter a file name to read: ");
      for (i = 0; i < FILENAME_SIZE; i++) {
         ch = k_wait();
         if ((ch == '\n') || (ch == '\r')) {
            break;
         }
         else {
            filename[i] = ch;
            t_char(1, ch);
         }
      }
      filename[i] = '\0';
      t_char(1, '\n');

      if (strlen(filename) > 0) {
#ifdef __CATALINA_CLOCK
         print_time();
#endif      
         t_string(1, "\nReading file '");
         t_string(1, filename);
         t_string(1, "' ...\n");

         if ((my_file = _open_unmanaged(filename, 0, &my_info)) != -1) {
            while ((_read(my_file, &ch, 1)) > 0) {
               t_char(1, ch);
            }
            t_string(1, "\n... EOF!\n");
            _close_unmanaged(my_file);
         }
         else {
            t_string(1, "\nCannot open file for read\n");
         }
      }

#ifdef __CATALINA_CLOCK
      print_time();
#endif      
      t_string(1, "\nEnter a file name to write: ");
      for (i = 0; i < FILENAME_SIZE; i++) {
         ch = k_wait();
         if ((ch == '\n') || (ch == '\r')) {
            break;
         }
         else {
            filename[i] = ch;
            t_char(1, ch);
         }
      }
      filename[i] = '\0';
      t_char(1, '\n');

      if (strlen(filename) > 0) {
#ifdef __CATALINA_CLOCK      
         print_time();
#endif      
         t_string(1, "\nWriting file '");
         t_string(1, filename);
         t_string(1, "' ...\n");
         if ((my_file = _open_unmanaged(filename, 1, &my_info)) != -1) {
            for (i = 1; i <= 1000; i++) {
               t_string(1, "Writing line ");
               t_integer(1, i);
               t_char(1, '\n');
               _write(my_file, line, strlen(line));
            }
            _close_unmanaged(my_file);
         }
         else {
            t_string(1, "\nCannot open file for write\n");
         }
      }
#ifdef __CATALINA_CLOCK
      print_time();
#endif      
      t_string(1, "\nEnter a file name to rename: ");
      for (i = 0; i < FILENAME_SIZE; i++) {
         ch = k_wait();
         if ((ch == '\n') || (ch == '\r')) {
            break;
         }
         else {
            filename[i] = ch;
            t_char(1, ch);
         }
      }
      filename[i] = '\0';
      t_char(1, '\n');
      if (strlen(filename) > 0) {
         t_string(1, "\nEnter a new name for the file: ");
         for (i = 0; i < FILENAME_SIZE; i++) {
            ch = k_wait();
            if ((ch == '\n') || (ch == '\r')) {
               break;
            }
            else {
               filename2[i] = ch;
               t_char(1, ch);
            }
         }
         filename2[i] = '\0';
         t_char(1, '\n');
#ifdef __CATALINA_CLOCK
         print_time();
#endif      
         t_string(1, "\nRenaming file '");
         t_string(1, filename);
         t_string(1, " to ");
         t_string(1, filename2);
         t_string(1, "' ...\n");

         if (_rename(filename, filename2) == -1) {
            t_string(1, "\nCannot rename file\n");
         };
      }

   }

   return 0;
}
