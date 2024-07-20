{{
'-------------------------------------------------------------------------------
'
' Proxy_IO - This object is loaded by all target files to include the SIO
'            plugin, based on the following symbols:
'
'             PROXY_SD       - use the Proxy SD
'             PROXY_SCREEN   - use the Proxy Screen
'             PROXY_MOUSE    - use the Proxy Mouse
'             PROXY_KEYBOARD - use the Proxy Keyboard
'
'
' This file is included by the following target files:
'
'   lmm_default.spin
'   cmm_default.spin
'   emm_default.spin
'   smm_default.spin
'   xmm_default.spin
'   lmm_blackcat.spin
'   cmm_blackcat.spin
'   emm_blackcat.spin
'   smm_blackcat.spin
'   xmm_blackcat.spin
'   Catalina_LMM_pod.spin
'
' Version 3.1 - Initial Version by Ross Higson
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
'
CON
'
' define PROXY_SIO if PROXY_SCREEN, PROXY_MOUSE, PROXY_KEYBOARD or PROXY_SD 
' are defined:                 
'
#ifdef PROXY_SCREEN
'
#ifndef PROXY_SIO
#define PROXY_SIO
#endif
'
#elseifdef PROXY_MOUSE
'
#ifndef PROXY_SIO
#define PROXY_SIO
#endif
'
#elseifdef PROXY_KEYBOARD
'
#ifndef PROXY_SIO
#define PROXY_SIO
#endif
'
#elseifdef PROXY_SD
'
#ifndef PROXY_SIO
#define PROXY_SIO
#endif
'
#endif
'
' Define NEED_SD if we need the SD plugin loaded:
'
#ifdef libcx
#ifndef NEED_SD
#define NEED_SD
#endif
#endif
'
#ifdef libcix
#ifndef NEED_SD
#define NEED_SD
#endif
#endif
'
#ifdef SD
#ifndef NEED_SD
#define NEED_SD
#endif
#endif
'
#ifdef SDCARD
#ifndef NEED_SD
#define NEED_SD
#endif
#endif
'
' Define NEED_SIO if PROXY_SD and NEED_SD are defined:
'
#ifdef NEED_SD
#ifdef PROXY_SD
#ifndef NEED_SIO
#define NEED_SIO
#endif
#endif
#endif
'
' Define PROXY_SIO is NEED_SIO is defined:
'
#ifdef PROXY_SIO
#ifndef NEED_SIO
#define NEED_SIO
#endif
#endif
'
#ifdef PROXY_SIO
'
MODE   = Common#SIO_COMM_MODE
BAUD   = Common#SIO_BAUD
TX_PIN = Common#TX_PIN
RX_PIN = Common#RX_PIN
'
#endif
'
' Select the appropriate plugin objects:
'
OBJ
#ifdef NEED_SIO
  Common   : "Catalina_Common"                          ' Common definitions

  SIO      : "Catalina_SIO_Plugin"                      ' SIO Support
#endif
'
VAR
#ifdef NEED_SIO
  ' These variables are used only during initialization:
  long IO_BLOCK
  long Proxy_Lock
  long Server_CPU
#endif
'
' This method is called by the targets to set up the 
' Proxy IO Block, the Proxy Lock, and the Server CPU:
'
PUB Setup
#ifdef NEED_SIO
  ' set up the Server_CPU
  ' (works on TriBladeProp, may not work on others):
#ifdef CPU_1
  Server_CPU := 2
#elseifdef CPU_2
  Server_CPU := 1
#elseifdef CPU_3
  Server_CPU := 2
#else
  Server_CPU := -1
#endif
  ' allocate a lock to serialize proxy access
  Proxy_Lock := locknew
  ' allocate an IO block to use
  IO_BLOCK              := long[Common#FREE_MEM] - SIO#BLOCK_SIZE
  long[Common#FREE_MEM] := IO_BLOCK
#endif
'
' This method is called by the target to retrieve the Proxy Server CPU:
'
PUB Get_Server : Server
  ' Return the server CPU we should use as proxy
#ifdef NEED_SIO
  Server := Server_CPU
#else
  Server := -1
#endif
'
' This method is called by the target to retrieve the Proxy Lock:
' (note that Setup must have been called!):
'
PUB Get_Lock : Lock
#ifdef NEED_SIO
  Lock := Proxy_Lock
#else
  Lock := -1
#endif
'
' This method is called by the target to retrieve the Proxy IO BLock:
' (note that Setup must have been called!):
'
PUB Get_IO_BLock : Block
#ifdef NEED_SIO
  BLock := IO_BLOCK
#else
  BLock := -1
#endif
'
' This method is called by the targets to start the plugin:
'
PUB Start
#ifdef NEED_SIO
  SIO.Start(IO_BLOCK, RX_PIN, TX_PIN, MODE, BAUD, TRUE)
#endif

