#include <stdio.h>

/*
 * _load_overlay - load a blob stored in a named overlay file 
 *                 and with a specified size to a specified 
 *                 Hub RAM address.
 */
int _load_overlay (char *filename, void *addr, int size) {
    FILE *fp;
    fp = fopen(filename, "rb");
    if (fp != NULL) {
       fread(addr, 1, size, fp);
       fclose(fp);
    }
    return (fp != NULL);
}
