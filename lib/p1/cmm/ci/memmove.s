' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export memmove

 alignl ' align long
C_memmove ' <symbol:memmove>
 alignl ' align long
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r2)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_memmove_2)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r20)<<D16A + (r23)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_memmove_4)<<S32 ' GTU4 reg reg
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A ' ADDI/P
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (3)
 word I16A_CMP + (r20)<<D16A + (r23)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_memmove_4)<<S32 ' LEU4 reg reg
 word I16A_ADDS + (r23)<<D16A + (r2)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r21)<<D16A + (r2)<<S16A ' ADDI/P (2)
 word I16A_ADDI + (r2)<<D16A + (1)<<S16A ' ADDU4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_memmove_7)<<S32 ' JUMPV addrg
 alignl ' align long
C_memmove_6
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' ADDI/P
 word I16A_ADDS + (r20)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r23)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r22)<<D16A + (r20)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C_memmove_7
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_memmove_6)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_memmove_5)<<S32 ' JUMPV addrg
 alignl ' align long
C_memmove_4
 word I16A_ADDI + (r2)<<D16A + (1)<<S16A ' ADDU4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_memmove_10)<<S32 ' JUMPV addrg
 alignl ' align long
C_memmove_9
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C_memmove_10
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_memmove_9)<<S32 ' NEU4 reg coni
 alignl ' align long
C_memmove_5
 alignl ' align long
C_memmove_2
 word I16A_MOV + (r0)<<D16A + (r4)<<S16A ' CVI, CVU or LOAD
' C_memmove_1 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long
' end
