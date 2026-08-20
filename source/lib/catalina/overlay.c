#include <stdio.h>

/*
 * _load_overlay - load a blob stored in a named overlay file 
 *                 and with a specified size to a specified 
 *                 Hub RAM address.
 *                 Returns the number of bytes read.
 */
int _load_overlay (char *filename, void *addr, int size) {
    FILE *fp;
    register int result = 0;
    fp = fopen(filename, "rb");
    if (fp != NULL) {
       result = fread(addr, 1, size, fp);
       fclose(fp);
    }
    return result;
}
