{{  
'-------------------------------------------------------------------------------
' XMM.inc - includes the PASM Code for all XMM access for all platforms.
'
' This file is included in the following files:
'
'       Catalina_XMM.spin
'       Catalina_XMM_EEPROM_Loader.spin
'       Catalina_HUB_XMM_Loader.spin
'       Catalina_HUB_Flash_Loader.spin
'       Catalina_XMM_SIO_Loader.spin
'       Catalina_XMM_RamTest.spin
'       Catalina_SPI_Cache.spin
'       Catalina_XMM_SD_Loader.spin
'
' Version 2.8 - initital version by Ross Higson.
' Version 3.0 - add support for SPI FLASH (via cached driver).
' Version 3.1 - Simplified Version.
' Version 3.3 - include error for platforms that don't have XMM.
' Version 3.11 - modified to fix 'order of compilation' issues with spinnaker.
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
' Since we have only one platform in this target, this file is quite simple.
' However, it is retained for compatibility with more complex targets.
'
' Include the correct XMM API based on the platform:
'
#include "Custom_XMM.inc"
'
