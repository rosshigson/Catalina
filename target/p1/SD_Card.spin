{{
'-------------------------------------------------------------------------------
'
' SD_Card - This object is loaded by all target files to include the SD Card
'           plugin, based on the following symbols:
'
'             SDCARD      - Use the SDCARD Loader
'             SD          - use the SD Card plugin
'
'             PROXY_SD    - use the Proxy SD
'
'             libcx       - use the extended library
'             libcix      - use the extended integer library
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
'
' Version 3.1 - Initial Version by Ross Higson
' Version 3.5 - Register services.
' Version 3.11 - Added new SD card plugin, which is used by default. For 
'                the previous version, use -C OLD_SD. Note that the new 
'                version does not support the clock function.
' Version 5.4  - remove OLD_SD support, and CLOCK support. Instead of 
'                providing clock services, SD plugins now provide a new 
'                service called SVC_GETTICKS which can be used to provide 
'                clock services in software instead of requiring a separate
'                Real-Time Clock plugin. If a hardware real-time clock
'                is available, an RTC plugin can still be created to use it
'                to provide the RTC services.
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
'
' Set up the NEED_SD symbol if we need the SD plugin loaded:
'
CON
'
CLOCKS_PER_SEC = 1_000          ' resolution of clock - if this value
                                ' is changed, also change time.h
'
RTC_First      = 6              ' first valid command
RTC_SetFreq    = 6
RTC_GetClock   = 7
RTC_SetTime    = 8
RTC_GetTime    = 9
RTC_Debug      = 10
SD_GetTicks    = 11
RTC_Last       = 11             ' last valid command
'
#ifdef libthreads
#ifndef PROTECT_PLUGINS
#define PROTECT_PLUGINS
#endif
#endif
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
VAR
#ifdef NEED_SD
#ifdef PROXY_SD
   ' These variables are used only during initialization:
   long v_io_block
   long v_proxy_lock
   long v_server_cpu
#endif  
#endif
'
' Select the appropriate plugin objects:
'
OBJ
#ifdef NEED_SD
  Common   : "Catalina_Common"
#ifdef PROXY_SD
  SD       : "Catalina_Proxy_SD_Plugin"                 ' Proxy SD Card Support
#else
  SD       : "Catalina_SD2_Plugin"                      ' SD Card Support
#endif  
#endif
'
' This function is called by the target to set up details for the SD Card.
' If proxying is not in use, it does nothing.  This is done for consistency 
' with other plugin "Setup" methods.
'   
PUB Setup(proxy_io_block, proxy_lock, server_cpu)
#ifdef NEED_SD
#ifdef PROXY_SD
  v_io_block   := proxy_io_block
  v_proxy_lock := proxy_lock
  v_Server_cpu := server_cpu
#endif
#endif
'
' This method is called by the target to start the plugin:
'
PUB Start | cog, lock, request, parameter

#ifdef NEED_SD
#ifdef PROXY_SD
   cog  := SD.Start(v_io_block, v_proxy_lock, v_server_cpu)
#else 
   cog  := SD.Start
#endif

{
   if cog => 0
      ' clock won't start until we tell it the frequency
      ' but we can't do that till we know it has registered
    
      repeat until (long[Common#REGISTRY][cog] & $FF000000) <> $FF000000
         ' loop until SD plugin has registered
 
      request := long[Common#REGISTRY][cog] & $00FFFFFF

      parameter := CLKFREQ
      long[request][0] := RTC_SetFreq<<24 + @parameter
    
      repeat until long[request][0] == 0
         ' wait till frequency set
}

#ifdef PROTECT_PLUGINS
   lock := locknew
#else
   lock := -1
#endif
   if cog > 0
     cog-- ' Start returns cog + 1
     Common.RegisterServiceCog(Common#SVC_SD_INIT,    lock, cog, 1)
     Common.RegisterServiceCog(Common#SVC_SD_READ,    lock, cog, 2)
     Common.RegisterServiceCog(Common#SVC_SD_WRITE,   lock, cog, 3)
     Common.RegisterServiceCog(Common#SVC_SD_BYTEIO,  lock, cog, 4)
     Common.RegisterServiceCog(Common#SVC_SD_STOPIO,  lock, cog, 5)
#ifdef CLOCK
#ifndef SEPARATE_CLOCK
     Common.RegisterServiceCog(Common#SVC_SETTIME,    lock, cog, 8)
#endif
#endif
     Common.RegisterServiceCog(Common#SVC_GETTICKS,   lock, cog, 11)

#endif

