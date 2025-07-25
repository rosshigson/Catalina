' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export getlfnum

 alignl_label
C_getlfnum ' <symbol:getlfnum>
 alignl_p1
 long I32_NEWF + 84<<S32
 alignl_p1
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (80)<<S32 ' reg ARG coni
 word I16B_LODF + ((-88)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_safe_gets)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_MOVI + RI<<D32 + (80)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRBE + (@C_getlfnum_2)<<S32 ' LEI4 reg coni
 alignl_p1
 long I32_LODS + (r19)<<D32S + ((80)&$7FFFF)<<S32 ' reg <- cons
 alignl_label
C_getlfnum_2
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r5)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16B_LODF + ((-88)&$1FF)<<S16B
 word I16B_PSHL ' stack ARG ADDRLi
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C__scanf_getll)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
' C_getlfnum_1 ' (symbol refcount = 0)
 word I16B_POPM + 21<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import _scanf_getll

' Catalina Import safe_gets
' end
