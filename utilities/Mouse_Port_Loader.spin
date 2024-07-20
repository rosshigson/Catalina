{{
---------------------------------------------------------------
 Mouse_Port_Loader - An SIO Loader program for use with the
                Catalina Payload program to load LMM or XMM
                programs into a Prop platform when the mouse
                port must be used (e.g the Hydra or Hybdrid).

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

 On multi-CPU systems, this program can be loaded on any CPU.
 It is normally specified as the first program to be loaded
 by the Catalina Payload loader - by doing this, the second
 program specified can be an XMM program.  
 
 NOTE: The CPU number on which this program will "listen" for
       data to load is specified using THIS_CPU - in most
       cases this is fine - even in multi-CPU systems, unless
       there is another program already loaded into another
       CPU that identifies itself as CPU 1. The Payload loader
       (by default) will load the CPU that identifies itself
       as CPU 1. In multi-prop systems where there may already
       be an SIO program running as CPU 1, the CPU number of
       this program can be set to another CPU number - and the
       '-c' option to the Payload program can be used to select
       which CPU will be loaded. 

 NOTE: Although "Generic" in that it can load SPIN, LMM or XMM
       programs, this program is compiled to run on a specific
       platform - it will contain XMM routines specific to the
       platform for which it is compiled.

 NOTE: This loader can print debugging information on the HMI
       (on some platfoms) - but note that this slows down the
       rate at which data can be loaded, and also uses some of
       the Hub RAM that then cannot be loaded over. See the 
       lines with the comment 'UNCOMMENT FOR DIAGNOSTICS'

 Version 1.0 - initial version by Ross Higson
 Version 2.8 - Added Reserved cog support

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
RX        = Common#BLACKCAT_RXPIN
TX        = Common#BLACKCAT_TXPIN
MODE      = Common#BLACKCAT_MODE ' use same mode as BlackCat 
BAUD      = Common#BLACKCAT_BAUD 
'
' Set this to indicate the CPU we are:
'
THIS_CPU  = 1
'
' Set up Proxy, HMI and CACHE symbols and constants:
'
#include "Constants.inc"
'
'START_KBD    = TRUE
'START_MOUSE  = FALSE
'START_SCREEN = TRUE

OBJ
  Common : "Catalina_Common"                          ' Common Definitions
  Loader : "Catalina_XMM_SIO_Loader"                  ' Low Level Loader
  SIO    : "Catalina_SIO_Plugin"                      ' SIO Card Plugin

#ifdef CACHED
   Cache   : "Catalina_SPI_Cache.spin"
#endif

' Start a HMI Plugin (and screen driver)
' UNCOMMENT (ONE) FOR DIAGNOSTICS ONLY:
'  HMI    : "Catalina_HMI_Plugin_LoRes_Vga"
'  HMI    : "Catalina_HMI_Plugin_HiRes_Tv"
             
PUB Start : ok | PAGE, BLOCK, XFER                    

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

' UNCOMMENT FOR DIAGNOSTICS ONLY:
  long[Common#FREE_MEM] := long[Common#FREE_MEM] - Loader#SECTOR_SIZE
  PAGE  := long[Common#FREE_MEM]

  long[Common#FREE_MEM] := long[Common#FREE_MEM] - SIO#BLOCK_SIZE
  BLOCK := long[Common#FREE_MEM]

  long[Common#FREE_MEM] := long[Common#FREE_MEM] - 8
  XFER  := long[Common#FREE_MEM]
  
  '
  ' Start the SIO plugin
  '
  SIO.Start(BLOCK, RX, TX, MODE, BAUD, TRUE)

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

