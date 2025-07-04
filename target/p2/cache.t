{{
'-------------------------------------------------------------------------------
'
' Cache  - This object is loaded by all target files to include 
'          Cache support.
'          The plugin is loaded depending on the following symbols  
'          (the logic is in Catalina_Plugin.inc):
'
'            CACHED - include Cache support
'
' This object is included by the following target files:
'
'   xmm_default.t
'   xmm_blackcat.t
'
' Version 5.4 - Initial P2 version 
'
' Version 8.7 - Support read-only LUT (LARGE mode only)
'
'-------------------------------------------------------------------------------
'
'    Copyright 2022 Ross Higson
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

{
PUB Start : okay | init_mbox, init_cache, init_iwidth, init_owidth

    if CACHE_COG > 0 

      if not Running
        init_mbox := XMM_CACHE_CMD
        init_cache := XMM_CACHE
        init_iwidth := DEFAULT_INDEX_WIDTH
        init_owidth := DEFAULT_OFFSET_WIDTH
        long[XMM_CACHE_CMD] := $ffffffff
        coginit(CACHE_COG, @init_vm, @init_mbox)
        repeat while long[XMM_CACHE_CMD]

      okay := TRUE

    else

      okay := FALSE


PUB Running : okay

    long[XMM_CACHE_CMD] := $fffffffe
    repeat 1000
       if long[XMM_CACHE_CMD] == 0
          quit
    okay := (long[XMM_CACHE_RSP] == UNIQUE_RESPONSE)
   

}

CON

CACHE_BLOCK_SIZE = 4*4 ' Size in bytes to allocate for cache initialization.

DAT

#ifdef CACHED

#if !defined(NO_LUT) || defined(LUT_CACHE)
#include "lutcache.t"
#else
#include "cogcache.t"
#endif

DAT

  orgh

' CACHE_Setup - set up Cache initialization data
' On entry - r0 points to memory allocated for initialization data
'            (must be preserved)

CACHE_Setup
    mov     r2,##XMM_CACHE_CMD       ' set 
    mov     r1,r0                    ' ... cache command address ...
    wrlong  r2,r1                    ' ... in initialization data
    add     r1,#4                    ' point to next initialization long
    mov     r2,##XMM_CACHE           ' set cache address ...
    wrlong  r2,r1                    ' ... in initialization data
    add     r1,#4                    ' point to next initialization long
    mov     r2,#DEFAULT_INDEX_WIDTH  ' set index width  ...
    wrlong  r2,r1                    ' ... in initialization data
    add     r1,#4                    ' point to next initialization long
    mov     r2,#DEFAULT_OFFSET_WIDTH ' set offset width ...
    wrlong  r2,r1                    ' ... in initialization data
    neg     r1,#1                    ' write 0xFFFFFFFF ...
    wrlong  r1,##XMM_CACHE_CMD       ' ... to cache command address
    ret

#endif
