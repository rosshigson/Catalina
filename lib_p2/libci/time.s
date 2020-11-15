' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export time

 alignl ' align long
C_time ' <symbol:time>
 PRIMITIVE(#NEWF)
 sub SP, #4
 PRIMITIVE(#PSHM)
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_rtc_gettime ' CALL addrg
 PRIMITIVE(#LODF)
 long -4
 wrlong r0, RI ' ASGNU4 addrl reg
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_time_3 ' EQU4
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 wrlong r22, r23 ' ASGNU4 reg reg
C_time_3
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRU4 reg
' C_time_2 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 add SP, #4 ' framesize
 PRIMITIVE(#RETF)


' Catalina Import rtc_gettime
' end
