' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_getrealrand_cog_L000004 ' <symbol:cog>
 long -1

 alignl ' align long
C_getrealrand_request_block_L000006 ' <symbol:request_block>
 long $0

 alignl ' align long
C_getrealrand_last_random_L000008 ' <symbol:last_random>
 long 0

' Catalina Export getrealrand

' Catalina Code

DAT ' code segment

 alignl ' align long
C_getrealrand ' <symbol:getrealrand>
 jmp #NEWF
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, #0 ' reg <- coni
 jmp #LODI
 long @C_getrealrand_cog_L000004
 mov r22, RI ' reg <- INDIRI4 addrg
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_getrealrand_9 ' NEI4
 mov r2, #32 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__locate_plugin ' CALL addrg
 jmp #LODL
 long @C_getrealrand_cog_L000004
 mov BC, r0
 jmp #WLNG ' ASGNI4 addrg reg
 jmp #LODI
 long @C_getrealrand_cog_L000004
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_getrealrand_11 ' LTI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__registry ' CALL addrg
 jmp #LODI
 long @C_getrealrand_cog_L000004
 mov r20, RI ' reg <- INDIRI4 addrg
 shl r20, #2 ' LSHI4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 adds r22, r20 ' ADDI/P (2)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 jmp #LODL
 long $ffffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 jmp #LODL
 long @C_getrealrand_request_block_L000006
 mov BC, r22
 jmp #WLNG ' ASGNP4 addrg reg
C_getrealrand_11
C_getrealrand_9
 jmp #LODI
 long @C_getrealrand_request_block_L000006
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_getrealrand_13 ' EQU4
 jmp #JMPA
 long @C_getrealrand_16 ' JUMPV addrg
C_getrealrand_15
 jmp #LODI
 long @C_getrealrand_request_block_L000006
 mov r22, RI ' reg <- INDIRP4 addrg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r23, r22 ' CVI, CVU or LOAD
C_getrealrand_16
 cmps r23,  #0 wz
 jmp #BR_Z
 long @C_getrealrand_15 ' EQI4
 jmp #LODI
 long @C_getrealrand_last_random_L000008
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r23, r22 wz
 jmp #BR_Z
 long @C_getrealrand_15 ' EQI4
 jmp #LODL
 long @C_getrealrand_last_random_L000008
 mov BC, r23
 jmp #WLNG ' ASGNI4 addrg reg
 jmp #JMPA
 long @C_getrealrand_14 ' JUMPV addrg
C_getrealrand_13
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_getrand ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_getrealrand_last_random_L000008
 mov BC, r23
 jmp #WLNG ' ASGNI4 addrg reg
C_getrealrand_14
 mov r0, r23 ' CVI, CVU or LOAD
' C_getrealrand_2 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import _locate_plugin

' Catalina Import _registry

' Catalina Import getrand
' end
