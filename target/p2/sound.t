{{
'-------------------------------------------------------------------------------
'
' Sound  - This object is loaded by all target files to include 
'          sound suport.  
'          The plugin is loaded depending on the following symbols  
'          (the logic is in Catalina_Plugin.inc):
'
'          libsoundse - include SN76489 Emulator
'
' This object is included by the following target files:
'
'   nmmdef.t
'   cmmdef.t
'   lmmdef.t
'   nmmdbg.t
'   cmmdbg.t
'   lmmdbg.t
'
' Version 9.1 - Initial P2 version 
'
'-------------------------------------------------------------------------------
'
'    Copyright 2026 Ross Higson
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

#if defined(libsoundsne)

CON

SNE_BLOCK_SIZE = 32 ' Size in bytes of data block to allocate (8 longs)

DAT

#include "cogsne.t"

#endif

