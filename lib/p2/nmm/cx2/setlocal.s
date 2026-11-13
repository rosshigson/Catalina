' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export setlocale

 alignl ' align long
C_setlocale ' <symbol:setlocale>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_setlocale_2  ' NEU4
 mov r0, ##@C_setlocale_4_L000005 ' reg <- addrg
 jmp #\@C_setlocale_1 ' JUMPV addrg
C_setlocale_2
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C_setlocale_6 ' EQI4
 mov r2, ##@C_setlocale_4_L000005 ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_setlocale_6 ' EQI4
 mov r0, ##0 ' RET con
 jmp #\@C_setlocale_1 ' JUMPV addrg
C_setlocale_6
 cmps r23,  #1 wcz
 if_b jmp #\C_setlocale_8 ' LTI4
 cmps r23,  #6 wcz
 if_a jmp #\C_setlocale_8 ' GTI4
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_setlocale_14_L000016-4 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_setlocale_14_L000016 ' <symbol:14>
 long @C_setlocale_10
 long @C_setlocale_10
 long @C_setlocale_10
 long @C_setlocale_10
 long @C_setlocale_10
 long @C_setlocale_10

' Catalina Code

DAT ' code segment
C_setlocale_10
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C_setlocale_12 ' EQI4
 mov r19, r21 ' CVI, CVU or LOAD
 jmp #\@C_setlocale_13 ' JUMPV addrg
C_setlocale_12
 mov r19, ##@C_setlocale_4_L000005 ' reg <- addrg
C_setlocale_13
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #\@C_setlocale_1 ' JUMPV addrg
C_setlocale_8
 mov r0, ##0 ' RET con
C_setlocale_1
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Data

DAT ' uninitialized data segment

' Catalina Export _lc

 alignl ' align long
C__lc ' <symbol:_lc>
 byte 0[48]

' Catalina Code

DAT ' code segment

' Catalina Import strcmp

' Catalina Data

DAT ' uninitialized data segment

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_setlocale_4_L000005 ' <symbol:4>
 byte 67
 byte 0

' Catalina Code

DAT ' code segment
' end
