/* 
 * Copy files between two logical drives (i.e when FF_MULTI_PARTITION == 1).
 *
 * By default, it copies the file from logical drive 0 to logical drive 1, 
 * but this can be modified by using either or both of the -i and -o options.
 *
 * If only one of -i or -o is specified and the value is 0 or 1, the other 
 * option is assumed to be value 0. If both options are specified then
 * both numbers are used.
 *
 * For example:
 *
 *    volcopy filename           <= copy from 0:filename to 1:filename
 *
 *    volcopy filename -i1       <= copy from 1:filename to 0:filename
 *    volcopy filename -o0       <=            ditto
 *    volcopy filename -i1 -o0   <=            ditto
 *
 *    volcopy filename -i2 -o3   <= copy from 2:filename to 3:filename
 *
 *
 * Note that files in folders can be copied, but the destination folder
 * must already exist on the destination drive. For example:
 *
 *   volcopy bin/poker.bin       <= copy 0:bin/poker.bin to 1:bin/poker.bin
 *                                  (the folder 1:bin must already exist!)
 *                                  
 * Compile this program with -lc (not -lci) because it uses sscanf.
 * For example:
 *
 *   catalina -p2 -lc -lm -C SD -W-Wp-wd82 -W-Wp-wd44 -C99 -O5 volcopy.c \
 *      ff.c ffsystem.c ffunicode.c diskio.c sd_init.c sd_read.c \
 *      sd_stat.c sd_write.c sd_ioctl.c sd_size.c crc7.c int64.c
 *
 */
#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <prop.h>
#include <hmi.h>

#include "ff.h"

#define ARGV_MAX      24  // to match Catalyst
#define MAX_FILENAME 256  // chars
#define BUFFER_SIZE 4096  // bytes

static char *file_name[ARGV_MAX];
static int file_count = 0;

static int help = 0;
static int verbose = 0;

static int ivol = -1;
static int ovol = -1;

#if FF_MULTI_PARTITION == 0

#error volcopy requires FF_MULTI_PARTITION set to 1

#else

   /* Volume mapping table defined by user (required when FF_MULTI_PARTITION == 1) */
   PARTITION VolToPart[] = {
       {0, 1},    /* "0:" ==> 1st partition in physical drive 0 */
       {0, 2},    /* "1:" ==> 2nd partition in physical drive 0 */
   };
#endif


void do_help(char *name) {
   printf("\nusage: %s [options] filename ...\n", name);
   printf("options:\n");
   printf("  -? or -h  print this message\n");
   printf("  -i vol    input volume number (0 .. 3)\n");
   printf("  -o vol    output volume number (0 .. 3)\n");
   printf("  -v        print verbose messages\n");
}

/*
 * decode arguments, building file list - return -1 if
 * there is no further processing to do
 */
int decode_arguments(int argc, char *argv[]) {
   int  i = 0;
   int  code = 0;

   while ((code >= 0) && (argc--)) {
      if (i > 0) {
         if (argv[i][0] == '-') {
            /* it's a command line switch */
            switch (argv[i][1]) {
               case 'h':
               case '?':
                  if (strlen(argv[0]) == 0) {
                     /* in case my name was not passed in ... */
                     do_help("volcopy");
                  }
                  else {
                     do_help(argv[0]);
                  }
                  code = -1;
                  break;
               case 'v':
                  verbose++;   /* increase verbosity level */
                  break;
               case 'i':
                  if (strlen(argv[i]) == 2) {
                     /* use next arg */
                     if (argc > 0) {
                        sscanf(argv[i], "%d", &ivol);

                        argc--;
                     }
                     else {
                        fprintf(stderr, "Option -i requires a numeric parameter\n");
                        code = -1;
                        break;
                     }
                  }
                  else {
                     /* use remainder of this arg */
                     if (sscanf(&argv[i][2], "%d", &ivol) < 1) {
                        fprintf(stderr, "Option -i requires a numeric parameter\n");
                     }
                  }
                  if ((ivol < 0) || (ivol > 3)) {
                     fprintf(stderr, "Error: input volume must be in the range 1 to 3\n");
                     code = -1;
                  }
                  else {
                     if (verbose) {
                        fprintf(stderr, "using input volume %d\n", ivol);
                     }
                  }
                  break;
               case 'o':
                  if (strlen(argv[i]) == 2) {
                     /* use next arg */
                     if (argc > 0) {
                        sscanf(argv[i], "%d", &ovol);
                        argc--;
                     }
                     else {
                        fprintf(stderr, "Option -o requires a parameter\n");
                        code = -1;
                        break;
                     }
                  }
                  else {
                     /* use remainder of this arg */
                     if (sscanf(&argv[i][2], "%d", &ovol) < 1) {
                        fprintf(stderr, "Option -o requires a numeric parameter\n");
                     }
                  }
                  if ((ovol < 0) || (ovol > 3)) {
                     fprintf(stderr, "Error: output volume must be in the range 1 to 3\n");
                     code = -1;
                  }
                  else {
                     if (verbose) {
                        fprintf(stderr, "using output volume %d\n", ovol);
                     }
                  }
                  break;
               default:
                  printf("\nError: unrecognized switch: %s\n", argv[i]);
                  code = -1; // force exit without further processing
                  break;
            }
         }
         else {
            /* assume its a filename */
            if (file_count < ARGV_MAX) {
               file_name[file_count] = malloc(MAX_FILENAME+1);
               memset(file_name[file_count], 0, MAX_FILENAME);
               strncpy(file_name[file_count], argv[i], MAX_FILENAME);
               if (verbose) {
                  printf("file_name[%d] is \"%s\"\n", file_count, file_name[file_count]);
               }
               file_count++;
               code = 1; /* work to do */
            }
            else {
               fprintf(stderr, "\ntoo many files specified - file %s will be ignored\n", argv[i]);
            }
         }
      }
      i++; /* next argument */
   }
   if (code == -1) {
      return code;
   }

   return code;
}


int main (int argc, char *argv[]) {
    int i;

    char ivolstr[] = "0:";
    char ovolstr[] = "1:";

    char ifilename[MAX_FILENAME + 3] = "0:";
    char ofilename[MAX_FILENAME + 3] = "1:";

    FATFS fs0, fs1;      /* Work area (filesystem object) for logical drives */
    FIL fsrc, fdst;      /* File objects */
    BYTE buffer[BUFFER_SIZE];   /* File copy buffer */
    FRESULT fr;          /* FatFs function common result code */
    UINT br, bw;         /* File read/write count */


    if (decode_arguments(argc, argv) == -1) {
       // nothing to do
       exit(-1);
    }

    if (file_count == 0) {
       do_help(argv[0]);
       exit(0);
    }

    // set defaults if none or only one of -o or -i 
    // is specified (with a value of 0 or 1)
    if ((ivol == -1) && (ovol == -1)) { 
      ivol = 0; ovol = 1;
    }
    else if ((ivol == 0) && (ovol == -1)) {
      ovol = 1;
    }
    else if ((ovol == 0) && (ivol == -1)) {
      ivol = 1;
    }
    else if ((ivol == 1) && (ovol == -1)) {
      ovol = 0;
    }
    else if ((ovol == 1) && (ivol == -1)) {
      ivol = 0;
    }

    // set up volume strings
    ivolstr[0] = '0' + ivol;
    ovolstr[0] = '0' + ovol;

    // set up volume strings
    ifilename[0] = '0' + ivol;
    ofilename[0] = '0' + ovol;

    /* Give work areas to each logical drive */
    fr = f_mount(&fs0, ivolstr, 0);
    if (fr != FR_OK) {
       printf("mounting input volume %d failed, returned %d\n", ivol, fr);
    }
    fr = f_mount(&fs1, ovolstr, 0);
    if (fr != FR_OK) {
       printf("mounting output volume %d failed, returned %d\n", ovol, fr);
    }

    for (i = 0; i < file_count; i++) {
       /* set up the input and output file names */
       strncpy(ifilename+2, file_name[i], MAX_FILENAME);
       strncpy(ofilename+2, file_name[i], MAX_FILENAME);
       if (verbose) {
          printf("copying %s to %s\n", ifilename, ofilename);
       }       
       
       /* Open source file on the drive 1 */
       fr = f_open(&fsrc, ifilename, FA_READ);
       if (fr != FR_OK) {
         printf("opening input file %s failed, returned %d\n", ifilename, fr);
         return (int)fr;
       }

       /* Create destination file on the drive 0 */
       fr = f_open(&fdst, ofilename, FA_WRITE | FA_CREATE_ALWAYS);
       if (fr != FR_OK) {
         printf("opening output file %s failed, returned %d\n", ofilename, fr);
         return (int)fr;
       }

       /* Copy source to destination */
       for (;;) {
           /* Read a chunk of data from the source file */
           fr = f_read(&fsrc, buffer, sizeof buffer, &br);
           if (fr != FR_OK) {
              printf("file read returned %d\n", fr);
           }
           /* Write it to the destination file */
           fr = f_write(&fdst, buffer, br, &bw);
           if (br == 0) break; /* error or eof */
           if (fr != FR_OK) {
              printf("file write returned %d\n", fr);
           }
           if (bw < br) break; /* error or disk full */
       }
       /* Close open files */
       f_close(&fsrc);
       f_close(&fdst);

    }

    /* Unregister work area prior to discard it */
    f_unmount(ivolstr);
    f_unmount(ovolstr);

    return (int)fr;
}
