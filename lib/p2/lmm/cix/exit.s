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
C_s10bg_690ed790__calls_L000003 ' <symbol:_calls>
 jmp #NEWF
 jmp #PSHM
 long $d00000 ' save registers
 jmp #LODI
 long @C___funccnt
 mov r23, RI ' reg <- INDIRI4 addrg
 jmp #JMPA
 long @C_s10bg_690ed790__calls_L000003_6 ' JUMPV addrg
C_s10bg_690ed790__calls_L000003_5
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C___functab
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 mov RI, r22
 jmp #CALI ' CALL indirect
C_s10bg_690ed790__calls_L000003_6
 mov r22, r23
 subs r22, #1 ' SUBI4 coni
 mov r23, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wcz
 jmp #BRAE
 long @C_s10bg_690ed790__calls_L000003_5 ' GEI4
' C_s10bg_690ed790__calls_L000003_4 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export exit

 alignl ' align long
C_exit ' <symbol:exit>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_s10bg_690ed790__calls_L000003 ' CALL addrg
 jmp #LODI
 long @C__clean
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_exit_9 ' EQU4
 jmp #LODI
 long @C__clean
 mov r22, RI ' reg <- INDIRP4 addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 mov RI, r22
 jmp #CALI ' CALL indirect
C_exit_9
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__exit ' CALL addrg
' C_exit_8 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


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
