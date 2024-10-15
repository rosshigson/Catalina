' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export fgetc

 alignl ' align long
C_fgetc ' <symbol:fgetc>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_getchar ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_fgetc_1 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Data

DAT ' uninitialized data segment

' Catalina Export stdin

 alignl ' align long
C_stdin ' <symbol:stdin>
 byte 0[4]

' Catalina Code

DAT ' code segment

' Catalina Import getchar

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment
' end
