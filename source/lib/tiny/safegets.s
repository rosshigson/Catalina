' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export safe_gets

 alignl ' align long
C_safe_gets ' <symbol:safe_gets>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, r23 ' CVI, CVU or LOAD
 jmp #\@C_safe_gets_3 ' JUMPV addrg
C_safe_gets_2
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_getchar ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r17,  #8 wz
 if_z jmp #\C_safe_gets_7 ' EQI4
 cmps r17,  #127 wz
 if_nz jmp #\C_safe_gets_5 ' NEI4
C_safe_gets_7
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r23 ' CVI, CVU or LOAD
 cmp r22, r20 wcz 
 if_be jmp #\C_safe_gets_8 ' LEU4
 mov r2, ##@C_safe_gets_10_L000011 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_putstr ' CALL addrg
 adds r21, #1 ' ADDI4 coni
 mov r22, ##-1 ' reg <- con
 adds r19, r22 ' ADDI/P (1)
C_safe_gets_8
 adds r21, #1 ' ADDI4 coni
 jmp #\@C_safe_gets_3 ' JUMPV addrg
C_safe_gets_5
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_putchar ' CALL addrg
 cmps r17,  #13 wz
 if_nz jmp #\C_safe_gets_12 ' NEI4
 mov r2, #10 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_putchar ' CALL addrg
C_safe_gets_12
 cmps r17,  #13 wz
 if_z jmp #\C_safe_gets_16 ' EQI4
 cmps r17,  #10 wz
 if_nz jmp #\C_safe_gets_14 ' NEI4
C_safe_gets_16
 jmp #\@C_safe_gets_4 ' JUMPV addrg
C_safe_gets_14
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDP4 coni
 mov r20, r17 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
C_safe_gets_3
 mov r22, r21
 subs r22, #1 ' SUBI4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wcz
 if_a jmp #\C_safe_gets_2 ' GTI4
C_safe_gets_4
 mov r22, #0 ' reg <- coni
 wrbyte r22, r19 ' ASGNU1 reg reg
 mov r0, r23 ' CVI, CVU or LOAD
' C_safe_gets_1 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import getchar

' Catalina Import putstr

' Catalina Import putchar

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_safe_gets_10_L000011 ' <symbol:10>
 byte 8
 byte 32
 byte 8
 byte 0

' Catalina Code

DAT ' code segment
' end
