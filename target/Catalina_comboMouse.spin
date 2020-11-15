{{
'-------------------------------------------------------------------------------
'
' Catalina_comboMouse - a mouse driver usable on for multiple platforms.
'
' There is not really a comboMouse driver - this object is just
' a wrapper around one of two other mouse drivers - either the
' Catalina version of the Hydra one, or the Catalina version of
' the standard Parallax one. The Hydra mouse driver accepts a pin
' group, whereas the parallax one accepts two pins - but we
' assume here that the mouse uses two consecutive pins - if this
' is not the case on some platform, this routine should instead
' ignore the pin it is given, but get the real pins out of
' Catalina_Common
'
' Having this dummy driver makes it much easier to support
' multiple platforms, since this is usually the only file
' that needs modifying to port to a new Propeller platform.
'
' Version 1.0 - initial version
' Version 3.3 - Tidy up platform dependencies
' Version 3.5 - now returns cog + 1, or zero if no cog
' 
'-------------------------------------------------------------------------------
}}
CON

m_count = mouse#m_count

OBJ
'
' Choose one of the following mouse drivers (based on the symbol ISO_MOUSE):
'
#ifdef ISO_MOUSE
  mouse  : "Catalina_mouse_iso_010"                     ' (e.g. Hydra)
#else
  mouse  : "Catalina_mouse"                             ' (Other)
#endif

  
PUB start(m_block, pin) : okay

'' Start mouse driver - starts a cog
'' returns false if no cog available
''

#ifdef ISO_MOUSE
  return mouse.Start(m_block, pin)                      ' (e.g. Hydra)
#else
  return mouse.Start(m_block, pin, pin+1)               ' (Other)
#endif
  
