' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _create

 alignl ' align long
C__create ' <symbol:_create>
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
' C__create_2 ' (symbol refcount = 0)
 word I16B_RETN
 alignl ' align long
 alignl ' align long
' end
