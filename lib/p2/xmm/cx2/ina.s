'#line 1 "ina.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _ina

 alignl ' align long

C__ina
 mov r0, INA
 jmp #RETN
' end

