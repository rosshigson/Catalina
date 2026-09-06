' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

' Catalina Export SNRegisters

 alignl_label
C_S_N_R_egisters ' <symbol:SNRegisters>
 long $0

' Catalina Export sne_initialize

' Catalina Code

DAT ' code segment

 alignl_label
C_sne_initialize ' <symbol:sne_initialize>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $400000<<S32 ' save registers
 alignl_p1
 long I32_CALA + (@C_sne_getR_egisters)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODA + (@C_S_N_R_egisters)<<S32
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 alignl_p1
 long I32_LODI + (@C_S_N_R_egisters)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sne_initialize_3)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_CALA + (@C_sne_reset)<<S32 ' CALL addrg
 alignl_label
C_sne_initialize_3
' C_sne_initialize_2 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export sne_getRegisters

 alignl_label
C_sne_getR_egisters ' <symbol:sne_getRegisters>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_sne_getR_egisters_6
 alignl_p1
 long I32_CALA + (@C__registry)<<S32 ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r20)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_SHRI + (r22)<<D16A + (24)<<S16A ' SHRU4 reg coni
 word I16A_CMPI + (r22)<<D16A + (15)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sne_getR_egisters_10)<<S32 ' NEU4 reg coni
 alignl_p1
 long I32_CALA + (@C__registry)<<S32 ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r20)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $ffffff ' reg <- con
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_sne_getR_egisters_5)<<S32 ' JUMPV addrg
 alignl_label
C_sne_getR_egisters_10
' C_sne_getR_egisters_7 ' (symbol refcount = 0)
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_CMPSI + (r23)<<D16A + (16)<<S16A
 alignl_p1
 long I32_BR_B + (@C_sne_getR_egisters_6)<<S32 ' LTI4 reg coni
 word I16B_LODL + R0<<D16B
 alignl_p1
 long 0 ' RET con
 alignl_label
C_sne_getR_egisters_5
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export sne_reset

 alignl_label
C_sne_reset ' <symbol:sne_reset>
 alignl_p1
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_sne_reset_13
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODI + (@C_S_N_R_egisters)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
' C_sne_reset_14 ' (symbol refcount = 0)
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_CMPSI + (r23)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BR_B + (@C_sne_reset_13)<<S32 ' LTI4 reg coni
' C_sne_reset_12 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export sne_setFreq

 alignl_label
C_sne_setF_req ' <symbol:sne_setFreq>
 alignl_p1
 long I32_PSHM + $500000<<S32 ' save registers
 alignl_p1
 long I32_LODI + (@C_S_N_R_egisters)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sne_setF_req_18)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_SHLI + (r22)<<D16A + (1)<<S16A ' SHLI4 reg coni
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODI + (@C_S_N_R_egisters)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r2)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl_label
C_sne_setF_req_18
' C_sne_setF_req_17 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export sne_setVolume

 alignl_label
C_sne_setV_olume ' <symbol:sne_setVolume>
 alignl_p1
 long I32_PSHM + $500000<<S32 ' save registers
 alignl_p1
 long I32_LODI + (@C_S_N_R_egisters)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sne_setV_olume_21)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_SHLI + (r22)<<D16A + (1)<<S16A ' SHLI4 reg coni
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODI + (@C_S_N_R_egisters)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r2)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl_label
C_sne_setV_olume_21
' C_sne_setV_olume_20 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export sne_play

 alignl_label
C_sne_play ' <symbol:sne_play>
 alignl_p1
 long I32_PSHM + $500000<<S32 ' save registers
 alignl_p1
 long I32_LODI + (@C_S_N_R_egisters)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sne_play_24)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A
 word I16A_SHLI + (r22)<<D16A + (1)<<S16A ' SHLI4 reg coni
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODI + (@C_S_N_R_egisters)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOV + (r20)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A
 word I16A_SHLI + (r22)<<D16A + (1)<<S16A ' SHLI4 reg coni
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODI + (@C_S_N_R_egisters)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl_label
C_sne_play_24
' C_sne_play_23 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Import _registry
' end
