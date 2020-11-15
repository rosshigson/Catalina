' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export isupper

 alignl ' align long
C_isupper ' <symbol:isupper>
 PRIMITIVE(#PSHM)
 long $c00000 ' save registers
 mov r22, r2
 subs r22, #65 ' SUBI4 coni
 cmp r22,  #26 wcz 
 PRIMITIVE(#BRAE)
 long @C_isupper_3 ' GEU4
 mov r23, #1 ' reg <- coni
 PRIMITIVE(#JMPA)
 long @C_isupper_4 ' JUMPV addrg
C_isupper_3
 mov r23, #0 ' reg <- coni
C_isupper_4
 mov r0, r23 ' CVI, CVU or LOAD
' C_isupper_1 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)

' end
