' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _read

 alignl ' align long
C__read ' <symbol:_read>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 mov r15, r22 ' CVI, CVU or LOAD
 cmps r23, r22 wz
 if_nz jmp #\C__read_2 ' NEI4
 jmp #\@C__read_5 ' JUMPV addrg
C__read_4
 mov r2, ##@C___stdin ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_catalina_getc ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, ##-1 ' reg <- con
 cmps r17, r22 wz
 if_nz jmp #\C__read_7 ' NEI4
 jmp #\@C__read_6 ' JUMPV addrg
C__read_7
 cmps r17,  #13 wz
 if_nz jmp #\C__read_9 ' NEI4
 mov r17, #10 ' reg <- coni
C__read_9
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDI4 coni
 adds r22, r21 ' ADDI/P (1)
 mov r20, r17 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 cmps r17,  #10 wz
 if_nz jmp #\C__read_11 ' NEI4
 jmp #\@C__read_6 ' JUMPV addrg
C__read_11
C__read_5
 cmps r15, r19 wcz
 if_b jmp #\C__read_4 ' LTI4
C__read_6
 mov r0, r15 ' CVI, CVU or LOAD
 jmp #\@C__read_1 ' JUMPV addrg
C__read_2
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C___fdtab ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C___valid ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C__read_13 ' NEI4
 mov r0, ##-1 ' RET con
 jmp #\@C__read_1 ' JUMPV addrg
C__read_13
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C___fdtab ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r5, r22 ' reg <- INDIRP4 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_f_read
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C__read_15  ' NEU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C__read_1 ' JUMPV addrg
C__read_15
 mov r0, ##-1 ' RET con
C__read_1
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Import f_read

' Catalina Import __fdtab

' Catalina Import __valid

' Catalina Import __stdin

' Catalina Import catalina_getc
' end
