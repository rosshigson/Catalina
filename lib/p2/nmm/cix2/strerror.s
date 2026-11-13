' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export strerror

 alignl ' align long
C_strerror ' <symbol:strerror>
 calld PA,#PSHM
 long $500000 ' save registers
 cmps r2,  #0 wcz
 if_b jmp #\C_strerror_4 ' LTI4
 mov r22, ##@C__sys_nerr
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r2, r22 wcz
 if_b jmp #\C_strerror_2 ' LTI4
C_strerror_4
 mov r0, ##@C_strerror_5_L000006 ' reg <- addrg
 jmp #\@C_strerror_1 ' JUMPV addrg
C_strerror_2
 mov r22, r2
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C__sys_errlist ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r0, r22 ' reg <- INDIRP4 reg
C_strerror_1
 calld PA,#POPM ' restore registers
 calld PA,#RETN


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
