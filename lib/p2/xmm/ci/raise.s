' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_s2ko_669506a7__sig_handler_L000001 ' <symbol:_sig_handler>
 long $1
 byte 0[60]

' Catalina Export raise

' Catalina Code

DAT ' code segment

 alignl ' align long
C_raise ' <symbol:raise>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 cmps r23,  #0 wz,wc
 jmp #BR_B
 long @C_raise_5 ' LTI4
 cmps r23,  #16 wz,wc
 jmp #BRBE
 long @C_raise_3 ' LEI4
C_raise_5
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_raise_2 ' JUMPV addrg
C_raise_3
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_s2ko_669506a7__sig_handler_L000001
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 cmp r22,  #1 wz
 jmp #BR_Z
 long @C_raise_6 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 mov RI, r22
 jmp #CALI ' CALL indirect
C_raise_6
 cmps r23,  #6 wz
 jmp #BRNZ
 long @C_raise_8 ' NEI4
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_exit ' CALL addrg
 jmp #JMPA
 long @C_raise_9 ' JUMPV addrg
C_raise_8
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_raise_2 ' JUMPV addrg
C_raise_9
 mov r0, #0 ' reg <- coni
C_raise_2
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export signal

 alignl ' align long
C_signal ' <symbol:signal>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $500000 ' save registers
 cmps r3,  #0 wz,wc
 jmp #BR_B
 long @C_signal_13 ' LTI4
 cmps r3,  #16 wz,wc
 jmp #BRBE
 long @C_signal_11 ' LEI4
C_signal_13
 jmp #LODL
 long $ffffffff
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_signal_10 ' JUMPV addrg
C_signal_11
 mov r22, r3
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_s2ko_669506a7__sig_handler_L000001
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r2 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_signal_14 ' NEU4
 mov r22, r3
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_s2ko_669506a7__sig_handler_L000001
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 jmp #LODL
 long $1
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 jmp #JMPA
 long @C_signal_15 ' JUMPV addrg
C_signal_14
 mov r22, r3
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_s2ko_669506a7__sig_handler_L000001
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 mov BC, r2
 jmp #WLNG ' ASGNP4 reg reg
C_signal_15
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 regl
C_signal_10
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Import exit
' end
