' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export _set_service_lock

 alignl ' align long
C__set_service_lock ' <symbol:_set_service_lock>
 jmp #NEWF
 sub SP, #64
 jmp #PSHM
 long $fea800 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
C__set_service_lock_3
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, FP
 sub r20, #-(-68) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
' C__set_service_lock_4 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
 cmps r19,  #16 wz,wc
 jmp #BR_B
 long @C__set_service_lock_3 ' LTI4
 mov r21, #1 ' reg <- coni
C__set_service_lock_7
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__registry ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, r21
 shl r20, #1 ' LSHI4 coni
 mov r15, r22 ' SUBI/P
 subs r15, r20 ' SUBI/P (3)
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__registry ' CALL addrg
 neg r20, r21 ' NEGI4
 shl r20, #1 ' LSHI4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 adds r22, r20 ' ADDI/P (2)
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 mov r17, r22
 and r17, #127 ' BANDI4 coni
 cmps r17,  #0 wz,wc
 jmp #BRBE
 long @C__set_service_lock_11 ' LEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__registry ' CALL addrg
 neg r20, r21 ' NEGI4
 shl r20, #1 ' LSHI4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 adds r22, r20 ' ADDI/P (2)
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 sar r22, #7 ' RSHI4 coni
 mov r11, r22
 and r11, #31 ' BANDI4 coni
 cmps r11,  #16 wz,wc
 jmp #BR_B
 long @C__set_service_lock_13 ' LTI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__registry ' CALL addrg
 neg r20, r21 ' NEGI4
 shl r20, #1 ' LSHI4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 adds r22, r20 ' ADDI/P (2)
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 mov r13, r22
 sar r13, #12 ' RSHI4 coni
 mov r22, r13
 shl r22, #2 ' LSHI4 coni
 mov r20, FP
 sub r20, #-(-68) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BRNZ
 long @C__set_service_lock_15 ' NEI4
 cmps r23,  #0 wz,wc
 jmp #BR_B
 long @C__set_service_lock_17 ' LTI4
 mov r22, r13
 shl r22, #2 ' LSHI4 coni
 mov r20, FP
 sub r20, #-(-68) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 mov BC, r23
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C__set_service_lock_18 ' JUMPV addrg
C__set_service_lock_17
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__locknew ' CALL addrg
 mov r20, r13
 shl r20, #2 ' LSHI4 coni
 mov r18, FP
 sub r18, #-(-68) ' reg <- addrli
 adds r20, r18 ' ADDI/P (1)
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r13
 shl r22, #2 ' LSHI4 coni
 mov r20, FP
 sub r20, #-(-68) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BRNZ
 long @C__set_service_lock_19 ' NEI4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C__set_service_lock_2 ' JUMPV addrg
C__set_service_lock_19
C__set_service_lock_18
C__set_service_lock_15
 mov r22, r13
 shl r22, #12 ' LSHI4 coni
 mov r20, r13
 shl r20, #2 ' LSHI4 coni
 mov r18, FP
 sub r18, #-(-68) ' reg <- addrli
 adds r20, r18 ' ADDI/P (1)
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 shl r20, #7 ' LSHI4 coni
 or r22, r20 ' BORI/U (1)
 or r22, r17 ' BORI/U (1)
 mov RI, r15
 mov BC, r22
 jmp #WWRD ' ASGNU2 reg reg
C__set_service_lock_13
C__set_service_lock_11
' C__set_service_lock_8 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
 cmps r21,  #96 wz,wc
 jmp #BRBE
 long @C__set_service_lock_7 ' LEI4
 mov r0, #0 ' reg <- coni
C__set_service_lock_2
 jmp #POPM ' restore registers
 add SP, #64 ' framesize
 jmp #RETF


' Catalina Import _locknew

' Catalina Import _registry
' end
