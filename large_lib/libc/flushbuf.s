' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

 long ' align long
C_si6o_6132d12a_do_write_L000003 ' <symbol:do_write>
 jmp #PSHM
 long $ea8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #JMPA
 long @C_si6o_6132d12a_do_write_L000003_6 ' JUMPV addrg
C_si6o_6132d12a_do_write_L000003_5
 subs r19, r17 ' SUBI/P (1)
 adds r21, r17 ' ADDI/P (2)
C_si6o_6132d12a_do_write_L000003_6
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C__write
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz,wc
 jmp #BRBE
 long @C_si6o_6132d12a_do_write_L000003_8 ' LEI4
 cmps r17, r19 wz,wc
 jmp #BR_B
 long @C_si6o_6132d12a_do_write_L000003_5 ' LTI4
C_si6o_6132d12a_do_write_L000003_8
 cmps r17,  #0 wz,wc
 jmp #BRBE
 long @C_si6o_6132d12a_do_write_L000003_10 ' LEI4
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C_si6o_6132d12a_do_write_L000003_11 ' JUMPV addrg
C_si6o_6132d12a_do_write_L000003_10
 mov r15, #0 ' reg <- coni
C_si6o_6132d12a_do_write_L000003_11
 mov r0, r15 ' CVI, CVU or LOAD
' C_si6o_6132d12a_do_write_L000003_4 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 long ' align long
C_si6o1_6132d12a_get_buf_L000012 ' <symbol:get_buf>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $500000 ' save registers
 jmp #LODI
 long @C___iolock
 mov r22, RI ' reg <- INDIRI4 addrg
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_si6o1_6132d12a_get_buf_L000012_14 ' NEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__locknew ' CALL addrg
 jmp #LODL
 long @C___iolock
 mov BC, r0
 jmp #WLNG ' ASGNI4 addrg reg
C_si6o1_6132d12a_get_buf_L000012_14
 jmp #LODI
 long @C___iolock
 mov r22, RI ' reg <- INDIRI4 addrg
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_si6o1_6132d12a_get_buf_L000012_16 ' NEI4
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_si6o1_6132d12a_get_buf_L000012_13 ' JUMPV addrg
C_si6o1_6132d12a_get_buf_L000012_16
 jmp #LODI
 long @C___iolock
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__acquire_lock ' CALL addrg
 jmp #LODI
 long @C___ioused
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_si6o1_6132d12a_get_buf_L000012_18 ' NEI4
 jmp #LODL
 long @C___iobuff
 mov r22, RI ' reg <- addrg
 mov RI, FP
 sub RI, #-(-4)
 wrlong r22 , RI ' ASGNP4 addrli reg
 mov r22, #1 ' reg <- coni
 jmp #LODL
 long @C___ioused
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 jmp #JMPA
 long @C_si6o1_6132d12a_get_buf_L000012_19 ' JUMPV addrg
C_si6o1_6132d12a_get_buf_L000012_18
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 mov RI, FP
 sub RI, #-(-4)
 wrlong r22, RI ' ASGNP4 addrli reg
C_si6o1_6132d12a_get_buf_L000012_19
 jmp #LODI
 long @C___iolock
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__release_lock ' CALL addrg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 regl
C_si6o1_6132d12a_get_buf_L000012_13
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export __flushbuf

 long ' align long
C___flushbuf ' <symbol:__flushbuf>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f40000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #LODL
 long @C___cleanup
 mov r22, RI ' reg <- addrg
 jmp #LODL
 long @C__clean
 mov BC, r22 
 jmp #WLNG ' ASGNP4 addrg reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #0 wz,wc
 jmp #BRAE
 long @C___flushbuf_21 ' GEI4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C___flushbuf_20 ' JUMPV addrg
C___flushbuf_21
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C___flushbuf_23 ' NEI4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C___flushbuf_20 ' JUMPV addrg
C___flushbuf_23
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r20, #0 ' reg <- coni
 mov r18, r22
 and r18, #128 ' BANDI4 coni
 cmps r18, r20 wz
 jmp #BR_Z
 long @C___flushbuf_25 ' EQI4
 and r22, #16 ' BANDI4 coni
 cmps r22, r20 wz
 jmp #BRNZ
 long @C___flushbuf_25 ' NEI4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C___flushbuf_20 ' JUMPV addrg
C___flushbuf_25
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long -129
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 or r20, #256 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 and r22, #4 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C___flushbuf_27 ' NEI4
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C___flushbuf_29 ' NEU4
 mov r22, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long @C___iotab
 mov r20, RI ' reg <- addrg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C___flushbuf_31 ' NEU4
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 jmp #LODL
 long @C___iostdb
 mov r20, RI ' reg <- addrg
 mov RI, r22
 mov BC, r20 
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 or r20, #8 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 jmp #LODL
 long 512
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C___flushbuf_32 ' JUMPV addrg
C___flushbuf_31
 mov r22, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long @C___iotab+24
 mov r20, RI ' reg <- addrg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C___flushbuf_33 ' NEU4
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 jmp #LODL
 long @C___iostdb+128
 mov r20, RI ' reg <- addrg
 mov RI, r22
 mov BC, r20 
 jmp #WLNG ' ASGNP4 reg reg
 jmp #LODI
 long @C___iotab+24+4
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__isatty ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C___flushbuf_37 ' EQI4
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 or r20, #72 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C___flushbuf_38 ' JUMPV addrg
C___flushbuf_37
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 or r20, #8 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
C___flushbuf_38
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 jmp #LODL
 long 512
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C___flushbuf_34 ' JUMPV addrg
C___flushbuf_33
 mov r22, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long @C___iotab+48
 mov r20, RI ' reg <- addrg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C___flushbuf_41 ' NEU4
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 jmp #LODL
 long @C___iostdb+256
 mov r20, RI ' reg <- addrg
 mov RI, r22
 mov BC, r20 
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 or r20, #4 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C___flushbuf_42 ' JUMPV addrg
C___flushbuf_41
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_si6o1_6132d12a_get_buf_L000012 ' CALL addrg
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C___flushbuf_45 ' NEU4
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 or r20, #4 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C___flushbuf_46 ' JUMPV addrg
C___flushbuf_45
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 or r20, #8 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 jmp #LODL
 long 512
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C___flushbuf_47 ' NEI4
 mov r22, #511 ' reg <- coni
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C___flushbuf_48 ' JUMPV addrg
C___flushbuf_47
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
C___flushbuf_48
C___flushbuf_46
C___flushbuf_42
C___flushbuf_34
C___flushbuf_32
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
C___flushbuf_29
C___flushbuf_27
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 and r22, #4 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C___flushbuf_49 ' EQI4
 mov r22, r23 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-4)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long 512
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C___flushbuf_51 ' EQI4
 mov r2, #2 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRI4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C__lseek
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r0, r20 wz
 jmp #BRNZ
 long @C___flushbuf_53 ' NEI4
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 or r20, #32 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C___flushbuf_20 ' JUMPV addrg
C___flushbuf_53
C___flushbuf_51
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-4) ' reg ARG ADDRLi
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRI4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C__write
 add SP, #8 ' CALL addrg
 cmps r0,  #1 wz
 jmp #BR_Z
 long @C___flushbuf_55 ' EQI4
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 or r20, #32 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C___flushbuf_20 ' JUMPV addrg
C___flushbuf_55
 mov r22, r23 ' CVI, CVU or LOAD
 mov r0, r22 ' CVUI
 and r0, cviu_m1 ' zero extend
 jmp #JMPA
 long @C___flushbuf_20 ' JUMPV addrg
C___flushbuf_49
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C___flushbuf_57 ' EQI4
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r23 ' CVI, CVU or LOAD
 mov RI, r20
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
 cmps r23,  #10 wz
 jmp #BR_Z
 long @C___flushbuf_61 ' EQI4
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 neg r20, r20 ' NEGI4
 cmps r22, r20 wz
 jmp #BRNZ
 long @C___flushbuf_58 ' NEI4
C___flushbuf_61
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 neg r22, r22 ' NEGI4
 mov RI, FP
 sub RI, #-(-4)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, #0 ' reg <- coni
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long 512
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C___flushbuf_62 ' EQI4
 mov r2, #2 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRI4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C__lseek
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r0, r20 wz
 jmp #BRNZ
 long @C___flushbuf_64 ' NEI4
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 or r20, #32 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C___flushbuf_20 ' JUMPV addrg
C___flushbuf_64
C___flushbuf_62
 mov RI, FP
 sub RI, #-(-4)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRI4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_si6o_6132d12a_do_write_L000003
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C___flushbuf_58 ' NEI4
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 or r20, #32 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C___flushbuf_20 ' JUMPV addrg
C___flushbuf_57
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 mov RI, FP
 sub RI, #-(-4)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz,wc
 jmp #BRBE
 long @C___flushbuf_68 ' LEI4
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long 512
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C___flushbuf_70 ' EQI4
 mov r2, #2 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRI4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C__lseek
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r0, r20 wz
 jmp #BRNZ
 long @C___flushbuf_72 ' NEI4
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 or r20, #32 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C___flushbuf_20 ' JUMPV addrg
C___flushbuf_72
C___flushbuf_70
 mov RI, FP
 sub RI, #-(-4)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRI4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_si6o_6132d12a_do_write_L000003
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C___flushbuf_74 ' NEI4
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r23 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 or r20, #32 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C___flushbuf_20 ' JUMPV addrg
C___flushbuf_74
C___flushbuf_68
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r23 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C___flushbuf_58
 mov r22, r23 ' CVI, CVU or LOAD
 mov r0, r22 ' CVUI
 and r0, cviu_m1 ' zero extend
C___flushbuf_20
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Import _clean

' Catalina Import _isatty

' Catalina Import _write

' Catalina Import _lseek

' Catalina Import __cleanup

' Catalina Import __iostdb

' Catalina Import __iobuff

' Catalina Import __ioused

' Catalina Import __iolock

' Catalina Import _release_lock

' Catalina Import _acquire_lock

' Catalina Import _locknew

' Catalina Import __iotab
' end
