' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export DFS_GetVolInfo

 alignl ' align long
C_D_F_S__G_etV_olI_nfo ' <symbol:DFS_GetVolInfo>
 jmp #NEWF
 jmp #PSHM
 long $ff8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r15, r21 ' CVI, CVU or LOAD
 mov RI, r17
 mov BC, r23
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r17
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 mov BC, r19
 jmp #WLNG ' ASGNU4 reg reg
 mov r2, #1 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__R_eadS_ector
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 jmp #BR_Z
 long @C_D_F_S__G_etV_olI_nfo_5 ' EQU4
 jmp #LODL
 long $ffffffff
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_D_F_S__G_etV_olI_nfo_4 ' JUMPV addrg
C_D_F_S__G_etV_olI_nfo_5
 mov r22, r17
 adds r22, #20 ' ADDP4 coni
 mov r20, r15
 adds r20, #13 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r17
 adds r22, #22 ' ADDP4 coni
 mov r20, r15
 adds r20, #14 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, cviu_m2 ' zero extend
 mov r18, r15
 adds r18, #15 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 and r18, cviu_m2 ' zero extend
 shl r18, #8 ' LSHI4 coni
 or r20, r18 ' BORI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WWRD ' ASGNU2 reg reg
 mov r22, r17
 adds r22, #24 ' ADDP4 coni
 mov r20, r15
 adds r20, #19 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, cviu_m2 ' zero extend
 mov r18, r15
 adds r18, #20 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 and r18, cviu_m2 ' zero extend
 shl r18, #8 ' LSHI4 coni
 or r20, r18 ' BORI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, r17
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_D_F_S__G_etV_olI_nfo_7 ' NEU4
 mov r22, r17
 adds r22, #24 ' ADDP4 coni
 mov r20, r15
 adds r20, #32 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov r18, r15
 adds r18, #33 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shl r18, #8 ' LSHU4 coni
 or r20, r18 ' BORI/U (1)
 mov r18, r15
 adds r18, #34 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shl r18, #16 ' LSHU4 coni
 or r20, r18 ' BORI/U (1)
 mov r18, r15
 adds r18, #35 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shl r18, #24 ' LSHU4 coni
 or r20, r18 ' BORI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
C_D_F_S__G_etV_olI_nfo_7
 mov r22, r17
 adds r22, #28 ' ADDP4 coni
 mov r20, r15
 adds r20, #22 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, cviu_m2 ' zero extend
 mov r18, r15
 adds r18, #23 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 and r18, cviu_m2 ' zero extend
 shl r18, #8 ' LSHI4 coni
 or r20, r18 ' BORI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, r17
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_D_F_S__G_etV_olI_nfo_9 ' NEU4
 mov r22, r17
 adds r22, #28 ' ADDP4 coni
 mov r20, r15
 adds r20, #36 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov r18, r15
 adds r18, #37 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shl r18, #8 ' LSHU4 coni
 or r20, r18 ' BORI/U (1)
 mov r18, r15
 adds r18, #38 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shl r18, #16 ' LSHU4 coni
 or r20, r18 ' BORI/U (1)
 mov r18, r15
 adds r18, #39 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shl r18, #24 ' LSHU4 coni
 or r20, r18 ' BORI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r2, #11 ' reg ARG coni
 mov r3, r15
 adds r3, #71 ' ADDP4 coni
 mov r4, r17
 adds r4, #2 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, r17
 adds r22, #13 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_D_F_S__G_etV_olI_nfo_10 ' JUMPV addrg
C_D_F_S__G_etV_olI_nfo_9
 mov r2, #11 ' reg ARG coni
 mov r3, r15
 adds r3, #43 ' ADDP4 coni
 mov r4, r17
 adds r4, #2 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, r17
 adds r22, #13 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_D_F_S__G_etV_olI_nfo_10
 mov r22, r17
 adds r22, #32 ' ADDP4 coni
 mov r20, r15
 adds r20, #17 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, cviu_m2 ' zero extend
 mov r18, r15
 adds r18, #18 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 and r18, cviu_m2 ' zero extend
 shl r18, #8 ' LSHI4 coni
 or r20, r18 ' BORI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WWRD ' ASGNU2 reg reg
 mov r22, r17
 adds r22, #40 ' ADDP4 coni
 mov r20, r17
 adds r20, #22 ' ADDP4 coni
 mov RI, r20
 jmp #RWRD
 mov r20, BC ' reg <- INDIRU2 reg
 and r20, cviu_m2 ' zero extend
 add r20, r19 ' ADDU (2)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, r17
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_D_F_S__G_etV_olI_nfo_11 ' EQI4
 mov r22, r17
 adds r22, #44 ' ADDP4 coni
 mov r20, r17
 adds r20, #40 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r17
 adds r18, #28 ' ADDP4 coni
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRU4 reg
 shl r18, #1 ' LSHU4 coni
 add r20, r18 ' ADDU (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, r17
 adds r22, #48 ' ADDP4 coni
 mov r20, r17
 adds r20, #44 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r17
 adds r18, #32 ' ADDP4 coni
 mov RI, r18
 jmp #RWRD
 mov r18, BC ' reg <- INDIRU2 reg
 and r18, cviu_m2 ' zero extend
 shl r18, #5 ' LSHI4 coni
 adds r18, #511 ' ADDI4 coni
 jmp #LODL
 long 512
 mov r16, RI ' reg <- con
 mov r0, r18 ' setup r0/r1 (2)
 mov r1, r16 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r18, r0 ' CVI, CVU or LOAD
 add r20, r18 ' ADDU (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 jmp #JMPA
 long @C_D_F_S__G_etV_olI_nfo_12 ' JUMPV addrg
C_D_F_S__G_etV_olI_nfo_11
 mov r22, r17
 adds r22, #48 ' ADDP4 coni
 mov r20, r17
 adds r20, #40 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r17
 adds r18, #28 ' ADDP4 coni
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRU4 reg
 shl r18, #1 ' LSHU4 coni
 add r20, r18 ' ADDU (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, r17
 adds r22, #44 ' ADDP4 coni
 mov r20, r15
 adds r20, #44 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov r18, r15
 adds r18, #45 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shl r18, #8 ' LSHU4 coni
 or r20, r18 ' BORI/U (1)
 mov r18, r15
 adds r18, #46 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shl r18, #16 ' LSHU4 coni
 or r20, r18 ' BORI/U (1)
 mov r18, r15
 adds r18, #47 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shl r18, #24 ' LSHU4 coni
 or r20, r18 ' BORI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
C_D_F_S__G_etV_olI_nfo_12
 mov r22, r17
 adds r22, #36 ' ADDP4 coni
 mov r20, r17
 adds r20, #24 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r17
 adds r18, #48 ' ADDP4 coni
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRU4 reg
 sub r20, r18 ' SUBU (1)
 mov r18, r17
 adds r18, #20 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov RI, r22
 mov BC, r0
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, r17
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 jmp #LODL
 long 4085
 mov r20, RI ' reg <- con
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_D_F_S__G_etV_olI_nfo_13 ' GEU4
 mov r0, #7 ' reg <- coni
 jmp #JMPA
 long @C_D_F_S__G_etV_olI_nfo_4 ' JUMPV addrg
C_D_F_S__G_etV_olI_nfo_13
 mov r22, r17
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 jmp #LODL
 long $fff5
 mov r20, RI ' reg <- con
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_D_F_S__G_etV_olI_nfo_15 ' GEU4
 mov r22, r17
 adds r22, #1 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_D_F_S__G_etV_olI_nfo_16 ' JUMPV addrg
C_D_F_S__G_etV_olI_nfo_15
 mov r22, r17
 adds r22, #1 ' ADDP4 coni
 mov r20, #2 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_D_F_S__G_etV_olI_nfo_16
 mov r0, #0 ' reg <- coni
C_D_F_S__G_etV_olI_nfo_4
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import DFS_ReadSector

' Catalina Import memcpy
' end
