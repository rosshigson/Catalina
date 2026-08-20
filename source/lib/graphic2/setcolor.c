#include <stdlib.h>
#include <plugin.h>

#include <graphic2.h>

// g_set_colors - set the whole screen to use the specified four colors 
// chosen from the current 256 color color palette
//
void g_set_colors(int color_bg, int color_1, int color_2, int color_3) {
    int dx, dxo, dy, dyo;
    int x_offs, y_offs;
    int x_tiles, y_tiles;
    int x_total, y_total;
    unsigned *gri, *grj;
    unsigned colors;

    colors = ((color_bg&0xFF)<<24)
           | ((color_1&0xFF)<<16)
           | ((color_2&0xFF)<<8)
           | ((color_3&0xFF));

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
            *(grj + dyo) = colors;
        }
    }
}


