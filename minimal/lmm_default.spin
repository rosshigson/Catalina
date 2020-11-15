{{
'-------------------------------------------------------------------------------
'
' LMM_default - LMM target for Catalina programs. 
'
' This target uses the LMM Kernel.
'
' Version 2.8 - initial version
' Version 3.5 - simplified version.
' Version 3.11 - include Extras.spin to make this target compatible with others.
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
'
' Set these to suit the platform by modifying "Catalina_Common"
'
_clkmode  = Common#CLOCKMODE
_xinfreq  = Common#XTALFREQ
_stack    = Common#STACKSIZE
'
' Include platform constants:
'
#include "Constants.inc"
'
OBJ
'
' The following object MUST be loaded ...
'
  Common : "Catalina_Common"
'
' The following object MUST be loaded ...
'
  Catalina : "Catalina"
'
' The following object MUST be loaded ...
'
  Kernel   : "Catalina_LMM"
'
' The following object MUST be loaded for Extra Plugin support ...
'
  Extras   : "Extras"

'
' Start - This is the main initialization routine - it 
' initializes all plugins and then start the Kernel.
'
PUB Start

  ' Set up the Registry
  Common.InitializeRegistry

  ' Setup and start any extra plugins
  Extras.Setup
  Extras.Start

  ' Plugins now loaded - start the LMM by giving it the base 
  ' address of the Catalina program to execute. 
  Kernel.Run (Catalina.Base)


