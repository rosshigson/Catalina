' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export ftell

 alignl ' align long
C_ftell ' <symbol:ftell>
 jmp #NEWF
 jmp #PSHM
 long $fc0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_ftell_2 ' EQI4
 rdlong r22, r23 ' reg <- INDIRI4 reg
 neg r19, r22 ' NEGI4
 jmp #JMPA
 long @C_ftell_3 ' JUMPV addrg
C_ftell_2
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, #0 ' reg <- coni
 mov r18, r22
 and r18, #256 ' BANDI4 coni
 cmps r18, r20 wz
 jmp #BR_Z
 long @C_ftell_4 ' EQI4
 mov r18, r23
 adds r18, #16 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRP4 reg
 cmp r18,  #0 wz
 jmp #BR_Z
 long @C_ftell_4 ' EQU4
 and r22, #4 ' BANDI4 coni
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_ftell_4 ' NEI4
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_ftell_5 ' JUMPV addrg
C_ftell_4
 mov r19, #0 ' reg <- coni
C_ftell_5
C_ftell_3
 mov r2, #1 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRI4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C__lseek
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r21, r22 wz
 jmp #BRNZ
 long @C_ftell_6 ' NEI4
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_ftell_1 ' JUMPV addrg
C_ftell_6
 adds r21, r19 ' ADDI/P (1)
 mov r0, r21 ' CVI, CVU or LOAD
C_ftell_1
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import _lseek
' end
