{{
'-------------------------------------------------------------------------------
'
' SMM_blackcat - SMM target for Catalina programs with BlackCat or BlackBox
'                debugging.
'
' This target uses the LMM Kernel.
'
' This target assumes the program is to be loaded from SDCARD. The program that
' loads this file must load the file sector list, geometry and file information.
' See the Catalyst loader foran example of how this can be done. Note that SMM
' programs always load an SD card plugin.
'
' Version 3.1 - Simplified version.
'                 
' Version 3.5 - simplified further.
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
' The following object MUST be loaded for BlackCat support...
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
' Include the SMM Program Loader ...
'
#ifdef XEPROM
#error : XEPROM IS ONLY SUPPORTED FOR XMM PROGRAMS
#else
  Loader : "Catalina_SMM_SDCARD_Loader"
#endif
'
PUB Start

  ' Set up the Registry - required to use plugins
  Common.InitializeRegistry

  ' re-initalize the free memory pointer (for loadtime memory allocation)
  long[Common#FREE_MEM] := Common#LOADTIME_ALLOC

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

  ' All plugins now loaded - note that for SMM programs we don't
  ' either load or start the Kernel directly, instead we load and
  ' start the SMM Loader, which will replace itself with the LMM
  ' Kernel code when it has finished loading the Catalina program.
  ' Note that the SMM Loader does not need to be passed the Kernel
  ' address (as other loaders do) since the SMM format always puts
  ' the kernel at a known offset in the SD Card file. 
  Loader.Run

