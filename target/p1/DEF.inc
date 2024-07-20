{{  
'-------------------------------------------------------------------------------
' DEF.inc - includes the platform-specific definitions for all platforms.
'
' This file is included in the following files:
'
'       Catalina_Common.spin
'
' Version 3.3  - initital version by Ross Higson.
' Version 3.12 - include support for both XMM platforms and XMM add-on boards.
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
#ifndef DEFINITIONS_DEFINE
#define DEFINITIONS_DEFINE
'
' Include Definitions based on platform. Note that XMM add-on boards should 
' not be included here - they should be included in the next section.
'
#ifdef HYDRA
#include "Hydra_DEF.inc"
#elseifdef HYBRID
#include "Hybrid_DEF.inc"
#elseifdef C3
#include "C3_DEF.inc"
#elseifdef TRIBLADEPROP
#include "TriBladeProp_DEF.inc"
#elseifdef RAMBLADE
#include "RamBlade_DEF.inc"
#elseifdef RAMBLADE3
#include "RamBlade3_DEF.inc"
#elseifdef DEMO
#include "Demo_DEF.inc"
#elseifdef DRACBLADE
#include "DracBlade_DEF.inc"
#elseifdef ASC
#include "ASC_DEF.inc"
#elseifdef PP
#include "PP_DEF.inc"
#elseifdef QUICKSTART
#include "QuickStart_DEF.inc"
#elseifdef ACTIVITY
#include "Activity_DEF.inc"
#elseifdef FLIP
#include "FLiP_DEF.inc"
#elseifdef CUSTOM
#include "Custom_DEF.inc"
#else
' default is CUSTOM
#include "Custom_DEF.inc"
#endif
'
' Also include Definitions based on XMM board. Note that XMM add-on boards
' should come before platforms with XMM functionality built-in, so that add-on
' boards can be used on those platforms, overriding the built-in XMM support.
'
#ifdef XEPROM
#include "XEPROM_XMM_DEF.inc"
#elseifdef PMC
#include "PMC_XMM_DEF.inc"
#elseifdef RP2
#include "RP2_XMM_DEF.inc"
#elseifdef SUPERQUAD
#include "FlashPoint_XMM_DEF.inc"
#elseifdef RAMPAGE
#include "FlashPoint_XMM_DEF.inc"
#elseifdef HX512
#include "HX512_XMM_DEF.inc"
#elseifdef HYDRA
#include "HX512_XMM_DEF.inc"
#elseifdef HYBRID
#include "HX512_XMM_DEF.inc"
#elseifdef C3
#include "C3_XMM_DEF.inc"       
#elseifdef TRIBLADEPROP
#include "TriBladeProp_XMM_DEF.inc"
#elseifdef RAMBLADE
#include "RamBlade_XMM_DEF.inc"
#elseifdef RAMBLADE3
#include "RamBlade3_XMM_DEF.inc"
#elseifdef DRACBLADE
#include "DracBlade_XMM_DEF.inc"
#elseifdef DUALSRAM
#include "DUALSRAM_XMM_DEF.inc"
#elseifdef CUSTOM
#include "Custom_XMM_DEF.inc"
#else
' default is CUSTOM
#include "Custom_XMM_DEF.inc"
#endif
'
#endif
