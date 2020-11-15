'
' Select the appropriate plugin objects:
'
OBJ
  Common : "Catalina_Common"

#ifdef PLUGIN
  PLUGIN   : "Catalina_Plugin"                          ' Generic Plugin
#endif

'
' This function is called by the target to allocate data blocks or set up 
' other details for the extra plugins. If it does not need to do anything
' it can simply be a null routine.
'   
PUB Setup
  ' Setup and start the Plugin if the PLUGIN symbol is defined
#ifdef PLUGIN
  ' Setup the plugin
  PLUGIN.Setup
#endif

'
' This function will be called by the targets to start the plugins:
'
PUB Start
  ' Setup and start the Plugin if the PLUGIN symbol is defined
#ifdef PLUGIN
  ' Start the plugin
  PLUGIN.Start
#endif

