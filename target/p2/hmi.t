{{
'-------------------------------------------------------------------------------
'
' HMI - This file is loaded by all target files to load the correct HMI driver.
'       The following symbols can be used ...
'
'       NO_HMI - do not load any HMI drivers
'       TTY    - load full function Serial driver 
'       SIMPLE - load Simple Serial driver
'       VGA    - load a VGA driver, which can be additionaly specified as:
'                LORES_VGA or VGA_640 (same as just VGA)
'                HIRES_VGA or VGA_800
'                VGA_1024
'
'
'       The appropriate symbols are usually specified on the Catalina command 
'       line (e.g. -C TTY).
'        
'
' This file is included by the following target files:
'
'   cmm_default.spin
'   lmm_blackcat.spin
'   nmm_blackcat.spin
'
'   Version 3.15 - Initial version for P2.
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

#if !defined (NO_HMI)

' if any VGA related options are defined, ensure VGA itself is defined (this
' simplifies subsequent cases). 

#if !defined(VGA)

#if defined(LORES_VGA) || defined(HIRES_VGA) || defined(VGA_640) || defined(VGA_800) || defined(VGA_1024)

#define VGA

#endif

#endif

' set default HMI
#if !defined(TTY) && !defined(VGA) && !defined(SIMPLE)
#define SIMPLE
#endif

#if defined(TTY)

#include "hmitty.t"

#elif defined(SIMPLE)

#include "hmisimpl.t"

#elif defined(VGA)

#include "hmivga.t"

#endif

#endif
