/*
 * simple "mkdir" command implemented in C for Catalyst
 *
 * Version 3.11 - first C version
 * 
 * Version 5.0.1 - allow combined command line options (e.g. -dh)
 * 
 */

#include <string.h>
#include <stdio.h>
#include <dosfs.h>
#include <prop.h>
#include <hmi.h>
#include <fs.h>

#include "catalyst.h"
 
static int help = 0;
static int diagnose = 0;
static int recurse = 0;
static int file_count = 0;
static int pstart = 0;

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
   t_strln("usage mkdir [options] directory ...");
   t_eol();
   t_strln("options:");
   t_strln("  -? or -h  print this message");
   t_strln("  -p        create parent dirs");
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
      case 'p':
         recurse = 1;
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


unsigned long create_single_dir(PVOLINFO vi, char *name) {
   uint8_t scratch[SECTOR_SIZE];
   char tmp_name[MAX_PATH + 4];
   char tmp_sep[2];
   FILEINFO fi;
   int error;

   tmp_sep[0] = DIR_SEPARATOR;
   tmp_sep[1] = 0;

   strncpy(tmp_name, name, MAX_PATH);

   // see if directory exists already
   if (DFS_OpenFile(vi, (uint8_t *)tmp_name, DFS_OPENDIR, scratch, &fi) != DFS_NOTFOUND) {
      t_str("directory ");
      t_str(name);
      t_strln( " already exists");
      return DFS_ERRNAME;
   }

   if ((error = DFS_OpenFile(vi, (uint8_t *)tmp_name, DFS_CREATEDIR, scratch, &fi)) != DFS_OK) {
      t_str("cannot create directory ");
      t_str(name);
      if (strchr(name, DIR_SEPARATOR) != NULL) {
         t_str(" - try using -p");
      }
      t_eol();
      return error;
   }
   else {
      //safecat(tmp_name, tmp_sep, MAX_PATH+1);
      //safecat(tmp_name, ".", MAX_PATH+2); 
      //error = DFS_OpenFile(vi, (uint8_t *)name, DFS_CREATEDIR, scratch, &fi);
      //if (error != DFS_OK) {
         //t_strln("cannot create special directory \".\"");
         //return error;
      //}
      //safecat(tmp_name, ".", MAX_PATH+3); 
      //error = DFS_OpenFile(vi, (uint8_t *)name, DFS_CREATEDIR, scratch, &fi);
      //if (error != DFS_OK) {
         //t_strln("cannot create special directory \"..\"");
         //return error;
      //}
   }
   return DFS_OK;
}


unsigned int create_directory(PVOLINFO vi, char *name) {
   int i, j, len;
   char tmp_name[MAX_PATH + 1];
   FILEINFO fi;
   uint8_t scratch[SECTOR_SIZE];
   unsigned int error;

   if (!recurse) {
      // just create final directory (parents must all exist)
      error = create_single_dir(vi, name);
      if ((error == DFS_OK) && diagnose) {
         t_str("created ");
         t_strln(tmp_name);
      }
      return error;
   }

   tmp_name[0] = 0;
   i = 0;
   len = strlen(name);

   while (i < len) {

      while ((i < len) && (name[i] != DIR_SEPARATOR)) {
         tmp_name[i] = name[i];
         i++;
      }
      tmp_name[i] = 0;

      if (diagnose) {
         t_str("trying ");
         t_strln(tmp_name);
      }
      // see if directory exists already
      if (DFS_OpenFile(vi, (uint8_t *)tmp_name, DFS_OPENDIR, scratch, &fi) == DFS_NOTFOUND) {
         // no, so create it
         if (error = create_single_dir(vi, tmp_name) != DFS_OK) {
            if (diagnose) {
               t_str("failed to create ");
               t_strln(tmp_name);
            }
            return error;
         }
         else {
            if (diagnose) {
               t_str("created ");
               t_strln(tmp_name);
            }
         }
      }
      else {
         // not finished yet - try next level deeper
         tmp_name[i] = name[i];
         i++;
      }
   }
   return DFS_OK;
}

void main(int argc, char *argv[]) {
   int i;
   int n = 0;
   int error = 0;
   uint8_t scratch[SECTOR_SIZE];
   uint32_t psize;
   uint8_t pactive, ptype;
   VOLINFO vi;

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
                  t_str("cannot create ");
                  t_str(argv[i]);
                  t_strln(" - path too long");
               }
               else {
                  create_directory(&vi, argv[i]);
               }
            }
         }
      }
   }
   if (diagnose) {
      t_strln("mkdir done");
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


