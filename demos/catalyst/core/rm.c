/*
 * simple "rm" command implemented in C for Catalyst
 *
 * Version 3.11 - first C version
 *
 * Note that the "recursive" removal option (-r) can be disabled - this is
 * because on some platforms (with some HMI dirivers) the program may end
 * up too large to run correctly. In this case, you can compile it as a LARGE
 * program, or disable the recursive removal option.
 *
 */

#define RECURSIVE_RM // undefine this if RM is too large to run without XMM RAM!

#include <propeller.h>
#include <string.h>
#include <stdio.h>
#include <dosfs.h>
#include <catalina_hmi.h>

#include <catalina_fs.h>

#include "catalyst.h"
 
static int diagnose = 0;
static int interact = 0;
static int recurse = 0;
static int force = 0;
static int count_only = 0;
static int file_count = 0;
static int pstart = 0;

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
   t_strln("usage rm [options] file_or_directory ...");
   t_eol();
   t_strln("options:");
   t_strln("  -? or -h print this message");
   t_strln("  -c       count, don't remove");
   t_strln("  -d       print diagnostics");
   t_strln("  -f       force dir removal");
   t_strln("  -i       interactive mode");
#ifdef RECURSIVE_RM
   t_strln("  -r       recursive removal");
#endif   
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
               case 'c':
                  count_only = 1;
                  break;
               case 'd':
                  diagnose = 1;
                  break;
               case 'f':
                  force = 1;
                  break;
               case 'i':
                  interact = 1;
                  break;
#ifdef RECURSIVE_RM                  
               case 'r':
                  recurse = 1;
                  break;
#endif                  
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


void press_key_to_continue() {
/*
 * Prompt for a key to continue
 */
   t_str("Press any key to continue ...");
   k_wait();
   t_eol();
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


/*
 * process a directory, either recursively deleting all contents, or just
 * counting how many files would be deleted
 */ 
int process_directory(PVOLINFO vi, char *name, int count_only) {
   uint8_t scratch[SECTOR_SIZE];
   char filename[12+1]; // 8.3 filename plus terminator
   DIRINFO di;
   DIRENT de;
   int count = 0;
   int len = 0;
   int i, j;

   len = strlen(name);

   if (diagnose) {
      if (count_only) {
         t_str("counting in ");
      }
#ifdef RECURSIVE_RM      
      else {
         t_str("removing from ");
      }
#endif      
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
            name[len] = DIR_SEPARATOR;
            name[len + 1] = '\0';
            safecat(name, filename, MAX_PATH);
            if (de.attr&ATTR_DIRECTORY) {
               if (recurse && !force) {
                  t_str("cannot remove directory ");
                  t_str(name);
                  t_strln("(needs -f)");
               }
#ifdef RECURSIVE_RM               
               else if (recurse) {
                  if (diagnose) {
                     t_str("recursing into directory ");
                     t_strln(name);
                  }
                  count += remove_entry(vi, di, name, count_only);
                  if (diagnose) {
                     t_str("counted ");
                     t_int(count);
                     t_strln(" files/directories");
                  }
               }
#else
               else {
                  // don't recurse into it, just count it
                  count += 1;
               }               
#endif               
            }
            else {
               if (count_only) {
                  if (diagnose) {
                     t_str("counting ");
                     t_strln(name);
                  }
                  count += 1;
               }
#ifdef RECURSIVE_RM               
               else {
                  if (diagnose) {
                     t_str("removing ");
                     t_strln(name);
                  }
                  if (remove_file(name) == DFS_OK) {
                     // reopen the directory
                     if (DFS_OpenDir(vi, (uint8_t *)name, &di) != DFS_OK) {
                        if (diagnose) {
                            t_str("cannot open directory ");
                            t_strln(name);
                        }
                     }
                     count += 1;
                  }
                  else {
                     t_str("cannot remove ");
                     t_strln(name);
                  }
               }
#endif

            }
            name[len] = '\0';
         }
      }
   }
   return count;
} 


int remove_entry(PVOLINFO vi, char *name, int count_only) {
   int i, j, k, len;
   char tmp_name[MAX_PATH + 1];
   DIRINFO di;
   FILEINFO fi;
   uint8_t scratch[SECTOR_SIZE];
   int count, count2;


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
     if ((k != 'y') && (k != 'Y')) {
       return 0;
     }
   }

   j = 0;

   // first, see if it is a file - if it is, just delete it
   if (diagnose) {
      t_str("trying file ");
      t_strln(name);
   }

   if (DFS_OpenFile(vi, (uint8_t *)name, DFS_READ, scratch, &fi) == DFS_OK) {
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

   di.scratch = scratch;
   if (DFS_GetVolInfo(0, scratch, pstart, vi) != DFS_OK) {
      if (diagnose) {
         t_strln("cannot get volume information");
      }
      return 0;
   }
   else {
      if (DFS_OpenDir(vi, (uint8_t *)tmp_name, &di) == DFS_OK) {
         if (!force) {
             t_str(name);
             t_strln(" is a directory (needs -f)");
             return 0;
         }
      }
      else {
         // neither a file nor a directory with that name!
         t_str("file or directory ");
         t_str(name);
         t_strln(" not found");
         return 0;
      }
   }

   // if we are recursing and not counting we can 
   // delete immediately, otherwise we just count
   count = process_directory(vi, tmp_name, count_only || !recurse);

#ifdef RECURSIVE_RM   
   // if we are NOT recursing and NOT just counting and we found
   // files in the directory, then we cannot delete it!
   if ((count > 0) && !count_only && !recurse) {
      t_str("directory ");
      t_str(name);
      t_strln(" not empty (needs -r)");
      return 0;
   }
#endif   

   if (count_only) {
      // we are just counting, so count the directiry
      if (diagnose) {
         t_str("counting ");
         t_strln(tmp_name);
      }
      count += 1;
   }

#ifdef RECURSIVE_RM   

   else {
      // we are removing the directory
      if (diagnose) {
         t_str("removing ");
      }
      t_strln(tmp_name);
      // if the directory still has contents, we cannot delete it
      count2 = process_directory(vi, tmp_name, 1);
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
            t_str("cannot remove ");
            t_strln(name);
         }
      }
      else {
         // we could not delete all the contents! So we cannot
         // delete the directory!!
         t_str("directory ");
         t_str(name);
         t_strln(" - not removed (not empty)");
      }
   }

#else

   else {
      if (count > 0) {
         t_str("directory ");
         t_str(name);
         t_strln(" - not removed (not empty)");
      }
      else {
         // now delete the directory itself
         if (remove_dir(name) == DFS_OK) {
            if (diagnose) {
               t_str("removed ");
               t_strln(name);
            }
            count += 1;
         }
         else {
            // we can't seem to remove it!
            t_str("cannot remove ");
            t_strln(name);
         }
      }
   }

#endif

   return count;
}

void main(int argc, char *argv[]) {
   int i;
   int n = 0;
   int error = 0;
   uint8_t scratch[SECTOR_SIZE];
   uint32_t psize;
   uint8_t pactive, ptype;
   VOLINFO vi;
   int count = 0;

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
                  count += remove_entry(&vi, argv[i], count_only);
               }
            }
         }
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
   if (diagnose) {
      t_strln("rm done");
   }

#ifdef SERIAL_HMI
   // allow some time for characters to be sent out before terminating
   msleep(250);
#else
   // wait for the user to press a key before terminating
   press_key_to_continue();
#endif    
}


