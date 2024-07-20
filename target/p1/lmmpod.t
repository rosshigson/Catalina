{{
'-------------------------------------------------------------------------------
'
' LMM_pod - an LMM target for Catalina Programs using the POD debugger.
' 
' This file exists only to ensure that the Catalina.Spin file
' is loaded in memory BEFORE the debugger - since Catalina now
' rearranges the Catalina program in memory to start at memory
' location zero, it corrupts any SPIN that exists in memory
' before it. This program then simply passes control to the
' lmm_pod_main program, which does the real work.
'
' This is really a bit of a hack, and the whole concept of
' POD debugger support may need to be revisited in future - or
' Catalina may need a new 'external' debugger to be used in
' place of POD.
'
'-------------------------------------------------------------------------------
}}
CON
'
_clkmode  = Common#CLOCKMODE
_xinfreq  = Common#XTALFREQ
_stack    = Common#STACKSIZE
'
OBJ
'
   Catalina : "Catalina"
'   
   Common   : "Catalina_Common"
'   
   Debugger : "lmm_pod_main"
'
PUB Start

   Debugger.Start (Catalina.Base)
