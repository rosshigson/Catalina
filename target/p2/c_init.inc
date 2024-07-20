{{
'-------------------------------------------------------------------------------
'
' c_init.inc - Common C initialization code. This code is normally loaded
'              and executed from the LUT.
'
' Version 7.1  - Now common across all kernels and memory models
'                 
'-------------------------------------------------------------------------------
'
'    Copyright 2024 Ross Higson
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

DAT

_C_init
 hubset  #$F0          
 hubset  ##_CLOCKINIT 
 waitx   ##_CLOCKWAIT
 mov     r0,##_CLOCKFREQ
 wrlong  r0,#$14
 mov     r0,##_CLOCKMODE
 wrlong  r0,#$18
 hubset  r0
 wrlong  #0,##ENVIRON
#ifndef NO_PLUGINS
 call    #INITIALIZE_REGISTRY
#ifndef NO_ARGS
 call    #INITIALIZE_ARGUMENTS
#endif
#ifndef NO_ENV
 call    #INITIALIZE_ENVIRON
#endif
 call    #TERMINATE_PLUGINS
 call    #INITIALIZE_PLUGINS
#endif
#ifdef BLACKBOX
 call    #INITIALIZE_BLACKCAT
#endif

' <<< INSERT COMMON INITIAL PASM HERE (if any - must fit in LUT RAM) >>>

' Note that the following code works only for static kernels that are not
' loaded by a separate loader. For XMM, EMM, SMM, Quick Build or dynamically 
' loaded kernels, code to set up these registers must be executed by the 
' kernel AFTER it is loaded ...

 rdlong  SP,##FREE_MEM      ' set up default SP (may be overridden later)
 rdlong  r3,##ARGC_ADDR     ' load argc
 rdlong  r2,##ARGV_ADDR     ' load argv

 ret

