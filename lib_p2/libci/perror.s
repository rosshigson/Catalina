' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export perror

 alignl ' align long
C_perror ' <symbol:perror>
 PRIMITIVE(#PSHM)
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_perror_2 ' EQU4
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_perror_2 ' EQI4
 PRIMITIVE(#LODL)
 long @C___iotab+48
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_fputs
 add SP, #4 ' CALL addrg
 PRIMITIVE(#LODL)
 long @C___iotab+48
 mov r2, RI ' reg ARG ADDRG
 PRIMITIVE(#LODL)
 long @C_perror_5_L000006
 mov r3, RI ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_fputs
 add SP, #4 ' CALL addrg
C_perror_2
 PRIMITIVE(#LODI)
 long @C_errno
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_strerror ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#LODL)
 long @C___iotab+48
 mov r2, RI ' reg ARG ADDRG
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_fputs
 add SP, #4 ' CALL addrg
 PRIMITIVE(#LODL)
 long @C___iotab+48
 mov r2, RI ' reg ARG ADDRG
 PRIMITIVE(#LODL)
 long @C_perror_9_L000010
 mov r3, RI ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_fputs
 add SP, #4 ' CALL addrg
' C_perror_1 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import strerror

' Catalina Import fputs

' Catalina Import __iotab

' Catalina Import errno

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_perror_9_L000010 ' <symbol:9>
 byte 10
 byte 0

 alignl ' align long
C_perror_5_L000006 ' <symbol:5>
 byte 58
 byte 32
 byte 0

' Catalina Code

DAT ' code segment
' end
