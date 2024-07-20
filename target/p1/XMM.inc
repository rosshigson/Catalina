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
' Version 3.3 - include error for platforms that don't have XMM
' Version 3.11 - modified to fix 'order of compilation' issues with spinnaker.
' Version 3.12 - modified to put "add-on" boards before "built-in" XMM support.
' Version 3.14 - add support for executing XMM from EEPROM (XEPROM).
' Version 5.9.3 - add support for DualSRAM.
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
' Include the correct XMM API based on the platform. Note that "add-on"
' boards that can apply to multiple platforms should be added FIRST in the
' list, so they take precedence over any "built-in" XMM API - this is to allow
' for add-on boards to also be used on platforms with built-in XMM support,
' overriding the build-in XMM:
'
#ifdef XEPROM
#include "XEPROM_XMM.inc"
#elseifdef PMC
#include "PMC_XMM.inc"
#elseifdef RP2
#include "RP2_XMM.inc"
#elseifdef SUPERQUAD
#include "FlashPoint_XMM.inc"
#elseifdef RAMPAGE
#include "FlashPoint_XMM.inc"
#elseifdef HX512
#include "HX512_XMM.inc"
#elseifdef HYDRA
#include "HX512_XMM.inc"
#elseifdef HYBRID
#include "HX512_XMM.inc"
#elseifdef C3
#include "C3_XMM.inc"       
#elseifdef TRIBLADEPROP
#include "TriBladeProp_XMM.inc"
#elseifdef RAMBLADE
#include "RamBlade_XMM.inc"
#elseifdef RAMBLADE3
#include "RamBlade3_XMM.inc"
#elseifdef DRACBLADE
#include "DracBlade_XMM.inc"
#elseifdef DUALSRAM
#include "DUALSRAM_XMM.inc"
#elseifdef CUSTOM
#include "Custom_XMM.inc"
#else
' default is CUSTOM
#include "Custom_XMM.inc"
#endif

