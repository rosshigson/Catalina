{{
'-------------------------------------------------------------------------------
'
' Floating_Point - This object is loaded by all target files to include 
'           the correct Floating Point plugins, based on the following 
'           symbols:
'
'           NO_FP      - do not include any floating point plugins
'           NO_FLOAT   - ditto 
'
'           ALTERNATE  - using the alternate kernel (load Float_A)
'           COMPACT    - using the compact (CMM) kernel (load Float_A)
'           libthreads - using the threaded kernal (load Float_A)
'
'           POD        - using POD Debugger (load Float_A)
'
'           SMALL      - (internal) XMM kernel (load Float_A)
'           LARGE      - (internal) XMM kernel (load Float_A)
'
'           libma      - load Float_A
'           libmb      - load Float_A and Float_B
'
'    Be sure to link with the appropriate floating point library
'    (i.e. libm, libma or libmb) - this is normally handled automatically
'         
' This object is included by the following target files:
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
' Version 3.7 - support COMPACT (CMM) mode.
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
'
' Set up the NEED_FLOAT_A and NEED_FLOAT_B symbols:
'
#ifdef NO_FP
' no floating point
#elseifdef NO_FLOAT
' no floating point
#else
' check if floating point plugin A is required (for ALTERNATE kernel)
#ifdef ALTERNATE
#ifndef NEED_FLOAT_A
#define NEED_FLOAT_A
#endif
#endif
' check if floating point plugin A is required (for COMPACT kernel)
#ifdef COMPACT
#ifndef NEED_FLOAT_A
#define NEED_FLOAT_A
#endif
#endif
'
#ifdef libthreads
#ifndef NEED_FLOAT_A
#define NEED_FLOAT_A
#endif
#ifndef PROTECT_PLUGINS
#define PROTECT_PLUGINS
#endif
#endif
'
#ifdef SMALL
#ifndef NEED_FLOAT_A
#define NEED_FLOAT_A
#endif
#endif
'
#ifdef LARGE
#ifndef NEED_FLOAT_A
#define NEED_FLOAT_A
#endif
#endif
'
#ifdef POD
#ifndef NEED_FLOAT_A
#define NEED_FLOAT_A
#endif
#endif
'
#ifdef libma
#ifndef NEED_FLOAT_A
#define NEED_FLOAT_A
#endif
#endif
#endif
'
#ifdef libmb
#ifndef NEED_FLOAT_A
#define NEED_FLOAT_A
#endif
#define NEED_FLOAT_B
#endif
'
' Select the appropriate plugin objects:
'
OBJ
  Common   : "Catalina_Common"
#ifdef NEED_FLOAT_A
  Float_A  : "Catalina_Float32_A_Plugin"                ' Float32 Library A
#endif
#ifdef NEED_FLOAT_B
  Float_B  : "Catalina_Float32_B_Plugin"                ' Float32 Library B
#endif
'
DAT
#ifdef NEED_FLOAT_A
Float_A_Service_Table
  byte Common#SVC_FLOAT_ADD,   1
  byte Common#SVC_FLOAT_SUB,   2
  byte Common#SVC_FLOAT_MUL,   3
  byte Common#SVC_FLOAT_DIV,   4
  byte Common#SVC_FLOAT_FLOAT, 5
  byte Common#SVC_FLOAT_TRUNC, 6
  byte Common#SVC_FLOAT_RND,   7
  byte Common#SVC_FLOAT_SQR,   8
  byte Common#SVC_FLOAT_CMP,   9
  byte Common#SVC_FLOAT_SIN,   10
  byte Common#SVC_FLOAT_COS,   11
  byte Common#SVC_FLOAT_TAN,   12
  byte Common#SVC_FLOAT_LOG,   13
  byte Common#SVC_FLOAT_LOG10, 14
  byte Common#SVC_FLOAT_EXP,   15
  byte Common#SVC_FLOAT_EXP10, 16
  byte Common#SVC_FLOAT_POW,   17
  byte Common#SVC_FLOAT_FRAC,  18
  byte 0,                      0
#endif
#ifdef NEED_FLOAT_B
Float_B_Service_Table
  byte Common#SVC_FLOAT_FMOD,  19
  byte Common#SVC_FLOAT_ASIN,  20
  byte Common#SVC_FLOAT_ACOS,  21
  byte Common#SVC_FLOAT_ATAN,  22
  byte Common#SVC_FLOAT_ATAN2, 23
  byte Common#SVC_FLOAT_FLOOR, 24
  byte Common#SVC_FLOAT_CEIL,  25
  byte 0,                      0
#endif

'
' This function is called by the target to allocate data blocks or set up 
' other details for the extra plugins. If it does not need to do anything
' it can simply be a null routine.
'   
PUB Setup
  ' nothing to do
'
' This method is called by the target to start the plugins:
'
PUB Start | cog, lock, i 
#ifdef NEED_FLOAT_A
   cog  := Float_A.Start
#ifdef PROTECT_PLUGINS
   lock := locknew
#else
   lock := -1
#endif
   if cog > 0
     cog-- ' Start returns cog + 1
     i := 0
     repeat
        Common.RegisterServiceCog(byte[@Float_A_Service_Table][i], lock, cog, byte[@Float_A_Service_Table][i+1])
        i += 2
     until byte[@Float_A_Service_Table][i] == 0 
{
     Common.RegisterServiceCog(Common#SVC_FLOAT_ADD,   lock, cog, 1)
     Common.RegisterServiceCog(Common#SVC_FLOAT_SUB,   lock, cog, 2)
     Common.RegisterServiceCog(Common#SVC_FLOAT_MUL,   lock, cog, 3)
     Common.RegisterServiceCog(Common#SVC_FLOAT_DIV,   lock, cog, 4)
     Common.RegisterServiceCog(Common#SVC_FLOAT_FLOAT, lock, cog, 5)
     Common.RegisterServiceCog(Common#SVC_FLOAT_TRUNC, lock, cog, 6)
     Common.RegisterServiceCog(Common#SVC_FLOAT_RND,   lock, cog, 7)
     Common.RegisterServiceCog(Common#SVC_FLOAT_SQR,   lock, cog, 8)
     Common.RegisterServiceCog(Common#SVC_FLOAT_CMP,   lock, cog, 9)
     Common.RegisterServiceCog(Common#SVC_FLOAT_SIN,   lock, cog, 10)
     Common.RegisterServiceCog(Common#SVC_FLOAT_COS,   lock, cog, 11)
     Common.RegisterServiceCog(Common#SVC_FLOAT_TAN,   lock, cog, 12)
     Common.RegisterServiceCog(Common#SVC_FLOAT_LOG,   lock, cog, 13)
     Common.RegisterServiceCog(Common#SVC_FLOAT_LOG10, lock, cog, 14)
     Common.RegisterServiceCog(Common#SVC_FLOAT_EXP,   lock, cog, 15)
     Common.RegisterServiceCog(Common#SVC_FLOAT_EXP10, lock, cog, 16)
     Common.RegisterServiceCog(Common#SVC_FLOAT_POW,   lock, cog, 17)
     Common.RegisterServiceCog(Common#SVC_FLOAT_FRAC,  lock, cog, 18)
}
#endif
#ifdef NEED_FLOAT_B
   cog  := Float_B.Start
#ifdef PROTECT_PLUGINS
   lock := locknew
#else
   lock := -1
#endif
   if cog > 0
     cog-- ' Start returns cog + 1
     i := 0
     repeat
        Common.RegisterServiceCog(byte[@Float_B_Service_Table][i], lock, cog, byte[@Float_B_Service_Table][i+1])
        i += 2
     until byte[@Float_B_Service_Table][i] == 0 
{
     Common.RegisterServiceCog(Common#SVC_FLOAT_FMOD,  lock, cog, 19)
     Common.RegisterServiceCog(Common#SVC_FLOAT_ASIN,  lock, cog, 20)
     Common.RegisterServiceCog(Common#SVC_FLOAT_ACOS,  lock, cog, 21)
     Common.RegisterServiceCog(Common#SVC_FLOAT_ATAN,  lock, cog, 22)
     Common.RegisterServiceCog(Common#SVC_FLOAT_ATAN2, lock, cog, 23)
     Common.RegisterServiceCog(Common#SVC_FLOAT_FLOOR, lock, cog, 24)
     Common.RegisterServiceCog(Common#SVC_FLOAT_CEIL,  lock, cog, 25)
}
#endif


