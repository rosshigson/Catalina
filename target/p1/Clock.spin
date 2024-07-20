{{
'-------------------------------------------------------------------------------
'
' Clock - This object is loaded by all target files to include the Real-Time
'         Clock plugin, based on the following symbols: 
'              CLOCK
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
' Version 3.3 - do nothing if the SD plugin is loaded (it will be used instead).
'               Enabling the debug flag can no longer be done via Setup/Start -
'               define the DEBUG_LED_CLOCK symbol or use the rtc_debug service.
' Version 3.5 - Register Services.
' Version 3.11 - Do nothing ONLY if OLD_SD is specified and the SD plugin is
'                loaded - the new SD plugin does not support the clock function.
' Version 5.4  - Remove OLD_SD support. Do nothing if SD plugin is loaded
'                unless SEPARATE_CLOCK is defined.
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

#ifdef libthreads
#ifndef PROTECT_PLUGINS
#define PROTECT_PLUGINS
#endif
#endif

#ifdef CLOCK
#ifdef NEED_SD
#ifdef SEPARATE_CLOCK
#ifndef NEED_CLOCK_OTHER_THAN_SD
#define NEED_CLOCK_OTHER_THAN_SD
#endif
#else
#ifdef PROXY_SD
' the PROXY_SD does not implement clock functions
#ifndef NEED_CLOCK_OTHER_THAN_SD
#define NEED_CLOCK_OTHER_THAN_SD
#endif
#endif
#endif
#else
#ifndef NEED_CLOCK_OTHER_THAN_SD
#define NEED_CLOCK_OTHER_THAN_SD
#endif
#endif
#endif

#include "Constants.inc"

OBJ

#ifdef NEED_CLOCK_OTHER_THAN_SD
   Common : "Catalina_Common"

   ' currently, we always use software clock - this may change!
   RTC    : "Catalina_RTC_Plugin"
#endif
'
' This function is called by the target to allocate data blocks or set up 
' other details for the extra plugins. If it does not need to do anything
' it can simply be a null routine.
'   
PUB Setup
  ' nothing to do
'
' Called by the target to start the plugin
'
PUB Start | cog, lock

#ifdef NEED_CLOCK_OTHER_THAN_SD
   cog := RTC.Start
#ifdef PROTECT_PLUGINS
   lock := locknew
#else
   lock := -1
#endif
   if cog > 0
     cog-- ' Start returns cog + 1
     Common.RegisterServiceCog(Common#SVC_RTC_SETFREQ,  lock, cog, 6)
     Common.RegisterServiceCog(Common#SVC_RTC_GETCLOCK, lock, cog, 7)
     Common.RegisterServiceCog(Common#SVC_SETTIME,      lock, cog, 8)
     Common.RegisterServiceCog(Common#SVC_RTC_GETTIME,  lock, cog, 9)
     Common.RegisterServiceCog(Common#SVC_GETTICKS,     lock, cog, 11)
#endif
