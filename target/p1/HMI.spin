{{
'-------------------------------------------------------------------------------
'
' HMI - This file is loaded by all target files to load the correct HMI driver.
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
'   Catalina_Proxy_Server.spin
'   Catalyst_HMI.spin
'
' Version 3.1 - Simplified version.
' Version 3.5 - Register services.
' Version 3.11 - fix error defining DATA_LONGS etc when NO_HMI is defined.
'               Allow this plugin to use the space prior to itself (up to
'               660 longs) as buffer space. This technique is currently only 
'               used by Catalyst, and requires some padding in the Extras.spin
'               file to ensure there is enough space for all HMI options 
'               except HiRes VGA. This should have no impact on other programs.
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

#ifdef libthreads
#ifndef PROTECT_PLUGINS
#define PROTECT_PLUGINS
#endif
#endif

DAT

#ifndef NO_HMI

HMI_Service_Table
  byte Common#SVC_K_PRESENT , 1
  byte Common#SVC_K_GET     , 2
  byte Common#SVC_K_WAIT    , 3
  byte Common#SVC_K_NEW     , 4
  byte Common#SVC_K_READY   , 5
  byte Common#SVC_K_CLEAR   , 6
  byte Common#SVC_K_STATE   , 7
  byte Common#SVC_M_PRESENT , 11
  byte Common#SVC_M_BUTTON  , 12
  byte Common#SVC_M_BUTTONS , 13
  byte Common#SVC_M_ABS_X   , 14
  byte Common#SVC_M_ABS_Y   , 15
  byte Common#SVC_M_ABS_Z   , 16
  byte Common#SVC_M_DELTA_X , 17
  byte Common#SVC_M_DELTA_Y , 18
  byte Common#SVC_M_DELTA_Z , 19
  byte Common#SVC_M_RESET   , 20
  byte Common#SVC_T_GEOMETRY, 21
  byte Common#SVC_T_CHAR    , 22
  byte Common#SVC_T_STRING  , 23
  byte Common#SVC_T_INT     , 24
  byte Common#SVC_T_UNSIGNED, 25
  byte Common#SVC_T_HEX     , 26
  byte Common#SVC_T_BIN     , 27
  byte Common#SVC_T_SETPOS  , 28
  byte Common#SVC_T_GETPOS  , 29
  byte Common#SVC_T_MODE    , 30
  byte Common#SVC_T_SCROLL  , 31
  byte Common#SVC_T_COLOR   , 32
  byte 0                    , 0

#endif

CON
'
' Include platform-specific HMI plugin selection logic:
'
#include "HMI.inc"
'
OBJ
  Common : "Catalina_Common"
'
CON
'
#ifndef NO_HMI
DATA_LONGS = HMI#DATA_LONGS
rows = HMI#rows
cols = HMI#cols
#else
DATA_LONGS = 0
rows = 0
cols = 0
#endif
'
VAR
#ifndef NO_HMI
  ' these variables used only during initialization
  long HMI_BLOCK
  long v_io_block              ' only used if proxying
  long v_proxy_lock            ' only used if proxying
  long v_server_cpu            ' only used if proxying
#endif
'
OBJ
#ifndef NO_HMI
'
' choose a HMI plugin based on the combined symbol:
'
#ifdef SUPPORT_HIRES_VGA
  HMI      : "Catalina_HMI_Plugin_HiRes_Vga"
#elseifdef SUPPORT_LORES_VGA
  HMI      : "Catalina_HMI_Plugin_LoRes_Vga"
#elseifdef SUPPORT_HIRES_TV
  HMI      : "Catalina_HMI_Plugin_HiRes_Tv"
#elseifdef SUPPORT_LORES_TV
  HMI      : "Catalina_HMI_Plugin_Tv"
#elseifdef SUPPORT_PROPTERMINAL
  HMI      : "Catalina_HMI_Plugin_PropTerminal"
#elseifdef SUPPORT_TTY
  HMI      : "Catalina_HMI_Plugin_TTY"
#elseifdef SUPPORT_TTY256
  HMI      : "Catalina_HMI_Plugin_TTY256"
#elseifdef SUPPORT_PC
  HMI      : "Catalina_HMI_Plugin_PC"
#else
#error : HMI OPTION NOT SUPPORTED ON THE SPECIFIED PLATFORM
#endif
'
#endif
'
' This function is called by the target to set up the HMI.
'   
PUB Setup(proxy_io_block, proxy_lock, server_cpu) | i

#ifndef NO_HMI

#ifdef CATALYST
'
' For Catalyst, if we are not using EEPROM mode, we use the 660 longs 
' prior to the service table as our HMI buffer (the extra 20 is for 
' the Spin object pointer table). It is the caller's responsibility 
' to ensure that this space is no longer being used before setting up 
' and starting this HMI plugin. 660 longs is sufficient for all HMI
' options except HIRES_VGA. If you need that HMI options, use EEPROM 
' mode.
'
#ifndef EEPROM
#define CATALYST_KLUDGE
#endif

#endif

#ifdef CATALYST_KLUDGE

  HMI_BLOCK      := @HMI_Service_Table - 20 - 660*4

#else

  HMI_BLOCK      := long[Common#FREE_MEM]  - 4 * HMI#DATA_LONGS
  long[Common#FREE_MEM] := HMI_BLOCK

#endif

  v_io_block     := proxy_io_block
  v_proxy_lock   := proxy_lock
  v_Server_cpu   := server_cpu

#endif

'
' This function is called by the target to start the plugin
'
PUB Start | cog, lock, i
#ifndef NO_HMI
   cog  := HMI.Start (HMI_BLOCK, v_io_block, v_proxy_lock, v_server_cpu)
#ifdef PROTECT_PLUGINS
   lock := locknew
#else
   lock := -1
#endif
   if cog > 0
     cog-- ' Start returns cog + 1
     i := 0
     repeat
        Common.RegisterServiceCog(byte[@HMI_Service_Table][i], lock, cog, byte[@HMI_Service_Table][i+1])
        i += 2
     until byte[@HMI_Service_Table][i] == 0 
{       
     Common.RegisterServiceCog(Common#SVC_K_PRESENT ,   lock, cog, 1)
     Common.RegisterServiceCog(Common#SVC_K_GET     ,   lock, cog, 2)
     Common.RegisterServiceCog(Common#SVC_K_WAIT    ,   lock, cog, 3)
     Common.RegisterServiceCog(Common#SVC_K_NEW     ,   lock, cog, 4)
     Common.RegisterServiceCog(Common#SVC_K_READY   ,   lock, cog, 5)
     Common.RegisterServiceCog(Common#SVC_K_CLEAR   ,   lock, cog, 6)
     Common.RegisterServiceCog(Common#SVC_K_STATE   ,   lock, cog, 7)
     Common.RegisterServiceCog(Common#SVC_M_PRESENT ,   lock, cog, 11)
     Common.RegisterServiceCog(Common#SVC_M_BUTTON  ,   lock, cog, 12)
     Common.RegisterServiceCog(Common#SVC_M_BUTTONS ,   lock, cog, 13)
     Common.RegisterServiceCog(Common#SVC_M_ABS_X   ,   lock, cog, 14)
     Common.RegisterServiceCog(Common#SVC_M_ABS_Y   ,   lock, cog, 15)
     Common.RegisterServiceCog(Common#SVC_M_ABS_Z   ,   lock, cog, 16)
     Common.RegisterServiceCog(Common#SVC_M_DELTA_X ,   lock, cog, 17)
     Common.RegisterServiceCog(Common#SVC_M_DELTA_Y ,   lock, cog, 18)
     Common.RegisterServiceCog(Common#SVC_M_DELTA_Z ,   lock, cog, 19)
     Common.RegisterServiceCog(Common#SVC_M_RESET   ,   lock, cog, 20)
     Common.RegisterServiceCog(Common#SVC_T_GEOMETRY,   lock, cog, 21)
     Common.RegisterServiceCog(Common#SVC_T_CHAR    ,   lock, cog, 22)
     Common.RegisterServiceCog(Common#SVC_T_STRING  ,   lock, cog, 23)
     Common.RegisterServiceCog(Common#SVC_T_INT     ,   lock, cog, 24)
     Common.RegisterServiceCog(Common#SVC_T_UNSIGNED,   lock, cog, 25)
     Common.RegisterServiceCog(Common#SVC_T_HEX     ,   lock, cog, 26)
     Common.RegisterServiceCog(Common#SVC_T_BIN     ,   lock, cog, 27)
     Common.RegisterServiceCog(Common#SVC_T_SETPOS  ,   lock, cog, 28)
     Common.RegisterServiceCog(Common#SVC_T_GETPOS  ,   lock, cog, 29)
     Common.RegisterServiceCog(Common#SVC_T_MODE    ,   lock, cog, 30)
     Common.RegisterServiceCog(Common#SVC_T_SCROLL  ,   lock, cog, 31)
     Common.RegisterServiceCog(Common#SVC_T_COLOR   ,   lock, cog, 32)
}
#endif
