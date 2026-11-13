' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _open

 alignl ' align long
C__open ' <symbol:_open>
 jmp #NEWF
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r15, #0 ' reg <- coni
 cmps r21,  #1 wz
 jmp #BR_Z
 long @C__open_2 ' EQI4
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 or r22, #1 ' BORI4 coni
 mov r15, r22 ' CVI, CVU or LOAD
C__open_2
 cmps r21,  #0 wz
 jmp #BR_Z
 long @C__open_4 ' EQI4
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 or r22, #18 ' BORI4 coni
 mov r15, r22 ' CVI, CVU or LOAD
C__open_4
 jmp #LODL
 long @C___fs
 rdbyte r22, RI ' reg <- INDIRU1 addrg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__open_6 ' NEI4
 mov r2, #1 ' reg ARG coni
 jmp #LODL
 long @C___vol
 mov r3, RI ' reg ARG ADDRG
 jmp #LODL
 long @C___fs
 mov r4, RI ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_f_mount
 add SP, #8 ' CALL addrg
 cmp r0,  #0 wz
 jmp #BR_Z
 long @C__open_8 ' EQU4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C__open_1 ' JUMPV addrg
C__open_8
C__open_6
 mov r19, #3 ' reg <- coni
 jmp #JMPA
 long @C__open_13 ' JUMPV addrg
C__open_10
 cmps r19,  #63 wcz
 jmp #BR_B
 long @C__open_14 ' LTI4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C__open_1 ' JUMPV addrg
C__open_14
' C__open_11 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C__open_13
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C___fdtab
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C__open_10 ' NEU4
 jmp #LODL
 long 588
 mov r2, RI ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_malloc ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C__open_16 ' NEU4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C__open_1 ' JUMPV addrg
C__open_16
 mov r2, r15 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_f_open
 add SP, #8 ' CALL addrg
 cmp r0,  #0 wz
 jmp #BR_Z
 long @C__open_18 ' EQU4
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_free ' CALL addrg
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C__open_1 ' JUMPV addrg
C__open_18
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C___fdtab
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r0, r19 ' CVI, CVU or LOAD
C__open_1
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import free

' Catalina Import f_open

' Catalina Import malloc

' Catalina Import __fdtab

' Catalina Import __vol

' Catalina Import f_mount

' Catalina Import __fs
' end
