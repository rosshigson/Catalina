' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _unlink

 alignl_label
C__unlink ' <symbol:_unlink>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODA + (@C___fs)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__unlink_2)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C___vol ' reg ARG ADDRG
 word I16B_LODL + (r4)<<D16B
 alignl_p1
 long @C___fs ' reg ARG ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_f_mount)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__unlink_4)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C__unlink_1)<<S32 ' JUMPV addrg
 alignl_label
C__unlink_4
 alignl_label
C__unlink_2
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_f_unlink)<<S32 ' CALL addrg
 word I16A_CMPI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__unlink_6)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C__unlink_1)<<S32 ' JUMPV addrg
 alignl_label
C__unlink_6
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C__unlink_1
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import f_unlink

' Catalina Import __vol

' Catalina Import f_mount

' Catalina Import __fs
' end
