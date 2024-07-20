'
' The FLiP Module supports only serial comms HMI options, such as the PC
' and PROPTERMINAL options (the default is TTY). 
'
' It assumes a 5Mhz crystal is installed. 
'
' Programs should be compiled to use the FLIP platform - e.g:
'
'    catalina hello_world.c -lc -C FLIP
'
'===============================================================================
'
' This configuration file should only contain #defines for configuring various
' platform-specific hardware (for example, whether the pins used for XMM access
' are shared with other devices). Any other platform-specific definitions or
' constants should be included in the definitions file for the platform.
'
' FLIP platform #defines:
'
'===============================================================================
'
