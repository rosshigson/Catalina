' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_gk_state_key_state_L000004 ' <symbol:key_state>
 long $0

' Catalina Export gk_state

' Catalina Code

DAT ' code segment

 alignl ' align long
C_gk_state ' <symbol:gk_state>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODI + (@C_kb_block)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_gk_state_5)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C_gk_initialize)<<S32 ' CALL addrg
 alignl ' align long
C_gk_state_5
 alignl ' align long
 long I32_LODI + (@C_gk_state_key_state_L000004)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_gk_state_7)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_LODI + (@C_kb_block)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_LODA + (@C_gk_state_key_state_L000004)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 alignl ' align long
C_gk_state_7
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SARI + (r22)<<D16A + (5)<<S16A ' SHRI4 reg coni
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_gk_state_key_state_L000004)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOVI + (r20)<<D16A + (31)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r23)<<S16A ' BANDI/U (2)
 word I16A_SAR + (r22)<<D16A + (r20)<<S16A ' RSHI (1)
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' BANDI/U
 word I16A_AND + (r0)<<D16A + (r20)<<S16A ' BANDI/U (3)
' C_gk_state_2 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Import gk_initialize

' Catalina Import kb_block
' end
