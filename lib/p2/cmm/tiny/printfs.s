' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export trivial_printf

 alignl_label
C_trivial_printf ' <symbol:trivial_printf>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $400000<<S32 ' save registers
 word I16B_LODF + 8<<S16B
 alignl_p1
 long I32_SPILL + r2<<D32 ' spill reg (varadic)
 alignl_p1
 long I32_SPILL + r3<<D32 ' spill reg (varadic)
 alignl_p1
 long I32_SPILL + r4<<D32 ' spill reg (varadic)
 alignl_p1
 long I32_SPILL + r5<<D32 ' spill reg (varadic)
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- addrl16
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C__doprintf_s)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_trivial_printf_1 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import _doprintf_s
' end
