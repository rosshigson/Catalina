' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export gk_present

 alignl ' align long
C_gk_present ' <symbol:gk_present>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $400000<<S32 ' save registers
 alignl ' align long
 long I32_LODI + (@C_kb_block)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_gk_present_3)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C_gk_initialize)<<S32 ' CALL addrg
 alignl ' align long
C_gk_present_3
 alignl ' align long
 long I32_LODI + (@C_kb_block)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_gk_present_5)<<S32 ' EQU4 reg coni
 alignl ' align long
 long I32_LODI + (@C_kb_block)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r0)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_JMPA + (@C_gk_present_2)<<S32 ' JUMPV addrg
 alignl ' align long
C_gk_present_5
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
C_gk_present_2
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Import gk_initialize

' Catalina Import kb_block
' end
