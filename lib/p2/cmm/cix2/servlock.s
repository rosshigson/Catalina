' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _set_service_lock

 alignl_label
C__set_service_lock ' <symbol:_set_service_lock>
 alignl_p1
 long I32_NEWF + 64<<S32
 alignl_p1
 long I32_PSHM + $fea800<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C__set_service_lock_3
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODF + ((-68)&$1FF)<<S16B
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
' C__set_service_lock_4 ' (symbol refcount = 0)
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_CMPSI + (r19)<<D16A + (16)<<S16A
 alignl_p1
 long I32_BR_B + (@C__set_service_lock_3)<<S32 ' LTI4 reg coni
 word I16A_MOVI + (r21)<<D16A + (1)<<S16A ' reg <- coni
 alignl_label
C__set_service_lock_7
 alignl_p1
 long I32_CALA + (@C__registry)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_SHLI + (r20)<<D16A + (1)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' SUBI/P
 word I16A_SUBS + (r15)<<D16A + (r20)<<S16A ' SUBI/P (3)
 alignl_p1
 long I32_CALA + (@C__registry)<<S32 ' CALL addrg
 word I16A_NEG + (r20)<<D16A + (r21)<<S16A ' NEGI4
 word I16A_SHLI + (r20)<<D16A + (1)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (2)
 word I16A_RDWORD + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU2 reg
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((127)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' BANDI/U
 word I16A_AND + (r17)<<D16A + (r20)<<S16A ' BANDI/U (3)
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRBE + (@C__set_service_lock_11)<<S32 ' LEI4 reg coni
 alignl_p1
 long I32_CALA + (@C__registry)<<S32 ' CALL addrg
 word I16A_NEG + (r20)<<D16A + (r21)<<S16A ' NEGI4
 word I16A_SHLI + (r20)<<D16A + (1)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (2)
 word I16A_RDWORD + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU2 reg
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_SARI + (r22)<<D16A + (7)<<S16A ' SHRI4 reg coni
 word I16A_MOVI + (r20)<<D16A + (31)<<S16A ' reg <- coni
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A ' BANDI/U
 word I16A_AND + (r11)<<D16A + (r20)<<S16A ' BANDI/U (3)
 word I16A_CMPSI + (r11)<<D16A + (16)<<S16A
 alignl_p1
 long I32_BR_B + (@C__set_service_lock_13)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_CALA + (@C__registry)<<S32 ' CALL addrg
 word I16A_NEG + (r20)<<D16A + (r21)<<S16A ' NEGI4
 word I16A_SHLI + (r20)<<D16A + (1)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (2)
 word I16A_RDWORD + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU2 reg
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A
 word I16A_SARI + (r13)<<D16A + (12)<<S16A ' SHRI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODF + ((-68)&$1FF)<<S16B
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__set_service_lock_15)<<S32 ' NEI4 reg reg
 word I16A_CMPSI + (r23)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C__set_service_lock_17)<<S32 ' LTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODF + ((-68)&$1FF)<<S16B
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r23)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C__set_service_lock_18)<<S32 ' JUMPV addrg
 alignl_label
C__set_service_lock_17
 alignl_p1
 long I32_CALA + (@C__locknew)<<S32 ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r13)<<S16A
 word I16A_SHLI + (r20)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODF + ((-68)&$1FF)<<S16B
 word I16A_MOV + (r18)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r0)<<D16A + (r20)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODF + ((-68)&$1FF)<<S16B
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__set_service_lock_19)<<S32 ' NEI4 reg reg
 alignl_p1
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C__set_service_lock_2)<<S32 ' JUMPV addrg
 alignl_label
C__set_service_lock_19
 alignl_label
C__set_service_lock_18
 alignl_label
C__set_service_lock_15
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_SHLI + (r22)<<D16A + (12)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r20)<<D16A + (r13)<<S16A
 word I16A_SHLI + (r20)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODF + ((-68)&$1FF)<<S16B
 word I16A_MOV + (r18)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_SHLI + (r20)<<D16A + (7)<<S16A ' SHLI4 reg coni
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16A_OR + (r22)<<D16A + (r17)<<S16A ' BORI/U (1)
 word I16A_WRWORD + (r22)<<D16A + (r15)<<S16A ' ASGNU2 reg reg
 alignl_label
C__set_service_lock_13
 alignl_label
C__set_service_lock_11
' C__set_service_lock_8 ' (symbol refcount = 0)
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (96)<<S32
 word I16A_CMPS + (r21)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRBE + (@C__set_service_lock_7)<<S32 ' LEI4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C__set_service_lock_2
 word I16B_POPM + 16<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import _locknew

' Catalina Import _registry
' end
