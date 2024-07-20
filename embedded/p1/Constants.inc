{{
'-------------------------------------------------------------------------------
'
' Constants.inc - This file is included by all target files to set various
'                 commonly used constant symbols.
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
'   Catalina_LMM_pod.spin
'
' It may also be imported by other files that need these constants set.
'
' Version 3.1 - simplified version
' Version 3.3 - add setting of NEED_SD
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
#ifndef alignl
#define alignl long
#endif
'
' Caching options - allow CACHED_1K, CACHED_2K, CACHED_4K, CACHED_8K 
'                   or just CACHED (equivalent to CACHED_8K)
' 
#ifdef CACHED_1K
#ifndef CACHED
#define CACHED
#endif

#elseifdef CACHED_2K
#ifndef CACHED
#define CACHED
#endif

#elseifdef CACHED_4K
#ifndef CACHED
#define CACHED
#endif

#elseifdef CACHED_8K
#ifndef CACHED
#define CACHED
#endif

#endif

'
' set up the NEED_SD if we need the SD card plugin loaded:
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
' Some generally useful constants:
' 
#ifdef NO_HMI
HMI_PC  = FALSE
HMI_VGA = FALSE
HMI_TV  = FALSE

#elseifdef PC
HMI_PC  = TRUE
HMI_VGA = FALSE
HMI_TV  = FALSE

#elseifdef TTY
HMI_PC  = TRUE
HMI_VGA = FALSE
HMI_TV  = FALSE

#elseifdef TTY256
HMI_PC  = TRUE
HMI_VGA = FALSE
HMI_TV  = FALSE

#elseifdef VGA
HMI_VGA = TRUE
HMI_PC  = FALSE
HMI_TV  = FALSE

#elseifdef LORES_VGA
HMI_VGA = TRUE
HMI_PC  = FALSE
HMI_TV  = FALSE

#elseifdef HIRES_VGA
HMI_VGA = TRUE
HMI_PC  = FALSE
HMI_TV  = FALSE

#elseifdef TV
HMI_TV  = TRUE
HMI_PC  = FALSE
HMI_VGA = FALSE

#elseifdef HIRES_TV
HMI_TV  = TRUE
HMI_PC  = FALSE
HMI_VGA = FALSE

#elseifdef LORES_TV
HMI_TV  = TRUE
HMI_PC  = FALSE
HMI_VGA = FALSE

#else
HMI_TV  = TRUE
HMI_PC  = FALSE
HMI_VGA = FALSE

#endif

#ifdef HIRES_VGA
HIRES = TRUE

#elseifdef HIRES_TV
HIRES = TRUE

#else
HIRES = FALSE

#endif
'
'------------------------------------------------------------------------------
'
' Include platform-specific #defines:
'
#include "Custom_CFG.inc"
'------------------------------------------------------------------------------
'
' Multithreading Constants
'
' Size of thread block and offsets (for multithreading):
'
THREAD_BLOCK_SIZE = 35         ' size (LONGs) of thread_block
THREAD_REG_OFF    = 1          ' offset (LONGs) of register save area
THREAD_AFF_OFF    = 33         ' offset (LONGs) of affinity and status data
THREAD_EXT_OFF    = 34         ' offset (LONGs) of extended information

