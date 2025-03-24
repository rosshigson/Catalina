' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

' Catalina Export __funccnt

 alignl ' align long
C___funccnt ' <symbol:__funccnt>
 long 0

' Catalina Export _clean

 alignl ' align long
C__clean ' <symbol:_clean>
 long $0

' Catalina Code

DAT ' code segment

 alignl ' align long
C_srqk_67da404a__calls_L000003 ' <symbol:_calls>
 calld PA,#NEWF
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, ##@C___funccnt
 rdlong r23, r23 ' reg <- INDIRI4 addrg
 jmp #\@C_srqk_67da404a__calls_L000003_6 ' JUMPV addrg
C_srqk_67da404a__calls_L000003_5
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C___functab ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 mov RI, r22
 calld PA,#CALI ' CALL indirect
C_srqk_67da404a__calls_L000003_6
 mov r22, r23
 subs r22, #1 ' SUBI4 coni
 mov r23, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wcz
 if_ae jmp #\C_srqk_67da404a__calls_L000003_5 ' GEI4
' C_srqk_67da404a__calls_L000003_4 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export exit

 alignl ' align long
C_exit ' <symbol:exit>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_srqk_67da404a__calls_L000003 ' CALL addrg
 mov r22, ##@C__clean
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_z jmp #\C_exit_9 ' EQU4
 mov r22, ##@C__clean
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 mov RI, r22
 calld PA,#CALI ' CALL indirect
C_exit_9
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__exit ' CALL addrg
' C_exit_8 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import _exit

' Catalina Data

DAT ' uninitialized data segment

' Catalina Export __functab

 alignl ' align long
C___functab ' <symbol:__functab>
 byte 0[128]

' Catalina Code

DAT ' code segment
' end
