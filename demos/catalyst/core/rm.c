/*
 * simple "rm" command implemented in C for Catalyst
 *
 * Version 3.11  - first C version
 *
 * Version 5.0.1 - allow combined command line options (e.g. -dh)
 *               - fix a bug when recursively deleting. 
 *
 * Version 5.2   - support 'globbing' (wildcard matching - see glob.c).
 *               - removed the ability to disable recursion - this was
 *                 only done to save space, but globbing won't work 
 *                 without it, and since Catalyst is now copiled in 
 *                 COMPACT mode by default, space should not be a problem.
 *
 * Version 5.3   - ignore volume id.
 *
 * Version 5.9.3 - add -k option to kill (suppress) information messages.
 *
 * Version 6.3   - -k option now also suppresses "Continue" prompt
 *
 */

#include <ctype.h>
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
static int interact = 0;
static int recurse = 0;
static int force = 0;
static int suppress = 0;
static int count_only = 0;
static int file_count = 0;
static int pstart = 0;
static char *files[ARGV_MAX];

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
   t_strln("usage rm [options] file_or_dir ...");
   t_eol();
   t_strln("options:");
   t_strln("  -? or -h  print this message");
   t_strln("  -c        count, don't remove");
   t_strln("  -d        print diagnostics");
   t_strln("  -f        force dir removal");
   t_strln("  -i        interactive mode");
   t_strln("  -k        kill (suppress) information messages");
   t_strln("  -r        recursive removal");
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
      case 'c':
         count_only = 1;
         break;
      case 'f':
         force = 1;
         break;
      case 'i':
         interact = 1;
         break;
      case 'k':
         suppress = 1;
         break;
      case 'r':
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
   int    j = 0;

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


unsigned long remove_file(char *name) {
   uint8_t scratch[SECTOR_SIZE];
   VOLINFO vi;

   if (DFS_GetVolInfo(0, scratch, pstart, &vi) != DFS_OK) {
      if (diagnose) {
         t_strln("cannot get volume information");
      }
      return DFS_ERRMISC;
   }
   return DFS_UnlinkFile(&vi, (uint8_t *)name, scratch);
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

// forward declaration
int remove_entry(char *name, int count_only);

// match function - see glob.c
extern int amatch(char *str, char *p);

/*
 * process a directory, either recursively deleting all contents, or just
 * counting how many files would be deleted. If the file argument is not
 * an empty string, only files that match the argument will be deleted.
 *
 * NOTE: "dir" must be a char buffer of at least MAX_PATH + 1 characters!
 */ 
int process_directory(char *dir, char *file, int count_only) {
   uint8_t scratch[SECTOR_SIZE];
   uint8_t scratch2[SECTOR_SIZE];
   char *filename;
   DIRINFO di;
   VOLINFO vi;
   FILEINFO fi;
   DIRENT de;
   int count = 0;
   int tmpcount = 0;
   int len = 0;
   int i, j;
   int match;

   if (DFS_GetVolInfo(0, scratch2, pstart, &vi) != DFS_OK) {
      if (diagnose) {
         t_strln("cannot get volume information");
      }
   }

   len = strlen(dir);

   if (diagnose) {
      if (count_only) {
         t_str("counting '");
         t_str(file);
         t_str("' files in '");
      }
      else {
         t_str("removing '");
         t_str(file);
         t_str("' files from '");
      }
      t_str(dir);
      t_strln("'");
   }

   di.scratch = scratch;
   if (DFS_OpenDir(&vi, (uint8_t *)dir, &di) != DFS_OK) {
      if (diagnose) {
          t_str("cannot open directory ");
          t_strln(dir);
      }
   }

   while (DFS_GetNext(&vi, &di, &de) == DFS_OK) {

      if (de.name[0] != 0) {
         filename = formatted_name(de.name);
         if (diagnose) {
            t_str("trying ");
            t_strln(filename);
         }
         // see if formatted name matches file argument
         if (strlen(file) == 0) {
            match = 1;
         }
         else {
            match = amatch(filename, file);
         }
         if (match) {
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
               dir[len] = DIR_SEPARATOR;
               dir[len + 1] = 0;
               safecat(dir, filename, MAX_PATH);
               if (count_only) {
                  if (diagnose) {
                     t_str("counting ");
                     t_strln(dir);
                  }
                  count += remove_entry(dir, count_only);
               }
               else {
                  if (diagnose) {
                     t_str("removing ");
                     t_strln(dir);
                  }
                  tmpcount = remove_entry(dir, count_only);
                  count += tmpcount;
                  if (tmpcount > 0) {
                     // reopen the directory after removing entry
                     dir[len] = 0;
                     if (DFS_OpenDir(&vi, (uint8_t *)dir, &di) != DFS_OK) {
                        if (diagnose) {
                            t_str("cannot open directory ");
                            t_strln(dir);
                        }
                     }
                  }
               }
               dir[len] = 0;
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
   return count;
} 


int remove_entry(char *name, int count_only) {
   int i, j, k, len;
   char tmp_name[MAX_PATH + 1];
   FILEINFO fi;
   VOLINFO vi;
   uint8_t scratch[SECTOR_SIZE];
   uint8_t scratch2[SECTOR_SIZE];
   int count, count2;

   if (DFS_GetVolInfo(0, scratch2, pstart, &vi) != DFS_OK) {
      if (diagnose) {
         t_strln("cannot get volume information");
      }
   }

   len = strlen(name);
   if (len == 0) {
      // can't do anything with a null name!
      return 0;
   }

   if (interact) {
      t_str("remove ");
      t_str(name);
      t_str("? ");
      k = k_wait();
      t_ch(k);
      t_eol();
      if ((k == 'a') || (k == 'A')) {
         interact = 0;
      }
      else if ((k != 'y') && (k != 'Y')) {
        return 0;
      }
   }

   j = 0;

   // first, see if it is a file - if it is, just delete it
   if (diagnose) {
      t_str("trying file ");
      t_strln(name);
   }

   if (DFS_OpenFile(&vi, (uint8_t *)name, DFS_READ, scratch, &fi) == DFS_OK) {
      if (count_only) {
         return 1;
      }
      else {
         if (remove_file(name) == DFS_OK) {
            if (diagnose) {
               t_str("removed ");
               t_strln(name);
            }
            return 1;
         }
         else {
            // we can't seem to remove it!
            t_str("cannot remove ");
            t_strln(name);
            return 0;
         }
      }
   }

   // it must be a directory
   safecpy(tmp_name, name, MAX_PATH);
   if (tmp_name[len - 1] == DIR_SEPARATOR) {
      tmp_name[len - 1] = '\0';
      len--;
   }

   if (diagnose) {
      t_str("trying directory ");
      t_strln(tmp_name);
   }

   //di.scratch = scratch;
   //if (DFS_OpenDir(&vi, (uint8_t *)tmp_name, &di) == DFS_OK) {
   if (DFS_OpenFile(&vi, (uint8_t *)name, DFS_OPENDIR, scratch, &fi) == DFS_OK) {
      if (!suppress) {
         if (!force) {
             t_str(name);
             t_strln(" is a directory (needs -f)");
             return 0;
         }
         if (!recurse) {
             t_str(name);
             t_strln(" is a directory (needs -r)");
             return 0;
         }
      }
   }
   else {
      // neither a file nor a directory with that name!
      if (!suppress) {
         t_str("file or directory ");
         t_str(name);
         t_strln(" not found");
      }
      return 0;
   }

   // if we are recursing and not counting we can 
   // delete immediately, otherwise we just count
   count = process_directory(tmp_name, "", count_only || !recurse);

   // if we are NOT recursing and NOT just counting and we found
   // files in the directory, then we cannot delete it!
   if ((count > 0) && !count_only && !recurse) {
      if (!suppress) {
         t_str("directory ");
         t_str(name);
         t_strln(" not empty (needs -r)");
      }
      return 0;
   }

   if (count_only) {
      // we are just counting, so count the directory
      if (diagnose) {
         t_str("counting ");
         t_strln(tmp_name);
      }
      count += 1;
   }
   else {
      // we are removing the directory
      if (diagnose) {
         t_str("removing ");
      }
      t_strln(tmp_name);
      // if the directory still has contents, we cannot delete it
      count2 = process_directory(tmp_name, "", 1);
      if (count2 == 0) {
         // no contents - so delete the directory itself
         if (remove_dir(name) == DFS_OK) {
            if (diagnose) {
               t_str("removed ");
               t_strln(name);
            }
            count += 1;
         }
         else {
            // we can't seem to remove it!
            if (!suppress) {
               t_str("cannot remove ");
               t_strln(name);
            }
         }
      }
      else {
         // we could not delete all the contents! So we cannot
         // delete the directory!!
         if (!suppress) {
            t_str("directory ");
            t_str(name);
            t_strln(" - not removed (not empty)");
         }
      }
   }
   return count;
}

void main(int argc, char *argv[]) {
   int i;
   int n = 0;
   int error = 0;
   uint32_t psize;
   uint8_t pactive, ptype;
   VOLINFO vi;
   uint8_t scratch[SECTOR_SIZE];
   int count = 0;
   int len;
   char dir[MAX_PATH + 1];
   char *file;

   if ((decode_arguments(argc, argv) == 0) && (file_count > 0)) {
      // work to do, so initialize the file system     
      pstart = DFS_GetPtnStart(0, scratch, 0, &pactive, &ptype, &psize);
      if (DFS_GetVolInfo(0, scratch, pstart, &vi) != DFS_OK) {
         if (diagnose) {
            t_strln("cannot get volume information");
         }
      }
      else {
         // process each file argument - if it contains a path, separate
         // the directory (which cannot contain wildcards) from the file 
         // name (which can contain wildcards) and process it. If there
         // is no directory, the file argument will be processed in the 
         // root directory. 
         for (i = 0; i < file_count; i++) {
            strncpy(dir, files[i], MAX_PATH);
            len = pathlen(dir);
            // remove trailing separator from path (if there is one)
            if ((len > 0) && (dir[len - 1] == DIR_SEPARATOR)) {
               dir[len - 1] = 0;
            }
            else {
               dir[len] = 0;
            }
            file = &files[i][len];
            count += process_directory(dir, file, count_only);
         }
         if (!count_only && !suppress) {
            t_int(count);
            t_str(" files/directories ");
            if (count_only) {
               t_strln("would be removed (without -c)");
            }
            else {
               t_strln("removed");
            }
         }
      }
   }
   if (diagnose) {
      t_strln("rm done");
   }

#ifdef SERIAL_HMI
   // allow some time for characters to be sent out before terminating
   msleep(250);
#else
   if (!aborted && !suppress) {
      // wait for the user to press a key before terminating
      press_key_to_continue();
   }
#endif    
}


