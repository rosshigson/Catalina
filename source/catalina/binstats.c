/*
 * binstats - Print binary statistics for Catalina binary files. 
 *
 * version 7.1 - initial release (to coincide with Catalina 7.1)
 *
 * version 7.2 - just update version number.
 *
 * version 7.3 - just update version number.
 *
 * version 7.3.1 - remove incorrect file size check.
 *
 * version 7.4.1 - just update version number.
 *
 * version 7.5 - just update version number.
 *
 * version 7.6 - just update version number.
 *
 * version 7.9 - just update version number.
 *
 * version 8.1 - just update version number.
 */

/*--------------------------------------------------------------------------
    This file is part of Catalina.

    Copyright 2009 Ross Higson

    Catalina is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Catalina is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Catalina.  If not, see <http://www.gnu.org/licenses/>.

  -------------------------------------------------------------------------- */

#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>

#ifdef __CATALINA__
#include <dosfs.h>
#else
#include <unistd.h>
#include <sys/stat.h>
#endif

#define SHORT_LAYOUT_2     1 /* 1 to remove unused bytes when using layout 2 (P2 only) */
#define SHORT_LAYOUT_3     1 /* 1 to remove unused bytes when using layout 3 (P1 only) */
#define SHORT_LAYOUT_4     1 /* 1 to remove unused bytes when using layout 4 (P1 only) */
#define SHORT_LAYOUT_5     1 /* 1 to remove unused bytes when using layout 5 (P1 or P2) */

#define VERSION            "8.1"

#define MAX_LINELEN        4096
#define MAX_PATHLEN        1000

#define P1_INIT_B0_OFF 0x51 // must match kernels and [clnx]mmbeg.s
#define P1_INIT_BZ_OFF 0x51
#define P1_LAYOUT_OFFS (P1_INIT_BZ_OFF - P1_INIT_B0_OFF + 0x10)

#define P2_PROLOGUE_OFFS   0x1000 // must match Catalina_reserved.inc
#define P2_LAYOUT_OFFS       0x10 // must match Catalina_reserved.inc

#define KERNEL_SIZE        0x0800 // size of kernel (max - 2048 bytes) 
#define P1_HUB_SIZE        0x8000 // size of P1 HUB RAM (32kb)
#define P2_HUB_SIZE       0x80000 // size of P2 HUB RAM (512kb)

#define P1_LOAD_SIZE  P1_HUB_SIZE // max size of P1 loader (32kb)
#define P2_LOAD_SIZE      0x10000 // max size of P2 loader (64kb)
                                  // (must match catalina_cog.h, payload.c, 
                                  //  Catalina_Common.spin and 
                                  //  Catalina_constants.inc)

#define PROLOGUE_SIZE SECTOR_SIZE // size of XMM prologue (one sector!)

/* global flags */
static int diagnose  = 0;
static int verbose   = 0;
static int prop_vers = 2; 
static int layout    = 0;

static char *input_file = NULL;

#ifdef __CATALINA__

// strdup is not ANSI C
char * strdup(const char *str) {
   if (str != NULL) {
      register char *copy = malloc(strlen(str) + 1);
      if (copy != NULL) {
         return strcpy(copy, str);
      }
   }
   return NULL;
}

#endif

void help(char *my_name) {
   fprintf(stderr, "\nusage: %s [options] input_file\n\n", my_name);
   fprintf(stderr, "options:  -? or -h  print this helpful message (and exit)\n");
   fprintf(stderr, "          -d        output diagnostic messages\n");
   fprintf(stderr, "          -p ver    Propeller Hardware Version (default is 2)\n");
   fprintf(stderr, "          -v        verbose (output information messages)\n");
   fprintf(stderr, "          -x layout use specified memory layout (layout = 0 .. 6, 8 .. 11)\n");
   fprintf(stderr, "                    (not required for propeller 2)\n");
   fprintf(stderr, " exit code is 0 on success, negative on error)\n");
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

// pathcat will check for paths with spaces and quote
// them if we are using Win32 style path names, otherwise
// it is much the same as two safecats
void pathcat(char *dst, const char *src, const char *sfx, size_t max) {
//#ifdef WIN32_PATHS
   if ((strchr(src, ' ') != NULL) && (src[0] != '\"')) {
      safecat(dst, "\"", max);
      safecat(dst, src, max);
      if (sfx != NULL) {
         safecat(dst, sfx, max);
      }
      safecat(dst, "\"", max);
   }
   else {
      safecat(dst, src, max);
      if (sfx != NULL) {
         safecat(dst, sfx, max);
      }
   }
//#else
//   safecat(dst, src, max);
//   if (sfx != NULL) {
//      safecat(dst, sfx, max);
//   }
//#endif   
}


/*
 * return a pointer to the value of the argument to the command-line option,
 * with the specified index, or NULL if there is no value, incrementing the 
 * index, and also decrementing argc if we consume a second command-line 
 * argument.
 */
char *get_option_argument(int *index, int *argc, char *argv[]) {
   if (strlen(argv[*index]) == 2) {
      if ((*argc) > 0) {
         (*index)++;
         // use next arg
         (*argc)--;
         return argv[*index];
      }
      else {
         return NULL;
      }
   }
   else {
      // use remainder of this arg
      return &argv[*index][2];
   }
}

/*
 * decode arguments - return -1 if there is no further processing to do
 */
int decode_arguments (int argc, char *argv[]) {
   int    result = 0;
   int    i = 0;
   char * arg;

   if (argc == 1) {
      if (strlen(argv[0]) == 0) {
         // in case my name was not passed in ...
         fprintf(stderr, "Catalina BinBuild %s\n", VERSION); 
         help("binbuild");
      }
      else {
         fprintf(stderr, "Catalina BinBuild %s\n", VERSION); 
         help(argv[0]);
      }
      result = -1;
   }
   while ((result >= 0) && (argc--)) {
      if (diagnose) {
         fprintf(stderr, "arg: %s\n", argv[i]);
      }
      if (i > 0) {
         if (argv[i][0] == '-') {
            if (diagnose) {
               fprintf(stderr, "switch: %s\n", argv[i]);
            }
            // it's a command line switch
            switch (argv[i][1]) {
               case 'h':
                  /* fall through to ... */
               case '?':
                  if (strlen(argv[0]) == 0) {
                     // in case my name was not passed in ...
                     help("bind");
                  }
                  else {
                     help(argv[0]);
                  }
                  break;

               case 'd':
                  diagnose++;   /* increase diagnosis level */
                  if ((verbose + diagnose) == 1) {
                     fprintf(stderr, "Catalina Binder %s\n", VERSION); 
                  }
                  fprintf(stderr, "diagnostic level %d\n", diagnose);
                  break;

               case 'p':
                  arg = get_option_argument(&i, &argc, argv);
                  if (arg == NULL) {
                     fprintf(stderr, "option -p requires an argument\n");
                     result = -1;
                  }
                  else {
                     sscanf(arg, "%d", &prop_vers);
                  }
                  if (verbose) {
                     fprintf(stderr, "propeller hardware version = %d\n", prop_vers);
                  }
                  if ((prop_vers < 1) || (prop_vers > 2)) {
                     fprintf(stderr, "Unknown propeller hardware version = %d\n", prop_vers);
                     result = -1;
                  }
                  break;

               case 'v':
                  verbose++;
                  if ((verbose + diagnose) == 1) {
                     fprintf(stderr, "Catalina Binder %s\n", VERSION); 
                  }
                  if (diagnose) {
                     fprintf(stderr, "verbosity level %d\n", verbose);
                  }
                  break;

               case 'x':
                  arg = get_option_argument(&i, &argc, argv);
                  if (arg == NULL) {
                     fprintf(stderr, "option -x requires an argument\n");
                  }
                  else {
                     sscanf(arg, "%d", &layout);
                  }
                  if (diagnose) {
                     fprintf(stderr, "memory layout %d\n", layout);
                  }
                  if ((layout < 0) || (layout == 7) || (layout > 11)) {
                     fprintf(stderr, "unknown memory layout - using layout 0\n");
                     layout = 0;
                  }
                  break;

               default:
                  fprintf(stderr, "unrecognized switch: %s\n", argv[i]);
                  result = -1; // force exit without further processing
                  break;
            }
         }
         else {
            // assume its the filename
            input_file = strdup(argv[i]);
            result = 1; // work to do
         }
      }
      i++; // next argument
   }
   if (diagnose) {
      fprintf(stderr, "binary file = %s\n", argv[0]);
   }
   return result;

}

void unquote(char *name, char *unquoted) {
   int  len, i, j;
   
   len = strlen(name);
   if (len > MAX_PATHLEN) {
      len = MAX_PATHLEN;
   }
   j = 0;
   for (i = 0; i < len; i++) {
      if (name[i] != '\"') {
         unquoted[j++] = name[i];
      }
   }
   unquoted[j] = '\0';
}
FILE *fopen_unquoted(char *filename, char *mode) {
   char unquoted_filename[MAX_PATHLEN + 1];

   unquote(filename, unquoted_filename);
   if (diagnose) {
      fprintf(stderr, "fopen filename = %s\n", unquoted_filename);
   }
   return fopen(unquoted_filename, mode);
}

/* print file statistics */
int do_binstats () {

   FILE   * output_file;
   int      lval;
   int      seglayout;
   int      code_addr;
   int      cnst_addr;
   int      init_addr;
   int      data_addr;
   int      ends_addr;
   int      ro_base;
   int      rw_base;
   int      ro_ends;
   int      rw_ends;
   int      ro_beg;
   int      rw_beg;
   int      ro_end;
   int      rw_end;

   if ((output_file = fopen_unquoted(input_file, "rb")) == NULL) {
      fprintf(stderr, "cannot open output file %s\n",input_file);
   }
   else {
      if (prop_vers == 1) {
         // location of seglayout depends on layout!
         fseek(output_file, 0, SEEK_END);
         if ((layout == 0) || (layout == 8) || (layout == 11)) {
            // print Propeller 1 memory layout and size statistics
            fseek(output_file, 0x10, SEEK_SET);
            lval = getc(output_file) | (getc(output_file) << 8);
            //printf("offset = %08X\n", lval);
            fseek(output_file, lval + 0x10 + P1_LAYOUT_OFFS, SEEK_SET);
         }
         else {
            // print Propeller 1 memory layout and size statistics
            fseek(output_file, P1_LOAD_SIZE + P1_LAYOUT_OFFS + 0x10, SEEK_SET);
         }
         seglayout =  getc(output_file) 
                   | (getc(output_file)<<8) 
                   | (getc(output_file)<<16) 
                   | (getc(output_file)<<24);
      }
      else {
         // print Propeller 2 memory layout and size statistics
         fseek(output_file, P2_PROLOGUE_OFFS + P2_LAYOUT_OFFS, SEEK_SET);
         seglayout =  getc(output_file) 
                   | (getc(output_file)<<8) 
                   | (getc(output_file)<<16) 
                   | (getc(output_file)<<24);
         if ((seglayout == 2) || (seglayout == 5)) {
            fseek(output_file, P2_LOAD_SIZE + P2_LAYOUT_OFFS, SEEK_SET);
            seglayout =  getc(output_file) 
                      | (getc(output_file)<<8) 
                      | (getc(output_file)<<16) 
                      | (getc(output_file)<<24);
         }
      }
      if (diagnose) {
         printf("offset = %ld bytes\n", ftell(output_file));
      }
      if (prop_vers == 1) {
         if (seglayout != layout) {
            if (((layout == 0) || (layout == 8) || (layout == 11))
            &&  (seglayout != 0) && (seglayout != 8) && (seglayout != 11)) {
               printf("Incompatible layout - expected %d, got %d\n", layout, seglayout);
               fclose(output_file);
               return -2;
            }
         }
      }
      if (diagnose) {
         printf("seglayout = %08X\n", seglayout);
      }
      code_addr =  getc(output_file) 
                | (getc(output_file)<<8) 
                | (getc(output_file)<<16) 
                | (getc(output_file)<<24);
      if (diagnose) {
         printf("code_addr = %08X\n", code_addr);
      }
      cnst_addr =  getc(output_file) 
                | (getc(output_file)<<8) 
                | (getc(output_file)<<16) 
                | (getc(output_file)<<24);
      if (diagnose) {
         printf("cnst_addr = %08X\n", cnst_addr);
      }
      init_addr =  getc(output_file) 
                | (getc(output_file)<<8) 
                | (getc(output_file)<<16) 
                | (getc(output_file)<<24);
      if (diagnose) {
         printf("init_addr = %08X\n", init_addr);
      }
      data_addr =  getc(output_file) 
                | (getc(output_file)<<8) 
                | (getc(output_file)<<16) 
                | (getc(output_file)<<24);
      if (diagnose) {
         printf("data_addr = %08X\n", data_addr);
      }
      ends_addr =  getc(output_file) 
                | (getc(output_file)<<8) 
                | (getc(output_file)<<16) 
                | (getc(output_file)<<24);
      if (diagnose) {
         printf("ends_addr = %08X\n", ends_addr);
      }
      ro_base   =  getc(output_file) 
                | (getc(output_file)<<8) 
                | (getc(output_file)<<16) 
                | (getc(output_file)<<24);
      if (diagnose) {
         printf("ro_base = %08X\n", ro_base);
      }
      rw_base   =  getc(output_file) 
                | (getc(output_file)<<8) 
                | (getc(output_file)<<16) 
                | (getc(output_file)<<24);
      if (diagnose) {
         printf("rw_base = %08X\n", rw_base);
      }
      ro_ends   =  getc(output_file) 
                | (getc(output_file)<<8) 
                | (getc(output_file)<<16) 
                | (getc(output_file)<<24);
      if (diagnose) {
         printf("ro_ends = %08X\n", ro_ends);
      }
      rw_ends   =  getc(output_file) 
                | (getc(output_file)<<8) 
                | (getc(output_file)<<16) 
                | (getc(output_file)<<24);
      if (diagnose) {
         printf("rw_ends = %08X\n", rw_ends);
      }
      printf("\n");
      if ((seglayout == 0) || (seglayout == 8) || (seglayout == 11)) {
         printf("code = %d bytes\n", cnst_addr - code_addr);
         printf("cnst = %d bytes\n", rw_base   - cnst_addr);
         printf("init = %d bytes\n", data_addr - init_addr);
         printf("data = %d bytes\n", ends_addr - data_addr);
      }
      else if ((seglayout == 2) || (seglayout == 4)) {
         printf("code = %d bytes\n", ro_ends   - code_addr);
         printf("cnst = %d bytes\n", init_addr - cnst_addr);
         printf("init = %d bytes\n", data_addr - init_addr);
         printf("data = %d bytes\n", rw_ends   - data_addr);
      }
      else {
         printf("code = %d bytes\n", cnst_addr - code_addr);
         printf("cnst = %d bytes\n", ro_ends   - cnst_addr);
         printf("init = %d bytes\n", data_addr - init_addr);
         printf("data = %d bytes\n", rw_ends   - data_addr);
      }
      fseek(output_file, 0, SEEK_END);
      printf("file = %ld bytes\n", ftell(output_file));
      printf("\n");
      fclose(output_file);
   }
   return 0;
}

void main (int argc, char *argv[]) {
   int   len;
   int   i;
   int   result;

   if (decode_arguments(argc, argv) <= 0) {
      if (diagnose) {
         fprintf(stderr, "%s exiting\n", argv[0]);
      }
      exit(0);
   }

   if (input_file == NULL) {
      fprintf(stderr, "no input file specified\n");
      exit(-10);
   }

   result = do_binstats();

   if (diagnose) {
      fprintf(stderr, "\n%s done, result = %d\n", argv[0], result);
   }

   exit(result);
}
