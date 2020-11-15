' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export _lseek

 long ' align long
C__lseek ' <symbol:_lseek>
 jmp #NEWF
 jmp #LODL
 long 512
 sub SP, RI
 jmp #PSHM
 long $fc0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C___fdtab+9
 mov r20, RI ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r20 ' ADDI/P (3)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__lseek_3 ' NEI4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C__lseek_2 ' JUMPV addrg
C__lseek_3
 cmps r19,  #0 wz
 jmp #BRNZ
 long @C__lseek_6 ' NEI4
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODF
 long -512
 mov r2, RI ' reg ARG ADDRL
 mov r3, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long @C___fdtab
 mov r20, RI ' reg <- addrg
 mov r4, r22 ' ADDI/P
 adds r4, r20 ' ADDI/P (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__S_eek
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C__lseek_7 ' JUMPV addrg
C__lseek_6
 cmps r19,  #2 wz
 jmp #BRNZ
 long @C__lseek_8 ' NEI4
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODF
 long -512
 mov r2, RI ' reg ARG ADDRL
 jmp #LODL
 long @C___fdtab+16
 mov r20, RI ' reg <- addrg
 adds r20, r22 ' ADDI/P (2)
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r21 ' CVI, CVU or LOAD
 mov r3, r20 ' ADDU
 add r3, r18 ' ADDU (3)
 jmp #LODL
 long @C___fdtab
 mov r20, RI ' reg <- addrg
 mov r4, r22 ' ADDI/P
 adds r4, r20 ' ADDI/P (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__S_eek
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C__lseek_9 ' JUMPV addrg
C__lseek_8
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODF
 long -512
 mov r2, RI ' reg ARG ADDRL
 jmp #LODL
 long @C___fdtab+24
 mov r20, RI ' reg <- addrg
 adds r20, r22 ' ADDI/P (2)
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r21 ' CVI, CVU or LOAD
 mov r3, r20 ' ADDU
 add r3, r18 ' ADDU (3)
 jmp #LODL
 long @C___fdtab
 mov r20, RI ' reg <- addrg
 mov r4, r22 ' ADDI/P
 adds r4, r20 ' ADDI/P (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__S_eek
 add SP, #8 ' CALL addrg
C__lseek_9
C__lseek_7
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C___fdtab+24
 mov r20, RI ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r20 ' ADDI/P (3)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r0, r22 ' CVI, CVU or LOAD
C__lseek_2
 jmp #POPM ' restore registers
 jmp #LODL
 long 512
 add SP, RI ' framesize
 jmp #RETF


' Catalina Import __fdtab

' Catalina Import DFS_Seek
' end
