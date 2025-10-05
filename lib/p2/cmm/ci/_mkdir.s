' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _mkdir

 alignl_label
C__mkdir ' <symbol:_mkdir>
 alignl_p1
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
' C__mkdir_2 ' (symbol refcount = 0)
 word I16B_RETN
 alignl_p1
 alignl_p1

' Catalina Export _mkdirr

 alignl_label
C__mkdirr ' <symbol:_mkdirr>
 alignl_p1
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
' C__mkdirr_3 ' (symbol refcount = 0)
 word I16B_RETN
 alignl_p1
 alignl_p1
' end
