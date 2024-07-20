'#line 1 "rellock.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _release_lock

 alignl ' align long

C__release_lock




 lockclr r2

 jmp #RETN
' end

