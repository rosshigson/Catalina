'#line 1 "registry.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _registry

 alignl ' align long

C__registry









 jmp #LODL
 long $7FD0              ' !!! Note: MUST match Catalina_Common !!!
 mov r0, RI

 jmp #RETN
' end

