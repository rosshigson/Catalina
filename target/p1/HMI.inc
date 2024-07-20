{{  
'-------------------------------------------------------------------------------
' HMI.inc - includes the HMI selection logic for all platforms (in HMI.spin).
'
' Version 3.3  - Initial version by Ross Higson.
' Version 3.12 - Remove "add-on" boards - they no longer need HMI definitions.
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
#ifndef HUMAN_MACHINE_INTERFACE_DEFINE
#define HUMAN_MACHINE_INTERFACE_DEFINE
'
' Include HMI Definitions based on platform. 
'
#ifdef HYDRA
#include "Hydra_HMI.inc"
#elseifdef HYBRID
#include "Hybrid_HMI.inc"
#elseifdef C3
#include "C3_HMI.inc"
#elseifdef TRIBLADEPROP
#include "TriBladeProp_HMI.inc"
#elseifdef RAMBLADE
#include "RamBlade_HMI.inc"
#elseifdef RAMBLADE3
#include "RamBlade3_HMI.inc"
#elseifdef DEMO
#include "Demo_HMI.inc"
#elseifdef DRACBLADE
#include "DracBlade_HMI.inc"
#elseifdef ASC
#include "ASC_HMI.inc"
#elseifdef PP
#include "PP_HMI.inc"
#elseifdef QUICKSTART
#include "QuickStart_HMI.inc"
#elseifdef ACTIVITY
#include "Activity_HMI.inc"
#elseifdef FLIP
#include "FLiP_HMI.inc"
#elseifdef CUSTOM
#include "Custom_HMI.inc"
#else
' default is CUSTOM
#include "Custom_HMI.inc"
#endif
'
#endif
