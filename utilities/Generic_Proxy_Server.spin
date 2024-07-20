{{
'-------------------------------------------------------------------------------
' Generic_Proxy_Server - A Proxy Server for SD and/or HMI device access. 
'
' This program can provide proxy services for any or all of the following
' devices to a program running on another CPU:
'
'    - SD Card
'    - Screen
'    - Keyboard
'    - Mouse
'
' The program running on the other CPU must specify the following command-line
' options when compiling in order to use the proxy devices (otherwise local
' devices will be used):
'
'    - PROXY_SD
'    - PROXY_SCREEN
'    - PROXY_KEYBOARD
'    - PROXY_MOUSE
' 
' Note that this program can only act as a proxy server for one client CPU.
'
' Version 1.0 - initial version by Ross Higson
'
'-------------------------------------------------------------------------------
}}
'
CON
'
' Set these to suit the platform by modifying "Catalina_Common"
'
_clkmode  = Common#CLOCKMODE
_xinfreq  = Common#XTALFREQ
_stack    = Common#STACKSIZE
'
OBJ

  Common : "Catalina_Common"                          ' Common Definitions
  Proxy  : "Catalina_Proxy_Server"                    ' The Proxy Server

PUB Start

  Proxy.Run                     ' never returns
