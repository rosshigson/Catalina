#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "version.h"

#define MAX_STR 80

/* 
 * bindump - generate various text dumps of a binary file, formatted  
 *           for inclusion in another program. 
 *
 * For instance ...
 *
 *    bindump xxx.bin -p "   0x" -c 
 *    
 *       could produce ...
 *
 *          0x12345678,
 *          0x9abcdef0,
 *          0xabcdef01,
 *          0x98765432,
 *          0x01010101,
 *          0x22334455
 *          (etc - note that with -c the last item is NOT followed by a comma!)
 *
 *       ... for inclusion in a 'C' program.
 *
 *    bindump xxx.bin -w -p "   word $"
 *
 *       could produce ...
 *
 *          word   $1234
 *          word   $5678
 *          word   $9abc
 *          word   $def0
 *          (etc)
 *
 *       ... for inclusion in a Spin program
 *
 *    bindump xxx.bin -b -p "byte " -s "H"
 *
 *       could produce ...
 *
 *       byte 12H
 *       byte 34H
 *       byte 56H
 *       byte 78H
 *       (etc)
 *
 *       ... for inclusion in some other type of program
 *
 */

void usage(char *name)
{
    printf("%s - dump a binary files as text\n", name);
    printf("version: %s\n", CATALINA_VERSION);
    printf("usage: %s [options] filename\n", name);
    printf("options:\n");
    printf("  -h      print this help\n");
    printf("  -p str  prefix dumped values with 'str'\n");
    printf("  -s str  suffix dumped values with 'str'\n");
    printf("  -c      separate dumped valued with ','\n");
    printf("  -b      dump bytes instead of longs\n");
    printf("  -w      dump words instead of longs\n");
    exit(1);
}


int main(int argc, char *argv[])
{
    int i, j, val;
    int dump_bytes = 0;
    int dump_words = 0;
    int comma_separate = 0;
    int first = 0;
    FILE *f;
    char *file_name = 0;
    char prefix[MAX_STR+1] = "";
    char suffix[MAX_STR+1] = "";

    for (i = 1; i < argc; i++)
    {
        if (strcmp(argv[i], "-h") == 0) {
           usage(argv[0]);
        }
        else if (strcmp(argv[i], "-b") == 0) {
           dump_bytes = 1;
        }
        else if (strcmp(argv[i], "-w") == 0) {
           dump_words = 1;
        }
        else if (strcmp(argv[i], "-p") == 0) {
           strncpy(prefix, argv[i+1], MAX_STR);
           i++;
        }
        else if (strcmp(argv[i], "-s") == 0) {
           strncpy(suffix, argv[i+1], MAX_STR);
           i++;
        }
        else if (strcmp(argv[i], "-c") == 0) {
           comma_separate = 1;
        }
        else if (!file_name) {
            file_name = argv[i];
        }
        else {
           usage(argv[0]);
        }
    }

    if (!file_name)  {
        usage(argv[0]);
    }

    f = fopen(file_name, "rb");
    if (!f) {
        printf("Could not open %s\n", file_name);
        exit(1);
    }
    first = 1;
    while (fread(&val, 1, 4, f)) {
        if (dump_bytes) {
           for (j = 0; j < 4; j++) {
              if (!first) {
                 if (comma_separate) {
                    printf(",");
                 }
                 printf("\n");
              }
              printf("%s%02x%s", prefix, val & 0xFF, suffix);
              val >>= 8;
              first = 0;
           }
        }
        else if (dump_words) {
           for (j = 0; j < 2; j++) {
              if (!first) {
                 if (comma_separate) {
                    printf(",");
                 }
                 printf("\n");
              }
              printf("%s%04x%s", prefix, val & 0xFFFF, suffix);
              val >>= 16;
              first = 0;
           }
        }
        else {
           if (!first) {
              if (comma_separate) {
                 printf(",");
              }
              printf("\n");
           }
           printf("%s%08x%s", prefix, val, suffix);
           first = 0;
        }
    }
    printf("\n");
    fclose(f);
    return 0;
}
