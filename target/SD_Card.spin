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
'            Also, if the CLOCK symbol is defined as well as the SDCARD, this
'            plugin also provides Real-Time Clock services.
'
' This file is included by the following target files:
'
'   lmm_default.spin
'   emm_default.spin
'   smm_default.spin
'   xmm_default.spin
'   lmm_blackcat.spin
'   emm_blackcat.spin
'   smm_blackcat.spin
'   xmm_blackcat.spin
'
' Version 3.1 - Initial Version by Ross Higson
' Version 3.5 - Register services.
' Version 3.11 - Added new SD card plugin, which is used by default. For 
'                the previous version, use -C OLD_SD. Note that the new 
'                version does not support the clock function.
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
#ifdef OLD_SD
  SD       : "Catalina_SD_Plugin"                       ' old SD Card Support
#else
  SD       : "Catalina_SD2_Plugin"                      ' new SD Card Support
#endif
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
PUB Start | cog, lock

#ifdef NEED_SD
#ifdef PROXY_SD
   cog  := SD.Start(v_io_block, v_proxy_lock, v_server_cpu)
#else 
   cog  := SD.Start
#endif
#ifdef PROTECT_PLUGINS
   lock := locknew
#else
   lock := -1
#endif
   if cog > 0
     cog-- ' Start returns cog + 1
     Common.RegisterServiceCog(Common#SVC_SD_INIT  , lock, cog, 1)
     Common.RegisterServiceCog(Common#SVC_SD_READ  , lock, cog, 2)
     Common.RegisterServiceCog(Common#SVC_SD_WRITE , lock, cog, 3)
     Common.RegisterServiceCog(Common#SVC_SD_BYTEIO, lock, cog, 4)
     Common.RegisterServiceCog(Common#SVC_SD_STOPIO, lock, cog, 5)
#ifdef CLOCK
#ifdef OLD_SD
     Common.RegisterServiceCog(Common#SVC_RTC_SETFREQ , lock, cog, 6)
     Common.RegisterServiceCog(Common#SVC_RTC_GETCLOCK, lock, cog, 7)
     Common.RegisterServiceCog(Common#SVC_RTC_SETTIME , lock, cog, 8)
     Common.RegisterServiceCog(Common#SVC_RTC_GETTIME , lock, cog, 9)
#endif
#endif

#endif

