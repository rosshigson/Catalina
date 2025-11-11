' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl_label
C_s6n8_690edad6_next_L000003 ' <symbol:next>
 long $1

' Catalina Export rand

' Catalina Code

DAT ' code segment

 alignl_label
C_rand ' <symbol:rand>
 alignl_p1
 long I32_PSHM + $540000<<S32 ' save registers
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_s6n8_690edad6_next_L000003 ' reg <- addrg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $41c64e6d ' reg <- con
 word I16A_RDLONG + (r18)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long 12345 ' reg <- con
 word I16A_ADD + (r20)<<D16A + (r0)<<S16A ' ADDU (2)
 alignl_p1
 long I32_LODA + (@C_s6n8_690edad6_next_L000003)<<S32
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_SHRI + (r22)<<D16A + (16)<<S16A ' SHRU4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long 32767 ' reg <- con
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
' C_rand_4 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export srand

 alignl_label
C_srand ' <symbol:srand>
 alignl_p1
 long I32_LODA + (@C_s6n8_690edad6_next_L000003)<<S32
 word I16A_WRLONG + (r2)<<D16A + RI<<S16A ' ASGNU4 addrg reg
' C_srand_5 ' (symbol refcount = 0)
 word I16B_RETN
 alignl_p1
 alignl_p1
' end
