' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export perror

 alignl ' align long
C_perror ' <symbol:perror>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_perror_2 ' EQU4
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C_perror_2 ' EQI4
 mov r2, ##@C___stderr ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_fputs
 add SP, #4 ' CALL addrg
 mov r2, ##@C___stderr ' reg ARG ADDRG
 mov r3, ##@C_perror_4_L000005 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_fputs
 add SP, #4 ' CALL addrg
C_perror_2
 mov r2, ##@C_errno
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strerror ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, ##@C___stderr ' reg ARG ADDRG
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_fputs
 add SP, #4 ' CALL addrg
 mov r2, ##@C___stderr ' reg ARG ADDRG
 mov r3, ##@C_perror_6_L000007 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_fputs
 add SP, #4 ' CALL addrg
' C_perror_1 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import strerror

' Catalina Import fputs

' Catalina Import __stderr

' Catalina Import errno

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_perror_6_L000007 ' <symbol:6>
 byte 10
 byte 0

 alignl ' align long
C_perror_4_L000005 ' <symbol:4>
 byte 58
 byte 32
 byte 0

' Catalina Code

DAT ' code segment
' end
