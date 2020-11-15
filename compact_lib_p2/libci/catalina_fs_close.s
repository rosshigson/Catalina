' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _close

 alignl ' align long
C__close ' <symbol:_close>
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
' C__close_2 ' (symbol refcount = 0)
 word I16B_RETN
 alignl ' align long
 alignl ' align long
' end
