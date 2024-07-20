' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Data

DAT ' uninitialized data segment

 alignl ' align long
C_strtok_savestring_L000003 ' <symbol:savestring>
 byte 0[4]

' Catalina Export strtok

' Catalina Code

DAT ' code segment

 alignl ' align long
C_strtok ' <symbol:strtok>
 jmp #NEWF
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_strtok_4 ' NEU4
 jmp #LODI
 long @C_strtok_savestring_L000003
 mov r23, RI ' reg <- INDIRP4 addrg
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_strtok_6 ' NEU4
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_strtok_1 ' JUMPV addrg
C_strtok_6
C_strtok_4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strspn
 add SP, #4 ' CALL addrg
 mov r19, r0 ' ADDI/P
 adds r19, r23 ' ADDI/P (3)
 mov RI, r19
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_strtok_8 ' NEI4
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 jmp #LODL
 long @C_strtok_savestring_L000003
 mov BC, r22
 jmp #WLNG ' ASGNP4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_strtok_1 ' JUMPV addrg
C_strtok_8
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strpbrk
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_strtok_10 ' EQU4
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #1 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_strtok_10
 jmp #LODL
 long @C_strtok_savestring_L000003
 mov BC, r17
 jmp #WLNG ' ASGNP4 addrg reg
 mov r0, r19 ' CVI, CVU or LOAD
C_strtok_1
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import strspn

' Catalina Import strpbrk
' end
