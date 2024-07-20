/*
 * simple "cat" command implemented in C for Catalyst
 *
 * Version 3.11 - first C version
 *
 * Version 5.0.1 - allow combined command line options (e.g. -dh)
 * 
 * Version 5.2   - support 'globbing' (wildcard matching - see glob.c)
 *
 * Version 5.3   - ignore volume id
 */

#include <string.h>
#include <stdio.h>
#include <dosfs.h>
#include <prop.h>
#include <fs.h>
#include <hmi.h>

#include "catalyst.h"

#define LINE_LEN 80
 
static int help = 0;
static int diagnose = 0;
static int interact = 0;
static int file_count = 0;
static int pstart = 0;
static char *files[ARGV_MAX];

static int rows;
static int cols;
static int rowcount;

static int aborted = 0;

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
   t_strln("usage cat [options] src [src ...]");
   t_eol();
   t_strln("options:");
   t_strln("  -? or -h  print this message");
   t_strln("  -i        interactive (paged)");
   t_strln("  -d        print diagnostics ");
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
      case 'i':
         interact = 1;
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
   int    result = 0;
   int    i = 0;
   int    j;

   if (argc == 1) {
      help = 1;
   }
   while ((result >= 0) && (argc--)) {
      if (i > 0) {
         if (argv[i][0] == '-') {
            // it's a command line switch
            int j = 1;
            while (argv[i][j]) {
               decode_option(argv[i][j++]);
            }
         }
         else {
            // convert file argument to upper case
            j = 0;
            files[file_count]=argv[i];
            while (files[file_count][j] != 0) {
               files[file_count][j] = toupper(files[file_count][j]);
               j++;
            }
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
 * Prompt for a key to continue - set aborted to 1 
 * and return TRUE if ESC is the key
 */
   t_str("Continue? (ESC exits) ...");
   k = k_wait();
   t_eol();
   aborted = (k == 0x1b);
   return aborted;
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


void concatenate_file(PVOLINFO vi, char *src) {

   int my_file;
   FILEINFO fi;
   char line_in[LINE_LEN + 1];
   char line_out[LINE_LEN + 1];
   int count;
   char ch;
   int i, j;
   int stop = 0;

   if ((my_file = _open_unmanaged((const char *)src, 0, &fi)) != -1) {
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
      _close_unmanaged(my_file);
   }
   else {
      t_eol();
      t_str("cannot open file ");
      t_str(src);
      t_strln(" for read");
   }
}


void concatenate(PVOLINFO vi, char *src) {
   uint8_t scratch[SECTOR_SIZE];
   char separator[2] = { DIR_SEPARATOR, 0 };
   int srclen, dirlen;
   FILEINFO fi;
   char src_path[MAX_PATH+1];
   char *src_filt;
   char src_file[MAX_PATH+1];
   int plen;
   int flen;
   uint8_t scratch2[SECTOR_SIZE];
   DIRINFO di;
   DIRENT de;
   char *filename;
   int slen;

   srclen = strlen(src);

   if (srclen == 0) {
      t_strln("cannot cat - no source specified");
      return;
   }

   if (strcmp(src, ".") == 0) {
      t_strln("cannot cat .");
   }

   if (strcmp(src, "..") == 0) {
      t_strln("cannot cat ..");
      return;
   }

   // separate source path from filter (which may contain wildcards)

   strncpy(src_path, src, MAX_PATH);
   plen = pathlen(src_path);
   // remove trailing separator from src_path (if there is one)
   if ((plen > 0) && (src_path[plen - 1] == DIR_SEPARATOR)) {
      src_path[plen - 1] = 0;
   }
   flen = strlen(src);
   if ((flen > 0) && (src[flen - 1] == DIR_SEPARATOR)) {
      src_filt = NULL; //no file filter
   }
   else {
      src_path[plen] = 0;
      src_filt = &src[plen]; // note plen, not flen!
   }
   if (diagnose) {
      t_str("src path = ");
      t_str(src_path);
      t_str(", filter = ");
      t_strln(src_filt);
   }

   // finally we are ready to cat ... we do this a file at a time 
   
   di.scratch = scratch;
   if (DFS_OpenDir(vi, (uint8_t *)src_path, &di) != DFS_OK) {
      if (diagnose) {
          t_str("cannot open directory ");
          t_strln(src_path);
      }
      return;
   }

   slen = strlen(src_path);

   while (DFS_GetNext(vi, &di, &de) == DFS_OK) {
      if (de.name[0] != 0) {
         filename = formatted_name(de.name);
         if (diagnose) {
            t_str("trying ");
            t_strln(filename);
         }
         // see if formatted name matches file argument
         if ((src_filt == NULL) || amatch(filename, src_filt)) {
            if (de.attr & ATTR_VOLUME_ID) {
               if (diagnose) {
                  t_str("ignoring volume id ");
                  t_str(filename);
                  t_eol();
               }  
            }
            else if (strcmp(filename, ".") == 0) {
               if (diagnose) {
                  t_strln("ignoring special entry .");
               }  
            }
            else if (strcmp(filename, "..") == 0) {
               if (diagnose) {
                  t_strln("ignoring special entry ..");
               }  
            }
            else {
               src_path[slen] = DIR_SEPARATOR;
               src_path[slen + 1] = 0;
               safecat(src_path, filename, MAX_PATH);
               concatenate_file(vi, src_path);
               src_path[slen] = 0;
            }
         }
         else {
            if (diagnose) {
               t_str("no match on ");
               t_strln(filename);
            }
         }
      }
   }
   t_eol();
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
         for (i = 0; i < file_count; i++) {
            if (strlen(files[i]) > MAX_PATH) {
               t_str("cannot cat ");
               t_str(files[i]);
               t_strln(" - path too long");
            }
            else {
               concatenate(&vi, files[i]);
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
   if (!aborted) {
      // wait for the user to press a key before terminating
      press_key_to_continue();
   }
#endif    
}


