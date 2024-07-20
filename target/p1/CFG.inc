{{
'-------------------------------------------------------------------------------
'
' CFG.inc - This file is included by Constants.inc, or can be included on its
'           own in any file that requires access to platform-specific #defines.
'                 
' Version 3.3  - simplified version.
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
#ifndef CONFIGURATION_DEFINE
#define CONFIGURATION_DEFINE
'
' Include Configuration based on platform. Note that XMM add-on boards should 
' not be included here - they should be included in the next section.
'
#ifdef HYDRA
#include "Hydra_CFG.inc"
#elseifdef HYBRID
#include "Hybrid_CFG.inc"
#elseifdef C3
#include "C3_CFG.inc"
#elseifdef TRIBLADEPROP
#include "TriBladeProp_CFG.inc"
#elseifdef RAMBLADE
#include "RamBlade_CFG.inc"
#elseifdef RAMBLADE3
#include "RamBlade3_CFG.inc"
#elseifdef DEMO
#include "Demo_CFG.inc"
#elseifdef DRACBLADE
#include "DracBlade_CFG.inc"
#elseifdef ASC
#include "ASC_CFG.inc"
#elseifdef PP
#include "PP_CFG.inc"
#elseifdef QUICKSTART
#include "QuickStart_CFG.inc"
#elseifdef ACTIVITY
#include "Activity_CFG.inc"
#elseifdef FLIP
#include "FLiP_CFG.inc"
#elseifdef CUSTOM
#include "Custom_CFG.inc"
#else
' default is CUSTOM
#include "Custom_CFG.inc"
#endif
'
' Also include Configurations based on XMM board. Note that XMM add-on boards
' should come before platforms with XMM functionality built-in, so that add-on
' boards can be used on those platforms, overriding the built-in XMM support.
'
#ifdef XEPROM
#include "XEPROM_XMM_CFG.inc"
#elseifdef PMC
#include "PMC_XMM_CFG.inc"
#elseifdef RP2
#include "RP2_XMM_CFG.inc"
#elseifdef SUPERQUAD
#include "FlashPoint_XMM_CFG.inc"
#elseifdef RAMPAGE
#include "FlashPoint_XMM_CFG.inc"
#elseifdef HX512
#include "HX512_XMM_CFG.inc"
#elseifdef HYDRA
#include "HX512_XMM_CFG.inc"
#elseifdef HYBRID
#include "HX512_XMM_CFG.inc"
#elseifdef C3
#include "C3_XMM_CFG.inc"       
#elseifdef TRIBLADEPROP
#include "TriBladeProp_XMM_CFG.inc"
#elseifdef RAMBLADE
#include "RamBlade_XMM_CFG.inc"
#elseifdef RAMBLADE3
#include "RamBlade3_XMM_CFG.inc"
#elseifdef DRACBLADE
#include "DracBlade_XMM_CFG.inc"
#elseifdef DUALSRAM
#include "DUALSRAM_XMM_CFG.inc"
#elseifdef CUSTOM
#include "Custom_XMM_CFG.inc"
#else
' default is CUSTOM
#include "Custom_XMM_CFG.inc"
#endif
'
#endif

