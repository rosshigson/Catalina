' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export _read

 long ' align long
C__read ' <symbol:_read>
 jmp #NEWF
 jmp #LODL
 long 516
 sub SP, RI
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r15, #0 ' reg <- coni
 cmps r23,  #0 wz
 jmp #BRNZ
 long @C__read_3 ' NEI4
 jmp #JMPA
 long @C__read_6 ' JUMPV addrg
C__read_5
 jmp #LODL
 long @C___iotab
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_catalina_getc ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r17, r22 wz
 jmp #BRNZ
 long @C__read_8 ' NEI4
 jmp #JMPA
 long @C__read_7 ' JUMPV addrg
C__read_8
 cmps r17,  #13 wz
 jmp #BRNZ
 long @C__read_10 ' NEI4
 mov r17, #10 ' reg <- coni
C__read_10
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDI4 coni
 adds r22, r21 ' ADDI/P (1)
 mov r20, r17 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 cmps r17,  #10 wz
 jmp #BRNZ
 long @C__read_12 ' NEI4
 jmp #JMPA
 long @C__read_7 ' JUMPV addrg
C__read_12
C__read_6
 cmps r15, r19 wz,wc
 jmp #BR_B
 long @C__read_5 ' LTI4
C__read_7
 mov r0, r15 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C__read_2 ' JUMPV addrg
C__read_3
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C___fdtab+9
 mov r20, RI ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r20 ' ADDI/P (3)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__read_14 ' NEI4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C__read_2 ' JUMPV addrg
C__read_14
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-4) ' reg ARG ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 jmp #LODF
 long -516
 mov r5, RI ' reg ARG ADDRL
 jmp #LODL
 long @C___fdtab
 mov r20, RI ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r20 ' ADDI/P (3)
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_D_F_S__R_eadF_ile
 add SP, #16 ' CALL addrg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r0, r22 ' CVI, CVU or LOAD
C__read_2
 jmp #POPM ' restore registers
 jmp #LODL
 long 516
 add SP, RI ' framesize
 jmp #RETF


' Catalina Import catalina_getc

' Catalina Import __fdtab

' Catalina Import DFS_ReadFile

' Catalina Import __iotab
' end
