{{
'-------------------------------------------------------------------------------
'
' XMM_default - XMM target for Catalina programs. 
'
' This target uses the XMM Kernel.
'
' This target can be used for programs to be loaded serially, from EEPROM, or 
' from SDCARD.
'
' Version 3.1 - Simplified version.
'
' Version 3.5 - simplified further.
'                 
' Version 3.14 - support XEPROM (execute XMM programs from EEPROM).
'                 
'------------------------------------------------------------------------------
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
'-------------------------------------------------------------------------------
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
' The following object MUST be loaded for Cache support ...
'
  Cache : "Cache"
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
' The following object MUST be loaded for CLOCK support ...
'
  CLK : "Clock"
'
' The following object MUST be loaded for HMI support ...
'
  HMI : "HMI"
'
' The following object MUST be loaded for GRAPHICS support ...
'
  CGI : "Graphics"
'
' The following object MUST be loaded for Proxy support ...
'
  PX : "Proxy_IO"
'
' The following object MUST be loaded for Extra Plugin support ...
'
  EX : "Extras"
'
' Include the appropriate XMM Kernel ...
'
#ifdef ALTERNATE
#error : ALTERNATE KERNEL NOT SUPPORTED IN XMM MODE
#elseifdef libthreads
#error : THREADED KERNEL NOT SUPPORTED IN XMM MODE
#else
  Kernel : "Catalina_XMM"
#endif  
'
' Include the appropriate XMM Program Loader ...
'
#ifdef XEPROM
  ' EEPROM two-phase loader for XMM programs executed from EEPROM
  Loader : "Catalina_XMM_XEPROM_Loader"
#elseifdef EEPROM
  ' EEPROM two-phase loader for XMM programs executed from XMM
  Loader : "Catalina_XMM_EEPROM_Loader"
#elseifdef FLASH
  ' FLASH Loader for XMM programs  
  Loader : "Catalina_HUB_FLASH_Loader"
#else
  ' Hub Loader is used for both SCARD and Serial Load for XMM programs  
  Loader : "Catalina_HUB_XMM_Loader"
#endif
'
PUB Start

  ' Set up the Registry - required to use plugins
  Common.InitializeRegistry

  ' Start the cache (if enabled)
  Cache.Start

  ' Set up the command line (if used)
  CL.Setup

  ' Now set up the plugins

  ' Set up the Floating Point plugins (if used)
  FP.Setup

  ' Set up the Proxy IO plugin (if used)
  PX.Setup

  ' Set up the HMI plugin (if used)
  HMI.Setup(PX.Get_IO_Block, PX.Get_Lock, PX.Get_Server)

  ' Set up the SD Card plugin (if used)
  SD.Setup(PX.Get_IO_Block, PX.Get_Lock, PX.Get_Server)

  ' Set up the Clock plugin (if used)
  CLK.Setup

  ' Set up the Graphics plugin (if used)
  CGI.Setup

  ' Set up the Extra plugins (if used)
  EX.Setup

  ' Now start the plugins

  ' Start the Floating Point plugins (if used)
  FP.Start

  ' Start the Proxy IO plugin (if used)  
  PX.Start

  ' Start the SD Card plugin (if used)
  SD.Start

  ' Start the Clock plugin (if used)
  CLK.Start

  ' Start the Graphics plugin (if used)
  CGI.Start

  ' Start the HMI plugin (if used)
  HMI.Start

  ' Start the Extra plugins (if used)
  EX.Start

  ' All plugins now loaded - note that for XMM programs we don't
  ' either load or start the Kernel directly, instead we load and
  ' start an XMM Loader, which will replace itself with the XMM
  ' Kernel code when it has finished loading the Catalina program.
  Loader.Run(Kernel.Entry_Addr)

