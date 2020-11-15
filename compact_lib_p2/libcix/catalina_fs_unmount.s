' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _unmount

 alignl ' align long
C__unmount ' <symbol:_unmount>
 alignl ' align long
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOVI + (r23)<<D16A + (3)<<S16A ' reg <- coni
 alignl ' align long
C__unmount_3
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C___fdtab+9 ' reg <- addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__unmount_7)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C__unmount_2)<<S32 ' JUMPV addrg
 alignl ' align long
C__unmount_7
' C__unmount_4 ' (symbol refcount = 0)
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_CMPSI + (r23)<<D16A + (8)<<S16A
 alignl ' align long
 long I32_BR_B + (@C__unmount_3)<<S32 ' LTI4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 alignl ' align long
 long I32_LODA + (@C___pstart)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
C__unmount_2
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

' Catalina Import __pstart

' Catalina Import __fdtab
' end
