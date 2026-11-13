' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _mount

 alignl_label
C__mount ' <symbol:_mount>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C___vol ' reg <- addrg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (2)
 alignl_p1
 long I32_LODA + (@C___vol)<<S32
 word I16A_WRBYTE + (r20)<<D16A + RI<<S16A ' ASGNU1 addrg reg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r4)<<D16B
 alignl_p1
 long @C___fs ' reg ARG ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_f_mount)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__mount_2)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C__mount_1)<<S32 ' JUMPV addrg
 alignl_label
C__mount_2
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C__mount_1
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import __fs

' Catalina Import f_mount

' Catalina Import __vol
' end
