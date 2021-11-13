'#line 1 "pinr.e"











' Catalina Code

DAT ' code segment

' Catalina Export _pinr

 alignl ' align long

C__pinr
 testp r2 wc
 if_c mov r0, #1
 if_nc mov r0, #0
 PRIMITIVE(#RETN)
' end

