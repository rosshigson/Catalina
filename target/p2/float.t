{{
'-------------------------------------------------------------------------------
'
' Floating_Point - This object is loaded by all target files to include 
'           the correct Floating Point plugins, based on the following 
'           symbols (the logic is in plugsup.inc):
'
'           NEED_FLOAT_A    include Float A plugin
'           NEED_FLOAT_B    include Float B plugin
'           NEED_FLOAT_C    include Float C plugin
'
' This object is included by the following target files:
'
'   nmm_default.t
'   cmm_default.t
'   lmm_default.t
'
' Version 3.15 - Initial P2 version 
' Version 3.16 - The P8X32A_ROM_TABLES are now included by the lmm_progend.t,
'                cmm_progend.t and nmm_progend.t files, to ensure they are 
'                before sbrkinit (i.e. not overwritten by memory allocation)
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

DAT

#if defined (NEED_FLOAT_A) || defined (NEED_FLOAT_B)

#include "floata.t"

Float_A_Service_Table
  byte SVC_FLOAT_ADD,   1
  byte SVC_FLOAT_SUB,   2
  byte SVC_FLOAT_MUL,   3
  byte SVC_FLOAT_DIV,   4
  byte SVC_FLOAT_FLOAT, 5
  byte SVC_FLOAT_TRUNC, 6
  byte SVC_FLOAT_RND,   7
  byte SVC_FLOAT_SQR,   8
  byte SVC_FLOAT_CMP,   9
  byte SVC_FLOAT_SIN,   10
  byte SVC_FLOAT_COS,   11
  byte SVC_FLOAT_TAN,   12
  byte SVC_FLOAT_LOG,   13
  byte SVC_FLOAT_LOG10, 14
  byte SVC_FLOAT_EXP,   15
  byte SVC_FLOAT_EXP10, 16
  byte SVC_FLOAT_POW,   17
  byte SVC_FLOAT_FRAC,  18
  byte 0,                0

  alignl

#endif

#if defined (NEED_FLOAT_B)

#include "floatb.t"

Float_B_Service_Table
  byte SVC_FLOAT_FMOD,  19
  byte SVC_FLOAT_ASIN,  20
  byte SVC_FLOAT_ACOS,  21
  byte SVC_FLOAT_ATAN,  22
  byte SVC_FLOAT_ATAN2, 23
  byte SVC_FLOAT_FLOOR, 24
  byte SVC_FLOAT_CEIL,  25
  byte 0,                0

  alignl

#endif

#if defined (NEED_FLOAT_C)

#include "floatc.t"

Float_C_Service_Table
  byte SVC_FLOAT_ADD,   1
  byte SVC_FLOAT_SUB,   2
  byte SVC_FLOAT_MUL,   3
  byte SVC_FLOAT_DIV,   4
  byte SVC_FLOAT_FLOAT, 5
  byte SVC_FLOAT_TRUNC, 6
  byte SVC_FLOAT_RND,   7
  byte SVC_FLOAT_SQR,   8
  byte SVC_FLOAT_CMP,   9
  byte SVC_FLOAT_SIN,   10
  byte SVC_FLOAT_COS,   11
  byte SVC_FLOAT_TAN,   12
  byte SVC_FLOAT_LOG,   13
  byte SVC_FLOAT_LOG10, 14
  byte SVC_FLOAT_EXP,   15
  byte SVC_FLOAT_EXP10, 16
  byte SVC_FLOAT_POW,   17
  byte SVC_FLOAT_FRAC,  18
  byte SVC_FLOAT_FMOD,  19
  byte SVC_FLOAT_ASIN,  20
  byte SVC_FLOAT_ACOS,  21
  byte SVC_FLOAT_ATAN,  22
  byte SVC_FLOAT_ATAN2, 23
  byte SVC_FLOAT_FLOOR, 24
  byte SVC_FLOAT_CEIL,  25
  byte 0,                0

  alignl

#endif
