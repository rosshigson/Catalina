' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export strerror

 alignl ' align long
C_strerror ' <symbol:strerror>
 jmp #PSHM
 long $500000 ' save registers
 cmps r2,  #0 wz,wc
 jmp #BR_B
 long @C_strerror_4 ' LTI4
 jmp #LODI
 long @C__sys_nerr
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r2, r22 wz,wc
 jmp #BR_B
 long @C_strerror_2 ' LTI4
C_strerror_4
 jmp #LODL
 long @C_strerror_5_L000006
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C_strerror_1 ' JUMPV addrg
C_strerror_2
 mov r22, r2
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C__sys_errlist
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r0, BC ' reg <- INDIRP4 reg
C_strerror_1
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Import _sys_nerr

' Catalina Import _sys_errlist

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_strerror_5_L000006 ' <symbol:5>
 byte 117
 byte 110
 byte 107
 byte 110
 byte 111
 byte 119
 byte 110
 byte 32
 byte 101
 byte 114
 byte 114
 byte 111
 byte 114
 byte 0

' Catalina Code

DAT ' code segment
' end
