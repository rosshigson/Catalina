{{
'-------------------------------------------------------------------------------
'
' Cache.spin - This objectis included by target files to load and
'              start the cache, based on the following symbols:
'
'                CACHED_1K   - use Caching XMM driver, 1k cache
'                CACHED_2K   - use Caching XMM driver, 2k cache
'                CACHED_4K   - use Caching XMM driver, 4k cache
'                CACHED_8K   - use Caching XMM driver, 8k cache 
'                CACHED      - same as CACHED_8K
'
'                    
' This file is included by the following target files:
'
'   xmm_default.spin
'   xmm_blackcat.spin
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
'
' include cache contants (defines symbol CACHED if any cache option defined)
'
#include "Constants.inc"
'
' Load the appropriate cache object:
'
OBJ
#ifdef CACHED
   Cache   : "Catalina_SPI_Cache.spin"
#endif
'
' Call this method to start the cache (if not already started):
'
PUB Start
#ifdef CACHED
   Cache.Start
#endif

