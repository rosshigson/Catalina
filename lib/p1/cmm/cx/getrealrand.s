' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl_label
C_getrealrand_cog_L000004 ' <symbol:cog>
 long -1

 alignl_label
C_getrealrand_request_block_L000006 ' <symbol:request_block>
 long $0

 alignl_label
C_getrealrand_last_random_L000008 ' <symbol:last_random>
 long 0

' Catalina Export getrealrand

' Catalina Code

DAT ' code segment

 alignl_label
C_getrealrand ' <symbol:getrealrand>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODI + (@C_getrealrand_cog_L000004)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_getrealrand_9)<<S32 ' NEI4 reg reg
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (32)<<S32 ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__locate_plugin)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODA + (@C_getrealrand_cog_L000004)<<S32
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl_p1
 long I32_LODI + (@C_getrealrand_cog_L000004)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_getrealrand_11)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_CALA + (@C__registry)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODI + (@C_getrealrand_cog_L000004)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_SHLI + (r20)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $ffffff ' reg <- con
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 alignl_p1
 long I32_LODA + (@C_getrealrand_request_block_L000006)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 alignl_label
C_getrealrand_11
 alignl_label
C_getrealrand_9
 alignl_p1
 long I32_LODI + (@C_getrealrand_request_block_L000006)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_getrealrand_13)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_JMPA + (@C_getrealrand_16)<<S32 ' JUMPV addrg
 alignl_label
C_getrealrand_15
 alignl_p1
 long I32_LODI + (@C_getrealrand_request_block_L000006)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_getrealrand_16
 word I16A_CMPSI + (r23)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_getrealrand_15)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_LODI + (@C_getrealrand_last_random_L000008)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPS + (r23)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_getrealrand_15)<<S32 ' EQI4 reg reg
 alignl_p1
 long I32_LODA + (@C_getrealrand_last_random_L000008)<<S32
 word I16A_WRLONG + (r23)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl_p1
 long I32_JMPA + (@C_getrealrand_14)<<S32 ' JUMPV addrg
 alignl_label
C_getrealrand_13
 alignl_p1
 long I32_CALA + (@C_getrand)<<S32 ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODA + (@C_getrealrand_last_random_L000008)<<S32
 word I16A_WRLONG + (r23)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl_label
C_getrealrand_14
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
' C_getrealrand_2 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import _locate_plugin

' Catalina Import _registry

' Catalina Import getrand
' end
