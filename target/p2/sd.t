{{
'-------------------------------------------------------------------------------
'
' SDCard  - This object is loaded by all target files to include 
'           a SD support. This plugin can also provide clock support. 
'           The plugin is loaded depending on the following symbols  
'           (the logic is in Catalina_Plugin.inc):
'
'           SD         - include SD support
'
'           libcx      - include SD support
'           libcix     - include SD support
'
'           CLOCK      - include clock support
'         
'           If you link with the appropriate floating point library
'           (i.e. -lcx or -lcix) then loading the SD Card plugin is 
'           handled automatically. The clock support must still be
'           included by specifying -C CLOCK in the Catalina command.
'
' This object is included by the following target files:
'
'   nmm_default.t
'   cmm_default.t
'   lmm_default.t
'
' Version 3.15 - Initial P2 version 
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

DAT

#if defined(SD)

#include "cogsd.t"

' setup function for SD Card

   orgh
   alignl

SD_Setup
 mov     r0, ##@SD_Service_Table
 call    #Register_Services      ' register SD services
#if defined(CLOCK) && !defined(SEPARATE_CLOCK) && !defined(RTC)
 mov     r0, r6                  ' point ...
 shl     r0, #2                  ' ... to ...
 add     r0, ##REGISTRY          ' RTC registry entry
.wait_for_sd
 rdlong  r1, r0                  ' wait ...
 mov     r2, r1                  ' ... till ...
 shr     r1, #24                 ' ... SD ...
 cmp     r1, #$FF wz             ' ... is ...
 if_z    jmp #.wait_for_SD       ' ... registered
 mov     r0, ##(SD_RTC_SetFreq<<24 + @CLKFREQ)
 wrlong  r0, r2                  ' set frequency
.wait_for_setfreq
 rdlong  r0, r2 wz               ' wait till ...
 if_nz   jmp #.wait_for_setfreq  ' ... frequency set
#endif
         ret

SD_Service_Table
  byte SVC_SD_INIT,       1    
  byte SVC_SD_READ,       2
  byte SVC_SD_WRITE,      3 
  byte SVC_SD_BYTEIO,     4 
  byte SVC_SD_STOPIO,     5 
#if defined(CLOCK) && !defined(SEPARATE_CLOCK) && !defined(RTC)
  byte SVC_SETTIME,       8 
#endif
  byte SVC_GETTICKS,     11 
  byte 0,                 0

  alignl

#endif
