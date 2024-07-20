{{
'-------------------------------------------------------------------------------
'
' plugins.inc - include the code for all the selected plugins.
'               The plugin support code is included by 'plugsup.inc'
'
' Version 7.1  - Initial version
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

' The following file must be included for HMI support

#include "hmi.t"

' The following file must be included for Floating Point support

#include "float.t"

' The following file must be included for Real-Time Clock support

#include "clock.t"

' The following file must be included for SD Card support

#include "sd.t"

' The following file must be included for 2 Port Serial support

#include "serial2.t"

' The following file must be included for Multi Port Serial
' (aka 8 Port Serial) support

#include "serial8.t"

' The following file must be included for PSRAM support

#include "psram.t"

' The following file must be included for HYPER Ram support

#include "hyper.t"

' The following file must be included for Cache support

#include "cache.t"


