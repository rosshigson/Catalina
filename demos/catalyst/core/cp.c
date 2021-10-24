/*
 * simple "cp" command implemented in C for Catalyst
 *
 * Version 3.11 - first C version
 * 
 */

#define CHUNK_SIZE 2048 // size to copy in each read/write - reduce if program is too large!

#include <propeller.h>
#include <string.h>
#include <stdio.h>
#include <dosfs.h>
#include <catalina_hmi.h>

#include <catalina_fs.h>

#include "catalyst.h"
 
static int diagnose = 0;
static int force = 0;
static int interact = 0;
static int target = 0;
static int target_is_dir = 0;
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
   t_strln("usage cp [options] src [src ...] target");
   t_eol();
   t_strln("options:");
   t_strln("  -? or -h  print this message");
   t_strln("  -f        force overwrite");
   t_strln("  -i        interactive mode");
   t_strln("  -t        target is directory");
   t_strln("  -T        target is file");
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
               case 'f':
                  force = 1;
                  break;
               case 'i':
                  interact = 1;
                  break;
               case 't':
                  target_is_dir = 1;
                  break;
               case 'T':
                  target_is_dir = 0;
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
            target = i;
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


void press_key_to_continue() {
/*
 * Prompt for a key to continue
 */
   t_str("Press any key to continue ...");
   k_wait();
   t_eol();
}


void copy_to_target(PVOLINFO vi, char *src, char *target) {
   uint8_t scratch[SECTOR_SIZE];
   char tgt[MAX_PATH + 1];
   char separator[2] = { DIR_SEPARATOR, 0 };
   int srclen, tgtlen, pathlen;
   FILEINFO fi;
   int k;

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

   if (strcmp(src, ".") == 0) {
      t_strln("cannot copy to .");
   }

   if (strcmp(src, "..") == 0) {
      t_strln("cannot copy to ..");
      return;
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

   if (interact) {
      t_str("copy from ");
      t_str(src);
      t_str( " to ");
      t_str(tgt);
      t_str("? ");
      k = k_wait();
      t_ch(k);
      t_eol();
      if ((k != 'y') && (k != 'Y')) {
         return;
      }
   }
   else {
      t_str("copying from ");
      t_str(src);
      t_str( " to ");
      t_strln(tgt);
   }

   if (target_is_dir) {
      // make sure target directory exists
      if (DFS_OpenFile(vi, (uint8_t *)tgt, DFS_OPENDIR, scratch, &fi) != DFS_OK) {
         t_str("cannot find target directory ");
         t_strln(tgt);
         return;
      }
      // create target path from source filename and target dir
      pathlen = srclen;
      while ((pathlen > 0) && (src[pathlen - 1] != DIR_SEPARATOR)) {
         pathlen--;
      }
      if (pathlen > 0) {
         if (strlen(tgt) + strlen(&src[pathlen]) >= MAX_PATH) {
            t_strln("cannot copy - target path too long");
            return;
         }
         safecat(tgt, separator, MAX_PATH);
         safecat(tgt, &src[pathlen], MAX_PATH);
      }
      else {
         safecat(tgt, separator, MAX_PATH);
         safecat(tgt, src, MAX_PATH);
      }
      if (diagnose) {
         t_str( "target is ");
         t_strln(tgt);
      }
   }
   else {
      // separate target dir from file, to check if target directory exists
      pathlen = tgtlen;
      while ((pathlen > 0) && (tgt[pathlen - 1] != DIR_SEPARATOR)) {
         pathlen--;
      }
      if (pathlen > 0) {
         tgt[pathlen - 1] = 0;
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
         tgt[pathlen - 1] = DIR_SEPARATOR;
      }
   }

   // if we are not forcing, it is an error if target already exists
   if ((!force) 
   &&  (DFS_OpenFile(vi, (uint8_t *)tgt, DFS_READ, scratch, &fi) == DFS_OK)) {
      t_str("cannot copy - target file ");
      t_str(tgt);
      t_strln(" exists (use -f)");
      return;
   }

   // remove target file if it already exists
   DFS_UnlinkFile(vi, (uint8_t *)tgt, scratch);

   // finally we are ready to copy ... we do this a chunk at a time 
   
   {
      FILEINFO src_fi;
      FILEINFO tgt_fi;
      uint8_t chunk[CHUNK_SIZE];
      unsigned long count;

      if (DFS_OpenFile(vi, (uint8_t *)src, DFS_READ, scratch, &src_fi) != DFS_OK) {
         t_str("cannot open source ");
         t_str(src);
         t_strln(" for read");
         return;
      }
      if (DFS_OpenFile(vi, (uint8_t *)tgt, DFS_WRITE, scratch, &tgt_fi) != DFS_OK) {
         t_str("cannot open target ");
         t_str(tgt);
         t_strln(" for write");
         return;
      }
      do {
         DFS_ReadFile(&src_fi, scratch, chunk, &count, SECTOR_SIZE);
         DFS_WriteFile(&tgt_fi, scratch, chunk, &count, count);
      } while (count > 0);

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
            if ((argv[i][0] != '-') && (argv[i][0] != 0) && (i != target)) {
               if (strlen(argv[i]) > MAX_PATH) {
                  t_str("cannot copy ");
                  t_str(argv[i]);
                  t_strln(" - source path too long");
               }
               else if (strlen(argv[target]) > MAX_PATH) {
                  t_str("cannot copy ");
                  t_str(argv[i]);
                  t_strln(" - target path too long");
               }
               else {
                  copy_to_target(&vi, argv[i], argv[target]);
               }
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
   // wait for the user to press a key before terminating
   press_key_to_continue();
#endif    
}


