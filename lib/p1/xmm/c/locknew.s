'#line 1 "locknew.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _locknew

 alignl ' align long

C__locknew
 locknew r0 wc
 if_c neg r0, #1
 jmp #RETN
' end

