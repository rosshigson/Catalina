'#line 1 "pollatn.e"











' Catalina Code

DAT ' code segment

' Catalina Export _pollatn

 alignl ' align long

C__pollatn
 pollatn wc
 if_c mov r0,#1
 if_nc mov r0,#0
 PRIMITIVE(#RETN)
' end
