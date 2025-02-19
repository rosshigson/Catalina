' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export s_hex

 alignl ' align long
C_s_hex ' <symbol:s_hex>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_CMPSI + (r21)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_s_hex_2)<<S32 ' GEI4 reg coni
 word I16A_MOVI + (r21)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
C_s_hex_2
 word I16A_CMPSI + (r21)<<D16A + (8)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_s_hex_4)<<S32 ' LEI4 reg coni
 word I16A_MOVI + (r21)<<D16A + (8)<<S16A ' reg <- coni
 alignl ' align long
C_s_hex_4
 word I16A_MOVI + (r22)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_SUBS + (r22)<<D16A + (r21)<<S16A ' SUBI/P (1)
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_SHL + (r23)<<D16A + (r22)<<S16A ' LSHI/U (1)
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_s_hex_9)<<S32 ' JUMPV addrg
 alignl ' align long
C_s_hex_6
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHRI + (r22)<<D16A + (28)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r19)<<D16A + (9)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_s_hex_10)<<S32 ' LEI4 reg coni
 word I16A_ADDSI + (r19)<<D16A + (7)<<S16A ' ADDI4 reg coni
 alignl ' align long
C_s_hex_10
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_s_tx)<<S32 ' CALL addrg
 word I16A_SHLI + (r23)<<D16A + (4)<<S16A ' SHLU4 reg coni
' C_s_hex_7 ' (symbol refcount = 0)
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C_s_hex_9
 word I16A_CMPS + (r17)<<D16A + (r21)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s_hex_6)<<S32 ' LTI4 reg reg
' C_s_hex_1 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Import s_tx
' end
