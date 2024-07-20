{{
'-------------------------------------------------------------------------------
'
' EMM_default - EMM target for Catalina Programs. 
'               Supports both LMM and CMM programs. 
'
' This target uses the LMM Kernel.
'
' This target assumes the program is to be loaded from EEPROM.
'
' Version 3.1 - Simplified version.
'                 
' Version 3.5 - simplified further.
'
' Version 3.8 - Added CMM support.
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
' Include the EMM Program Loader ...
'
#ifdef XEPROM
#error : XEPROM IS ONLY SUPPORTED FOR XMM PROGRAMS
#else
  Loader : "Catalina_EMM_EEPROM_Loader"
#endif
'
' Include the appropriate LMM or CMM Kernel ...
'
#ifdef COMPACT

#ifdef ALTERNATE
#error : Alternate Kernel not supported in COMPACT mode
#elseifdef libthreads
  Kernel   : "Catalina_CMM_threaded"
#else
  Kernel   : "Catalina_CMM"
#endif  

#else

#ifdef ALTERNATE
  Kernel : "Catalina_LMM_alternate"
#elseifdef libthreads
  Kernel : "Catalina_LMM_threaded"
#else
  Kernel : "Catalina_LMM"
#endif
  
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

  ' Now start the plugins

  ' Start the Floating Point plugins (if used)
  FP.Start

  ' Start the SD Card plugin (if used)
  SD.Start

  ' Start the Extra plugins (if used)
  EX.Start

  ' All plugins now loaded - note that for EMM programs we don't
  ' either load or start the Kernel directly, instead we load and
  ' start the EMM Loader, which will replace itself with the LMM
  ' Kernel code when it has finished loading the Catalina program.
  Loader.Run(Kernel.Entry_Addr)

