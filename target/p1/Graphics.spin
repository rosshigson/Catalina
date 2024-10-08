{{
'------------------------------------------------------------------------------
'
' Graphics - Load a Graphics plugin (based on platform). Currently only 
'            supports TV output.
'
' Version 3.1 - Initial version.
' Version 3.5 - Now starts mouse driver (this driver must be accessed via the
'               libgraphics mouse functions - the normal HMI mouse functions
'               won't work, as they also expect a HMI plugin to be loaded).
' Version 3.8 - Initial version. Note that this version may start a mouse 
'               driver and/or a keyboard driver. To disable this, define the
'               NO_MOUSE and/or NO_KEYBOARD symbols.
'               These drivers must be accessed via the libvgraphic mouse and 
'               keyboard functions - the standard HMI functions expect to use 
'               the equivalent HMI drivers (if loaded), not these drivers.
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
VAR
#ifdef libgraphics
  ' this variable is used only during initialization
  long CGI_DATA
  long MOUSE_DATA
  long KBD_DATA
#endif
'
OBJ
#ifdef libgraphics
  common : "Catalina_Common"
#ifdef VGA
#error : GRAPHICS NOT SUPPORTED ON SELECTED PLATFORM
#elseifdef HIRES_VGA
#error : GRAPHICS NOT SUPPORTED ON SELECTED PLATFORM
#elseifdef LORES_VGA
#error : GRAPHICS NOT SUPPORTED ON SELECTED PLATFORM
#else
   ' currently, we only support TV - this may change!
   CGI    : "Catalina_CGI_Plugin_TV"
#endif
#ifndef NO_MOUSE
   MOUSE  : "Catalina_comboMouse"
#endif
#ifndef NO_KEYBOARD
   KBD    : "Catalina_comboKeyboard"
#endif
#endif
'
' This function is called by the target to set up details for graphics
'   
PUB Setup
#ifdef libgraphics
#ifndef NO_MOUSE
  MOUSE_DATA := long[Common#FREE_MEM] - 4*(MOUSE#m_count)
  long[Common#FREE_MEM] := MOUSE_DATA
#endif
#ifndef NO_KEYBOARD
  KBD_DATA := long[Common#FREE_MEM] - 4*(KBD#kb_count)
  long[Common#FREE_MEM] := KBD_DATA
#endif
  CGI_DATA := long[Common#FREE_MEM] - CGI#BYTE_SIZE
  CGI_DATA := 128 * (CGI_DATA / 128) ' must align to a 128 byte boundary
  long[Common#FREE_MEM] := CGI_DATA
#endif
'
' This function is called by the target to start the plugin
'
PUB Start : cog 
#ifdef libgraphics
  cog := CGI.Start (CGI_DATA)
#ifndef NO_MOUSE
  cog := MOUSE.start (MOUSE_DATA, common#MOUSE_PIN)
  if cog > 0
    ' register this cog
    Common.Register(cog-1, Common#LMM_MOU)
    ' save address of mouse block in registry
    Common.SendInitializationData(cog-1, MOUSE_DATA, 0)
#endif
#ifndef NO_KEYBOARD
  cog := KBD.start (KBD_DATA, common#KBD_PIN)
  if cog > 0
    ' register this cog
    Common.Register(cog-1, Common#LMM_KBD)
    ' save address of mouse block in registry
    Common.SendInitializationData(cog-1, KBD_DATA, 0)
#endif
#endif
