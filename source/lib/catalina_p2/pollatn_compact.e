' Catalina Code

DAT ' code segment

' Catalina Export _pollatn

 alignl ' align long

C__pollatn
 word I16B_EXEC
 alignl ' align long
 pollatn wc
 if_c mov r0,#1
 if_nc mov r0,#0
 jmp #EXEC_STOP
 word I16B_RETN
' end
