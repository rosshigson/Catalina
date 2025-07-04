' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export g_flush

 alignl_label
C_g_flush ' <symbol:g_flush>
 alignl_p1
 long I32_NEWF + 0<<S32
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (14)<<S16A ' reg ARG coni
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C__setcommand)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_g_flush_1 ' (symbol refcount = 0)
 word I16B_RETF + 0<<S32
 alignl_p1

' Catalina Import _setcommand
' end
