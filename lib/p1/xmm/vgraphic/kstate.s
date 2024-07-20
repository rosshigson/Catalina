' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_gk_state_key_state_L000004 ' <symbol:key_state>
 long $0

' Catalina Export gk_state

' Catalina Code

DAT ' code segment

 alignl ' align long
C_gk_state ' <symbol:gk_state>
 jmp #NEWF
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_kb_block
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_gk_state_5 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_gk_initialize ' CALL addrg
C_gk_state_5
 jmp #LODI
 long @C_gk_state_key_state_L000004
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_gk_state_7 ' NEU4
 jmp #LODI
 long @C_kb_block
 mov r22, RI ' reg <- INDIRP4 addrg
 adds r22, #12 ' ADDP4 coni
 jmp #LODL
 long @C_gk_state_key_state_L000004
 mov BC, r22
 jmp #WLNG ' ASGNP4 addrg reg
C_gk_state_7
 mov r22, r23
 sar r22, #5 ' RSHI4 coni
 shl r22, #2 ' LSHI4 coni
 jmp #LODI
 long @C_gk_state_key_state_L000004
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r20, r23
 and r20, #31 ' BANDI4 coni
 sar r22, r20 ' RSHI (1)
 mov r0, r22
 and r0, #1 ' BANDI4 coni
' C_gk_state_2 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import gk_initialize

' Catalina Import kb_block
' end
