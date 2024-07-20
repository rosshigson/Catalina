' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export tzset

 alignl ' align long
C_tzset ' <symbol:tzset>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_CALA + (@C__tzset)<<S32 ' CALL addrg
' C_tzset_1 ' (symbol refcount = 0)
 word I16B_RETF + 0<<S32
 alignl ' align long

' Catalina Import _tzset
' end
