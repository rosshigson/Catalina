' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

' Catalina Export __funccnt

 alignl_label
C___funccnt ' <symbol:__funccnt>
 long 0

' Catalina Export _clean

 alignl_label
C__clean ' <symbol:_clean>
 long $0

' Catalina Code

DAT ' code segment

 alignl_label
C_shlo_690edad5__calls_L000003 ' <symbol:_calls>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $d00000<<S32 ' save registers
 alignl_p1
 long I32_LODI + (@C___funccnt)<<S32
 word I16A_MOV + (r23)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 alignl_p1
 long I32_JMPA + (@C_shlo_690edad5__calls_L000003_6)<<S32 ' JUMPV addrg
 alignl_label
C_shlo_690edad5__calls_L000003_5
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C___functab ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16B_CALI' CALL indirect
 alignl
 alignl_label
C_shlo_690edad5__calls_L000003_6
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_shlo_690edad5__calls_L000003_5)<<S32 ' GEI4 reg coni
' C_shlo_690edad5__calls_L000003_4 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export exit

 alignl_label
C_exit ' <symbol:exit>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_CALA + (@C_shlo_690edad5__calls_L000003)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODI + (@C__clean)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_exit_9)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODI + (@C__clean)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16B_CALI' CALL indirect
 alignl
 alignl_label
C_exit_9
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__exit)<<S32 ' CALL addrg
' C_exit_8 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import _exit

' Catalina Data

DAT ' uninitialized data segment

' Catalina Export __functab

 alignl_label
C___functab ' <symbol:__functab>
 byte 0[128]

' Catalina Code

DAT ' code segment
' end
