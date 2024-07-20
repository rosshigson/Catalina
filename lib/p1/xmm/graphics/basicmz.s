' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export gm_delta_z

 alignl ' align long
C_gm_delta_z ' <symbol:gm_delta_z>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $d00000 ' save registers
 jmp #LODI
 long @C_m_block
 mov r22, RI ' reg <- INDIRP4 addrg
 mov r20, r22
 adds r20, #20 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r23, BC ' reg <- INDIRI4 reg
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 subs r20, r23
 neg r20, r20 ' SUBI/P (2)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r20, RI ' ASGNI4 addrli reg
 mov RI, r22
 mov BC, r23
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
' C_gm_delta_z_2 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export gm_abs_z

 alignl ' align long
C_gm_abs_z ' <symbol:gm_abs_z>
 jmp #PSHM
 long $400000 ' save registers
 jmp #LODI
 long @C_m_block
 mov r22, RI ' reg <- INDIRP4 addrg
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r0, BC ' reg <- INDIRI4 reg
' C_gm_abs_z_3 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Import m_block
' end
