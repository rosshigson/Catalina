' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _lseek

 alignl ' align long
C__lseek ' <symbol:_lseek>
 alignl ' align long
 long I32_NEWF + 512<<S32
 alignl ' align long
 long I32_PSHM + $fc0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
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
 long I32_BRNZ + (@C__lseek_3)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C__lseek_2)<<S32 ' JUMPV addrg
 alignl ' align long
C__lseek_3
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__lseek_6)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODF + ((-512)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C___fdtab ' reg <- addrg
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r4)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_D_F_S__S_eek)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C__lseek_7)<<S32 ' JUMPV addrg
 alignl ' align long
C__lseek_6
 word I16A_CMPSI + (r19)<<D16A + (2)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__lseek_8)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODF + ((-512)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C___fdtab+16 ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r20)<<S16A ' ADDU
 word I16A_ADD + (r3)<<D16A + (r18)<<S16A ' ADDU (3)
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C___fdtab ' reg <- addrg
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r4)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_D_F_S__S_eek)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C__lseek_9)<<S32 ' JUMPV addrg
 alignl ' align long
C__lseek_8
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODF + ((-512)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C___fdtab+24 ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r20)<<S16A ' ADDU
 word I16A_ADD + (r3)<<D16A + (r18)<<S16A ' ADDU (3)
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C___fdtab ' reg <- addrg
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r4)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_D_F_S__S_eek)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C__lseek_9
 alignl ' align long
C__lseek_7
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C___fdtab+24 ' reg <- addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C__lseek_2
 word I16B_POPM + $180<<S16B ' restore registers, do not pop frame, do not return
 alignl ' align long
 long I32_RETF + 512<<S32
 alignl ' align long

' Catalina Import __fdtab

' Catalina Import DFS_Seek
' end
