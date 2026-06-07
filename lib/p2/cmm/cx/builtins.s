' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export __builtin_popcount

 alignl_label
C___builtin_popcount ' <symbol:__builtin_popcount>
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C___builtin_popcount_3)<<S32 ' JUMPV addrg
 alignl_label
C___builtin_popcount_2
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r2)<<S16A ' BANDI/U (2)
 word I16A_ADDS + (r23)<<D16A + (r22)<<S16A ' ADDI/P (1)
 word I16A_SHRI + (r2)<<D16A + (1)<<S16A ' SHRU4 reg coni
 alignl_label
C___builtin_popcount_3
 word I16A_CMPI + (r2)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C___builtin_popcount_2)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
' C___builtin_popcount_1 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export __builtin_ffs

 alignl_label
C___builtin_ffs ' <symbol:__builtin_ffs>
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r21)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_CMPI + (r23)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C___builtin_ffs_9)<<S32 ' NEU4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C___builtin_ffs_5)<<S32 ' JUMPV addrg
 alignl_label
C___builtin_ffs_8
 word I16A_SHRI + (r23)<<D16A + (1)<<S16A ' SHRU4 reg coni
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C___builtin_ffs_9
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r23)<<S16A ' BANDI/U (2)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C___builtin_ffs_8)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_label
C___builtin_ffs_5
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1
' end
