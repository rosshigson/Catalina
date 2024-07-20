/*
 * simple "cp" command implemented in C for Catalyst
 *
 * Version 3.11 - first C version
 * 
 * Version 5.0.1 - allow combined command line options (e.g. -dh)
 * 
 * Version 5.2   - support 'globbing' (wildcard matching - see glob.c)
 *
 * Version 5.3   - ignore volume id.
 *
 * Version 6.3   - add -k option to suppress the "Continue" prompt.
 */

// size to copy in each read/write - reduce if program is too large
// for the Propeller 1 (minimum is SECTOR_SIZE)!
#ifdef __CATALINA_P2
#define CHUNK_SIZE 16384
#else
#define CHUNK_SIZE 2048 
#endif

#include <prop.h>
#include <string.h>
#include <stdio.h>
#include <dosfs.h>
#include <hmi.h>
#include <fs.h>

#include "catalyst.h"
 
#define ARGV_MAX 24 // to match Catalyst

static int help = 0;
static int diagnose = 0;
static int force = 0;
static int suppress = 0;
static int interact = 0;
static int target_is_dir = 0;
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
   t_strln("usage cp [options] src [src ...] target");
   t_eol();
   t_strln("options:");
   t_strln("  -? or -h  print this message");
   t_strln("  -f        force overwrite");
   t_strln("  -i        interactive mode");
   t_strln("  -k        kill (suppress) prompt");
   t_strln("  -t        target is directory");
   t_strln("  -T        target is file");
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
      case 'f':
         force = 1;
         break;
      case 'i':
         interact = 1;
         break;
      case 'k':
         suppress = 1;
         break;
      case 't':
         target_is_dir = 1;
         break;
      case 'T':
         target_is_dir = 0;
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
   if ((help) || (file_count < 2)) {
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


void copy_file(PVOLINFO vi, char *src, char *dst) {
   uint8_t scratch[SECTOR_SIZE];
   FILEINFO src_fi;
   FILEINFO dst_fi;
   uint8_t chunk[CHUNK_SIZE];
   unsigned long count;
   int result;
   int k;

   if (interact) {
      t_str("copy from ");
      t_str(src);
      t_str( " to ");
      t_str(dst);
      t_str("? ");
      k = k_wait();
      t_ch(k);
      t_eol();
      if ((k == 'a') || (k == 'A')) {
         interact = 0;
      }
      else if ((k != 'y') && (k != 'Y')) {
         return;
      }
   }

   if (diagnose) {
      t_str("copying from ");
      t_str(src);
      t_str( " to ");
      t_strln(dst);
   }

   if (DFS_OpenFile(vi, (uint8_t *)src, DFS_READ, scratch, &src_fi) != DFS_OK) {
      t_str("cannot open source ");
      t_str(src);
      t_strln(" for read");
      return;
   }

   // if we are not forcing, it is an error if target already exists
   if ((!force) 
   &&  (DFS_OpenFile(vi, (uint8_t *)dst, DFS_READ, scratch, &dst_fi) == DFS_OK)) {
      t_str("cannot copy - target file ");
      t_str(dst);
      t_strln(" exists (use -f)");
      return;
   }

   if (DFS_OpenFile(vi, (uint8_t *)dst, DFS_WRITE, scratch, &dst_fi) != DFS_OK) {
      t_str("cannot open target ");
      t_str(dst);
      t_strln(" for write");
      return;
   }
   
   while (1) {
      result = DFS_ReadFile(&src_fi, scratch, chunk, &count, CHUNK_SIZE);
      if (count == 0) {
         break;
      }
      if ((result == DFS_OK) || (result == DFS_EOF)) {
         result = DFS_WriteFile(&dst_fi, scratch, chunk, &count, count);
      }
      else {
         break;
      }
   }
   if ((result != DFS_OK) && (result != DFS_EOF)) {
      t_str("error occured while moving ");
      t_strln(src);
   }
}


void copy_to_target(PVOLINFO vi, char *src, char *target) {
   uint8_t scratch[SECTOR_SIZE];
   char tgt[MAX_PATH + 1];
   char separator[2] = { DIR_SEPARATOR, 0 };
   int srclen, tgtlen, dirlen;
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
   int tlen;

   srclen = strlen(src);
   strncpy(tgt, target, MAX_PATH);
   tgtlen = strlen(tgt);

   if (srclen == 0) {
      t_strln("cannot copy - no source specified");
      return;
   }

   if (tgtlen == 0) {
      t_strln("cannot copy - no target specified");
      return;
   }

   if (strcmp(src, tgt) == 0) {
      t_strln("cannot copy - source and target identical");
      return;
   }

   if ((strcmp(src, ".") == 0) 
   ||  (strcmp(src, "..") == 0)) {
      t_str("cannot copy ");
      t_strln(src);
      return;
   }

   if (strcmp(target, "..") == 0) {
      t_strln("cannot copy to ..");
      return;
   }

   if (strcmp(target, ".") == 0) {
      // since we have no concept of a current directory,
      // copying to "." means copying to the root directory
      target[0] = 0;
   }

   // targets ending with a separator are assumed to be directories
   if (tgt[tgtlen - 1] == DIR_SEPARATOR) {
      tgt[tgtlen - 1] = 0;
      tgtlen--;
      target_is_dir = 1;
      if (diagnose) {
         t_strln("target ends with path separator - directory assumed");
      }
   }

   // see if target exists as a directory
   if (DFS_OpenFile(vi, (uint8_t *)tgt, DFS_OPENDIR, scratch, &fi) == DFS_OK) {
      target_is_dir = 1;
      if (diagnose) {
         t_strln("target is a directory");
      }
   }
   else {
      // target is not a directory - if we thought it was, this is an error!
      if (target_is_dir) {
         t_strln("cannot copy - target directory not found");
         return;
      }
   }

   if (target_is_dir) {
      // make sure target directory exists
      if (DFS_OpenFile(vi, (uint8_t *)tgt, DFS_OPENDIR, scratch, &fi) != DFS_OK) {
         t_str("cannot find target directory ");
         t_strln(tgt);
         return;
      }
   }
   else {
      // separate target dir from file, to check if target directory exists
      dirlen = tgtlen;
      while ((dirlen > 0) && (tgt[dirlen - 1] != DIR_SEPARATOR)) {
         dirlen--;
      }
      if (dirlen > 0) {
         tgt[dirlen - 1] = 0;
         if (diagnose) {
            t_str( "checking existence of ");
            t_strln(tgt);
         }
         if (DFS_OpenFile(vi, (uint8_t *)tgt, DFS_OPENDIR, scratch, &fi) != DFS_OK) {
            t_str("cannot find target directory ");
            t_strln(tgt);
            return;
         }
         // restore target path
         tgt[dirlen - 1] = DIR_SEPARATOR;
      }

      // remove target file if it already exists
      DFS_UnlinkFile(vi, (uint8_t *)tgt, scratch);

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

   // finally we are ready to copy ... we do this a file at a time 
   
   di.scratch = scratch;
   if (DFS_OpenDir(vi, (uint8_t *)src_path, &di) != DFS_OK) {
      if (diagnose) {
          t_str("cannot open directory ");
          t_strln(src_path);
      }
      return;
   }

   slen = strlen(src_path);
   tlen = strlen(tgt);

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
               if (target_is_dir) {
                  tgt[tlen] = DIR_SEPARATOR;
                  tgt[tlen + 1] = 0;
                  safecat(tgt, filename, MAX_PATH);
               }
               copy_file(vi, src_path, tgt);
               src_path[slen] = 0;
               tgt[tlen] = 0;
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
         for (i = 0; i < file_count - 1; i++) {
            if (strlen(files[i]) > MAX_PATH) {
               t_str("cannot copy ");
               t_str(files[i]);
               t_strln(" - source path too long");
            }
            else if (strlen(files[file_count - 1]) > MAX_PATH) {
               t_str("cannot copy ");
               t_str(files[i]);
               t_strln(" - target path too long");
            }
            else {
               copy_to_target(&vi, files[i], files[file_count - 1]);
            }
         }
      }
   }
   if (diagnose) {
      t_strln("cp done");
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


