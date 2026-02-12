{{
'-------------------------------------------------------------------------------
'
' Command_Line - This object is included by target files to set up the command
'                line arguments, based on the following symbols:
'
'                   NO_ARGS     - No command line arguments
'           
'                 After the command line has been set up, the CogStore is then
'                 stopped, and then all cogs (apart from the current cog) from
'                 cog zero up to cog LAST_COG are stopped in preparation for 
'                 loading plugins.
'
' This file is included by the following target files:
'
'   lmm_default.spin
'   cmm_default.spin
'   emm_default.spin
'   smm_default.spin
'   xmm_default.spin
'   lmm_blackcat.spin
'   cmm_blackcat.spin
'   emm_blackcat.spin
'   smm_blackcat.spin
'   xmm_blackcat.spin
'
' Version 3.1 - Initial Version by Ross Higson
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
' Load the appropriate object for command line processing:
'
OBJ
  Common   : "Catalina_Common"                          ' Common definitions
#ifdef NO_ARGS
  CogStore : "Catalina_CogStopper"                      ' Just stop CogStore
#else
  CogStore : "Catalina_CogStore"                        ' Retrieve command line
#endif  
'
' Call this method to set up the command line:
'
PUB Setup | SIZE, COG

#ifndef NO_ARGS
  ' set up the command line arguments
#ifdef FIXED_ARGS
  SIZE := common#COGSTORE_MAX ' use maximum size
#else
  SIZE := CogStore.Size ' use actual size
#endif
  if (SIZE => 0)
    long[Common#FREE_MEM] := long[Common#FREE_MEM] - SIZE*4
  CogStore.Setup(long[Common#FREE_MEM])
#endif

  ' stop the CogStore Cog

  CogStore.Stop 

  ' stop all cogs (up to LAST_COG) currently running so
  ' they don't interfere during the load process - the
  ' Cache Cog and any Reserve Cog must be left running (if 
  ' loaded). Note that terminate the CogStore cog again
  ' because it may be that another program has been loaded 
  ' into the CogStore cog. Of course, we also have to be
  ' careful not to stop this cog!
  '
  repeat COG from 0 to Common#LAST_COG
    if cogid <> COG
      cogstop(COG)

