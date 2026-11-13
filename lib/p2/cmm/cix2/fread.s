' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export fread

 alignl_label
C_fread ' <symbol:fread>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $faac00<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r15)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r10)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_CMPI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_fread_2)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_JMPA + (@C_fread_5)<<S32 ' JUMPV addrg
 alignl_label
C_fread_4
 word I16A_MOV + (r11)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_fread_7
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r0)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_fread_10)<<S32 ' EQI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_JMPA + (@C_fread_11)<<S32 ' JUMPV addrg
 alignl_label
C_fread_10
 word I16A_MOV + (r0)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_fread_1)<<S32 ' JUMPV addrg
 alignl_label
C_fread_11
' C_fread_8 ' (symbol refcount = 0)
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_fread_7)<<S32 ' NEU4 reg coni
 word I16A_ADDI + (r10)<<D16A + (1)<<S16A ' ADDU4 reg coni
 alignl_label
C_fread_5
 word I16A_CMP + (r10)<<D16A + (r19)<<S16A
 alignl_p1
 long I32_BR_B + (@C_fread_4)<<S32 ' LTU4 reg reg
 alignl_label
C_fread_2
 word I16A_MOV + (r0)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_fread_1
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import getc
' end
