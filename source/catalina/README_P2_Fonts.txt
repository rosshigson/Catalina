INTRODUCTION
------------

On the Propeller 1, the ROM contains font data that is generally used by all 
HMI plugins (except the serial HMI plugin). 

On the Propeller 2, there is no built-in font data, so the font data must be
loaded by the program that intends to use it. However, this means that the
VGA HMI plugin can be configured to use different fonts.
 
This file gives details on the font structure, and how to create new fonts. 

Most of this document is extracted from the README file provided by
Eric R. Smith for his VGA Tile driver.

See https://github.com/totalspectrum/p2_vga_text for more details.

P2 FONTS
--------

The font is an 8xN or 16xN bitmap, but it's laid out a bit differently
from most fonts:

(1) The characters are all placed in one row in the bitmap; that is,
byte 0 is the first row of character 0, byte 1 is the first row of
character 1, and so on, until we get to byte 256 which is the second row
of character 0. This is because we have to keep the data we need for all
characters in COG memory, but we'll only ever need the data for one font
row at a time. This data is read during the horizontal sync and blanking
period.

(2) The rows are output bit 0 first, then bit 1, and so on, so the
individual characters are "reversed" from how most fonts store them.
This is due to the way the streamer works in immediate mode.

There's a C program given here (makebitmap.c) to convert an X window
system .bdf font to a suitable font.bin file. I've only tried it on the
unscii and spleen fonts, so caveat emptor. To use it do:

   gcc -o makebitmap makebitmap.c
   makebitmap unscii-16.bdf vga.map

it'll create a file called unscii-16.bin. The "vga.map" file gives the
mapping between glyphs and Unicode characters. That is, for each of
the 256 possible character positions in the final bitmap, you specify
which Unicode character is desired for the font. If the character you
specify is not actually in the font the corresponding glyph will come
out blank. If no .map file is provided (if you just run "makebitmap
file.bdf") then it'll just use a default mapping where glyphs 0-255
represent Unicode characters 0-255.

The unscii-16.bin file can then be turned into an ascii file suitable
for use by Catalina. This can be accomplished using Catalina's bindump 
utility:

   bindump unscii-16.bin -p "  long $" >unscii-16.inc

The resulting ".inc" file can be copied to the Catalina target\p2 
directory, where it is included by a file called "Catalina_pre_sbrk.inc". 
In that file the symbol FONT_TABLE is defined, with lines similar to the 
following:

   FONT_TABLE
   #include <unscii-16.inc>

To use a different font, replace unscii-16.inc with the font of your 
choice, and recompile your program. It is possible to make this 
selectable on the command line by instead including lines similar to
the following:

   FONT_TABLE
   #if defined(USE_MY_FONT)
   #include <my_font.inc>
   #else
   #include <unscii-16.inc>
   #endif

Then, just compile your program including the option -C USE_MY_FONT in your 
Catalina command. For example:

   catalina -p2 -lc my_program.c -C USE_MY_FONT

CREDITS
-------

The VGA Tile driver is by E. R. Smith (Total Spectrum Software).

The VGA code itself is heavily based on earlier P2 work by Rayman and
Cluso99, and of course Chip's original VGA driver.

The unscii font is from http://pelulamu.net/unscii/
