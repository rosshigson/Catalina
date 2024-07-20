#include <fs.h>

/*
 * _load_overlay_unmanaged - load a blob stored in a named overlay file 
 *                 and with a specified size to a specified Hub RAM address, 
 *                 but using Catalina file system functions rather than stdio.
 *
 *                 NOTE that _mount MUST be called before using this function.
 */
int _load_overlay_unmanaged (char *filename, void *addr, int size) {
   int my_file;
   FILEINFO my_info;
    my_file = _open_unmanaged(filename, 0, &my_info);
    if (my_file >= 0) {
       _read(my_file, addr, size);
       _close_unmanaged(my_file);
    }
    return (my_file >= 0);
}
