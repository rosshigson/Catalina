'#line 1 "poll_PAT.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _poll_PAT

 alignl ' align long

C__poll_P_A_T_
   POLLPAT wc
 if_c mov r0, #1
 if_nc mov r0, #0
 jmp #RETN
' end

