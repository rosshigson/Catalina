'#line 1 "lockchk.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _lockchk

 alignl ' align long

C__lockchk
 mov r0, r2
 lockrel r0 wc
 bitc r0, #31
 jmp #RETN
 ' end

