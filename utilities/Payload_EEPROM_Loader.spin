{{
---------------------------------------------------------------
 Payload_EEPROM_Loader - An SIO Loader program for use with the
                         Catalina Payload program to load Spin,
                         LMM, CMM or XMM programs into EEPROM.

 Although it is neither a Catalina C program nor a Catalina
 target, and it does not load a kernel, this program loads
 and uses a Catalina plugin to read data from serial IO. The 
 data loaded may be a normal SPIN program or an LMM program
 that is 32Kb or less, an LMM or CMM program that is 64Kb or
 less, or an XMM program that is 128Kb or less. Programs
 larger than 32Kb must be compiled with -C EEPROM.
 
 In all cases, the program is programmed into EEPROM. The
 Propeller is then rebooted, so the program will be executed
 if it is a valid SPIN, LMM, CMM program, or an LMM, CMM or
 XMM program compiled with -C EEPROM.
 
 On multi-CPU systems, this program can be loaded on any CPU.
 It is normally specified as the first program to be loaded
 by the Catalina Payload loader - by doing this, the second
 program specified can be any SPIN LMM, EMM or XMM program.
 For example, assuming this program is compiled into a file
 called EEPROM.binary, the following commands could be used
 to compile and load an EMM program:
 
    catalina My_Program.c -C EEPROM
    payload EEPROM My_Program  
 
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

 NOTE: Although "Generic" in that it can load SPIN, LMM or EMM
       programs, this program is compiled to run on a specific
       platform - and it will contain EEPROM routines specific
       to the platform for which it is compiled. The EEPROM page
       size is the most critical parameter. It must be specified
       in the low level loader. The SPI bus speed is also 
       important, but is set to default to 100Mhz, which should
       work on most platforms. It can be  upped to 400Mhz if the
       EEPROM used supports it. This is also set in the low level
       loader.         

 NOTE: This loader can print debugging information on the HMI
       (on some platfoms) - but note that this slows down the
       rate at which data can be loaded, and also uses some of
       the Hub RAM that then cannot be loaded over. See the 
       lines with the comment 'UNCOMMENT FOR DIAGNOSTICS'

 Version 1.0 - initial version by Ross Higson


---------------------------------------------------------------
}}
CON
' The following symbols should not be set here - they should instead be defined on
' the command line, so that they apply to all files included in the compilation:

'#define HI_SPEED_SPI  ' define for 400Khz SPI bus, otherwise 100Khz 
'#define DISPLAY_LOAD  ' display packet Begin/End and CRCs during load
'#define DISPLAY_DATA  ' display packet bytes during load

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
MODE      = Common#SIO_COMM_MODE ' NOTE SIO_COMM_MODE, not SIO_LOAD_MODE
BAUD      = Common#SIO_BAUD
'
' Set this to indicate the CPU we are:
'
THIS_CPU  = 1
'
' Inlcude the Layer 2 registry functions:
'
#define FULL_LAYER_2
'
' Include a display plugin if we are displaying load packets or data
'
#ifdef DISPLAY_DATA
#ifndef DISPLAY
#define DISPLAY
#endif
#elseifdef DISPLAY_LOAD
#ifndef DISPLAY
#define DISPLAY
#endif
#endif

OBJ
  Common : "Catalina_Common"                          ' Common Definitions
  Loader : "Catalina_EEPROM_SIO_Loader"               ' Low Level Loader
  SIO    : "Catalina_SIO_Plugin"                      ' SIO Card Plugin

#ifdef DISPLAY                                        ' Display Plugin
  HMI    : "HMI"
#endif  

PUB Start : ok | PAGE, BLOCK, XFER 
  '    
  ' Set up the Registry - required to use Catalina plugins
  '
  Common.InitializeRegistry

  ' re-initalize the free memory pointer (for loadtime memory allocation)
  long[Common#FREE_MEM] := Common#LOADTIME_ALLOC

  long[Common#FREE_MEM] := long[Common#FREE_MEM] - Loader#SECTOR_SIZE
  PAGE  := long[Common#FREE_MEM]

  long[Common#FREE_MEM] := long[Common#FREE_MEM] - SIO#BLOCK_SIZE
  BLOCK := long[Common#FREE_MEM]

  long[Common#FREE_MEM] := long[Common#FREE_MEM] - 3*4 ' Xfer block is 3 longs
  XFER  := long[Common#FREE_MEM]
  
#ifdef DISPLAY
  '
  ' Start the HMI plugin
  '
  HMI.Setup (0, 0, 0)
  HMI.Start
#endif

  '
  ' Start the SIO plugin
  '
  SIO.Start(BLOCK, Common#PAYLOAD_RXPIN, Common#PAYLOAD_TXPIN, MODE, BAUD, TRUE)
  
  ' Load a program from serial I/O to EEPROM. Then the Propeller is restarted.
  '
  Loader.Start(BLOCK, PAGE, XFER, THIS_CPU)

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