' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export ungetc

 alignl ' align long
C_ungetc ' <symbol:ungetc>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $540000 ' save registers
 mov r22, ##-1 ' reg <- con
 cmps r3, r22 wz
 if_z jmp #\C_ungetc_4 ' EQI4
 mov r22, r2
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_ungetc_2 ' NEI4
C_ungetc_4
 mov r0, ##-1 ' RET con
 jmp #\@C_ungetc_1 ' JUMPV addrg
C_ungetc_2
 mov r22, r2
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r2
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_ungetc_5  ' NEU4
 rdlong r22, r2 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_ungetc_7 ' EQI4
 mov r0, ##-1 ' RET con
 jmp #\@C_ungetc_1 ' JUMPV addrg
C_ungetc_7
 mov r22, r2
 adds r22, #20 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #1 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
C_ungetc_5
 rdlong r22, r2 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 wrlong r22, r2 ' ASGNI4 reg reg
 mov r22, r2
 adds r22, #20 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, ##-1 ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r20, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r20, r3 ' CVI, CVU or LOAD
 and r20, cviu_m1 ' zero extend
 cmps r22, r20 wz
 if_z jmp #\C_ungetc_9 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r3 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
C_ungetc_9
 mov r0, r3 ' CVI, CVU or LOAD
C_ungetc_1
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF

' end
