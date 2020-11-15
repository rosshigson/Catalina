'#line 1 "locktry.e"











' Catalina Code

DAT ' code segment

' Catalina Export _locktry

 alignl ' align long

C__locktry
 locktry r2 wc
 if_c mov r0, #1
 if_nc mov r0, #0
 PRIMITIVE(#RETN)
 ' end

