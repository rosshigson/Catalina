/*
 * spinc - Convert SPIN objects to C arrays. Based on the original program 
 *         by Steve Densen (original copyright below). 
 *
 *         Modified by Ross Higson for use with Catalina.
 *
 *         See spinc.h for version history.
 *
 * ----------------------------------------------------------------------------
 * @file spinc.h
 * Defines data structures and API for spinc converter
 * Copyright (c) 2008, Steve Denson
 * ----------------------------------------------------------------------------
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

#include "spinc.h"

#define DEFAULT_STACK_SIZE 100 // 100 bytes (25 longs)
#define GUARD_SIZE 16 // allow 16 bytes (4 longs) for main() stack usage

static int    blob = 0;
static int    blob_obj = 0;
static int    named = 0;
static int    verbose = 0;
static int    diagnose = 0;
static int    tiny_only = 0;
static int    long_array = 1;
static int    func_named = 0;
static int    all_objects = 0;
static int    gen_function = 0;
static int    gen_overlay = 0;
static int    blob_layout = 0;
static int    prop_ver = 1;
static char   func_name[MAX_LINELEN+1];
static char   array_name[MAX_LINELEN+1];
static char   overlay_name[MAX_LINELEN+1];
static int    stack_size = DEFAULT_STACK_SIZE;

static int    file_count = 0;                  
static char * file_name[MAX_FILES];
static char * first_file_name;


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


void help(char *my_name) {
   int i;

   fprintf(stderr, "Convert Compiled Spin Programs to C arrays.\n");
   fprintf(stderr, "\nusage: %s [options] binary_file(s)\n\n", my_name);
   fprintf(stderr, "options:  -? or -h  print this helpful message and exit\n");
   fprintf(stderr, "          -a        include all SPIN objects (default is first only)\n");
   fprintf(stderr, "          -b        generate array of bytes (default is array of longs)\n");
   fprintf(stderr, "          -B obj    generate blob (default is array of longs) from object\n");
   fprintf(stderr, "          -c        generate callable C function that loads from memory\n");
   fprintf(stderr, "          -d        diagnostic mode\n");
   fprintf(stderr, "          -f func   use 'func' for the execution function\n");
   fprintf(stderr, "          -l        generate array of longs (default)\n");
   fprintf(stderr, "          -n name   use 'name' for arrays (default is binary file name)\n");
   fprintf(stderr, "          -o name   generate overlay file (into file name) instead of array\n");
   fprintf(stderr, "          -p ver    Propeller hardware version (default is 1)\n");
   fprintf(stderr, "          -s size   size (in bytes) of stack (default is %d bytes)\n", DEFAULT_STACK_SIZE);
   fprintf(stderr, "          -t        generate callable C function (TINY mode only)\n");
   fprintf(stderr, "          -v        verbose mode\n");
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
 * decode arguments, building file list - return -1 if
 * there is no further processing to do
 */
int decode_arguments (int argc, char *argv[]) {
   int  i = 0;
   int  code = 0;
   char modifier;
   char * arg;
   char filename[MAX_LINELEN + 3 + 1];

   fprintf(stderr, "Catalina SpinC %s\n", VERSION); 

   while ((code >= 0) && (argc--)) {
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
               case '?':
                  if (strlen(argv[0]) == 0) {
                     // in case my name was not passed in ...
                     help("spinc");
                  }
                  else {
                     help(argv[0]);
                  }
                  code = -1;
                  break;
               case 'a':
                  all_objects = 1;
                  if (verbose) {
                     fprintf(stderr, "all objects will be included\n");
                  }
                  if (verbose) {
                     fprintf(stderr, "option -a implies -b\n");
                  }
                  long_array = 0;
                  break;

               case 'b':
                  long_array = 0;
                  if (verbose) {
                     fprintf(stderr, "array will be generated as bytes\n");
                  }
                  break;

               case 'B':
                  tiny_only = 0;
                  blob = 1;
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        sscanf(argv[++i], "%d", &blob_obj);
                        argc--;
                     }
                     else {
                        fprintf(stderr, "option -B requires an argument\n");
                        code = -1;
                        break;
                     }
                  }
                  else {
                     // use remainder of this arg
                     sscanf(&argv[i][2], "%d", &blob_obj);
                  }
                  if (verbose) {
                     fprintf(stderr, "blob will be generated from object = %d\n", blob_obj);
                  }
                  break;

               case 'c':
                  gen_function = 1;
                  tiny_only = 0;
                  if (verbose) {
                     fprintf(stderr, "C function will be generated\n");
                  }
                  if (verbose) {
                     fprintf(stderr, "option -c implies -a and -b\n");
                  }
                  all_objects = 1;
                  long_array = 0;
                  break;

               case 'd':
                  diagnose++;   /* increase diagnosis level */
                  verbose = 1;   /* diagnose implies verbose */
                  if (diagnose == 1) {
                     fprintf(stderr, "Catalina Payload %s\n", VERSION); 
                  }
                  fprintf(stderr, "diagnostic level %d\n", diagnose);
                  break;

               case 'f':
                  func_named = 1;
                  if (strlen(argv[i]) == 2) {
                     if (argc > 0) {
                        // use next arg
                        safecpy(func_name,"", MAX_LINELEN);
                        pathcat(func_name, argv[++i], NULL, MAX_LINELEN);
                        argc--;
                     }
                     else {
                        fprintf(stderr, "option -f requires an argument\n");
                        code = -1;
                        break;
                     }
                  }
                  else {
                     // use remainder of this arg
                     safecpy(func_name,"", MAX_LINELEN);
                     pathcat(func_name, &argv[i][2], NULL, MAX_LINELEN);
                  }
                  if (verbose) {
                     fprintf(stderr, "function name = %s\n", func_name);
                  }
                  break;

               case 'l':
                  long_array = 1;
                  if (verbose) {
                     fprintf(stderr, "array will be generated as longs\n");
                  }
                  break;

               case 'n':
                  named = 1;
                  if (strlen(argv[i]) == 2) {
                     if (argc > 0) {
                        // use next arg
                        safecpy(array_name,"", MAX_LINELEN);
                        pathcat(array_name, argv[++i], NULL, MAX_LINELEN);
                        argc--;
                     }
                     else {
                        fprintf(stderr, "option -n requires an argument\n");
                        code = -1;
                        break;
                     }
                  }
                  else {
                     // use remainder of this arg
                     safecpy(array_name,"", MAX_LINELEN);
                     pathcat(array_name, &argv[i][2], NULL, MAX_LINELEN);
                  }
                  if (verbose) {
                     fprintf(stderr, "array name = %s\n", array_name);
                  }
                  break;

               case 'o':
                  gen_overlay = 1;
                  if (verbose) {
                     fprintf(stderr, "An overlay file will be generated\n");
                  }
                  if (strlen(argv[i]) == 2) {
                     if (argc > 0) {
                        // use next arg
                        safecpy(overlay_name,"", MAX_LINELEN);
                        pathcat(overlay_name, argv[++i], NULL, MAX_LINELEN);
                        argc--;
                     }
                     else {
                        fprintf(stderr, "option -o requires an argument\n");
                        code = -1;
                        break;
                     }
                  }
                  else {
                     // use remainder of this arg
                     safecpy(overlay_name,"", MAX_LINELEN);
                     pathcat(overlay_name, &argv[i][2], NULL, MAX_LINELEN);
                  }
                  if (verbose) {
                     fprintf(stderr, "overlay name = %s\n", overlay_name);
                  }
                  break;

               case 'p':
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        sscanf(argv[++i], "%d", &prop_ver);
                        argc--;
                     }
                     else {
                        fprintf(stderr, "option -p requires an argument\n");
                        code = -1;
                        break;
                     }
                  }
                  else {
                     // use remainder of this arg
                     sscanf(&argv[i][2], "%d", &prop_ver);
                  }
                  if (verbose) {
                     fprintf(stderr, "propeller version = %d\n", prop_ver);
                  }
                  break;

               case 's':
                  modifier = 0;
                  arg = get_option_argument(&i, &argc, argv);
                  if (arg == NULL) {
                     fprintf(stderr, "option -s requires an argument\n");
                     code = -1;
                  }
                  else {
                     if ((arg[0] == '$')) {
                        // hex parameter (such as $ABCD)
                        sscanf(&arg[1], "%x", &stack_size);
                     }
                     else if ((arg[0] == '0')
                     && ((arg[1] == 'x')||(arg[1] == 'X'))) {
                        // hex parameter (such as 0xFFFF or 0XA000)
                        sscanf(&arg[2], "%x", &stack_size);
                     }
                     else {
                        // decimal parameter, perhaps with modifier
                        // (such as 4k or 16m)
                        sscanf(arg, "%d%c", &stack_size, &modifier);
                     }
                  }
                  if (tolower(modifier) == 'k') {
                     stack_size *= 1024;
                  }
                  else if (tolower(modifier) == 'm') {
                     stack_size *= 1024 * 1024;
                  }
                  if (verbose) {
                     fprintf(stderr, "stack size = %d\n", stack_size);
                  }
                  break;

               case 't':
                  gen_function = 1;
                  tiny_only = 1;
                  if (verbose) {
                     fprintf(stderr, "C function will be generated (TINY mode only)\n");
                  }
                  if (verbose) {
                     fprintf(stderr, "option -t implies -a and -b\n");
                  }
                  all_objects = 1;
                  long_array = 0;
                  break;

               case 'v':
                  verbose = 1;
                  fprintf(stderr, "verbose mode\n");
                  break;

               default:
                  fprintf(stderr, "\nError: unrecognized switch: %s\n", argv[i]);
                  code = -1; // force exit without further processing
                  break;
            }
         }
         else {
            // assume its a filename
            if (file_count < MAX_FILES) {
               if (file_count == 0) {
                  first_file_name = strdup(argv[i]);
               }
               file_name[file_count++] = strdup(argv[i]);
               if (diagnose) {
                  fprintf(stderr, "file %s\n", argv[i]);
               }
               code = 1; // work to do
            }
            else {
               fprintf(stderr, "\ntoo many files specified - file %s will be ignored\n", argv[i]);
            }
         }
      }
      i++; // next argument
   }
   if (code == -1) {
      return code;
   }
   if (diagnose) {
      fprintf(stderr, "executable name = %s\n", argv[0]);
   }
   if ((argc == 1) || (file_count == 0)) {
      if (strlen(argv[0]) == 0) {
         // in case my name was not passed in ...
         help("spinc");
      }
      else {
         help(argv[0]);
      }
      code = -1;
   }

   return code;

}


/*
 * load spin binary from filename
 * @param name - path and filename
 * @returns pointer to binary or 0 on failure.
 */
static char* load_binary(char* name)
{
    FILE* fp;
    char* rp = 0;
    int   size = 0;
    int   ii;
    char* bin = 0;
    char  hdr[sizeof(SpinHdr_st)];
    SpinHdr_st* sp = 0;

    fp = fopen(name, "rb");
    if(!fp) {
        fprintf(stderr, "\nError: Can't find spin binary '%s'.\n", name);
        goto exit;
    }
    else {
        if (prop_ver == 1) {
           for(ii = 0; ii < 16; ii++) {
               hdr[ii] = fgetc(fp);
               if (feof(fp)) {
                   fprintf(stderr, "\nError: Bad spin binary header. Unexpected end of file in '%s'\n", name);
                   goto exit;
               }
           }
           sp = (SpinHdr_st*) hdr;
           if(sp->objstart != SPIN_OBJSTART) {
               fprintf(stderr, "\n:Error: Bad spin object start in '%s'. Expecting a spin binary for conversion.\n", name);
               goto exit;
           }
           size = sp->varstart;
           fclose(fp);
        }
        else {
           fseek(fp, 0L, SEEK_END);
           size = ftell(fp);
        }
        fp = fopen(name, "rb");
        rp = (char*) malloc(size);
//        for(ii = 0; ii < size; ii++) {
//            rp[ii] = fgetc(fp);
//        }
        ii = fread(rp,1,size,fp);
        if (ii <= 0) {
            fprintf(stderr, "\nError: Can't read spin binary '%s' [%d].\n", name, ii);
            goto exit;
        }
    }
exit:
    if(fp) fclose(fp);
    return rp;
}

/*
 * print P1 blob #defines, and set up hdrlen, datstart and datlen
 */
static void print_p1_blob_defines(char* p, char* name, long int *hdrlen,  int *datstart, int *datlen)
{
   SpinHdr_st* sp = (SpinHdr_st*) p;
   SpinObj_st* op = (SpinObj_st*) &sp->code;
   CatalinaP1Hdr_st* cp1;

   *hdrlen = ((long int)op-(long int)sp);

   if ((blob_obj < 0) || (blob_obj > op->objcnt)) {
      fprintf(stderr, "\nError: Can't find object '%d'\n", blob_obj);
      exit(1);
   }
   op = (SpinObj_st*) (p + *hdrlen + op->meth_obj[op->pubcnt-1+blob_obj-1]);
   cp1 = (CatalinaP1Hdr_st*)((char *)op + (op->objcnt+op->pubcnt)*4);
   *datstart = ((char *)op - p) + cp1->catalina_code;
   blob_layout = cp1->seglayout;
   if (((blob_layout != LMM_LAYOUT) && (blob_layout != CMM_LAYOUT))
   ||  (cp1->catalina_code > op->objlen)
   ||  (cp1->catalina_ends < cp1->catalina_code)) {
     fprintf(stderr, "\nError: Object %d is not a Catalina CMM or LMM program\n", blob_obj);
     exit(1);
   }
   *datlen   = cp1->catalina_data - cp1->catalina_code;
   // additional defines for blobs
   printf("#define %s_LAYOUT         %d\n\n", name, cp1->seglayout);
   printf("#define %s_BLOB_SIZE      0x%x // bytes\n", name, *datlen);
   printf("#define %s_STACK_SIZE     0x%x // bytes\n", name, stack_size);
   printf("#define %s_PROGRAM_SIZE   0x%x // bytes\n", name, cp1->catalina_ends - cp1->catalina_code);
   printf("#define %s_RUNTIME_SIZE   0x%x // bytes\n\n", name, cp1->catalina_ends - cp1->catalina_code + stack_size + GUARD_SIZE);
   printf("#define %s_INIT_PC        0x%x\n", name, cp1->init_PC);
   printf("#define %s_INIT_BZ        0x%x\n", name, cp1->init_BZ);
   printf("#define %s_INIT_SP        0x%x\n\n", name, cp1->catalina_ends + stack_size);
   printf("#define %s_CODE_ADDRESS   0x%x\n", name, cp1->catalina_code);
   printf("#define %s_CNST_ADDRESS   0x%x\n", name, cp1->catalina_cnst);
   printf("#define %s_INIT_ADDRESS   0x%x\n", name, cp1->catalina_init);
   printf("#define %s_DATA_ADDRESS   0x%x\n\n", name, cp1->catalina_data);
   if (gen_overlay) {
      // use the overlay name
      printf("#define %s_FILE_NAME      \"%s\"\n\n", name, overlay_name);
   }
   else {
      // if we are not producing an overlay file, use the first file name
      printf("#define %s_FILE_NAME      \"%s\"\n\n", name, first_file_name);
   }
}

/*
 * print P2 blob #defines, and set up datstart and datlen
 */
static void print_p2_blob_defines(char* p, char* name, int *datstart, int *datlen)
{
   CatalinaP2Hdr_st* cp2;

   cp2 = (CatalinaP2Hdr_st*)((char *)p + P2_CODE_OFFSET);
   *datstart = cp2->catalina_code;
   blob_layout = cp2->seglayout;
   if (((blob_layout != LMM_LAYOUT) && 
        (blob_layout != CMM_LAYOUT) && 
        (blob_layout != NMM_LAYOUT) && 
        (blob_layout != XMM_SMALL_LAYOUT) &&
        (blob_layout != XMM_LARGE_LAYOUT))
   ||  (cp2->catalina_ends < cp2->catalina_code)) {
     fprintf(stderr, "\nError: Binary file is not a Catalina CMM, LMM, XMM or NMM program\n");
     exit(1);
   }
   *datlen   = cp2->catalina_data - cp2->catalina_code;
   // additional defines for blobs
   printf("#define %s_LAYOUT         %d\n\n", name, cp2->seglayout);
   printf("#define %s_BLOB_SIZE      0x%x // bytes\n", name, *datlen);
   printf("#define %s_STACK_SIZE     0x%x // bytes\n", name, stack_size);
   printf("#define %s_PROGRAM_SIZE   0x%x // bytes\n", name, cp2->catalina_ends - cp2->catalina_code);
   printf("#define %s_RUNTIME_SIZE   0x%x // bytes\n\n", name, cp2->catalina_ends - cp2->catalina_code + stack_size + GUARD_SIZE);
   if (blob_layout == CMM_LAYOUT) { 
      printf("#define %s_INIT_PC        0x%x\n", name, *((unsigned int *)(p + P2_PC_OFFSET_CMM)));
   }
   else if (blob_layout == LMM_LAYOUT) { 
      printf("#define %s_INIT_PC        0x%x\n", name, *((unsigned int *)(p + P2_PC_OFFSET_LMM)));
   }
   else if (blob_layout == NMM_LAYOUT) { 
      printf("#define %s_INIT_PC        0x%x\n", name, *((unsigned int *)(p + P2_PC_OFFSET_NMM)));
   }
   else if (blob_layout == XMM_SMALL_LAYOUT) { 
      printf("#define %s_INIT_PC        0x%x\n", name, *((unsigned int *)(p + P2_PC_OFFSET_XMM)));
   }
   else if (blob_layout == XMM_LARGE_LAYOUT) { 
      printf("#define %s_INIT_PC        0x%x\n", name, *((unsigned int *)(p + P2_PC_OFFSET_XMM)));
   }
   else {
      fprintf(stderr, "\nError: Layout %d not supported\n", blob_layout);
      exit(1);
   }
   printf("#define %s_INIT_SP        0x%x\n\n", name, cp2->catalina_ends + stack_size);
   printf("#define %s_CODE_ADDRESS   0x%x\n", name, cp2->catalina_code);
   printf("#define %s_CNST_ADDRESS   0x%x\n", name, cp2->catalina_cnst);
   printf("#define %s_INIT_ADDRESS   0x%x\n", name, cp2->catalina_init);
   printf("#define %s_DATA_ADDRESS   0x%x\n\n", name, cp2->catalina_data);
   if (gen_overlay) {
      // use the overlay name
      printf("#define %s_FILE_NAME      \"%s\"\n\n", name, overlay_name);
   }
   else {
      // if we are not producing an overlay file, use the first file name
      printf("#define %s_FILE_NAME      \"%s\"\n\n", name, first_file_name);
   }
}

/*
 * print array of C longs or write an overlay file
 * @param p - pointer to spin binary image
 * @param name - array name
 */
static void print_long_array(char* p, char* name)
{
    int ii;
    int datstart = 0;
    int datlen = 0;
    SpinHdr_st* sp = (SpinHdr_st*) p;
    SpinObj_st* op = (SpinObj_st*) &sp->code;
    long int hdrlen = ((long int)op-(long int)sp);
    FILE* fp;

    if (blob) {
       if (prop_ver == 1) {
          print_p1_blob_defines(p, name, &hdrlen, &datstart, &datlen);
       }
       else if (prop_ver == 2) {
          print_p2_blob_defines(p, name, &datstart, &datlen);
       }
       else {
         fprintf(stderr, "\nError: Propeller version %d not supported\n", prop_ver);
         exit(1);
       }
    }
    else if (all_objects) {
       datstart = hdrlen;
       datlen   = sp->varstart-hdrlen;
    }
    else {
       datstart = hdrlen+(op->objcnt+op->pubcnt)*4;
       datlen   = sp->pubstart-datstart;
    }
    if (gen_overlay) {
       fp = fopen(overlay_name, "wb");
       if (!fp) {
           fprintf(stderr, "\nError: Can't open overlay file '%s'.\n", overlay_name);
       }
       else {
          fwrite((const void *)(p+datstart), 4, datlen/4, fp);
          fclose(fp);
       }
    }
    else {
       // then we need the array!
       printf("unsigned long %s_array[] =\n{\n    ", name);
       for (ii = 0; ii < datlen; ii += 4) {
           if (ii && ((ii % 16) == 0)) {
              if (diagnose) {
                 if (prop_ver == 2) {
                    printf("// 0x%04x",ii+datstart);
                 }
                 else {
                    printf("// 0x%04x",ii+datstart-16);
                 }
              }
              printf("\n    ");
           }
           printf("0x%08x", *(int*)(p+ii+datstart));
           if (ii < datlen - 4) {
              printf(", ");
           }
       }
       printf("\n};\n");
    }
}


/*
 * print array of C bytes (chars) or write an overlay file
 * @param p - pointer to spin binary image
 * @param name - array name
 */
static void print_byte_array(char* p, char* name)
{
    int ii;
    int datstart = 0;
    int datlen = 0;
    SpinHdr_st* sp = (SpinHdr_st*) p;
    SpinObj_st* op = (SpinObj_st*) &sp->code;
    long int hdrlen = ((long int)op-(long int)sp);
    FILE* fp;

    if (blob) {
       if (prop_ver == 1) {
          print_p1_blob_defines(p, name, &hdrlen, &datstart, &datlen);
       }
       else if (prop_ver == 2) {
          print_p2_blob_defines(p, name, &datstart, &datlen);
       }
       else {
         fprintf(stderr, "\nError: Propeller version %d not supported\n", prop_ver);
         exit(1);
       }
    }
    else if (all_objects) {
       datstart = hdrlen;
       datlen   = sp->varstart-hdrlen;
    }
    else {
       datstart = hdrlen+(op->objcnt+op->pubcnt)*4;
       datlen   = sp->pubstart-datstart;
    }
    if (gen_overlay) {
       fp = fopen(overlay_name, "wb");
       if (!fp) {
           fprintf(stderr, "\nError: Can't open overlay file '%s'.\n", overlay_name);
       }
       else {
          fwrite((const void *)(p+datstart), 1, datlen, fp);
          fclose(fp);
       }
    }
    else {
       // then we need the array!
       printf("unsigned char %s_array[] =\n{\n    ", name);
       for (ii = 0; ii < datlen; ii++) {
           if (ii && ((ii % 8) == 0)) {
              if (diagnose) {
                 if (prop_ver == 2) {
                    printf("// 0x%04x",ii+datstart);
                 }
                 else {
                    printf("// 0x%04x",ii+datstart-16);
                 }
              }
              printf("\n    ");
           }
           printf("0x%02x", *(unsigned char*)(p+ii+datstart));
           if (ii < datlen - 1) {
              printf(", ");
           }
       }
       printf("\n};\n");
    }
}


/*
 * print SPIN information as #defines
 * @param p - pointer to spin binary image
 * @param name - array name
 */
static void print_spin_defines(char* p, char* name)
{
    int datstart = 0;
    int datlen = 0;
    SpinHdr_st* sp = (SpinHdr_st*) p;
    SpinObj_st* op = (SpinObj_st*) &sp->code;
    long int hdrlen = ((long int)op-(long int)sp);

    datstart = (int) (hdrlen+(op->objcnt+op->pubcnt)*4);

    printf("\n");
    if (prop_ver == 1) {
       printf("#define %s_CLOCKFREQ  %d\n", name, sp->clkfreq);
       printf("#define %s_CLOCKMODE  0x%02X\n", name, sp->clkmode);
    }
    else if (prop_ver == 2) {
       printf("#define %s_CLOCKFREQ  %u\n", name, *((unsigned int *)(p + P2_CLOCKFREQ_OFFSET)));
       printf("#define %s_CLOCKMODE  0x%08X\n", name, *((unsigned int *)(p + P2_CLOCKMODE_OFFSET)));
    }
    printf("\n");

    if (blob) {
       printf("#define %s_ARRAY_TYPE 2 // array contains C blob\n", name);
    }
    else if (all_objects) {
       printf("#define %s_ARRAY_TYPE 1 // array contains SPIN program\n", name);
       printf("#define %s_PROG_SIZE  %ld // bytes\n", name, sp->varstart-hdrlen);
       printf("#define %s_PROG_OFF   %ld // byte offset in array\n", name, sp->pubstart-hdrlen);
       printf("#define %s_VAR_SIZE   %d // bytes\n", name, sp->stkstart-sp->varstart-8);
       printf("#define %s_STACK_SIZE %d // bytes\n", name, stack_size);
       printf("#define %s_STACK_OFF  %d // bytes\n", name, sp->stkbase-sp->stkstart);
    }
    else {
       printf("#define %s_ARRAYTYPE 0 // array contains PASM program\n", name);
       printf("#define %s_PROG_SIZE  %d // bytes\n", name, sp->pubstart-datstart);
    }
    printf("\n");
}


/*
 * print function to call
 * @param name - array name
 */
static void print_function(char* name)
{
   if (blob) {
      printf("\n");
      if (gen_overlay) {
         printf("// start the blob as a C program from an overlay\n");
         printf("int start_%s(void* var_addr, int cog) {\n\n", name);
         printf("   // zero the memory used for data and stack space\n");
         printf("   memset((void *)%s_DATA_ADDRESS, 0, %s_RUNTIME_SIZE-%s_BLOB_SIZE);\n\n", name, name, name);
         printf("   // load the blob to the correct location\n");
         printf("#ifdef __CATALINA_FS_OVERLAY\n");
         printf("   // use unmanaged file functions to load overlay\n");
         printf("   _load_overlay_unmanaged(\"%s\", (void *)%s_CODE_ADDRESS, %s_BLOB_SIZE);\n\n", overlay_name, name, name);
         printf("#else\n");
         printf("   // use managed file functions to load overlay\n");
         printf("   _load_overlay(\"%s\", (void *)%s_CODE_ADDRESS, %s_BLOB_SIZE);\n\n", overlay_name, name, name);
         printf("#endif\n");
      }
      else {
         printf("// start the blob as a C program from an array\n");
         printf("int start_%s(void* var_addr, int cog) {\n\n", name);
         printf("   // zero the memory used for data and stack space\n");
         printf("   memset((void *)%s_DATA_ADDRESS, 0, %s_RUNTIME_SIZE-%s_BLOB_SIZE);\n\n", name, name, name);
         printf("   // copy the blob to the correct location\n");
         printf("   memcpy((void *)%s_CODE_ADDRESS, %s_array, %s_BLOB_SIZE);\n\n", name, name, name);
      }
      if (func_named) {
         printf("   return %s(%s_INIT_PC, %s_INIT_SP, var_addr, cog);\n\n", func_name, name, name);
      }
      else {
         printf("#if (defined(__CATALINA_libthreads) || (defined(COGSTART_THREADED) && !defined(COGSTART_NON_THREADED)))\n\n");
         // use threaded start function
         printf("#if %s_LAYOUT == %d\n", name, CMM_LAYOUT);
         printf("   return _threaded_cogstart_CMM_cog(%s_INIT_PC, %s_INIT_SP, var_addr, cog);\n", name, name);
         if (prop_ver == 2) {
            printf("#elif %s_LAYOUT == %d\n", name, NMM_LAYOUT);
            printf("   return _threaded_cogstart_NMM_cog(%s_INIT_PC, %s_INIT_SP, var_addr, cog);\n", name, name);
         }
         printf("#else\n");
         printf("   return _threaded_cogstart_LMM_cog(%s_INIT_PC, %s_INIT_SP, var_addr, cog);\n", name, name);
         printf("#endif\n");
         printf("\n#else\n\n");
         // use non-threaded start function
         printf("#if %s_LAYOUT == %d\n", name, CMM_LAYOUT);
         printf("   return _cogstart_CMM_cog(%s_INIT_PC, %s_INIT_SP, var_addr, cog);\n", name, name);
         if (prop_ver == 2) {
            printf("#elif %s_LAYOUT == %d\n", name, NMM_LAYOUT);
            printf("   return _cogstart_NMM_cog(%s_INIT_PC, %s_INIT_SP, var_addr, cog);\n", name, name);
         }
         printf("#else\n");
         printf("   return _cogstart_LMM_cog(%s_INIT_PC, %s_INIT_SP, var_addr, cog);\n", name, name);
         printf("#endif\n");
         printf("\n#endif\n\n");
      }
      printf("}\n\n");
   }
   else if (tiny_only) {
      // do not need a prog array - only var and stack
      printf("\n");
      printf("int start_%s(void *var, void *stack) {\n\n", name);
      printf("   // zero the memory used as var and stack space\n");
      printf("   memset(var, 0, %s_VAR_SIZE);\n", name);
      printf("   memset(stack, 0, %s_STACK_SIZE);\n", name);
      printf("\n");
      printf("   // start the Spin program\n");
      if (func_named) {
         printf("   return %s(%s_array, var, stack, %s_PROG_OFF, %s_STACK_OFF);\n", func_name, name, name, name);
      }
      else {
         printf("   return _coginit_Spin(%s_array, var, stack, %s_PROG_OFF, %s_STACK_OFF);\n", name, name, name);
      }
      printf("\n");
      printf("}\n\n");
   }
   else {
      // need a prog array that is in Hub RAM
      printf("\n");
      printf("int start_%s(void *prog, void *var, void *stack) {\n\n", name);
      printf("   // zero the memory used as var and stack space\n");
      printf("   memset(var, 0, %s_VAR_SIZE);\n", name);
      printf("   memset(stack, 0, %s_STACK_SIZE);\n", name);
      printf("\n");
      printf("   // copy the Spin program to the local array, in case it is\n");
      printf("   // currently stored in XMM RAM\n");
      printf("   memcpy(prog, %s_array, %s_PROG_SIZE);\n", name, name);
      printf("\n");
      printf("   // start the Spin program\n");
      if (func_named) {
         printf("   return %s(%s_array, var, stack, %s_PROG_OFF, %s_STACK_OFF);\n", func_name, name, name, name);
      }
      else {
         printf("   return _coginit_Spin(%s_array, var, stack, %s_PROG_OFF, %s_STACK_OFF);\n", name, name, name);
      }
      printf("\n");
      printf("}\n\n");
   }
}


/*
 * chop path from filename
 * @param name - path and filename
 * @returns filename
 */
static char* chopPath(char* name)
{
    int ii = 0;
    int len = strlen(name);
    char* start = name;
    char* p = 0;
    int sep = 0;

    if(strchr(name, '\\'))  sep = '\\';
    if(strchr(name, '/'))   sep = '/';

    while((start+len-name) > 0) {
        p = strchr(name+1, sep);
        if (!p) break;
        name = p+1;
    }
    return name;
}


/*
 * chop extension from filename
 * @param name - path and filename
 * @returns filename
 */
static char* chopExtension(char* name)
{
    char* p  = strchr(name, '.');
    long int   ii = (long int)p-(long int)name;
    if (p && ii) name[ii] = '\0';
    return name;
}

int main(int argc, char* argv[])
{
    char * spin_ptr = 0;
    char spin_name[MAX_LINELEN + 1] = "";
    char spin_num[5] = "";
    int    i;

   if (decode_arguments(argc, argv) <= 0) {
      if (diagnose) {
         fprintf(stderr, "%s exiting\n", argv[0]);
      }
      exit(0);
   }

   if (file_count == 0) {
      fprintf(stderr, "\nError: No input files specified - exiting\n");
      exit(1);
   }

   for (i = 0; i < file_count; i++) {

      spin_ptr = load_binary(file_name[i]);
      if (spin_ptr) {
          if (blob) {
             if (blob_obj == 0) {
                blob_obj = 2;
             }
          }
          printf("/* \n");
          printf(" * Created from %s", file_name[i]);
          if (gen_function) {
             printf (" with option -c\n"); 
          }
          else if (all_objects) {
             printf (" with option -a\n"); 
          }
          else {
             printf("\n");
          }
          printf(" * \n");
          printf(" * by Spin to C Array Converter, version %s\n", VERSION);
          printf(" */\n");
          if (named) {
             safecpy(spin_name, array_name, MAX_LINELEN);
             if (file_count > 1) {
                sprintf(spin_num, "_%d", i);
                safecat(spin_name, spin_num, MAX_LINELEN);
             }
          }
          else {
             safecpy(spin_name, chopExtension(file_name[i]), MAX_LINELEN);
          }
          print_spin_defines(spin_ptr, spin_name);
          if (long_array) {
             print_long_array(spin_ptr, spin_name);
          }
          else {
             print_byte_array(spin_ptr, spin_name);
          }
          if (gen_function) {
             print_function(spin_name);
          }
      }
   }
   return 0;
}

