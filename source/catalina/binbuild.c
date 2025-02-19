/*
 * binbuild - Binary builder for the Catalina compilation system for 
 *            the Parallax Propeller - required for EMM, SMM & XMM 
 *            programs, where the program, target and kernel are 
 *            assembled separately and need to be combined into a 
 *            single binary. Not required for ordinary LMM, CMM and NMM 
 *            programs where the program, target and kernel are all in 
 *            the same source file which can simply be assembled.
 *
 * version 7.1 - initial release (to coincide with Catalina 7.1)
 *
 * version 7.2 - just update version number.
 *
 * version 7.3 - just update version number.
 *
 * version 7.4 - just update version number.
 *
 * version 7.5 - just update version number.
 *
 * version 7.6 - just update version number.
 *
 * version 7.9 - just update version number.
 *
 * version 8.1 - just update version number.
 *
 * version 8.2 - just update version number.
 *
 * version 8.3 - just update version number.
 *
 * version 8.4 - just update version number.
 *
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

#define VERSION            "8.4"

#define MAX_FILES          1
#define MAX_LINELEN        4096
#define MAX_PATHLEN        1000

#define LMM_PREFIX         "lmm"
#define EMM_PREFIX         "emm"
#define SMM_PREFIX         "smm"
#define XMM_PREFIX         "xmm"
#define CMM_PREFIX         "cmm"
#define NMM_PREFIX         "nmm"
#define LMM_BINARY         "Catalina_LMM.binary"         // P1 only
#define CMM_BINARY         "Catalina_CMM.binary"         // P1 only
#define SMM_OFFSET         0x20 // NOTE : THIS IS KERNEL DEPENDENT!!!

#define DEFAULT_TARGET     "def"

#define OUTPUT_SUFFIX      ".s"

#ifdef __CATALINA__
#define TEMP_SUFFIX        ".___"
#else
#define TEMP_SUFFIX        "_temp"
#endif

#ifndef SECTOR_SIZE
#define SECTOR_SIZE        0x0200 // size of sector 
#endif

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
static int diagnose   = 0;
static int verbose    = 0;
static int prop_vers  = 1; 
static int cleanup    = 1; 
static int quickbuild = 0; 
static int format     = 0; // 0 => binary, 1 => eeprom
static int layout     = 0;

static char *target     = NULL;
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
   fprintf(stderr, "          -e        use eeprom format (default is binary)\n");
   fprintf(stderr, "          -p ver    Propeller Hardware Version\n");
   fprintf(stderr, "          -q        enable quick build (don't delete target file)\n");
   fprintf(stderr, "          -t name   use target 'name' (default is 'def')\n");
   fprintf(stderr, "          -u        do not remove intermediate output files\n");
   fprintf(stderr, "          -v        verbose (output information messages)\n");
   fprintf(stderr, "          -x layout use specified memory layout (layout = 0 .. 6, 8 .. 11)\n");
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
      fprintf(stderr, "Catalina Binary Builder %s\n", VERSION); 
      if (strlen(argv[0]) == 0) {
         // in case my name was not passed in ...
         help("binbuild");
      }
      else {
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

               case 't':
                  arg = get_option_argument(&i, &argc, argv);
                  if (arg == NULL) {
                     fprintf(stderr, "option -t requires an argument\n");
                     result = -1;
                  }
                  else {
                     target = strdup(arg);
                     if (verbose) {
                        fprintf(stderr, "target name = %s\n", target);
                     }
                  }
                  break;

               case 'x':
                  arg = get_option_argument(&i, &argc, argv);
                  if (arg == NULL) {
                     fprintf(stderr, "option -x requires an argument\n");
                     result = -1;
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

               case 'd':
                  diagnose++;   /* increase diagnosis level */
                  if ((verbose + diagnose) == 1) {
                     fprintf(stderr, "Catalina Binary Builder %s\n", VERSION); 
                  }
                  fprintf(stderr, "diagnostic level %d\n", diagnose);
                  break;

               case 'e':
                  format = 1;   /* output eeprom format */
                  if (verbose) {
                     fprintf(stderr, "using eeprom format\n");
                  }
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

               case 'q':
                  quickbuild = 1;   /* enable quick build */
                  if (verbose) {
                     fprintf(stderr, "quick build enabled\n");
                  }
                  break;

               case 'u':
                  cleanup = 0;
                  fprintf(stderr, "untidy (no cleanup) mode\n");
                  break;

               case 'v':
                  verbose++;
                  if ((verbose + diagnose) == 1) {
                     fprintf(stderr, "Catalina Binary Builder %s\n", VERSION); 
                  }
                  if (diagnose) {
                     fprintf(stderr, "verbosity level %d\n", verbose);
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
      fprintf(stderr, "executable name = %s\n", argv[0]);
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

int rename_unquoted(char *old, char *new) {
   char unquoted_old[MAX_PATHLEN + 1];
   char unquoted_new[MAX_PATHLEN + 1];

   unquote(old, unquoted_old);
   unquote(new, unquoted_new);
   if (diagnose) {
      fprintf(stderr, "rename %s to %s\n", unquoted_old, unquoted_new);
   }
   return rename(unquoted_old, unquoted_new);
}

int remove_unquoted(char *filename) {
   char unquoted_filename[MAX_PATHLEN + 1];

   unquote(filename, unquoted_filename);
   if (diagnose) {
      fprintf(stderr, "remove %s\n", unquoted_filename);
   }
   return remove(unquoted_filename);
}
   
char *target_prefix(int layout) {
   switch (layout) {
      case 0  : return LMM_PREFIX;
      case 1  : return EMM_PREFIX;
      case 6  : return SMM_PREFIX;
      case 8  : return CMM_PREFIX;
      case 9  : return EMM_PREFIX;
      case 10 : return SMM_PREFIX;
      case 11 : return NMM_PREFIX;
      default : return XMM_PREFIX;               
   }
}

char *output_suffix(int prop_vers, int format) {
   static char bin[]=".bin";
   static char binary[]=".binary";
   static char eeprom[]=".eeprom";

   if (prop_vers == 2) {
       return bin; // p2 assembler always generates .bin files
   }
   else {
       return ((format == 0) ? binary : eeprom);
   }
}

/* combine the target, the program and the kernel file (if SMM). */
int do_binbuild() {
  
   char     program_name[MAX_PATHLEN * 2 + 10] = "";
   char     output_name[MAX_LINELEN] = "";
   char     path_sfx[MAX_PATHLEN + 1] = "";
   char     target_output_name[MAX_PATHLEN * 2 + 10] = "";
   char     temp_name_1[MAX_PATHLEN * 2 + 10] = "";
   char     temp_name_2[MAX_PATHLEN * 2 + 10] = "";
   char     temp_outname[MAX_PATHLEN + 1] = "";
   unsigned char  prologue[PROLOGUE_SIZE];
   int      result;
   int      count;
   char     c;
   char     d;
   FILE *   output_file;
   FILE *   program_file;
   FILE *   target_file;
   FILE *   smm_kernel_file;
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

#ifdef __CATALINA__
   sprintf(path_sfx, "%s", TEMP_SUFFIX);
#else
   sprintf(path_sfx, "%s%s", TEMP_SUFFIX, output_suffix(prop_vers, format));
#endif
   // rename the output file as a temporary so we can write the real output file
   temp_name_1[0] = '\0';
   pathcat(temp_name_1, input_file, output_suffix(prop_vers, format), MAX_LINELEN);
   temp_name_2[0] = '\0';
   pathcat (temp_name_2, input_file, path_sfx, MAX_LINELEN);
   remove_unquoted(temp_name_2);
   if (diagnose) {
      fprintf(stderr, "renaming output file from %s to %s\n", temp_name_1, temp_name_2);
   }
   rename_unquoted(temp_name_1, temp_name_2);
   // now combine the temporary file with the target file
   strcpy(output_name, "");
   pathcat(output_name, input_file, output_suffix(prop_vers, format), MAX_LINELEN); 
   if (diagnose) {
      fprintf(stderr, "combining target and program to %s\n", output_name);
   }
   if ((output_file = fopen_unquoted(output_name, "wb")) == NULL) {
      fprintf(stderr, "cannot open output file %s\n",output_name);
      return -1;
   }
   else {
      pathcat(program_name, input_file, path_sfx, MAX_PATHLEN); 

      if (diagnose) {
         fprintf(stderr, "using program file %s\n", program_name);
      }
      if ((program_file = fopen_unquoted(program_name, "rb")) == NULL) {
         fprintf(stderr, "cannot open program file %s\n",program_name);
         return -2;
      }
      else {
         safecpy(target_output_name, target_prefix(layout), MAX_PATHLEN);
         safecat(target_output_name, target, MAX_LINELEN);
         if (prop_vers == 2) {
            safecat(target_output_name, ".bin", MAX_LINELEN); // .bin on P2
         }
         else {
            safecat(target_output_name, ".eeprom", MAX_LINELEN); // .eeprom on P1
         }
         if (verbose || quickbuild) {
            if (quickbuild) {
               if (verbose) {
                  if (prop_vers == 2) {
                     fprintf(stderr, "Quick Build - ");
                  }
                  fprintf(stderr, "Target file is %s\n", target_output_name);
               }
               if (prop_vers != 2) {
                  fprintf(stderr, "Quick Build is only supported on the Propeller 2\n");
                  quickbuild = 0;
               }
            }
         }
         if ((target_file = fopen_unquoted(target_output_name, "rb")) == NULL) {
            fprintf(stderr, "cannot open target file %s\n",target_output_name);
            return -3;
         }
         else {
            // first, copy the loader from the target file
            int load_size;
            if (prop_vers == 1) {
               load_size = P1_LOAD_SIZE;
            }
            else {
               load_size = P2_LOAD_SIZE;
               if (fseek(program_file, P2_PROLOGUE_OFFS, SEEK_SET) != 0) {
                  fprintf(stderr, "no prologue in program file %s\n", program_name);
                  return -4;
               }
            }
            for (count = 0; count < load_size; count++) {
               c = getc(target_file);
               if (quickbuild 
               && (prop_vers == 2)
               && (count >= P2_PROLOGUE_OFFS) 
               && (count <  P2_PROLOGUE_OFFS + PROLOGUE_SIZE)) {
                  // while copying the loader, if Quick Build is enabled 
                  // and this is a propeller 2, then replace the prologue 
                  // data in the loader with the prologue data from the 
                  // program file
                  c = getc(program_file);
               }
               putc(c, output_file);
            }
            memset(prologue, 0, PROLOGUE_SIZE);
            // then copy the prologue from the program file
            // (and save it since we need statistics from it)
            if (prop_vers == 2) {
              fseek(program_file, P2_PROLOGUE_OFFS, SEEK_SET);
            }
            if ((layout == 2)||(layout == 5)) {
               if (diagnose) {
                  fprintf(stderr, "Prologue will be copied from %s\n", program_name);
               }
            }
            // get the prologe data from the program file
            for (count = 0; count < PROLOGUE_SIZE; count++) {
               c = getc(program_file);
               prologue[count] = c;
               if ((prop_vers == 1)||(layout == 2)||(layout == 5)) {
                  // copy the prologue to the output file
                  putc(c, output_file);
               }
            }
            // extract statistics from the prologue
            if (prop_vers == 2) {
               count = P2_LAYOUT_OFFS;
            }
            else {
               count = P1_LAYOUT_OFFS + 0x10;
            }
            seglayout =  prologue[count+0] 
                      | (prologue[count+1]<<8) 
                      | (prologue[count+2]<<16) 
                      | (prologue[count+3]<<24);
            count += 4;
            if (diagnose) {
               fprintf(stderr, "seglayout = %08X\n", seglayout);
            }
            code_addr =  prologue[count+0] 
                      | (prologue[count+1]<<8) 
                      | (prologue[count+2]<<16) 
                      | (prologue[count+3]<<24);
            count += 4;
            if (diagnose) {
               fprintf(stderr, "code_addr = %08X\n", code_addr);
            }
            cnst_addr =  prologue[count+0] 
                      | (prologue[count+1]<<8) 
                      | (prologue[count+2]<<16) 
                      | (prologue[count+3]<<24);
            count += 4;
            if (diagnose) {
               fprintf(stderr, "cnst_addr = %08X\n", cnst_addr);
            }
            init_addr =  prologue[count+0] 
                      | (prologue[count+1]<<8) 
                      | (prologue[count+2]<<16) 
                      | (prologue[count+3]<<24);
            count += 4;
            if (diagnose) {
               fprintf(stderr, "init_addr = %08X\n", init_addr);
            }
            data_addr =  prologue[count+0] 
                      | (prologue[count+1]<<8) 
                      | (prologue[count+2]<<16) 
                      | (prologue[count+3]<<24);
            count += 4;
            if (diagnose) {
               fprintf(stderr, "data_addr = %08X\n", data_addr);
            }
            ends_addr =  prologue[count+0] 
                      | (prologue[count+1]<<8) 
                      | (prologue[count+2]<<16) 
                      | (prologue[count+3]<<24);
            count += 4;
            if (diagnose) {
               fprintf(stderr, "ends_addr = %08X\n", ends_addr);
            }
            ro_base =    prologue[count+0] 
                      | (prologue[count+1]<<8) 
                      | (prologue[count+2]<<16) 
                      | (prologue[count+3]<<24);
            count += 4;
            if (diagnose) {
               fprintf(stderr, "ro_base = %08X\n", ro_base);
            }
            rw_base =    prologue[count+0] 
                      | (prologue[count+1]<<8) 
                      | (prologue[count+2]<<16) 
                      | (prologue[count+3]<<24);
            count += 4;
            if (diagnose) {
               fprintf(stderr, "rw_base = %08X\n", rw_base);
            }
            ro_ends =    prologue[count+0] 
                      | (prologue[count+1]<<8) 
                      | (prologue[count+2]<<16) 
                      | (prologue[count+3]<<24);
            count += 4;
            if (diagnose) {
               fprintf(stderr, "ro_ends = %08X\n", ro_ends);
            }
            rw_ends =    prologue[count+0] 
                      | (prologue[count+1]<<8) 
                      | (prologue[count+2]<<16) 
                      | (prologue[count+3]<<24);
            count += 4;
            if (diagnose) {
               fprintf(stderr, "rw_ends = %08X\n", rw_ends);
            }

            if (prop_vers == 2) {
               if ((SHORT_LAYOUT_5 == 1) && (layout == 5)) {
                  // when producing short layouts 5, then
                  // skip until we get to the end of HUB RAM - 
                  // this is all zeros anyway and is only 
                  // required to generate the correct addresses
                  // during assembly. We also skip the space 
                  // we allowed for the prologue (which we 
                  // have just added).
                  if (diagnose) {
                     fprintf(stderr, "Shortening layout %d\n", layout);
                  }
                  fseek(program_file, P2_HUB_SIZE + PROLOGUE_SIZE, SEEK_SET);
                  count = P2_HUB_SIZE + PROLOGUE_SIZE;
               }
               else if ((SHORT_LAYOUT_2) && (layout == 2)) {
                  // when producing short layout 2, then
                  // remove the space between the prologue 
                  // and the start of the code and data 
                  // segments - it's all zero. We must
                  // add it back when loading the image.
                  if (diagnose) {
                     fprintf(stderr, "Shortening layout %d\n", layout);
                  }
                  fseek(program_file, P2_PROLOGUE_OFFS + PROLOGUE_SIZE, SEEK_SET);
                  count = P2_PROLOGUE_OFFS+PROLOGUE_SIZE;
               }
               else if (quickbuild && ((layout == 0)||(layout == 8)||(layout == 11))) {
                  // when Quick Build is enabled, the first P2_LOAD_SIZE bytes
                  // are replaced with the Quick Hub loader, so we ignore them
                  if (diagnose) {
                     fprintf(stderr, "Quick Build - Program starts at %08X\n", P2_LOAD_SIZE);
                  }
                  fseek(program_file, P2_LOAD_SIZE, SEEK_SET);
                  count = 0;
               }
               else {
                  // leave the space between the layout and the start of segments
                  fseek(program_file, PROLOGUE_SIZE, SEEK_SET);
                  count = PROLOGUE_SIZE;
               }
               // copy everything
               ro_beg = 0;
               ro_end = INT_MAX;
               rw_beg = 0;
               rw_end = INT_MAX;
            }
            else {
               count = PROLOGUE_SIZE;
               if (((SHORT_LAYOUT_3 == 1) && (layout == 3)) 
               ||  ((SHORT_LAYOUT_5 == 1) && (layout == 5))) {
                  // when producing short layouts 3 & 5, then
                  // skip until we get to the end of Hub RAM - 
                  // this is all zeros anyway and is only 
                  // required to generate the correct 
                  // addresses during assembly.
                  if (diagnose) {
                     fprintf(stderr, "Shortening layout %d\n", layout);
                  }
                  fseek(program_file, P1_HUB_SIZE, SEEK_SET);
                  count = P1_HUB_SIZE;
               }   
               if (((SHORT_LAYOUT_3 == 1) && (layout == 3)) 
               ||  ((SHORT_LAYOUT_4 == 1) && (layout == 4))) {
                  // Layouts 3 & 4 have additional padding between the RW & RO segments,
                  // so calculate the start and end of these segments, and skip the rest
                  if (diagnose) {
                     fprintf(stderr, "Shortening layout %d\n", layout);
                  }
                  ro_beg = ro_base + 0x10;
                  ro_end = ro_ends + 0x10 + SECTOR_SIZE - 1;
                  ro_end /= SECTOR_SIZE;
                  ro_end *= SECTOR_SIZE;
                  rw_beg = rw_base + 0x10;
                  rw_end = rw_ends + 0x10 + SECTOR_SIZE - 1;
                  rw_end /= SECTOR_SIZE;
                  rw_end *= SECTOR_SIZE;
               }
               else {
                  // copy everything
                  ro_beg = 0;
                  ro_end = INT_MAX;
                  rw_beg = 0;
                  rw_end = INT_MAX;
               }
            }
            if (diagnose > 1) {
               printf("ro_beg = %08X\n", ro_beg);
               printf("ro_end = %08X\n", ro_end);
               printf("rw_beg = %08X\n", rw_beg);
               printf("rw_end = %08X\n", rw_end);
            }
            // copy remainder of program file, skipping padding between segments
            c = getc(program_file);
            while (!feof(program_file)) {
               if (((count >= ro_beg) && (count < ro_end)) 
               ||  ((count >= rw_beg) && (count < rw_end))) {
                  putc(c, output_file);
               }
               count++;
               c = getc(program_file);
            }
            if (layout == 6) {
               // for SMM, always pad output file to exactly 64K, 
               // since we want to add the kernel to a known 
               // location (i.e. at the end of the program)
               c = 0;
               if (count > P1_LOAD_SIZE) {
                  fprintf(stderr, "NOTE: program too large (%d) for SMM format - file will not be loadable!\n", count);
               }
               while (count < P1_LOAD_SIZE) {
                  putc(c, output_file);
                  count++;
               }
               if (diagnose) {
                  fprintf(stderr, "adding kernel to %s\n", output_name);
               }
               if ((smm_kernel_file = fopen(LMM_BINARY, "rb")) == NULL) {
                  fprintf(stderr, "cannot open kernel file %s\n", LMM_BINARY);
                  return -5;
               }
               else {
                  // skip the first few bytes (note that the offset of the 
                  // LMM kernel must be the same for all variants)
                  for (count = 0; count < SMM_OFFSET; count++) {
                     c = getc(smm_kernel_file);
                  }
                  // copy remainder of kernel file, but only copy a maximum
                  // of 2k - a kernel can't be any bigger than this!
                  count = 0;
                  c = getc(smm_kernel_file);
                  while (!feof(smm_kernel_file) && (count < KERNEL_SIZE)) {
                     putc(c, output_file);
                     count++;
                     c = getc(smm_kernel_file);
                  }
                  // pad output file to 2k if it is any smaller
                  c = 0;
                  while (count < KERNEL_SIZE) {
                     putc(c, output_file);
                     count++;
                  }
                  fclose(smm_kernel_file);
               }
            }
            else if (layout == 10) {
               // for SMM, always pad output file to exactly 64K, 
               // since we want to add the kernel to a known 
               // location (i.e. at the end of the program)
               c = 0;
               if (count > P1_LOAD_SIZE) {
                  fprintf(stderr, "NOTE: program too large (%d) for SMM format - file will not be loadable!\n", count);
                  return -6;
               }
               while (count < P1_LOAD_SIZE) {
                  putc(c, output_file);
                  count++;
               }
               if (diagnose) {
                  fprintf(stderr, "adding kernel to %s\n", output_name);
               }
               if ((smm_kernel_file = fopen(CMM_BINARY, "rb")) == NULL) {
                  fprintf(stderr, "cannot open kernel file %s\n", CMM_BINARY);
                  return -5;
               }
               else {
                  // skip the first few bytes (note that the offset of the 
                  // CMM kernel must be the same for all variants)
                  for (count = 0; count < SMM_OFFSET; count++) {
                     c = getc(smm_kernel_file);
                  }
                  // copy remainder of kernel file, but only copy a maximum
                  // of 2k - a kernel can't be any bigger than this!
                  count = 0;
                  c = getc(smm_kernel_file);
                  while (!feof(smm_kernel_file) && (count < KERNEL_SIZE)) {
                     putc(c, output_file);
                     count++;
                     c = getc(smm_kernel_file);
                  }
                  // pad output file to 2k if it is any smaller
                  c = 0;
                  while (count < KERNEL_SIZE) {
                     putc(c, output_file);
                     count++;
                  }
                  fclose(smm_kernel_file);
               }
            }
            fclose(output_file);
            fclose(target_file);
            fclose(program_file);
            if (cleanup) {
               if (diagnose) {
                  fprintf(stderr, "cleaning up temporary program file %s\n", program_name);
               }
               remove_unquoted(program_name);
               if (!quickbuild) {
                  if (diagnose) {
                     fprintf(stderr, "cleaning up target file %s\n", target_output_name);
                  }
                  remove_unquoted(target_output_name);
               }
               safecpy(temp_outname, target_prefix(layout), MAX_PATHLEN);
               safecat(temp_outname, target, MAX_LINELEN);
               safecat(temp_outname, OUTPUT_SUFFIX, MAX_PATHLEN);
               if (diagnose) {
                  fprintf(stderr, "cleaning up temporary output file %s\n", temp_outname);
               }
               remove_unquoted(temp_outname);
               if (layout == 6) {
                  // delete the kernel output file
                  if (diagnose) {
                     fprintf(stderr, "cleaning up intermediate kernel file %s\n", LMM_BINARY);
                  }
                  remove_unquoted(LMM_BINARY);
               }
               else if (layout == 10) {
                  // delete the kernel output file
                  if (diagnose) {
                     fprintf(stderr, "cleaning up intermediate kernel file %s\n", CMM_BINARY);
                  }
                  remove_unquoted(CMM_BINARY);
               }
            }
         }
      }
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

   if (target == NULL) {
      target = DEFAULT_TARGET;
   }

   if (input_file == NULL) {
      fprintf(stderr, "no input file specified\n");
      exit(-10);
   }

   result = do_binbuild();

   if (diagnose) {
      fprintf(stderr, "\n%s done, result = %d\n", argv[0], result);
   }

   exit(result);
}
