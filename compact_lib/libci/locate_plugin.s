' Catalina Code

DAT ' code segment

' Catalina Export _locate_plugin

' Catalina Import _registry

 alignl ' align long

C__locate_plugin
 alignl ' align long
 long I32_CALA + @C__registry<<S32
 word I16A_MOV + r4<<D16A + r0<<S16A
 word I16A_MOVI + r0<<D16A + 0<<S16A
 alignl ' align long
C__locate_plugin_L1
 word I16A_RDLONG + r3<<D16A + r4<<S16A
 word I16A_SHRI + r3<<D16A + 24<<S16A
 word I16A_CMP + r3<<D16A + r2<<S16A
 alignl ' align long
 long I32_BR_Z + @C__locate_plugin_L2<<S32
 word I16A_ADDI + r4<<D16A + 4<<S16A
 word I16A_ADDI + r0<<D16A + 1<<S16A
 word I16A_MOVI + RI<<D16A + 8<<S16A
 word I16A_CMP + r0<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + @C__locate_plugin_L1<<S32
 word I16A_MOVI + RI<<D16A + 1<<S16A
 word I16A_NEG + r0<<D16A + RI<<S16A
 alignl ' align long
C__locate_plugin_L2
 word I16B_RETN
' end

