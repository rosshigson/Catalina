/*
 * simple "ls" command implemented in C for Catalyst
 *
 * Version 3.11 - first C version
 * 
 * Version 5.0.1 - allow combined command line options (e.g. -dh)
 *
 * Version 5.2   - support 'globbing' (wildcard matching - see glob.c).
 *               - default is now short list format - for the previous
 *                 default format specify "-l" and for the previous
 *                 long format, specify "-l -l" or "-ll".
 *
 * Version 5.3   - no longer include volume id in output unless long or
 *                 very long listing format is specified (otherwise it 
 *                 looks too much like a file).
 *
 * Version 5.4   - Improve support for screens with short lines, such as
 *                 LORES_VGA. 
 *
 */

#include <string.h>
#include <stdio.h>
#include <dosfs.h>
#include <prop.h>
#include <hmi.h>
#include <fs.h>

#include "catalyst.h"

#define ARGV_MAX 24 // to match Catalyst

static int help = 0;
static int diagnose = 0;
static int recurse = 0;
static int long_format = 0;
static int file_count = 0;
static int dir_count = 0;
static int pstart = 0;
static char *files[ARGV_MAX];
static char *dirs[ARGV_MAX];

static int rows;
static int cols;
static int rowcount;
static int colcount;

static int aborted = 0;

void t_eol() {
   t_string(1, END_OF_LINE);
   colcount = 0;
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
// and is guaranteed to null terminate its result, so
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
   t_strln("usage ls [options] file_or_dir ...");
   t_eol();
   t_strln("options:");
   t_strln("  -? or -h  print this message");
   t_strln("  -l        long listing format");
   t_strln("  -l -l     very long listing format");
   t_strln("  -r        recurse into subdirs");
   t_strln("  -d        print diagnostics");
}

/*
 * decode_option - decode one option character
 */
void decode_option(char ch) {
   switch (ch) {
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
         long_format++;
         break;
      default:
         t_str("unknown option '");
         t_ch(ch);
         t_str("'");
         help = 1;
         break;
   }
}

/*
 * decode arguments and return 1 if there is no further processing to do
 */
int decode_arguments (int argc, char *argv[]) {
   int result = 0;
   int i = 0;
   int j;
   int dir;

   if (argc > ARGV_MAX) {
      argc = ARGV_MAX;
   }
   while ((result >= 0) && (argc--)) {
      if (i > 0) {
         if (argv[i][0] == '-') {
            // it's a command line switch
            j = 1;
            while (argv[i][j]) {
               decode_option(argv[i][j++]);
            }
         }
         else {
            // we handle files and dirs - arguments that contains a path 
            // seperator are treated as dirs, otherwise as a file/filter. 
            // In both cases we convert argument to upper case
            j = 0;
            dir = 0;
            while (argv[i][j] != 0) {
               if (argv[i][j] == DIR_SEPARATOR) {
                  dir = 1;
               }
               argv[i][j] = toupper(argv[i][j]);
               j++;
            }
            if (dir) {
               dirs[dir_count] = argv[i];
               dir_count++;
            }
            else {
               files[file_count] = argv[i];
               file_count++;
            }
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

/* We are about to output 'count' rows - if this would make the top of 
 * the current page scroll off the screen, prompt to continue first.
 * Sets aborted to 1 if ESCAPE is pressed.
 */
void increment_rowcount(int count) {
   if (rowcount + count + 1 > rows) {
      press_key_to_continue();
      rowcount = count;
   }
   else {
      rowcount += count;
   }
   return;
}

/* We are about to output 'count' cols - if this would exceed the screen
 * width, then reset the column count and increment the row count.
 * Sets aborted to 1 if ESCAPE is pressed.
 */
void increment_colcount(int count) {
   if (colcount + count + 1 > cols) {
      increment_rowcount(1);
      t_eol();
   }
   colcount += count;
   return;
}


int press_key_to_continue() {
   int k;
/*
 * Prompt for a key to continue - set aborted to 1 
 * and return TRUE if ESC is the key
 */
   if (colcount > 0) {
      t_eol();
      colcount = 0;
      rowcount += 1;
   }
   t_str("Continue? (ESC exits) ...");
   k = k_wait();
   t_eol();
   aborted = (k == 0x1b);
   return aborted;
}

/*
 * format a directory entry name
 */
char * formatted_name(uint8_t *name) {
   static char filename[12+1]; // 8.3 filename plus terminator
   int i;
   int j;
   filename[0] = 0;
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
 * print a single directory entry, filtering if requested
 */
void list_direntry(PDIRENT de, int filter) {
   unsigned long size;
   unsigned long ac_date;
   unsigned long cr_date;
   unsigned long cr_time;
   unsigned long mo_date;
   unsigned long mo_time;
   char *filename;
   int i;
   int match = 0;

   // get formatted name
   filename = formatted_name(de->name);
   if ((long_format == 0) && (de->attr & ATTR_VOLUME_ID)) {
      if (diagnose) {
         t_str("ignoring volume id ");
         t_str(filename);
         t_eol();
      }
      return;  
   }
   if (filter) {
      // see if formatted name matches any file argument
      for (i = 0; i < file_count; i++) {
         if (amatch(filename, files[i]) != 0) {
            match = 1;
            break;
         }
      }
      if (!match) {
         return; // no match to any file argmument
      }
   }
   i = strlen((char *)filename);
   // pad it to 12 characters
   while (i < 12) {
      filename[i++] = ' ';
   }
   filename[i] = 0;

   if (long_format > 0) {
      increment_rowcount(1);
   }
   else {
      increment_colcount(13);
   }

   if (aborted) {
      return;
   }

   t_str((char *)filename);
   t_ch(' ');

   if (long_format > 0) {
      t_ch((de->attr & ATTR_READ_ONLY) ? 'R' : '_');
      t_ch((de->attr & ATTR_HIDDEN)    ? 'H' : '_');
      t_ch((de->attr & ATTR_SYSTEM)    ? 'S' : '_');
      t_ch((de->attr & ATTR_DIRECTORY) ? 'D' : '_');
      t_ch((de->attr & ATTR_ARCHIVE)   ? 'A' : '_');
      t_ch((de->attr & ATTR_VOLUME_ID) ? 'V' : '_');
      t_ch(' ');

      size = (de->filesize_3<<24)
           + (de->filesize_2<<16)
           + (de->filesize_1<<8)
           + de->filesize_0;
      t_uint(size, 8);
      if (cols > 32) {
         t_strln(" Bytes");
      }
      else {
         t_strln(" B");
      }
   }

   if (long_format > 1) {
      increment_rowcount(3);
      if (aborted) {
         return;
      }
      ac_date = (de->lstaccdate_h<<8) + de->lstaccdate_l;
      cr_date = (de->crtdate_h<<8) + de->crtdate_l;
      cr_time = (de->crttime_h<<8) + de->crttime_l;
      mo_date = (de->wrtdate_h<<8) + de->wrtdate_l;
      mo_time = (de->wrttime_h<<8) + de->wrttime_l;
      t_str("Access Date ");
      t_date(ac_date & 0x1f, (ac_date >> 5) & 0xf, (ac_date >> 9) + 1980);
      t_eol();
      t_str("Create Time ");
      t_time(cr_time >> 11, (cr_time >> 5) & 0x3f,  (cr_time & 0x1f) << 1);
      t_ch(' ');
      t_date(cr_date & 0x1f, (cr_date >> 5) & 0xf, (cr_date >> 9) + 1980);
      t_eol();
      t_str("Modify Time ");
      t_time(mo_time >> 11, (mo_time >> 5) & 0x3f,  (mo_time & 0x1f) << 1);
      t_ch(' ');
      t_date(mo_date & 0x1f, (mo_date >> 5) & 0xf, (mo_date >> 9) + 1980);
      t_eol();
   }
   return;
}

/*
 * list a single directory, no recursion, filtering if requested
 */ 
void list_single_directory(PVOLINFO vi, char *name, int filter) {
   uint8_t scratch[SECTOR_SIZE];
   DIRINFO di;
   DIRENT de;

   if (colcount > 0) {
      t_eol();
   }

   if (strlen(name) > 0) {
      increment_rowcount(1);
      if (aborted) {
         return;
      }
   
      if (diagnose) {
         t_str("listing ");
      }
      t_str(name);
      t_strln(":");
   }
   else {
      if (diagnose) {
         t_strln("listing /:");
      }
   }

   di.scratch = scratch;
   if (DFS_OpenDir(vi, (uint8_t *)name, &di) != DFS_OK) {
      if (diagnose) {
          t_str("cannot open directory ");
          t_strln(name);
      }
      return;
   }

   while (DFS_GetNext(vi, &di, &de) == DFS_OK) {
      if (de.name[0] != 0) {
         list_direntry(&de, filter);
         if (aborted) {
            break;
         }
      }
   }
   return;
} 

/*
 * list a directory, first by listing its contents, then by
 * recursing into any subdirectories (if requested), and
 * filtering if requested
 */ 
void list_directory(PVOLINFO vi, char *name, int filter, int recurse) {
   uint8_t scratch[SECTOR_SIZE];
   char *dirname;
   char path[MAX_PATH+1];
   DIRINFO di;
   DIRENT de;
   int count = 0;
   int len = 0;
   int i, j;
   int match = 0;

   safecpy(path, name, MAX_PATH);
   len = strlen(path);

   // remove any trailing separators
   if (path[len] == DIR_SEPARATOR) {
      len--;
      path[len] = 0;
   }

   // list this directory, do not recurse
   list_single_directory(vi, name, filter);
   if (aborted) {
      return;
   }

   // now list all subdirectories, if recursive
   if (recurse) {
      di.scratch = scratch;
      if (DFS_OpenDir(vi, (uint8_t *)name, &di) != DFS_OK) {
         if (diagnose) {
             t_str("cannot open directory ");
             t_strln(name);
         }
         return;
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
                  match = 0;
                  if (filter) {
                     // see if directory name matches any file argument
                     for (i = 0; i < file_count; i++) {
                        if (amatch(dirname, files[i]) != 0) {
                           match = 1;
                           break;
                        }
                     }
                  }
                  else {
                     match = 1;
                  }
                  if (match) {
                     path[len] = DIR_SEPARATOR;
                     path[len + 1] = '\0';
                     safecat(path, dirname, MAX_PATH);
                     list_directory(vi, path, 0, recurse);
                     path[len] = '\0';
                  }
               }
            }
         }
         if (aborted) {
            break;
         }
      }
   }
   return;
} 

/*
 * pathlen - calculate the length of the path to a file name,
 *           returning zero if there is no path.
 */
int pathlen(char *name) {
   int len;

   len = strlen(name);
   while ((len > 0) && (name[len - 1] != DIR_SEPARATOR)) {
      len--;
   }
   return len;
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
   int filter;
   char path[MAX_PATH+1];
   int plen;
   int dlen;

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

   rowcount = 0;
   colcount = 0;
   if (decode_arguments(argc, argv) == 0) {
      // work to do, so initialize the file system     
      pstart = DFS_GetPtnStart(0, scratch, 0, &pactive, &ptype, &psize);
      if (DFS_GetVolInfo(0, scratch, pstart, &vi) != DFS_OK) {
         if (diagnose) {
            t_strln("cannot get volume information");
         }
      }
      else {
         if ((file_count == 0) && (dir_count == 0)) {
            // no arguments - list the root directory with no filter
            list_directory(&vi, "", 0, recurse);
            t_eol();
         }
         else {
            if (file_count > 0) {
               // process all the file arguments by listing the matching 
               // files in the root directory
               list_directory(&vi, "", 1, recurse);
               t_eol();
            }
            // now process each dir argument, listing all the files in 
            // each directory with no filters if the path is terminated
            // with a separator, or with the filter if there is a last
            // element in the path.
            for (i = 0; i < dir_count; i++) {
               t_eol();
               strncpy(path, dirs[i], MAX_PATH);
               plen = pathlen(path);
               // remove trailing separator from path (if there is one)
               if ((plen > 0) && (path[plen - 1] == DIR_SEPARATOR)) {
                  path[plen - 1] = 0;
               }
               dlen = strlen(dirs[i]);
               if ((dlen > 0) && (dirs[i][dlen - 1] == DIR_SEPARATOR)) {
                  file_count = 0; //no filter
               }
               else {
                  path[plen] = 0;
                  files[0] = &dirs[i][plen]; // note plen, not dlen!
                  file_count = 1; // one filter
               }
               list_directory(&vi, path, (file_count > 0), recurse);
               t_eol();
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
   if (!aborted) {
      // wait for the user to press a key before terminating
      press_key_to_continue();
   }
#endif    
}


