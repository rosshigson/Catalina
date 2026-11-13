' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export _write

 alignl ' align long
C__write ' <symbol:_write>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, #0 ' reg <- coni
 cmps r23,  #1 wz
 jmp #BRNZ
 long @C__write_2 ' NEI4
 mov r17, #0 ' reg <- coni
 jmp #JMPA
 long @C__write_7 ' JUMPV addrg
C__write_4
 jmp #LODL
 long @C___stdout
 mov r2, RI ' reg ARG ADDRG
 mov r22, r17 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r3, r22 ' CVUI
 and r3, cviu_m1 ' zero extend
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_catalina_putc
 add SP, #4 ' CALL addrg
' C__write_5 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C__write_7
 cmps r17, r19 wz,wc
 jmp #BR_B
 long @C__write_4 ' LTI4
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C__write_1 ' JUMPV addrg
C__write_2
 cmps r23,  #2 wz
 jmp #BRNZ
 long @C__write_8 ' NEI4
 mov r17, #0 ' reg <- coni
 jmp #JMPA
 long @C__write_13 ' JUMPV addrg
C__write_10
 jmp #LODL
 long @C___stderr
 mov r2, RI ' reg ARG ADDRG
 mov r22, r17 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r3, r22 ' CVUI
 and r3, cviu_m1 ' zero extend
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_catalina_putc
 add SP, #4 ' CALL addrg
' C__write_11 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C__write_13
 cmps r17, r19 wz,wc
 jmp #BR_B
 long @C__write_10 ' LTI4
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C__write_1 ' JUMPV addrg
C__write_8
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C___fdtab
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C___valid ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C__write_14 ' NEI4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C__write_1 ' JUMPV addrg
C__write_14
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C___fdtab
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r5, BC ' reg <- INDIRP4 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_f_write
 add SP, #12 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 mov r0, r22 ' CVI, CVU or LOAD
C__write_1
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Import f_write

' Catalina Import __fdtab

' Catalina Import __valid

' Catalina Import __stderr

' Catalina Import __stdout

' Catalina Import catalina_putc
' end
