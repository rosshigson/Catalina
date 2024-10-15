' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_getenv_timezone_L000005 ' <symbol:timezone>
 byte 71
 byte 77
 byte 84
 byte 0

 alignl ' align long
C_getenv_eaddr_L000007 ' <symbol:eaddr>
 long $0

' Catalina Export getenv

' Catalina Code

DAT ' code segment

 alignl ' align long
C_getenv ' <symbol:getenv>
 calld PA,#NEWF
 calld PA,#PSHM
 long $faa000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, ##@C_getenv_eaddr_L000007
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_getenv_8  ' NEU4
' loading argument C_getenv_10_L000011 to PASM eliminated
'START PASM ... 
#ifdef COMPACT
 word I16B_LODL + (r0)<<D16B
 alignl ' align long (required on the P2!)
 long ENVIRON
#else
#ifdef NATIVE
 mov r0, ##ENVIRON
#else
 jmp #LODL
 long ENVIRON
 mov r0, RI
#endif
#endif

'... END PASM
' call to PASM eliminated
 mov r22, r0 ' CVI, CVU or LOAD
 wrlong r22, ##@C_getenv_eaddr_L000007 ' ASGNP4 addrg reg
 mov r22, ##@C_getenv_eaddr_L000007
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_z jmp #\C_getenv_12 ' EQU4
 mov r21, ##@C_getenv_eaddr_L000007
 rdlong r21, r21 ' reg <- INDIRP4 addrg
 jmp #\@C_getenv_15 ' JUMPV addrg
C_getenv_17
 adds r21, #1 ' ADDP4 coni
C_getenv_18
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #10 wz
 if_nz jmp #\C_getenv_17 ' NEI4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_getenv_15
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_getenv_18 ' NEI4
 mov r13, #0 ' reg <- coni
C_getenv_20
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_getenv_21 ' (symbol refcount = 0)
 adds r13, #1 ' ADDI4 coni
 cmps r13,  #3 wcz
 if_b jmp #\C_getenv_20 ' LTI4
 mov r21, ##@C_getenv_eaddr_L000007
 rdlong r21, r21 ' reg <- INDIRP4 addrg
 jmp #\@C_getenv_25 ' JUMPV addrg
C_getenv_24
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r22, r0
 add r22, #1 ' ADDU4 coni
 adds r21, r22 ' ADDI/P (2)
C_getenv_25
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 cmp r0,  #0 wz
 if_nz jmp #\C_getenv_24  ' NEU4
C_getenv_12
C_getenv_8
 mov r22, ##@C_getenv_eaddr_L000007
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_z jmp #\C_getenv_27 ' EQU4
 mov r21, ##@C_getenv_eaddr_L000007
 rdlong r21, r21 ' reg <- INDIRP4 addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 jmp #\@C_getenv_30 ' JUMPV addrg
C_getenv_29
 mov r2, #61 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_getenv_32 ' EQU4
 mov r22, r15 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #61 wz
 if_nz jmp #\C_getenv_34 ' NEI4
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strncmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_getenv_34 ' NEI4
 mov r0, r19
 adds r0, #1 ' ADDP4 coni
 jmp #\@C_getenv_3 ' JUMPV addrg
C_getenv_34
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' ADDI/P
 adds r22, r19 ' ADDI/P (3)
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 jmp #\@C_getenv_33 ' JUMPV addrg
C_getenv_32
 mov r22, r17
 adds r22, #1 ' ADDI4 coni
 adds r21, r22 ' ADDI/P (2)
C_getenv_33
C_getenv_30
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wcz
 if_a jmp #\C_getenv_29 ' GTI4
C_getenv_27
 mov r2, ##@C_getenv_38_L000039 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_getenv_36 ' NEI4
 mov r0, ##@C_getenv_timezone_L000005 ' reg <- addrg
 jmp #\@C_getenv_3 ' JUMPV addrg
C_getenv_36
 mov r0, ##0 ' RET con
C_getenv_3
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import strlen

' Catalina Import strchr

' Catalina Import strncmp

' Catalina Import strcmp

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_getenv_38_L000039 ' <symbol:38>
 byte 84
 byte 90
 byte 0

' Catalina Code

DAT ' code segment
' end
