' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _lseek

 alignl ' align long
C__lseek ' <symbol:_lseek>
 PRIMITIVE(#NEWF)
 PRIMITIVE(#LODL)
 long 512
 sub SP, RI
 PRIMITIVE(#PSHM)
 long $fc0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 PRIMITIVE(#MULT) ' MULT(I/U)
 PRIMITIVE(#LODL)
 long @C___fdtab+9
 mov r20, RI ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r20 ' ADDI/P (3)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C__lseek_3 ' NEI4
 PRIMITIVE(#LODL)
 long -1
 mov r0, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C__lseek_2 ' JUMPV addrg
C__lseek_3
 cmps r19,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C__lseek_6 ' NEI4
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 PRIMITIVE(#MULT) ' MULT(I/U)
 mov r22, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#LODF)
 long -512
 mov r2, RI ' reg ARG ADDRL
 mov r3, r21 ' CVI, CVU or LOAD
 PRIMITIVE(#LODL)
 long @C___fdtab
 mov r20, RI ' reg <- addrg
 mov r4, r22 ' ADDI/P
 adds r4, r20 ' ADDI/P (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_D_F_S__S_eek
 add SP, #8 ' CALL addrg
 PRIMITIVE(#JMPA)
 long @C__lseek_7 ' JUMPV addrg
C__lseek_6
 cmps r19,  #2 wz
 PRIMITIVE(#BRNZ)
 long @C__lseek_8 ' NEI4
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 PRIMITIVE(#MULT) ' MULT(I/U)
 mov r22, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#LODF)
 long -512
 mov r2, RI ' reg ARG ADDRL
 PRIMITIVE(#LODL)
 long @C___fdtab+16
 mov r20, RI ' reg <- addrg
 adds r20, r22 ' ADDI/P (2)
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, r21 ' CVI, CVU or LOAD
 mov r3, r20 ' ADDU
 add r3, r18 ' ADDU (3)
 PRIMITIVE(#LODL)
 long @C___fdtab
 mov r20, RI ' reg <- addrg
 mov r4, r22 ' ADDI/P
 adds r4, r20 ' ADDI/P (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_D_F_S__S_eek
 add SP, #8 ' CALL addrg
 PRIMITIVE(#JMPA)
 long @C__lseek_9 ' JUMPV addrg
C__lseek_8
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 PRIMITIVE(#MULT) ' MULT(I/U)
 mov r22, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#LODF)
 long -512
 mov r2, RI ' reg ARG ADDRL
 PRIMITIVE(#LODL)
 long @C___fdtab+24
 mov r20, RI ' reg <- addrg
 adds r20, r22 ' ADDI/P (2)
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, r21 ' CVI, CVU or LOAD
 mov r3, r20 ' ADDU
 add r3, r18 ' ADDU (3)
 PRIMITIVE(#LODL)
 long @C___fdtab
 mov r20, RI ' reg <- addrg
 mov r4, r22 ' ADDI/P
 adds r4, r20 ' ADDI/P (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_D_F_S__S_eek
 add SP, #8 ' CALL addrg
C__lseek_9
C__lseek_7
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 PRIMITIVE(#MULT) ' MULT(I/U)
 PRIMITIVE(#LODL)
 long @C___fdtab+24
 mov r20, RI ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r20 ' ADDI/P (3)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r0, r22 ' CVI, CVU or LOAD
C__lseek_2
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#LODL)
 long 512
 add SP, RI ' framesize
 PRIMITIVE(#RETF)


' Catalina Import __fdtab

' Catalina Import DFS_Seek
' end
