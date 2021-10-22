' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_sejs_616ac96e_unget_count_L000002 ' <symbol:unget_count>
 long 0

' Catalina Export catalina_getc

' Catalina Code

DAT ' code segment

 alignl ' align long
C_catalina_getc ' <symbol:catalina_getc>
 PRIMITIVE(#NEWF)
 sub SP, #4
 PRIMITIVE(#PSHM)
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, ##@C___iotab ' reg <- addrg
 cmp r22, r20 wz
 if_nz jmp #\C_catalina_getc_5  ' NEU4
 mov r22, ##@C_sejs_616ac96e_unget_count_L000002
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_be jmp #\C_catalina_getc_7 ' LEI4
 mov r22, ##@C_sejs_616ac96e_unget_count_L000002 ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 wrlong r22, ##@C_sejs_616ac96e_unget_count_L000002 ' ASGNI4 addrg reg
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sejs1_616ac96e_unget_buff_L000003 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-4)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_catalina_getc_6 ' JUMPV addrg
C_catalina_getc_7
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_k_wait ' CALL addrg
 mov RI, FP
 sub RI, #-(-4)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##-1 ' reg <- con
 cmps r22, r20 wz
 if_z jmp #\C_catalina_getc_6 ' EQI4
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #255 ' BANDI4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_t_char
 add SP, #4 ' CALL addrg
 jmp #\@C_catalina_getc_6 ' JUMPV addrg
C_catalina_getc_5
 mov r22, ##-1 ' reg <- con
 mov RI, FP
 sub RI, #-(-4)
 wrlong r22, RI ' ASGNI4 addrli reg
C_catalina_getc_6
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_catalina_getc_4 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 add SP, #4 ' framesize
 PRIMITIVE(#RETF)


' Catalina Export catalina_ungetc

 alignl ' align long
C_catalina_ungetc ' <symbol:catalina_ungetc>
 PRIMITIVE(#PSHM)
 long $500000 ' save registers
 mov r22, ##-1 ' reg <- con
 cmps r3, r22 wz
 if_z jmp #\C_catalina_ungetc_12 ' EQI4
 mov r22, r2 ' CVI, CVU or LOAD
 mov r20, ##@C___iotab ' reg <- addrg
 cmp r22, r20 wz
 if_nz jmp #\C_catalina_ungetc_14  ' NEU4
 mov r22, ##@C_sejs_616ac96e_unget_count_L000002
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #10 wcz
 if_ae jmp #\C_catalina_ungetc_13 ' GEI4
 mov r22, ##@C_sejs_616ac96e_unget_count_L000002 ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r22
 adds r20, #1 ' ADDI4 coni
 wrlong r20, ##@C_sejs_616ac96e_unget_count_L000002 ' ASGNI4 addrg reg
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sejs1_616ac96e_unget_buff_L000003 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 wrlong r3, r22 ' ASGNI4 reg reg
 jmp #\@C_catalina_ungetc_13 ' JUMPV addrg
C_catalina_ungetc_14
 mov r0, ##-1 ' RET con
 jmp #\@C_catalina_ungetc_11 ' JUMPV addrg
C_catalina_ungetc_12
 mov r0, ##-1 ' RET con
 jmp #\@C_catalina_ungetc_11 ' JUMPV addrg
C_catalina_ungetc_13
 mov r0, r3 ' CVI, CVU or LOAD
C_catalina_ungetc_11
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Export catalina_fflush

 alignl ' align long
C_catalina_fflush ' <symbol:catalina_fflush>
 PRIMITIVE(#PSHM)
 long $400000 ' save registers
 mov r22, #0 ' reg <- coni
 wrlong r22, ##@C_sejs_616ac96e_unget_count_L000002 ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
' C_catalina_fflush_18 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Data

DAT ' uninitialized data segment

 alignl ' align long
C_sejs1_616ac96e_unget_buff_L000003 ' <symbol:unget_buff>
 byte 0[40]

' Catalina Code

DAT ' code segment

' Catalina Import t_char

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import k_wait

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import __iotab

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment
' end
