' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export catalina_fgets

 alignl ' align long
C_catalina_fgets ' <symbol:catalina_fgets>
 calld PA,#NEWF
 calld PA,#PSHM
 long $faaa80 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, r23 ' CVI, CVU or LOAD
 mov r15, r21 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, ##@C___stdin ' reg <- addrg
 cmp r22, r20 wz
 if_z jmp #\C_catalina_fgets_6 ' EQU4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_fgets
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_catalina_fgets_2 ' JUMPV addrg
C_catalina_fgets_5
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_k_wait ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r20, ##-1 ' reg <- con
 cmps r0, r20 wz
 if_nz jmp #\C_catalina_fgets_8 ' NEI4
 mov r22, r17 ' CVI, CVU or LOAD
 mov r20, r23 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_catalina_fgets_7  ' NEU4
 mov r22, #0 ' reg <- coni
 wrbyte r22, r17 ' ASGNU1 reg reg
 mov r0, ##0 ' RET con
 jmp #\@C_catalina_fgets_2 ' JUMPV addrg
C_catalina_fgets_8
 cmps r13,  #8 wz
 if_z jmp #\C_catalina_fgets_14 ' EQI4
 cmps r13,  #127 wz
 if_nz jmp #\C_catalina_fgets_12 ' NEI4
C_catalina_fgets_14
 mov r2, #1 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_t_getpos ' CALL addrg
 mov r9, r0 ' CVI, CVU or LOAD
 mov r11, r9
 sar r11, #8 ' RSHI4 coni
 mov r7, r9
 and r7, #255 ' BANDI4 coni
 cmps r11,  #0 wcz
 if_be jmp #\C_catalina_fgets_15 ' LEI4
 subs r11, #1 ' SUBI4 coni
 mov r2, r7 ' CVI, CVU or LOAD
 mov r3, r11 ' CVI, CVU or LOAD
 mov r4, #1 ' reg ARG coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_t_setpos
 add SP, #8 ' CALL addrg
 mov r2, #32 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_t_char
 add SP, #4 ' CALL addrg
 mov r2, r7 ' CVI, CVU or LOAD
 mov r3, r11 ' CVI, CVU or LOAD
 mov r4, #1 ' reg ARG coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_t_setpos
 add SP, #8 ' CALL addrg
C_catalina_fgets_15
 mov r22, r17 ' CVI, CVU or LOAD
 mov r20, r23 ' CVI, CVU or LOAD
 cmp r22, r20 wcz 
 if_be jmp #\C_catalina_fgets_13 ' LEU4
 mov r22, ##-1 ' reg <- con
 adds r17, r22 ' ADDI/P (1)
 adds r15, #1 ' ADDI4 coni
 jmp #\@C_catalina_fgets_13 ' JUMPV addrg
C_catalina_fgets_12
 cmps r13,  #10 wz
 if_z jmp #\C_catalina_fgets_21 ' EQI4
 cmps r13,  #13 wz
 if_nz jmp #\C_catalina_fgets_19 ' NEI4
C_catalina_fgets_21
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #1 ' ADDP4 coni
 mov r20, r13 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, #10 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_t_char
 add SP, #4 ' CALL addrg
 jmp #\@C_catalina_fgets_7 ' JUMPV addrg
C_catalina_fgets_19
 mov r2, r13 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_t_char
 add SP, #4 ' CALL addrg
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #1 ' ADDP4 coni
 mov r20, r13 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
C_catalina_fgets_13
C_catalina_fgets_6
 mov r22, r15
 subs r22, #1 ' SUBI4 coni
 mov r15, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_nz jmp #\C_catalina_fgets_5 ' NEI4
C_catalina_fgets_7
 mov r22, #0 ' reg <- coni
 wrbyte r22, r17 ' ASGNU1 reg reg
 mov r0, r23 ' CVI, CVU or LOAD
C_catalina_fgets_2
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import t_getpos

' Catalina Import t_setpos

' Catalina Import t_char

' Catalina Import k_wait

' Catalina Import fgets

' Catalina Import __stdin
' end
