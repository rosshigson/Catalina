' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_sjjo_67e346cb_charT_oI_nt_L000001 ' <symbol:charToInt>
 alignl ' align long
 long I32_PSHM + $500000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_sjjo_67e346cb_charT_oI_nt_L000001_3)<<S32 ' LTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_SUBSI + (r22)<<D16A + (7)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_sjjo_67e346cb_charT_oI_nt_L000001_3
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (15)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_sjjo_67e346cb_charT_oI_nt_L000001_5)<<S32 ' LEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_sjjo_67e346cb_charT_oI_nt_L000001_5
 word I16A_MOV + (r0)<<D16A + (r2)<<S16A ' CVUI
 word I16B_TRN1 + (r0)<<D16B ' zero extend
' C_sjjo_67e346cb_charT_oI_nt_L000001_2 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

' Catalina Export _scanf_getll

 alignl ' align long
C__scanf_getll ' <symbol:_scanf_getll>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $faac00<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r15)<<D16B ' zero extend
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__scanf_getll_8)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (45)<<S32
 word I16A_CMPS + (r15)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__scanf_getll_11)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r10)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C__scanf_getll_12)<<S32 ' JUMPV addrg
 alignl ' align long
C__scanf_getll_11
 word I16A_MOVI + (r10)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C__scanf_getll_12
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r10)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_MOVI + RI<<D32 + (43)<<S32
 word I16A_CMPS + (r15)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__scanf_getll_15)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (45)<<S32
 word I16A_CMPS + (r15)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__scanf_getll_13)<<S32 ' NEI4 reg coni
 alignl ' align long
C__scanf_getll_15
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
C__scanf_getll_13
 alignl ' align long
C__scanf_getll_8
 word I16A_MOVI + (r13)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r11)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C__scanf_getll_17)<<S32 ' JUMPV addrg
 alignl ' align long
C__scanf_getll_16
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r15)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (48)<<S32
 word I16A_CMPS + (r15)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + (@C__scanf_getll_21)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (57)<<S32
 word I16A_CMPS + (r15)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRBE + (@C__scanf_getll_19)<<S32 ' LEI4 reg coni
 alignl ' align long
C__scanf_getll_21
 word I16A_CMPSI + (r21)<<D16A + (16)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__scanf_getll_24)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (65)<<S32
 word I16A_CMPS + (r15)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + (@C__scanf_getll_23)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (70)<<S32
 word I16A_CMPS + (r15)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRBE + (@C__scanf_getll_19)<<S32 ' LEI4 reg coni
 alignl ' align long
C__scanf_getll_23
 alignl ' align long
 long I32_MOVI + RI<<D32 + (97)<<S32
 word I16A_CMPS + (r15)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + (@C__scanf_getll_24)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (102)<<S32
 word I16A_CMPS + (r15)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRBE + (@C__scanf_getll_19)<<S32 ' LEI4 reg coni
 alignl ' align long
C__scanf_getll_24
 word I16A_CMPSI + (r11)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__scanf_getll_18)<<S32 ' NEI4 reg coni
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C__scanf_getll_7)<<S32 ' JUMPV addrg
 alignl ' align long
C__scanf_getll_19
 word I16A_MOVI + (r11)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_sjjo_67e346cb_charT_oI_nt_L000001)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r13)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' ADDU
 word I16A_ADD + (r13)<<D16A + (r22)<<S16A ' ADDU (3)
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
C__scanf_getll_17
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A
 word I16A_SUBI + (r19)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__scanf_getll_16)<<S32 ' NEU4 reg coni
 alignl ' align long
C__scanf_getll_18
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__scanf_getll_27)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16B_CPL + (r22)<<D16B ' BCOMU4
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 alignl ' align long
 long I32_JMPA + (@C__scanf_getll_28)<<S32 ' JUMPV addrg
 alignl ' align long
C__scanf_getll_27
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_WRLONG + (r22)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 alignl ' align long
C__scanf_getll_28
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
C__scanf_getll_7
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long
' end
