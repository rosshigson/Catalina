' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export localtime

 long ' align long
C_localtime ' <symbol:localtime>
 jmp #PSHM
 long $fc0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__tzset ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_gmtime ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C__timezone
 mov r22, RI ' reg <- INDIRI4 addrg
 mov r20, #60 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r18, r20 ' reg <- INDIRI4 reg
 mov r22, r18 ' SUBI/P
 subs r22, r0 ' SUBI/P (3)
 wrlong r22, r20 ' ASGNI4 reg reg
 jmp #LODI
 long @C__timezone
 mov r22, RI ' reg <- INDIRI4 addrg
 mov r20, #60 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 rdlong r20, r21 ' reg <- INDIRI4 reg
 mov r22, r20 ' SUBI/P
 subs r22, r1 ' SUBI/P (3)
 wrlong r22, r21 ' ASGNI4 reg reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_mktime ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__dstget ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmp r19,  #0 wz
 jmp #BR_Z
 long @C_localtime_2 ' EQU4
 mov r22, #60 ' reg <- coni
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r18, r20 ' reg <- INDIRI4 reg
 mov r22, r18 ' ADDU
 add r22, r0 ' ADDU (3)
 wrlong r22, r20 ' ASGNI4 reg reg
 mov r22, #60 ' reg <- coni
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 rdlong r20, r21 ' reg <- INDIRI4 reg
 mov r22, r20 ' ADDU
 add r22, r1 ' ADDU (3)
 wrlong r22, r21 ' ASGNI4 reg reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_mktime ' CALL addrg
C_localtime_2
 mov r0, r21 ' CVI, CVU or LOAD
' C_localtime_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Import _timezone

' Catalina Import _dstget

' Catalina Import _tzset

' Catalina Import gmtime

' Catalina Import mktime
' end
