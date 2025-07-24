{{
'-------------------------------------------------------------------------------
'
' NMM_blackcat - NMM target for Catalina programs with BlackCat or BlackBox
'                debugging. 
'
' This target uses the NMM Kernel.
'
' This target can be used for programs to be loaded serially, from EEPROM, or
' from SDCARD.
'
' Version 3.15 - Initial version.
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

#if defined(QUICKBUILD) || defined(QUICKFORCE)

DAT

 orgh

 alignl ' align long

' Include the Quick Loader ...

' Quick Hub Loader is used for both SCARD and Serial Load for NMM programs 
 
#include "hubqload.t"

' Include the appropriate NMM Kernel ...

#if defined(ALTERNATE)
#error : ALTERNATE KERNEL NOT YET SUPPORTED ON THE PROPELLER 2 
#elif defined(libthreads)
#include "nmmt.t"
#else
#include "nmm.t"
#endif  

#ifdef BLACKBOX
#include "blackcat.inc"
#endif

' some of the values in the reserved locations are not available when 
' compiling this file, but the build program will fill them in later

#include "reserven.inc"

' This is tricky - the contents of "presbrk.inc" are things that are required 
' at run time by some plugns - but when we compile this file we don't know 
' what plugins will be loaded, so we have to include them all - and for 
' Quick Build programs we have to also include them in the same location 
' in Hub RAM. 

' we pad things to start after the prologue ...
Catalina_Prologue_Pad
        byte $00[@RESERVED + $200 + $10 - @Catalina_Prologue_Pad]

#include <presbrk.inc>

#ifdef SBRK_AFTER_PLUGINS
#error SBRK_AFTER PLUGINS IS INCOMPATIBLE WITH QUICKBUILD
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

#ifdef libthreads
#include "thread.inc"
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

#include "nmmklib.inc"

#ifdef libthreads
#include "thlib.inc"
#endif

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

' The following file must be included for BlackCat debugger support

#include "debugcog.t"

DAT

' the purpose of the following 'orgh' is twofold:
' (1) to pad the binary out to exactly P2_LOAD_SIZE bytes
' (2) to warn if this file exceeds P2_LOAD_SIZE bytes

 orgh P2_LOAD_SIZE

#else

'------------------------------------------------------------------------------

' NOT a Quick Build - plugins go AFTER program code

' The following file is generated during the compilation process

#include "catalina.s"

' The following file must be included for BlackCat debugger support

#include "debugcog.t"

#if !defined(NO_PLUGINS)

#include "plugins.inc"

#endif


' Catalina Data

DAT ' unitialized data segment

#ifdef SBRK_AFTER_PLUGINS

' sbrkinit is used by sbrk - it must be after all variables and data

' !!! sbrkinit should not be here, it should be in nmm_progend.t, but it 
' !!! can be moved here by defining SBRK_AFTER_PLUGINS if having it in the
' !!! correct place causes problems with plugins that need access to their
' !!! hub image after being loaded.

 orgh
 alignl ' align long
sbrkinit  ' heap starts here

#endif

#endif

