'#line 1 "waitcnt.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _waitcnt

 alignl ' align long

C__waitcnt

 mov r0, #0
 addct1 r0, r2
 waitct1



 calld PA,#RETN
' end

