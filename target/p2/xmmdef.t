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
' Version 5.6 - Initial P2 version.
'
' Version 7.1 - Added Quick Build support.
'             - Common code moved to include files.
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

' this symbol tells the optimizer we are compiling the top level target

#define CATALINA_TOPLEVEL

' the following file contains common #defines:

#include "define.inc"

'------------------------------------------------------------------------------

DAT 

 orgh

 alignl ' align long

' Hub Loader is used for both SCARD and Serial Load for XMM programs 
 
#include "hubload.t"

' Include the appropriate XMM Kernel ...

#include "xmm.t"

#ifdef BLACKBOX
#include "blackcat.inc"
#endif

' some of the values in the reserved locations are not available when 
' compiling this file, but the locations still need to be reserved as
' suitable values may be calculated and stored here during the load process

#include "reserven.inc"

' This is tricky - the contents of "presbrk.inc" are things that are
' required at run time by some plugns - but we don't know what plugins will be
' loaded, so we have to include them all - and for XMM SMALL programs we have 
' to also include them in XMM RAM in a place that will end up in the same 
' location in Hub RAM. 

' we pad things to start after the prologue ...
Catalina_Prologue_Pad
        byte $00[@RESERVED + $200 + $10 - @Catalina_Prologue_Pad]

#include <presbrk.inc>

#ifndef SBRK_AFTER_PLUGINS

' sbrkinit is used by sbrk - it must be after all variables and data

' !!!  THIS IS WHERE sbrkinit SHOULD be, but if some plugins need access to
' !!!  their hub images after being loaded it can be moved to the end of 
' !!!  xmm_default.spin2 by defining SBRK_AFTER_PLUGINS
'
 alignl ' align long
sbrkinit  ' heap starts here

#endif

'------------------------------------------------------------------------------

DAT

 orgh

 alignl ' align long

 org $200

' Pre-C initialization. This code is loaded and executed from the LUT RAM by
' all static kernels, and must fit in the area $200 - $2FF.
'
' After initialization, this space is available as general LUT RAM ...

LUT_STARTUP

#include "c_init.inc"

#if !defined(NO_ARGS) || !defined(NO_ENV)
#include "argument.inc"
#endif

LUT_STARTUP_END

 fit $300

' Common Kernel library functions. This code is loaded and started by all
' kernels (static and dynamic) and must fit in the area $300 - $3FF ...

 orgf $300

LUT_LIBRARY

' include any necessary kernel library functions. This code is loaded and
' executed from the LUT RAM ...

#include "klib.inc"

#include "xmmklib.inc"

LUT_LIBRARY_END

 fit $400

'------------------------------------------------------------------------------

DAT 

 orgh

 alignl ' align long

#if !defined(NO_PLUGINS)

#include "plugsup.inc"

#include "plugins.inc"

#endif

DAT

' the purpose of the following 'orgh' is twofold:
' (1) to pad the binary out to exactly P2_LOAD_SIZE bytes
' (2) to warn if this file exceeds P2_LOAD_SIZE bytes

 orgh P2_LOAD_SIZE
