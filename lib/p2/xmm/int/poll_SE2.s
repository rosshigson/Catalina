'#line 1 "poll_SE2.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _poll_SE2

 alignl ' align long

C__poll_S_E_2
   POLLSE2 wc
 if_c mov r0, #1
 if_nc mov r0, #0
 jmp #RETN
' end

