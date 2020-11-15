' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _write

 alignl ' align long
C__write ' <symbol:_write>
 PRIMITIVE(#NEWF)
 PRIMITIVE(#LODL)
 long 516
 sub SP, RI
 PRIMITIVE(#PSHM)
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, #0 ' reg <- coni
 cmps r23,  #1 wz
 PRIMITIVE(#BRNZ)
 long @C__write_3 ' NEI4
 mov r17, #0 ' reg <- coni
 PRIMITIVE(#JMPA)
 long @C__write_8 ' JUMPV addrg
C__write_5
 PRIMITIVE(#LODL)
 long @C___iotab+24
 mov r2, RI ' reg ARG ADDRG
 mov r22, r17 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r3, r22 ' CVUI
 and r3, cviu_m1 ' zero extend
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_catalina_putc
 add SP, #4 ' CALL addrg
' C__write_6 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C__write_8
 cmps r17, r19 wcz
 PRIMITIVE(#BR_B)
 long @C__write_5 ' LTI4
 mov r0, r19 ' CVI, CVU or LOAD
 PRIMITIVE(#JMPA)
 long @C__write_2 ' JUMPV addrg
C__write_3
 cmps r23,  #2 wz
 PRIMITIVE(#BRNZ)
 long @C__write_10 ' NEI4
 mov r17, #0 ' reg <- coni
 PRIMITIVE(#JMPA)
 long @C__write_15 ' JUMPV addrg
C__write_12
 PRIMITIVE(#LODL)
 long @C___iotab+48
 mov r2, RI ' reg ARG ADDRG
 mov r22, r17 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r3, r22 ' CVUI
 and r3, cviu_m1 ' zero extend
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_catalina_putc
 add SP, #4 ' CALL addrg
' C__write_13 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C__write_15
 cmps r17, r19 wcz
 PRIMITIVE(#BR_B)
 long @C__write_12 ' LTI4
 mov r0, r19 ' CVI, CVU or LOAD
 PRIMITIVE(#JMPA)
 long @C__write_2 ' JUMPV addrg
C__write_10
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
 long @C__write_17 ' NEI4
 PRIMITIVE(#LODL)
 long -1
 mov r0, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C__write_2 ' JUMPV addrg
C__write_17
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 PRIMITIVE(#MULT) ' MULT(I/U)
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-4) ' reg ARG ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 PRIMITIVE(#LODF)
 long -516
 mov r5, RI ' reg ARG ADDRL
 PRIMITIVE(#LODL)
 long @C___fdtab
 mov r20, RI ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r20 ' ADDI/P (3)
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 PRIMITIVE(#PSHL) ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 PRIMITIVE(#CALA)
 long @C_D_F_S__W_riteF_ile
 add SP, #16 ' CALL addrg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r0, r22 ' CVI, CVU or LOAD
C__write_2
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#LODL)
 long 516
 add SP, RI ' framesize
 PRIMITIVE(#RETF)


' Catalina Import catalina_putc

' Catalina Import __fdtab

' Catalina Import DFS_WriteFile

' Catalina Import __iotab
' end
