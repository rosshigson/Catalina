' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export _open

 long ' align long
C__open ' <symbol:_open>
 jmp #NEWF
 jmp #LODL
 long 516
 sub SP, RI
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r17, #0 ' reg <- coni
 cmps r21,  #1 wz
 jmp #BR_Z
 long @C__open_3 ' EQI4
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 or r22, #1 ' BORI4 coni
 mov r17, r22 ' CVI, CVU or LOAD
C__open_3
 cmps r21,  #0 wz
 jmp #BR_Z
 long @C__open_5 ' EQI4
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 or r22, #2 ' BORI4 coni
 mov r17, r22 ' CVI, CVU or LOAD
C__open_5
 jmp #LODI
 long @C___pstart
 mov r22, RI ' reg <- INDIRU4 addrg
 jmp #LODL
 long $ffffffff
 mov r20, RI ' reg <- con
 cmp r22, r20 wz
 jmp #BRNZ
 long @C__open_7 ' NEU4
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__mount
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r0, r20 wz
 jmp #BRNZ
 long @C__open_9 ' NEI4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C__open_2 ' JUMPV addrg
C__open_9
C__open_7
 mov r19, #3 ' reg <- coni
 jmp #JMPA
 long @C__open_14 ' JUMPV addrg
C__open_11
 cmps r19,  #7 wz,wc
 jmp #BR_B
 long @C__open_16 ' LTI4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C__open_2 ' JUMPV addrg
C__open_16
' C__open_12 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C__open_14
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
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
 long @C__open_11 ' NEI4
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C___fdtab
 mov r20, RI ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r20 ' ADDI/P (3)
 mov RI, FP
 sub RI, #-(-4)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-4)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 jmp #LODF
 long -516
 mov r3, RI ' reg ARG ADDRL
 mov r4, r17 ' CVUI
 and r4, cviu_m1 ' zero extend
 mov r5, r23 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 jmp #LODL
 long @C___vi
 jmp #PSHL ' stack ARG ADDRG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_D_F_S__O_penF_ile
 add SP, #16 ' CALL addrg
 cmp r0,  #0 wz
 jmp #BR_Z
 long @C__open_18 ' EQU4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C__open_2 ' JUMPV addrg
C__open_18
 mov r0, r19 ' CVI, CVU or LOAD
C__open_2
 jmp #POPM ' restore registers
 jmp #LODL
 long 516
 add SP, RI ' framesize
 jmp #RETF


' Catalina Import _mount

' Catalina Import __vi

' Catalina Import __pstart

' Catalina Import __fdtab

' Catalina Import DFS_OpenFile
' end
