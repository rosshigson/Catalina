' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export s_padchar

 alignl ' align long
C_s_padchar ' <symbol:s_padchar>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_s_padchar_5)<<S32 ' JUMPV addrg
 alignl ' align long
C_s_padchar_2
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_s_tx)<<S32 ' CALL addrg
' C_s_padchar_3 ' (symbol refcount = 0)
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C_s_padchar_5
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r23)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s_padchar_2)<<S32 ' LTU4 reg reg
' C_s_padchar_1 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Import s_tx
' end
