#include <stdlib.h>
#include <plugin.h>

#include <graphic2.h>

// g_palette - set one color (of four) for the whole screen to the 
// specified color from the current 256 color color palette. This 
// should be called AFTER g_setup(), which will override anything set
// beforehand with default values. It assumes the full screen is to be 
// used for graphics.
//
// color = 0 .. 3 (0 = background)
// palette_color = 0 .. 255
//
// Note that the palette_color is different to the P1, which accepted an rgb 
// value specified in bits[7..6] (red), [5..4] (green) and bits[3..2] (blue).
//
int g_palette(int color, int palette_color) {
    int dx, dxo, dy, dyo;
    int x_offs, y_offs;
    int x_tiles, y_tiles;
    int x_total, y_total;
    unsigned *gri, *grj;
    unsigned mask;
    unsigned repl;
    unsigned tmp;

    mask = ~(0xFF<<(8*(3-color&3)));
    repl = (palette_color&0xFF)<<(8*(3-color&3));

    x_offs = cgi_x_offs();
    y_offs = cgi_y_offs();

    x_tiles = cgi_x_tiles();
    y_tiles = cgi_y_tiles();

    x_total = cgi_x_total();
    y_total = cgi_y_total();

    gri = (unsigned *)cgi_screen_data(DOUBLE_BUFFER);
    grj = (unsigned *)cgi_color_data(DOUBLE_BUFFER);

    for (dx = 0; dx < x_tiles; dx++) {
        dxo = dx + x_offs;
        for (dy = 0; dy < y_tiles; dy++) {
            dyo = (dy + y_offs)*x_total + dxo;
            tmp = *(grj + dyo);
            tmp &= mask;
            tmp |= repl;
            *(grj + dyo) = tmp;
        }
    }
    return (int)cgi_palette();
}


