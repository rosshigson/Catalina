' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export sd_sectread

 alignl_label
C_sd_sectread ' <symbol:sd_sectread>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 alignl_p1
 long I32_LODA + (@C_berry_p2_sd_read_diag_phase)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODA + (@C_berry_p2_sd_read_diag_token)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_MOVI + (r4)<<D32 + (40)<<S32 ' reg ARG coni
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C__long_service_2)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_LODA + (@C_berry_p2_sd_read_diag_response)<<S32
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODA + (@C_berry_p2_sd_read_diag_token)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl_p1
 long I32_LODI + (@C_berry_p2_sd_read_diag_response)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
' C_sd_sectread_2 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Data

DAT ' uninitialized data segment

' Catalina Export berry_p2_sd_read_diag_token

 alignl_label
C_berry_p2_sd_read_diag_token ' <symbol:berry_p2_sd_read_diag_token>
 byte 0[4]

' Catalina Export berry_p2_sd_read_diag_response

 alignl_label
C_berry_p2_sd_read_diag_response ' <symbol:berry_p2_sd_read_diag_response>
 byte 0[4]

' Catalina Export berry_p2_sd_read_diag_phase

 alignl_label
C_berry_p2_sd_read_diag_phase ' <symbol:berry_p2_sd_read_diag_phase>
 byte 0[4]

' Catalina Code

DAT ' code segment

' Catalina Import _long_service_2

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment
' end
