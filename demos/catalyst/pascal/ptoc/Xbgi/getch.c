#include "graphics.h"

int getch(void)
{
        KeySym keysym;
        XEvent report;
        XComposeStatus compose;
        int buffer_size;
        char buffer[20];
        int charcount;

        buffer_size = 20;
        while (!XCheckTypedWindowEvent(dpy, window, KeyPress, &report))
                ;
        charcount = XLookupString(&report.xkey, buffer, buffer_size, &keysym,
                                  &compose);
	usleep(5000);
        return (int) keysym;
}
