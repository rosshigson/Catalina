' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export bsearch

 alignl_label
C_bsearch ' <symbol:bsearch>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $eaa000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_JMPA + (@C_bsearch_5)<<S32 ' JUMPV addrg
 alignl_label
C_bsearch_4
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SHRI + (r22)<<D16A + (1)<<S16A ' SHRU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r15)<<D16A + (r23)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 word I16A_MOV + RI<<D16A + (r17)<<S16A
 word I16B_CALI
 alignl
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL indirect
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_bsearch_7)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_bsearch_3)<<S32 ' JUMPV addrg
 alignl_label
C_bsearch_7
 word I16A_CMPSI + (r13)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_bsearch_9)<<S32 ' LTI4 reg coni
 word I16A_MOV + (r23)<<D16A + (r19)<<S16A ' ADDI/P
 word I16A_ADDS + (r23)<<D16A + (r15)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A
 word I16A_SHRI + (r21)<<D16A + (1)<<S16A ' SHRU4 reg coni
 alignl_p1
 long I32_JMPA + (@C_bsearch_10)<<S32 ' JUMPV addrg
 alignl_label
C_bsearch_9
 word I16A_SHRI + (r21)<<D16A + (1)<<S16A ' SHRU4 reg coni
 alignl_label
C_bsearch_10
 alignl_label
C_bsearch_5
 word I16A_CMPI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_bsearch_4)<<S32 ' NEU4 reg coni
 word I16B_LODL + R0<<D16B
 alignl_p1
 long 0 ' RET con
 alignl_label
C_bsearch_3
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1
' end
