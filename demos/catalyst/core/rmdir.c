/*
 * simple "rmdir" command implemented in C for Catalyst
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
   t_strln("usage rmdir [options] directory ...");
   t_eol();
   t_strln("options:");
   t_strln("  -? or -h  print this message");
   t_strln("  -p        remove parent dirs");
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


unsigned long remove_dir(char *name) {
   uint8_t scratch[SECTOR_SIZE];
   VOLINFO vi;

   if (DFS_GetVolInfo(0, scratch, pstart, &vi) != DFS_OK) {
      if (diagnose) {
         t_strln("cannot get volume information");
      }
      return DFS_ERRMISC;
   }
   return DFS_UnlinkDir(&vi, (uint8_t *)name, scratch);
}


/*
 * count files in a directory
 */ 
int count_directory(PVOLINFO vi, char *name) {
   uint8_t scratch[SECTOR_SIZE];
   char filename[12+1]; // 8.3 filename plus terminator
   DIRINFO di;
   DIRENT de;
   int count = 0;
   int i, j;

   if (diagnose) {
      t_str("counting in ");
      t_strln(name);
   }

   di.scratch = scratch;
   if (DFS_OpenDir(vi, (uint8_t *)name, &di) != DFS_OK) {
      if (diagnose) {
          t_str("cannot open directory ");
          t_strln(name);
      }
   }

   while (DFS_GetNext(vi, &di, &de) == DFS_OK) {

      if (de.name[0] != 0) {
         i = 0;
         j = 0;
         while (i < 11) {
            if (i == 8) {
               if (strncmp((char *)&de.name[8],"   ", 3) != 0) {
                  filename[j++] = '.';
               }
            }
            if ((de.name[i] != 0) && (de.name[i] != ' ')) {
               filename[j++] = de.name[i];
            }
            i++;
         }
         filename[j] = '\0';
         if (strcmp(filename, ".") == 0) {
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
            if (diagnose) {
               t_str("counting ");
               t_strln(filename);
            }
            count += 1;
         }
      }
   }
   return count;
} 


void remove_entry(PVOLINFO vi, char *name) {
   int i, j, k, len;
   char tmp_name[MAX_PATH + 1];
   DIRINFO di;
   FILEINFO fi;
   uint8_t scratch[SECTOR_SIZE];
   int count;


   while (1) {
      len = strlen(name);
      if (len == 0) {
         break;
      }

      j = 0;

      safecpy(tmp_name, name, MAX_PATH);
      if (tmp_name[len - 1] == DIR_SEPARATOR) {
         tmp_name[len - 1] = '\0';
         len--;
      }

      di.scratch = scratch;
      if (DFS_GetVolInfo(0, scratch, pstart, vi) != DFS_OK) {
         if (diagnose) {
            t_strln("cannot get volume information");
         }
         break;
      }
      else {
         if (DFS_OpenDir(vi, (uint8_t *)tmp_name, &di) != DFS_OK) {
            // no a directory with that name!
            t_str("directory ");
            t_str(name);
            t_strln(" not found");
            break;
         }
      }
   
      count = count_directory(vi, tmp_name);

      // if we have files in the directory, then we cannot delete it!
      if (count > 0) {
         t_str("directory ");
         t_str(name);
         t_strln(" not removed (not empty)");
         break;
      }
      else {
         // now delete the directory itself
         if (remove_dir(name) == DFS_OK) {
            if (diagnose) {
               t_str("removed ");
               t_strln(name);
            }
         }
         else {
            // we can't seem to remove it!
            t_str("cannot remove ");
            t_strln(name);
            break;
         }
      }
      if ((len > 0) && recurse) {
         for (j = len - 1; j > 0; j--) {
            if (name[j] == DIR_SEPARATOR) {
               name[j]='\0';
               break;
            }
         }
         if (j == 0) {
            break;
         }
      }
      else {
         break;
      }
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
                  t_str("cannot remove ");
                  t_str(argv[i]);
                  t_strln(" - path too long");
               }
               else {
                  remove_entry(&vi, argv[i]);
               }
            }
         }
      }
   }
   if (diagnose) {
      t_strln("rmdir done");
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


