' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export clock_getcpuclockid

 alignl ' align long
C_clock_getcpuclockid ' <symbol:clock_getcpuclockid>
 mov r0, #0 ' reg <- coni
' C_clock_getcpuclockid_2 ' (symbol refcount = 0)
 jmp #RETN


' Catalina Export clock_getres

 alignl ' align long
C_clock_getres ' <symbol:clock_getres>
 jmp #PSHM
 long $500000 ' save registers
 mov r22, r2 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_clock_getres_4 ' NEU4
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_clock_getres_3 ' JUMPV addrg
C_clock_getres_4
 cmps r3,  #4 wz
 jmp #BRNZ
 long @C_clock_getres_6 ' NEI4
 mov r22, #1 ' reg <- coni
 mov RI, r2
 mov BC, r22
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_clock_getres_7 ' JUMPV addrg
C_clock_getres_6
 mov r22, #0 ' reg <- coni
 mov RI, r2
 mov BC, r22
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 jmp #LODL
 long 1000000
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
C_clock_getres_7
 mov r0, #0 ' reg <- coni
C_clock_getres_3
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export clock_gettime

 alignl ' align long
C_clock_gettime ' <symbol:clock_gettime>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f40000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_clock_gettime_9 ' NEU4
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_clock_gettime_8 ' JUMPV addrg
C_clock_gettime_9
 cmps r23,  #4 wz
 jmp #BRNZ
 long @C_clock_gettime_11 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_time ' CALL addrg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_clock_gettime_12 ' JUMPV addrg
C_clock_gettime_11
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_clock ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 jmp #LODL
 long 1000
 mov r20, RI ' reg <- con
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov RI, r21
 mov BC, r0
 jmp #WLNG ' ASGNU4 reg reg
 jmp #LODL
 long 1000
 mov r22, RI ' reg <- con
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 mov r18, FP
 sub r18, #-(-8) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 regl
 mov r0, r18 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r0, r22 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
C_clock_gettime_12
 mov r0, #0 ' reg <- coni
C_clock_gettime_8
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export clock_settime

 alignl ' align long
C_clock_settime ' <symbol:clock_settime>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_clock_settime_14 ' NEU4
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_clock_settime_13 ' JUMPV addrg
C_clock_settime_14
 cmps r23,  #4 wz
 jmp #BRNZ
 long @C_clock_settime_16 ' NEI4
 mov RI, r21
 jmp #RLNG
 mov r2, BC ' reg <- INDIRU4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__settime ' CALL addrg
 jmp #JMPA
 long @C_clock_settime_17 ' JUMPV addrg
C_clock_settime_16
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_clock_settime_13 ' JUMPV addrg
C_clock_settime_17
 mov r0, #0 ' reg <- coni
C_clock_settime_13
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export clock_normalize

 alignl ' align long
C_clock_normalize ' <symbol:clock_normalize>
 jmp #PSHM
 long $540000 ' save registers
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long 1000000000
 mov r20, RI ' reg <- con
 cmps r22, r20 wz,wc
 jmp #BRBE
 long @C_clock_normalize_19 ' LEI4
 mov RI, r2
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long 1000000000
 mov r18, RI ' reg <- con
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r20, r0 ' CVI, CVU or LOAD
 add r22, r20 ' ADDU (1)
 mov RI, r2
 mov BC, r22
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long 1000000000
 mov r18, RI ' reg <- con
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov RI, r22
 mov BC, r1
 jmp #WLNG ' ASGNI4 reg reg
C_clock_normalize_19
' C_clock_normalize_18 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export clock_compare

 alignl ' align long
C_clock_compare ' <symbol:clock_compare>
 jmp #PSHM
 long $500000 ' save registers
 mov RI, r3
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov RI, r2
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 cmp r22, r20 wz,wc 
 jmp #BRBE
 long @C_clock_compare_22 ' LEU4
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_clock_compare_21 ' JUMPV addrg
C_clock_compare_22
 mov RI, r3
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov RI, r2
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_clock_compare_24 ' GEU4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_clock_compare_21 ' JUMPV addrg
C_clock_compare_24
 mov r22, r3
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 cmps r22, r20 wz,wc
 jmp #BRBE
 long @C_clock_compare_26 ' LEI4
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_clock_compare_21 ' JUMPV addrg
C_clock_compare_26
 mov r22, r3
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 cmps r22, r20 wz,wc
 jmp #BRAE
 long @C_clock_compare_28 ' GEI4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_clock_compare_21 ' JUMPV addrg
C_clock_compare_28
 mov r0, #0 ' reg <- coni
C_clock_compare_21
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export clock_sub

 alignl ' align long
C_clock_sub ' <symbol:clock_sub>
 jmp #PSHM
 long $550000 ' save registers
 mov r22, r3
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 cmps r22, r20 wz,wc
 jmp #BR_B
 long @C_clock_sub_31 ' LTI4
 mov r22, r3
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov r18, r2
 adds r18, #4 ' ADDP4 coni
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRI4 reg
 subs r20, r18 ' SUBI/P (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_clock_sub_32 ' JUMPV addrg
C_clock_sub_31
 mov RI, r3
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 sub r22, #1 ' SUBU4 coni
 mov RI, r3
 mov BC, r22
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, r3
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long 1000000000
 mov r18, RI ' reg <- con
 mov r16, r2
 adds r16, #4 ' ADDP4 coni
 mov RI, r16
 jmp #RLNG
 mov r16, BC ' reg <- INDIRI4 reg
 subs r18, r16 ' SUBI/P (1)
 subs r20, r18 ' SUBI/P (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
C_clock_sub_32
 mov RI, r3
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov RI, r2
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 sub r22, r20 ' SUBU (1)
 mov RI, r3
 mov BC, r22
 jmp #WLNG ' ASGNU4 reg reg
' C_clock_sub_30 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export clock_add

 alignl ' align long
C_clock_add ' <symbol:clock_add>
 jmp #NEWF
 jmp #PSHM
 long $f40000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov RI, r21
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (1)
 mov RI, r23
 mov BC, r22
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov r18, r21
 adds r18, #4 ' ADDP4 coni
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRI4 reg
 adds r20, r18 ' ADDI/P (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_clock_normalize ' CALL addrg
' C_clock_add_33 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export clock_nanosleep

 alignl ' align long
C_clock_nanosleep ' <symbol:clock_nanosleep>
 jmp #NEWF
 sub SP, #20
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_clock_nanosleep_35 ' NEU4
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_clock_nanosleep_34 ' JUMPV addrg
C_clock_nanosleep_35
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_clock_gettime
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_clock_nanosleep_37 ' NEI4
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_clock_nanosleep_34 ' JUMPV addrg
C_clock_nanosleep_37
 mov r22, r21
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_clock_nanosleep_39 ' EQI4
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_clock_compare
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz,wc
 jmp #BRBE
 long @C_clock_nanosleep_40 ' LEI4
 mov r0, FP
 sub r0, #-(-20) ' reg <- addrli
 mov r1, r19 ' CVI, CVU or LOAD
 jmp #CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_clock_sub
 add SP, #4 ' CALL addrg
 jmp #LODL
 long $f4240
 mov r22, RI ' reg <- con
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov RI, FP
 sub RI, #-(-24)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 jmp #LODL
 long 1000
 mov r20, RI ' reg <- con
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 add r22, r20 ' ADDU (2)
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_msleep ' CALL addrg
 jmp #JMPA
 long @C_clock_nanosleep_40 ' JUMPV addrg
C_clock_nanosleep_39
 jmp #LODL
 long $f4240
 mov r22, RI ' reg <- con
 mov RI, r19
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long 1000
 mov r20, RI ' reg <- con
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 add r22, r20 ' ADDU (2)
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_pthread_msleep ' CALL addrg
C_clock_nanosleep_40
 mov r0, #0 ' reg <- coni
C_clock_nanosleep_34
 jmp #POPM ' restore registers
 add SP, #20 ' framesize
 jmp #RETF


' Catalina Export nanosleep

 alignl ' align long
C_nanosleep ' <symbol:nanosleep>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r22 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_clock_nanosleep
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_nanosleep_44 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import pthread_msleep

' Catalina Import _settime

' Catalina Import time

' Catalina Import clock

' Catalina Import errno
' end
