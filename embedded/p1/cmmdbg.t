{{
'-------------------------------------------------------------------------------
'
' LMM_blackcat - LMM target for Catalina programs with BlackCat or BlackBox
'                debugging.
'
' This target uses the CMM Kernel.
'
' This target can be used for programs to be loaded serially, from EEPROM, or
' from SDCARD.
'
' Version 3.7 - Original version.
'                 
' Version 3.14 - check for inappropriate XEPROM usage.
'                 
'-------------------------------------------------------------------------------
'
'    Copyright 2011 Ross Higson
'
'    This file is part of the Catalina Target Package.
'
'    The Catalina Target Package is free software: you can redistribute 
'    it and/or modify it under the terms of the GNU Lesser General Public 
'    License as published by the Free Software Foundation, either version 
'    3 of the License, or (at your option) any later version.
'
'    The Catalina Target Package is distributed in the hope that it will
'    be useful, but WITHOUT ANY WARRANTY; without even the implied warranty
'    of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  
'    See the GNU Lesser General Public License for more details.
'
'    You should have received a copy of the GNU Lesser General Public 
'    License along with the Catalina Target Package.  If not, see 
'    <http://www.gnu.org/licenses/>.
'
'------------------------------------------------------------------------------
}}
CON
'
' Set these to suit the platform by modifying "Catalina_Common"
'
_clkmode  = Common#CLOCKMODE
_xinfreq  = Common#XTALFREQ
_stack    = Common#STACKSIZE
'
' Include platform constants:
'
#include "Constants.inc"
'
OBJ
'
' The following object MUST be loaded ...
'
  Common : "Catalina_Common"
'
' The following object MUST be loaded ...
'
  Catalina : "Catalina"
'
' The following object MUST be loaded for BlackCat/BlackBox support...
'
  BC : "BlackCat_DebugCog"
'
' The following object MUST be loaded for command line support ...
'
  CL : "Command_Line"
'
' The following object MUST be loaded for floating point support ...
'
  FP : "Floating_Point"
'
' The following object MUST be loaded for SD Card support ...
'
  SD : "SD_Card"
'
' The following object MUST be loaded for Extra Plugin support ...
'
  EX : "Extras"
'
#ifdef XEPROM
#error : XEPROM IS ONLY SUPPORTED FOR XMM PROGRAMS
#endif
'
' Include the appropriate CMM Kernel ...
'
#ifdef ALTERNATE
#error : Alternate Kernel not supported in COMPACT mode
#elseifdef libthreads
  Kernel   : "Catalina_CMM_threaded"
#else
  Kernel   : "Catalina_CMM"
#endif  
'
PUB Start

  ' Set up the Registry - required to use plugins
  Common.InitializeRegistry

  ' Set up the command line (if used)
  CL.Setup

  ' Now set up the plugins

  ' Set up the Floating Point plugins (if used)
  FP.Setup

  ' Set up the SD Card plugin (if used)
  SD.Setup

  ' Set up the Extra plugins (if used)
  EX.Setup

  ' Set up the BlackCat Debugger Cog
  BC.Setup

  ' Now start the plugins

  ' Start the Floating Point plugins (if used)
  FP.Start

  ' Start the SD Card plugin (if used)
  SD.Start

  ' Start the Extra plugins (if used)
  EX.Start

  ' Start the Black Cat Debugger Cog
  BC.Start  

  ' all plugins now loaded - start the CMM kernel by giving it 
  ' the base address of the program to be executed
  Kernel.Run (Catalina.Base)

