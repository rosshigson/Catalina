This directory contains a C version of the the Parallax Graphics demo program, 
but written in C and using the Catalina graphics library - this library 
contains C implementations of all the Parallax SPIN graphics functions.

The graphics library is only supported on the Propeller 1.

There is only one program in this folder (graphics_demo.c). To build the 
program, use the "build_all" command, specifying the platform for which you 
want to build (HYDRA, HYBRID, TRIBLADEPROP CPU_1 etc) and also any optional 
symbols - e.g. the DOUBLE_BUFFER or NTSC options. By default, the program 
builds a TINY (LMM) version of the demo. If you have XMM RAM, you can also 
specify SMALL or LARGE options to build an XMM version.

For example:

   build_all C3 COMPACT DOUBLE_BUFFER
or
   build_all HYBRID
or
   build_all HYDRA COMPACT DOUBLE_BUFFER NTSC
or
   build_all HYDRA SMALL
or 
   build_all HYDRA LARGE
or
   build_all TRIBLADEPROP CPU_1 LARGE 
or
   build_all C3 SMALL FLASH CACHED_1K NO_KEYBOARD
or
   build_all C3 COMPACT DOUBLE_BUFFER NO_KEYBOARD
 
Note that currently only the TV driver is supported - so the program will 
only compile and run on platforms that support a TV driver. A VGA version 
will be included in a later release.

The Makefile does several things:

 - it links the program with the graphics library (-lgraphics). This also
   tells the targets to load the new graphics driver plugin (CGI).

 - it defines the NO_HMI symbol, to prevent the normal HMI drivers from 
   loading - this is currently necessary to save space, and also 
   because the graphics library uses a different mouse driver to the 
   normal HMI, and currently loads its own. If you use only the PC or TTY HMI 
   you could also load the HMI drivers, but the demo program does not use 
   them.

 - defines the NO_FLOAT symbol. This is really optional - it is mainly required
   when building the CMM or XMM versions of the program.
   
 - defines the NO_INTERLACE symbol. This is really optional - you could
   remove this if the output looks better without it.
   
The graphics demo program (and library) is intended to be a faithful rendering
of the Parallax SPIN graphics demo into C. Like the SPIN version, the C version 
implements bitmap graphics functions on top of the basic video "tile" driver, 
allowing vector style graphics (line, arc, polygons etc). The C library also
includes functions to give C programs direct access to the underlying tile
driver.

NOTES ON THE GRAPHICS LIBRARY:
==============================

The graphics functions are intended to be functionally equivalent to the 
Parallax graphics functions. For details, see the include file (in the
directory 'Catalina\include') called 'catalina_graphics.h'. The main
differences are that it is simpler to configure, since nearly everything
is driven of the X_TILES and Y_TILES values defined in the common file
(i.e. 'Catalina_Common_Input.spin').

There are a few additional functions, as follows:

   cgi_x_tiles() : return the number of X tiles

   cgi_y_tiles() : return the number of y tiles

   cgi_display_base() : return the address of the display RAM

   cgi_bitmap_base(db) : return the address of the bitmap 

   cgi_screen_data(db) : return the address of the screen tile data (wordS)

   cgi_color_data(db) : return the address of the screen color data (longs)


Note that the last three functions require a parameter - you should pass in
the symbol DOUBLE_BUFFER, which is set appropriately when the same symbol is
defined on the cataline command line.

the "cgi" routines have been added to the normal Parallax graphics functions
to allow direct access to the tile map, the color data and the display memory
itself from C - this means that you can drive the graphics directly (e.g. to 
implement your own tile-based graphics) in addition to using the vector style
functions provided by the graphics library.

There are also a full set of mouse functions in this library - these are 
functionally equivalent to the normal Catalina (or Parallax) mouse functions, 
except they are prefixed by "gm_" instead of "m_". Note that you MUST use the 
graphics versions of the mouse functions if you use the graphics library, not 
the HMI versions. Also, you must be sure to call one of the two functions 
gm_reset() or gm_present() before calling any other mouse function, since
they automatically initialize the driver (and the other functions do not).




