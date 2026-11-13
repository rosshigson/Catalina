' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export setlocale

 alignl ' align long
C_setlocale ' <symbol:setlocale>
 jmp #NEWF
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_setlocale_2 ' NEU4
 jmp #LODL
 long @C_setlocale_4_L000005
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C_setlocale_1 ' JUMPV addrg
C_setlocale_2
 rdbyte r22, r21 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_setlocale_6 ' EQI4
 jmp #LODL
 long @C_setlocale_4_L000005
 mov r2, RI ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_setlocale_6 ' EQI4
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_setlocale_1 ' JUMPV addrg
C_setlocale_6
 cmps r23,  #1 wcz
 jmp #BR_B
 long @C_setlocale_8 ' LTI4
 cmps r23,  #6 wcz
 jmp #BR_A
 long @C_setlocale_8 ' GTI4
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_setlocale_14_L000016-4
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp #JMPI ' JUMPV INDIR reg

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
 rdbyte r22, r21 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_setlocale_12 ' EQI4
 mov r19, r21 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_setlocale_13 ' JUMPV addrg
C_setlocale_12
 jmp #LODL
 long @C_setlocale_4_L000005
 mov r19, RI ' reg <- addrg
C_setlocale_13
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_setlocale_1 ' JUMPV addrg
C_setlocale_8
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
C_setlocale_1
 jmp #POPM ' restore registers
 jmp #RETF


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
