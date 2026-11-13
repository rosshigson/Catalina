' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
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
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_strtok_4  ' NEU4
 mov r23, ##@C_strtok_savestring_L000003
 rdlong r23, r23 ' reg <- INDIRP4 addrg
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_strtok_6  ' NEU4
 mov r0, ##0 ' RET con
 jmp #\@C_strtok_1 ' JUMPV addrg
C_strtok_6
C_strtok_4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strspn
 add SP, #4 ' CALL addrg
 mov r19, r0 ' ADDI/P
 adds r19, r23 ' ADDI/P (3)
 rdbyte r22, r19 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_strtok_8 ' NEI4
 mov r22, ##0 ' reg <- con
 wrlong r22, ##@C_strtok_savestring_L000003 ' ASGNP4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_strtok_1 ' JUMPV addrg
C_strtok_8
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strpbrk
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_strtok_10 ' EQU4
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #1 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_strtok_10
 wrlong r17, ##@C_strtok_savestring_L000003 ' ASGNP4 addrg reg
 mov r0, r19 ' CVI, CVU or LOAD
C_strtok_1
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import strspn

' Catalina Import strpbrk
' end
