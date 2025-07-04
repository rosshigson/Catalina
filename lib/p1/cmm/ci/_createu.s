' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _create_unmanaged

 alignl_label
C__create_unmanaged ' <symbol:_create_unmanaged>
 alignl_p1
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
' C__create_unmanaged_2 ' (symbol refcount = 0)
 word I16B_RETN
 alignl_p1
 alignl_p1
' end
