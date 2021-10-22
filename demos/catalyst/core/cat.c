/*
 * simple "cat" command implemented in C for Catalyst
 *
 * Version 3.11 - first C version
 * 
 */

#include <propeller.h>
#include <string.h>
#include <stdio.h>
#include <dosfs.h>
#include <catalina_hmi.h>

#include <catalina_fs.h>

#include "catalyst.h"

#define LINE_LEN 80
 
static int diagnose = 0;
static int interact = 0;
static int file_count = 0;
static int pstart = 0;

int rowcount;

int rows;
int cols;

void t_eol() {
   t_string(1, END_OF_LINE);
}

void t_ch(char ch) {
   t_char(1, ch);
}

void t_str(char *str) {
   t_string(1, str);
}

void t_int(int i) {
   t_integer(1, i);
}

void t_strln(char *str) {
   t_string(1, str);
   t_eol();
}

// safecpy will never write more than size characters, 
// and is guaranteed to null terminate its result, so
// make sure the buffer passed is at least size + 1
char * safecpy(char *dst, const char *src, size_t size) {
   dst[size] = '\0';
   if (src) {
      return strncpy(dst, src, size - strlen(dst));
   }
   return NULL;
}

// safecat will never write more than size characters, 
// and is guaranteed to null terminate its resul, so
// make sure the buffer passed is at least size + 1
char * safecat(char *dst, const char *src, size_t size) {
   dst[size] = '\0';
   if (src) {
      return strncat(dst, src, size - strlen(dst));
   }
   return NULL;
}

void do_help() {
   t_eol();
   t_strln("usage cat [options] src [src ...]");
   t_eol();
   t_strln("options:");
   t_strln("  -? or -h  print this message");
   t_strln("  -i        interactive (paged)");
   t_strln("  -d        print diagnostics ");
}

/*
 * decode arguments and return -1 if there is no further processing to do
 */
int decode_arguments (int argc, char *argv[]) {
   int    result = 0;
   int    help = 0;
   int    i = 0;
   if (argc == 1) {
      help = 1;
   }
   while ((result >= 0) && (argc--)) {
      if (i > 0) {
         if (argv[i][0] == '-') {
            // it's a command line switch
            switch (argv[i][1]) {
               case 'h':
                  /* fall through to ... */

               case '?':
                  help = 1;
                  break;
               case 'd':
                  diagnose = 1;
                  break;
               case 'i':
                  interact = 1;
                  break;
               default:
                  t_str("unknown option ");
                  t_strln(argv[i]);
                  help = 1;
                  break;
            }
         }
         else {
            file_count++;
         }
      }
      i++; // next argument
   }
   if (help) {
      do_help();
      result = 1;
   }
   return result;
}


int press_key_to_continue() {
   int k;
/*
 * Prompt for a key to continue - return TRUE if ESC is the key
 */
   t_str("Press a key to continue (or ESC to exit) ...");
   k = k_wait();
   t_eol();
   return (k == 0x1b);
}


int increment_rowcount(int count) {
   int result = 0;

   if (rowcount + count + 1 > rows) {
      result = press_key_to_continue();
      rowcount = count;
   }
   else {
      rowcount += count;
   }
   return result;
}


void concatenate(PVOLINFO vi, char *src) {

   int my_file;
   FILEINFO my_info;
   char line_in[LINE_LEN + 1];
   char line_out[LINE_LEN + 1];
   int count;
   char ch;
   int i, j;
   int stop = 0;

   if ((my_file = _open_unmanaged((const char *)src, 0, &my_info)) != -1) {
      j = 0;
      while (((count = _read(my_file, line_in, LINE_LEN))) > 0) {
         for (i = 0; i < count; i++) {
            ch = (line_out[j++] = line_in[i]);
            if ((ch == 0x0a) || (j >= cols)) {
               line_out[j] = '\0';
               t_str(line_out);
               j = 0;
               if (interact) {
                  stop = increment_rowcount(1);
               }
            }
            if (stop) {
               break;
            }
         }
         if (stop) {
            break;
         }
      }
      if (j > 0) {
         line_out[j] = '\0';
         t_str(line_out);
         j = 0;
         if (interact) {
            stop = increment_rowcount(1);
         }
      }
      t_eol();
      _close_unmanaged(my_file);
   }
   else {
      t_eol();
      t_strln("Cannot open file for read");
   }
}

void main(int argc, char *argv[]) {
   int i;
   int n = 0;
   int error = 0;
   uint8_t scratch[SECTOR_SIZE];
   uint32_t psize;
   uint8_t pactive, ptype;
   VOLINFO vi;
   int rowcol;

#ifdef SERIAL_HMI
   rows = 0;
   cols = 0;
#else
   rowcol = t_geometry();
   cols = (rowcol >> 8) & 0xFF;
   rows = rowcol & 0xFF;
#endif   

   if (rows == 0) {
      rows = 24;
   }
   if (cols == 0) {
      cols = 80;
   }

   rowcount = 1;

   if ((decode_arguments(argc, argv) == 0) && (file_count > 0)) {
      // work to do, so initialize the file system     
      pstart = DFS_GetPtnStart(0, scratch, 0, &pactive, &ptype, &psize);
      if (DFS_GetVolInfo(0, scratch, pstart, &vi) != DFS_OK) {
         if (diagnose) {
            t_strln("cannot get volume information");
         }
      }
      else {
         for (i = 1; i < argc; i++) {
            if ((argv[i][0] != '-') && (argv[i][0] != 0)) {
               if (strlen(argv[i]) > MAX_PATH) {
                  t_str("cannot copy ");
                  t_str(argv[i]);
                  t_strln(" - path too long");
               }
               else {
                  concatenate(&vi, argv[i]);
               }
            }
         }
      }
   }
   if (diagnose) {
      t_strln("cat done");
   }

#ifdef SERIAL_HMI
   // allow some time for characters to be sent out before terminating
   msleep(250);
#else
   // wait for the user to press a key before terminating
   press_key_to_continue();
#endif    
}


