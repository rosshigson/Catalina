{{
 RAM_Test - An XMM RAM tester for Catalina.
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
' Set up Proxy, HMI and CACHE symbols and constants:
'
#include "Constants.inc"

OBJ
  Common : "Catalina_Common"
  Tester : "Catalina_XMM_RamTest"

#ifdef SDCARD
  SD     : "Catalina_SD2_Plugin"
#endif

#ifdef VGA
  HMI    : "Catalina_HMI_Plugin_Vga"                              
#elseifdef HIRES_VGA
  HMI    : "Catalina_HMI_Plugin_HiRes_Vga"                              
#elseifdef TV
  HMI    : "Catalina_HMI_Plugin_Tv"
#elseifdef HIRES_TV
  HMI    : "Catalina_HMI_Plugin_HiRes_Tv"
#elseifdef PC
  HMI    : "Catalina_HMI_Plugin_PC"
#elseifdef TTY
  HMI    : "Catalina_HMI_Plugin_TTY"
#else
  ERROR : MUST SPECIFY VGA, TV, HIRES_VGA, HIRES_TV OR PC
#endif

#ifdef CACHED
   Cache  : "Catalina_SPI_Cache.spin"
#endif

PUB Start : ok | DATA, XFER, PAGE                    

  '    
  ' Set up the Registry - required to use Catalina plugins
  '
  Common.InitializeRegistry

#ifdef CACHED

  '
  ' Start the cache (if not already started)
  '
  ok := Cache.Start

#endif

  DATA  := long[Common#FREE_MEM] - 4 * HMI#DATA_LONGS
  XFER  := DATA - 16 ' 4 longs
  PAGE  := XFER - Tester#PAGE_SIZE
  PAGE  := PAGE & !3 ' long align!
  long[Common#FREE_MEM] := PAGE

  '
  ' start the selected HMI Plugin
  '
  HMI.Start(DATA, -1, -1, -1)

#ifdef SDCARD

  '
  ' start the SD Plugin
  '
  SD.Start

#endif

  '
  ' Start the Tester
  '
  Tester.Run(XFER, PAGE)

  ' Note - Run never returns.  

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

