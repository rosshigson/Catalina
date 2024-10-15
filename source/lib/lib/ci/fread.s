' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export fread

 alignl ' align long
C_fread ' <symbol:fread>
 calld PA,#NEWF
 calld PA,#PSHM
 long $faaa00 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r15, r23 ' CVI, CVU or LOAD
 mov r9, #0 ' reg <- coni
 cmp r21,  #0 wz
 if_z jmp #\C_fread_2 ' EQU4
 jmp #\@C_fread_5 ' JUMPV addrg
C_fread_4
 mov r11, r21 ' CVI, CVU or LOAD
C_fread_7
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_getc ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r20, ##-1 ' reg <- con
 cmps r0, r20 wz
 if_z jmp #\C_fread_10 ' EQI4
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDP4 coni
 mov r20, r13 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_fread_11 ' JUMPV addrg
C_fread_10
 mov r0, r9 ' CVI, CVU or LOAD
 jmp #\@C_fread_1 ' JUMPV addrg
C_fread_11
' C_fread_8 ' (symbol refcount = 0)
 mov r22, r11
 sub r22, #1 ' SUBU4 coni
 mov r11, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_fread_7  ' NEU4
 add r9, #1 ' ADDU4 coni
C_fread_5
 cmp r9, r19 wcz 
 if_b jmp #\C_fread_4 ' LTU4
C_fread_2
 mov r0, r9 ' CVI, CVU or LOAD
C_fread_1
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import getc
' end
