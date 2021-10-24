/*
 * simple "ls" command implemented in C for Catalyst
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
 
static int diagnose = 0;
static int recurse = 0;
static int long_format = 0;
static int file_count = 0;
static int pstart = 0;

int row;
int col;
int rowcount;

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

/*
 * print unsigned integer val, padded to dig digits 
 */ 
void t_uint(unsigned long val, int dig) {
   int i, d, pad, pow;
   static long power[10] = {
      1000000000,
       100000000,
        10000000,
         1000000,
          100000,
           10000,
            1000,
             100,
              10,
               1 
   };

   // get magnitude of val
   for (pow = 0; pow < 10; pow++) {
      if (val >= power[pow]) {
         break;
      }
   }
   pow = 10 - pow;  // pow = number of digits val naturally occupies
   pad = dig - pow; // pad = number of digits we have to pad to get dig
   if (pad < 0) {
      pad = 0;
   }
   for (i = 0; i < pad; i++) {
      t_ch('0');
   }
   for (i = 10 - pow; i < 10; i++) {
      d = val/power[i];
      t_ch('0' + d);
      val -= d * power[i];
   }
}


void t_date(unsigned int dd, unsigned int mm, unsigned int yyyy) {
   t_uint(dd, 2);
   t_ch('/');
   t_uint(mm, 2);
   t_ch('/');
   t_uint(yyyy, 4);
}


void t_time(unsigned int hh, unsigned int mm, unsigned int ss) {
   t_uint(hh, 2);
   t_ch(':');
   t_uint(mm, 2);
   t_ch(':');
   t_uint(ss, 2);
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
   t_strln("usage ls [options] directory ...");
   t_eol();
   t_strln("options:");
   t_strln("  -? or -h  print this message");
   t_strln("  -l        long listing format");
   t_strln("  -r        recurse into subdirs");
   t_strln("  -d        print diagnostics");
}

/*
 * decode arguments and return -1 if there is no further processing to do
 */
int decode_arguments (int argc, char *argv[]) {
   int    result = 0;
   int    help = 0;
   int    i = 0;

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
               case 'r':
                  recurse = 1;
                  break;
               case 'l':
                  long_format = 1;
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

/* we are about to output 'count' rows - if this would make the top of 
 * the current page scroll off the screen, prompt to continue first.
 * Return TRUE if ESCAPE is pressed.
 */
int increment_rowcount(int count) {
   int rows = row;
   int result = 0;

   if (rows == 0) {
      rows = 24;
   }

   if (rowcount + count + 1 > rows) {
      result = press_key_to_continue();
      rowcount = count;
   }
   else {
      rowcount += count;
   }
   return result;
}

/*
 * format a directory entry name
 */
char * formatted_name(uint8_t *name) {
   static char filename[12+1]; // 8.3 filename plus terminator
   int i;
   int j;
   if (name[0] != 0) {
      i = 0;
      j = 0;
      while (i < 11) {
         if (i == 8) {
            if (strncmp((char *)&name[8],"   ", 3) != 0) {
               filename[j++] = '.';
            }
         }
         if ((name[i] != 0) && (name[i] != ' ')) {
            filename[j++] = name[i];
         }
         i++;
      }
      filename[j] = '\0';
   }
   return filename;
}


/*
 * print a single directory entry
 */
int list_direntry(PDIRENT de) {
   unsigned long size;
   unsigned long ac_date;
   unsigned long cr_date;
   unsigned long cr_time;
   unsigned long mo_date;
   unsigned long mo_time;
   char *filename;
   int i;
   int stop = 0;

   // get formatted name
   filename = formatted_name(de->name);
   i = strlen(filename);
   // pad it to 12 characters
   while (i < 12) {
      filename[i++] = ' ';
   }
   filename[i] = 0;

   stop = increment_rowcount(1);

   t_str(filename);
   t_ch(' ');

   t_ch((de->attr & ATTR_READ_ONLY) ? 'R' : '_');
   t_ch((de->attr & ATTR_HIDDEN)    ? 'H' : '_');
   t_ch((de->attr & ATTR_SYSTEM)    ? 'S' : '_');
   t_ch((de->attr & ATTR_DIRECTORY) ? 'D' : '_');
   t_ch((de->attr & ATTR_ARCHIVE)   ? 'A' : '_');
   t_ch(' ');

   size = (de->filesize_3<<24)
        + (de->filesize_2<<16)
        + (de->filesize_1<<8)
        + de->filesize_0;
   t_uint(size, 10);
   if ((col > 32) || (col == 0)) {
      t_strln(" Bytes");
   }
   else {
      t_strln(" B");
   }

   if (long_format) {
      stop = increment_rowcount(3);
      ac_date = (de->lstaccdate_h<<8) + de->lstaccdate_l;
      cr_date = (de->crtdate_h<<8) + de->crtdate_l;
      cr_time = (de->crttime_h<<8) + de->crttime_l;
      mo_date = (de->wrtdate_h<<8) + de->wrtdate_l;
      mo_time = (de->wrttime_h<<8) + de->wrttime_l;
      t_str("Access Date ");
      t_date(ac_date & 0x1f, (ac_date >> 5) & 0xf, (ac_date >> 9) + 1980);
      t_eol();
      t_str("Create Time ");
      t_time(cr_time >> 11, (cr_time >> 6) & 0x3f,  (cr_time & 0x1f) << 1);
      t_ch(' ');
      t_date(cr_date & 0x1f, (cr_date >> 5) & 0xf, (cr_date >> 9) + 1980);
      t_eol();
      t_str("Modify Time ");
      t_time(mo_time >> 11, (mo_time >> 6) & 0x3f,  (mo_time & 0x1f) << 1);
      t_ch(' ');
      t_date(mo_date & 0x1f, (mo_date >> 5) & 0xf, (mo_date >> 9) + 1980);
      t_eol();
   }
   return stop;
}

/*
 * list a single directory, no recursion
 */ 
int list_single_directory(PVOLINFO vi, char *name) {
   uint8_t scratch[SECTOR_SIZE];
   DIRINFO di;
   DIRENT de;
   int stop = 0;

   stop = increment_rowcount(1);
   if (stop) {
      return stop;
   }

   t_str("listing ");
   if (strlen(name) == 0) {
      t_strln("/");
   }
   else {
      t_strln(name);
   }

   di.scratch = scratch;
   if (DFS_OpenDir(vi, (uint8_t *)name, &di) != DFS_OK) {
      if (diagnose) {
          t_str("cannot open directory ");
          t_strln(name);
      }
      return stop;
   }

   while (DFS_GetNext(vi, &di, &de) == DFS_OK) {
      if (de.name[0] > 0) {
         stop = list_direntry(&de);
         if (stop) {
            break;
         }
      }
   }
   return stop;
} 

/*
 * list a directory, first by listing its contents, then by
 * recursing into any subdirectories (if requested)
 */ 
int list_directory(PVOLINFO vi, char *name) {
   uint8_t scratch[SECTOR_SIZE];
   char *dirname;
   char path[MAX_PATH+1];
   DIRINFO di;
   DIRENT de;
   int count = 0;
   int len = 0;
   int i, j;
   int stop = 0;

   safecpy(path, name, MAX_PATH);
   len = strlen(path);

   // remove any traling separators
   if (path[len] == DIR_SEPARATOR) {
      len--;
      path[len] = 0;
   }

   // list this directory, do not recurse
   stop = list_single_directory(vi, name);
   if (stop) {
      return stop;
   }

   // now list all subdirectories, if recursive
   if (recurse) {
      di.scratch = scratch;
      if (DFS_OpenDir(vi, (uint8_t *)name, &di) != DFS_OK) {
         if (diagnose) {
             t_str("cannot open directory ");
             t_strln(name);
         }
         return stop;
      }

      while (DFS_GetNext(vi, &di, &de) == DFS_OK) {
         if (de.name[0] != 0) {
            if (de.attr & ATTR_DIRECTORY) {
               dirname = formatted_name(de.name);
               if (strcmp(dirname, ".") == 0) {
                  if (diagnose) {
                     t_strln("ignoring special entry .");
                  }  
               }
               else if (strcmp(dirname, "..") == 0) {
                  if (diagnose) {
                     t_strln("ignoring special entry ..");
                  }  
               }
               else {
                  path[len] = DIR_SEPARATOR;
                  path[len + 1] = '\0';
                  safecat(path, dirname, MAX_PATH);
                  stop = list_directory(vi, path);
                  path[len] = '\0';
               }
            }
         }
         if (stop) {
            break;
         }
      }
   }
   return stop;
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
   int stop = 0;

#ifdef SERIAL_HMI
   row = 0;
   col = 0;
#else
   rowcol = t_geometry();
   col = (rowcol >> 8) & 0xFF;
   row = rowcol & 0xFF;
#endif   

   rowcount = 0;
   if (decode_arguments(argc, argv) == 0) {
      // work to do, so initialize the file system     
      pstart = DFS_GetPtnStart(0, scratch, 0, &pactive, &ptype, &psize);
      if (DFS_GetVolInfo(0, scratch, pstart, &vi) != DFS_OK) {
         if (diagnose) {
            t_strln("cannot get volume information");
         }
      }
      else {
         if (file_count == 0) {
            stop = list_directory(&vi, "");
         }
         else {
            for (i = 1; i < argc; i++) {
               if ((argv[i][0] != '-') && (argv[i][0] != 0)) {
                  if (strlen(argv[i]) > MAX_PATH) {
                     t_str("cannot list ");
                     t_str(argv[i]);
                     t_strln(" - path too long");
                  }
                  else {
                     stop = list_directory(&vi, argv[i]);
                  }
                  if (stop) {
                     break;
                  }
               }
            }
         }
      }
   }
   if (diagnose) {
      t_strln("ls done");
   }

#ifdef SERIAL_HMI
   // allow some time for characters to be sent out before terminating
   msleep(250);
#else
   // wait for the user to press a key before terminating
   press_key_to_continue();
#endif    
}


