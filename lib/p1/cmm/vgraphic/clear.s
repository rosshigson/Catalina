' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export g_clear

 alignl_label
C_g_clear ' <symbol:g_clear>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_CALA + (@C_g_flush)<<S32 ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (2)<<S16A ' reg ARG coni
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C__db_setcommand)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_g_clear_1 ' (symbol refcount = 0)
 word I16B_RETF + 0<<S32
 alignl_p1

' Catalina Import _db_setcommand

' Catalina Import g_flush
' end
