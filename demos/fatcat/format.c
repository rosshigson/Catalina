/*
 * SD disk format program using the FatFs f_mkfs() and f_fdisk() functions.
 * 
 * A formatted or unformatted SD card can be used. The program will create
 * a single partition on the drive if FF_MULTI_PARTITION == 0, or up to four 
 * partitions on the drive if FF_MULTI_PARTITION == 1. Each partition can
 * be formatted as FAT, FAT32 or exFAT.
 *
 * NOTE THAT ALL DATA ON THE SD CARD WILL BE LOST!
 *
 * The program is intended to run under Catalyst, so that it can accept 
 * command line parameters. If no parameters are specified, the program will 
 * prompt for all parameters. Up to 4 sets of partition parameters can be 
 * specified on the command line, each one of the form:
 *
 *   n:s,a,b,c,d,e,"f"
 *
 * where (see the FatFs function f_disk() for s, f_mkfs() for a .. e), or
 * f_setlabel() for f:
 *
 *   n => partition number [0..3], no default value
 *   s => size in percent or clusters (percent if 0..100), default is 100
 *   a => file system [0..7] (1 = FAT, 2 = FAT32, 4 = exFAT), default is any
 *   b => number of FATs [0..2], 0 means use default
 *   c => sector alignment [0 .. 32768], 0 means use default
 *   d => number of root directory entries [0..2], 0 means use default
 *   e => cluster size [0..16777216], 0 means use default
 *   f => volume name (up to 11 characters) - quotes must be used if the
 *        volume names includes spaces), default is no label.
 *
 * Note that only the partition number (n:) is required - other parameters 
 * are optional. For example:
 *
 *  format 0:                   => one partition, whole disk, all defaults
 *  format 0:100,0,0,0,0,0,"ME" => one partition, whole disk, label "ME"
 *  format 0:16384,2            => one partition, 16384 sectors (8Gb), FAT32
 *  format 0:100,1,0,0,0,32768  => one FAT partition, whole disk, 32k clusters
 *  format 0:50,2 1:50,4        => two partitions 50% FAT32, 50% exFAT
 *  format 0:8192,2 1:100,4     => two partitions 4Gb FAT32, remainder exFAT
 *
 * All numbers can be decimal (begins with '1'..'9'), octal (begins with '0')
 * or hexadecimal (begins with '0x' or '0X').
 *
 * If a partition number (n:) is repeated, the last values are used. If there
 * is insufficient space left for a partition but there is space left on the
 * disk, all the remaining space will be used (so 100 can always be specified
 * to make the last partition fill the remainder of the disk). Once all the
 * space on the disk is used, subsequent partitions will be ignored.
 *
 * Build the program with a command like:
 *
 *    catalina -p2 -lcix2 -C99 -C SD2 format.c
 *
 * Then load and execute it using Catalyst, or use payload. For example:
 *
 *    payload -o2 -i format
 *
 */
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <sd.h>
#include <prop.h>
#include <hmi.h>
#include <int64.h>

#include <ff.h>

#if FF_MULTI_PARTITION
#define MAX_PARTITIONS 4
#else
#define MAX_PARTITIONS 1
#endif

#define ARGV_MAX 24

#define DUMMY 0 // set to 1 to disable actual formatting (e.g. for testing)

#define SSIZE 512 // sector sixe
#define DSIZE 32  // directory entry size

int help = 0;
int verbose = 0;
int diagnose = 0;

static MKFS_PARM params[MAX_PARTITIONS];
static LBA_t plist[MAX_PARTITIONS + 1];
static char label[MAX_PARTITIONS][15];
static unsigned long size[MAX_PARTITIONS] = {0};

static char bad_fat32[] = "\"*+,/:;<=>?\\[]|.";
static char bad_exfat[] = "\\/:*?\"<>|";

void press_key_to_continue() {
   t_printf("Press a key to continue ...");
   k_wait();
   t_printf("\n\n");
}

// get a label up to 11 chars. 
void get_label(char *prompt, char *label) {
  int n = 0;
  char ch;

  t_string(1, prompt);
  while (1) {
    ch = k_wait();
    if ((ch == 8) && (n > 0)) {
      t_char(1, ch);
      t_char(1, ' ');
      t_char(1, ch);
      n -= 1;
    }
    else if ((ch == '\r') || (ch == '\n')) {
      t_char(1,'\n');
      break;
    }
    else if (isprint(ch)) {
      t_char(1, ch);
      if (n < 11) {
         label[n] = ch;
         n += 1;
      }
    }
  }
  label[n] = 0;
}

// get an unsigned long number (up to 12 decimal digits)
void get_number(char *prompt, unsigned long *num) {
  char digits[13] = "";
  int n = 0;
  char ch;

  t_string(1, prompt);
  while (1) {
    ch = k_wait();
    if ((ch == 8) && (n > 0)) {
      t_char(1, ch);
      t_char(1, ' ');
      t_char(1, ch);
      n -= 1;
    }
    else if ((ch == '\r') || (ch == '\n')) {
      t_char(1,'\n');
      break;
    }
    else if (isdigit(ch)) {
      t_char(1, ch);
      if (n < 12) {
         digits[n] = ch;
         n += 1;
      }
    }
  }
  digits[n] = 0;
  *num = strtoul(digits, NULL, 10);
}

void t_eol() {
   t_string(1, "\n");
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

void do_help() {
   t_eol();
   t_strln("usage: format [options] [partition_spec ...]");
   t_eol();
   t_strln("options:");
   t_strln("  -? or -h  print this message");
   t_strln("  -d        print diagnostics");
   t_strln("  -v        verbose");
   t_eol();
   t_strln("partition_spec (0 to 4 of these):");
   t_strln("  n:size,fs,n_fat,align,n_root,csize,\"label\"");
   t_eol();
   t_strln("where:");
   t_strln("  n:      = partition number [0..3], followed by a colon");
   t_strln("  size    = size in percent or clusters (percent if 0..100), default is 100");
   t_strln("  fs      = file system [0..7] (1 = FAT, 2 = FAT32, 4 = exFAT), 0 means any");
   t_strln("  n_fat   = number of FATs [0..2], 0 means 2");
   t_strln("  align   = sector alignment [0 .. 32768], 0 means use default");
   t_strln("  n_root  = number of root directory entries [0..2], 0 means use default");
   t_strln("  csize   = cluster size [0..16777216], 0 means use default");
   t_strln("  \"label\" = volume label (up to 11 characters) - quotes must be");
   t_strln("            used if the volume name includes spaces)");
   t_eol();
   t_strln(" No spaces are allowed except in quoted labels or between each partition_spec.");
   t_strln(" Only the partition number (n:) is required - other parameters are optional.");
   t_strln(" Numbers can be decimal (begin with '1'..'9'), octal (begin with '0') or");
   t_strln(" hexadecimal (begin with '0x' or '0X').");
   t_strln(" If no partition_spec is given, the program will prompt for all parameters.");
   t_strln(" If formatting fails, it may be because an SD card operaton fails or because");
   t_strln(" the combination of parameters is not possible.");
   t_eol();
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
      case 'v':
         verbose = 1;
         break;
      default:
         t_str("unknown option '");
         t_ch(ch);
         t_str("'");
         help = 1;
         break;
   }
}

int decode_partition_spec(char *spec) {
   long n,s,a,b,c,d,e;
   char f[13]; // must be as long as a line could be!
   char *q;
   int count;
   int result;

   result = 0;
   n = s = a = b = c = d = e = 0;
   if (strchr(spec,'"')) {
      // spec contains quotes ...
      count = sscanf(spec, "%li:%li,%li,%li,%li,%li,%li,\"%11[^\"]", 
                     &n, &s, &a, &b, &c, &d, &e, &f);
   }
   else {
      // spec does not contain quotes ...
      count = sscanf(spec, "%li:%li,%li,%li,%li,%li,%li,%11s", 
                     &n, &s, &a, &b, &c, &d, &e, &f);
  }
   if (diagnose) {
      t_printf("partition spec contained %d parameters\n", count);
   }
   if (count < 1) {
     t_printf("Invalid specification '%s'\n", spec);
     result = -1;
   }
   if (n > 3) {
     t_printf("Invalid partition number %lu\n", n);
     result = -1;
   }
   // check size
   if (count > 1) {
      size[n] = s;
   }
   if (size[n] == 0) {
      size[n] = 100;
   }
   // check format
   if (count > 2) {
      if (a < 8) {
         params[n].fmt = a;
      }
      else {
         t_printf("Invalid format %lu\n", a);
         result = -1;
      }
   }
   if (params[n].fmt == 0) {
      params[n].fmt = FM_ANY; // default is any format
   }
   // check number of FATs
   if (count > 3) {
      if (b <= 2) {
         params[n].n_fat = b;
      }
      else {
         t_printf("Invalid number of FATs %lu\n", b);
         result = -1;
      }
   }
   if (params[n].n_fat == 0) {
      params[n].n_fat = 2; // default is 2 (required to make the SD bootable!)
   }
   // check alignment
   if (count > 4) {
      if ((c == 0) || ((c < 32768) && ((c & (c-1)) == 0))) {
         params[n].align = c;
      }
      else {
         t_printf("Invalid alignment %lu\n", c);
         result = -1;
      }
   }
   // check number of root directory entries
   if (count > 5) {
      if ((d == 0) || ((d < 32768) && ((d % (SSIZE / DSIZE)) == 0))) {
         params[n].n_root = d;
      }
      else {
         t_printf("Invalid number of root dir entries %lu\n", d);
         result = -1;
      }
   }
   // check cluster size
   if (count > 6) {
      if ((e == 0) || ((e <= 16777216) && (e >= SSIZE) && ((e & (e-1)) == 0))) {
         params[n].au_size = e;
      }
      else {
         t_printf("Invalid cluster size %lu\n", e);
         result = -1;
      }
   }
   if (count > 7) {
      // label must be checked for character validity AFTER formatting
      // since we may be letting f_mkfs() choose the format!
      strncpy(label[n]+2, f, 11); 
   }
   return result;
}

/*
 * decode arguments and return -1 if an error is discovered
 */
int decode_arguments(int argc, char *argv[]) {
   int i = 0;
   int j;
   int dir;
   int specs = 0;

   if (argc > ARGV_MAX) {
      argc = ARGV_MAX;
   }
   while (argc--) {
      if (i > 0) {
         if (argv[i][0] == '-') {
            // it's a command line switch
            j = 1;
            while (argv[i][j]) {
               decode_option(argv[i][j++]);
            }
         }
         else {
            // it's a partition specification
            if (decode_partition_spec(argv[i]) == 0) {
              specs++;
            }
         }
      }
      i++; // next argument
   }
   if (help) {
      do_help();
      specs = -1;
   }
   return specs;
}

void main(int argc, char *argv[]) {

   unsigned long numpar = 0;
   int n;
   FATFS fs;
   BYTE work[FF_MAX_SS*10];         /* Working buffer */
   FRESULT result;
   int specs;

   _waitsec(1); // delay for terminal emulator

   for (n = 0; n < MAX_PARTITIONS; n++) {
      label[n][0] = '0' + n;
      label[n][1] = ':';
      label[n][2] = 0;
   }

   t_printf("FatFs Format Program\n");
   specs = decode_arguments(argc, argv);
   if (specs < 0) {
      press_key_to_continue();
      exit(specs);
   }

#if MAX_PARTITIONS == 1
   numpar = 1;
#else
   if (specs == 0) {
      while ((numpar < 1) || (numpar > MAX_PARTITIONS)) {
         char prompt[] = "Number of partitions [1..X]: ";
         prompt[strlen(prompt)-4] = '0' + MAX_PARTITIONS;
         get_number(prompt, &numpar);
         if ((numpar >= 1) && (numpar <= MAX_PARTITIONS)) {
            break;
         }
         t_printf("Invalid number of partitions\n");
      }

      for (n = 0; n < numpar; n++) {
         size[n] = 0;
         unsigned long val = 0;

         // get size
         {
            char prompt[] = "Size in sectors (or percent) for partition X: ";
            prompt[strlen(prompt)-3] = '0' + n;
            get_number(prompt, &size[n]);
            if (size[n] == 0) {
               size[n] = 100;
            }
         }

         // get format
         val = 99; // any invalid value
         while (val >= 8) {
            char prompt[] = "Format for partition X: ";
            prompt[strlen(prompt)-3] = '0' + n;
            get_number(prompt, &val);
            if (val == 0) {
               val = FM_ANY; // default is any format
            }
            if (val < 8) {
               break;
            }
            else {
               val = 99; // any invalid value
               t_printf("Invalid format - try again\n");
            }
         }
         params[n].fmt = val;

         // get number of FATs
         val = 99; // any invalid value
         while (val > 2) {
            char prompt[] = "Number of FATs for partition X: ";
            prompt[strlen(prompt)-3] = '0' + n;
            get_number(prompt, &val);
            if (val == 0) {
               val = 2; // default is 2 (required to make the SD bootable!)
            }
            if (val <= 2) {
               break;
            }
            else {
               val = 99; // any invalid value
               t_printf("Invalid number of FATs - try again\n");
            }
         }
         params[n].n_fat = val;

         // get alignment
         val = 65536; // any invalid value
         while (!((val == 0) || ((val < 32768) && ((val & (val-1)) == 0)))) {
            char prompt[] = "Alignment for partition X: ";
            prompt[strlen(prompt)-3] = '0' + n;
            get_number(prompt, &val);
            if ((val == 0) || ((val < 32768) && ((val & (val-1)) == 0))) {
               break;
            }
            else {
               val = 65536; // any invalid value
               t_printf("Invalid alignment - try again\n");
            }
         }
         params[n].align = val;

         // get number of root directory entries
         val = 99; // any invalid value
         while (!((val == 0) || ((val < 32768) && ((val % (SSIZE / DSIZE)) == 0)))) {
            char prompt[] = "Number of root directory entries for partition X: ";
            prompt[strlen(prompt)-3] = '0' + n;
            get_number(prompt, &val);
            if (((val == 0) || ((val < 32768) && ((val % (SSIZE / DSIZE)) == 0)))) {
               break;
            }
            else {
               val = 99; // any invalid value
               t_printf("Invalid format - try again\n");
            }
         }
         params[n].n_root = val;

         // get cluster size
         val = 16777217; // any invalid value
         while (val > 16777216) {
            char prompt[] = "Cluster size for partition X: ";
            prompt[strlen(prompt)-3] = '0' + n;
            get_number(prompt, &val);
            if ((val == 0) || ((val <= 16777216) && (val >= SSIZE) && ((val & (val-1)) == 0))) {
               break;
            }
            else {
               val = 16777217; // any invalid value
               t_printf("Invalid cluster size - try again\n");
            }
         }
         params[n].au_size = val;

         // get label
         char prompt3[] = "label for partition X: ";
         prompt3[strlen(prompt3)-3] = '0' + n;
         get_label(prompt3, &label[n][2]);
      }
   }
   else {
      numpar = specs;
   }

   // set up partition list, with a null entry at the end
   for (n == 0; n < MAX_PARTITIONS + 1; n++) {
      plist[n] = _int64(0, 0);
   }

   for (n = 0; n < numpar; n++) {
      plist[n] = _int64(0, size[n]);
   }

#endif

   if (diagnose || verbose) {
      // give the user a chance to review values to be used!
      printf("\n");
      for (n = 0; n < numpar; n++) {
         char *fmt_string[8] = {
           "default", 
           "FAT", 
           "FAT32", 
           "FAT or FAT32", 
           "exFAT", 
           "FAT or exFAT", 
           "FAT32 or exFAT", 
           "ANY"
         };
         t_printf("partition %lu:\n",n);
         t_printf("============\n",n);
         t_printf("size    = %lu (%s)\n",size[n], 
                  (size[n]<=100 ? "percent" : "sectors"));
         t_printf("format  = %lu (%s)\n",params[n].fmt,
                   fmt_string[params[n].fmt]);
         t_printf("n_fat   = %lu\n",params[n].n_fat);
         t_printf("align   = %lu\n",params[n].align);
         t_printf("n_root  = %lu\n",params[n].n_root);
         t_printf("au_size = %lu\n",params[n].au_size);
         t_printf("label   = \"%s\"\n\n", label[n]+2);
      }
   }

   t_eol();
   t_printf("Insert an SD card to be formatted - NOTE THAT ALL DATA WILL BE LOST!\n\n");
   press_key_to_continue();

   /* Initialize a brand-new disk drive mapped to physical drive 0 */
   if (diagnose) {
      for (n = 0; n < numpar+1; n++) {
         char s[20];
         LL_DECSTR(s, plist[n]);
         t_printf("plist[%d]=%s\n",n,s);
      }
   }   

#if !DUMMY
   result = f_fdisk(0, plist, work);  /* Divide the physical drive 0 */
   if (result == FR_OK) {
      t_printf("Disk Partitioned ok\n");
   }
   else {
      t_printf("Disk Partitioning failed\n");
      t_printf("f_fdisk() returned %d\n", result);
      t_printf("\n\n");
      press_key_to_continue();
      exit(1);
   }
#endif

   t_printf("\nFormatting - NOTE THAT THIS MAY TAKE A LONG TIME! ...\n");

   for (n = 0; n < numpar; n++) {
      char vol[3];
#if !DUMMY
      /* Create volume on the partition 0 */
      vol[0] = '0' + n;
      vol[1] = ':';
      vol[2] = 0;
      result = f_mkfs(vol, &params[n], work, sizeof work);
#else
      result = FR_OK;
#endif
      if (result != FR_OK) {
         t_printf("Formatting failed\n");
         t_printf("f_mkfs() returned %d\n", result);
         t_printf("\n\n");
         press_key_to_continue();
         exit(1);
      }
   }
   
   for (n = 0; n < numpar; n++) {
      /* set volume labels  (if specified) */
      if (strlen(label[n]) > 2) {
         char vol[] = "X:";
         vol[0] = '0' + n;
         result = f_mount(&fs, vol, 1); // force mount the partition

         if (result != FR_OK) {
            t_printf("f_mount() returned %d\n\n", result);
         }
         else {
            // check the label is valid for the file system type!
            int len = strlen(label[n]);
            int i;
            for (i = 2; i < len; i++) {
               if (strchr(((fs.fs_type == FS_EXFAT) ? bad_exfat : bad_fat32), 
                          label[n][i]) != NULL) {
                  t_printf("Error - \"%s\" is an invalid label for the volume type - ignoring\n", label[n]);
                  label[n][2] = 0;
                  break;
               }
            }
            if (strlen(label[n]) > 2) {
               t_string(1,"Setting Label: \"");
               t_string(1, label[n]);
               t_string(1,"\"\n\n");
#if !DUMMY
               result = f_setlabel(label[n]);
#else
               result = FR_OK;
#endif
               if (result != FR_OK) {
                  t_printf("Failed to set label, result %d\n", result);
               }
            }
            f_unmount(vol);
         }
      }
   }

   t_printf("\nFormatting complete\n\n");
   press_key_to_continue();
   exit(0);

}
