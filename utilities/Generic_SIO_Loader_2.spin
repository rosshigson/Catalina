{{
---------------------------------------------------------------
 Generic_SIO_Loader_2 - A Generic SIO Loader program for the
                        Morpheus Cpu #2. 

 Although it is neither a Catalina C program nor a Catalina
 target, and it does not load a kernel, this program loads
 and uses a Catalina plugin to read data from serial IO. The 
 data loaded may be a normal SPIN program or an LMM program
 that fits entirely into Hub RAM - but if the dataloaded is
 larger than 32k, then the first 31k is loaded into Hub RAM,
 and anything beyond 32k is loaded into XMM. In all cases a
 SPIN interpreter cog is started to execute the program in
 Hub RAM, so if the program is an XMM program it should use
 a target that expects the Catalina Program to be in XMM RAM.

 This program expects to execute on a 'slave' propeller, in 
 a system where there is a 'master' propeller executing a
 program such as the Generic_SD_Loader. In a Morpheus system,
 the 'master' propeller would normally be Cpu #1, which
 would run the Generic_SD_Loader program that reads programs
 to be loaded from SD Card, and then sends the program to the
 slave propellers via serial I/O.

 NOTE: Although "Generic" in that it can load SPIN, LMM or XMM
       programs, this program expects to run on a Morpheus
       CPU #2 - it contains XMM routines specific to that
       CPU.

 NOTE: This loader can print debugging information on the
       HMI (if available) - but note that this slows down
       the rate at which data can be loaded.       

 Version 1.0 - initial version by Ross Higson
 Version 3.0 - Added support for RESERVE_COG
             - display load progress if DISPLAY_LOAD is defined
               on the command line when the utilities are built.
 Version 3.1 - remove RESERVE_COG support.


---------------------------------------------------------------
}}
CON
'
' Set these to suit the platform by modifying "Catalina_Common"
' Also, that is now where the PIN definitions for the platform
' are defined. Do not modify these in this file.
'
_clkmode  = Common#CLOCKMODE
_xinfreq  = Common#XTALFREQ
_stack    = Common#STACKSIZE
'
' Set these to suit the Generic SD Loader, or whatever other
' program is executed on the master propeller.
'
MODE      = Common#SIO_LOAD_MODE
BAUD      = Common#SIO_BAUD
'
' Set this to indicate the CPU we are:
'
THIS_CPU  = 2
'
' Set up Proxy, HMI and CACHE symbols and constants:
'
#include "Constants.inc"
'
OBJ
  Common : "Catalina_Common"                          ' Common Definitions
  Loader : "Catalina_XMM_SIO_Loader"                  ' Low Level Loader
  SIO    : "Catalina_SIO_Plugin"                      ' SIO Card Plugin

#ifdef CACHED
   Cache   : "Catalina_SPI_Cache.spin"
#endif

#ifdef DISPLAY_LOAD  
  ' For progress display (if supported) - note that because of the size
  ' of the HiRes video buffer, some programs cannot be loaded if this
  ' is enabled - but it is very useful for debugging!
  HMI    : "Catalina_HMI_Plugin_Morpheus_Vga"         
#endif

PUB Start : ok | PAGE, BLOCK, XFER, DATA                    

  ' Set up the Registry - required to use the SIO Plugin
  Common.InitializeRegistry

  ' re-initalize the free memory pointer (for loadtime memory allocation)
  long[Common#FREE_MEM] := Common#LOADTIME_ALLOC


#ifdef CACHED

  '
  ' Start the cache (if not already started)
  '
  ok := Cache.Start

#endif

  long[Common#FREE_MEM] := long[Common#FREE_MEM] - Loader#SECTOR_SIZE
  PAGE  := long[Common#FREE_MEM]

  long[Common#FREE_MEM] := long[Common#FREE_MEM] - SIO#BLOCK_SIZE
  BLOCK := long[Common#FREE_MEM]

  long[Common#FREE_MEM] := long[Common#FREE_MEM] - 8
  XFER  := long[Common#FREE_MEM]
  
  '
  ' Start the SIO plugin
  '
  SIO.Start(BLOCK, Common#SI_PIN, Common#SO_PIN, MODE, BAUD, TRUE)

#ifdef DISPLAY_LOAD
  ' Start the selected HMI Plugin (and screen driver)
  ' so that we can display load progress on the screen.
  ' NOTE THAT THIS MAY SLOW DOWN THE LOAD PROCESS, AND
  ' THE ADDITIONAL MEMORY REQUIRED MAY MAKE SOME 
  ' PROGRAMS UNLOADABLE.
  long[Common#FREE_MEM] := long[Common#FREE_MEM] - 4 * HMI#DATA_LONGS
  DATA   := long[Common#FREE_MEM]
  HMI.Start(DATA, FALSE, FALSE, TRUE)
#endif

  ' Load a program from serial I/O to Hub and XMM RAM.
  ' The first 31k (32k minus any buffer space) is loaded
  ' into Hub RAM, and any data beyond 32k is loaded into
  ' XMM. Then the Propeller is restarted.
  Loader.Start (BLOCK, PAGE, XFER, THIS_CPU, long[Common#FREE_MEM])

  ' Note - Start never returns.  

{{
                            TERMS OF USE: MIT License 

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
}}

