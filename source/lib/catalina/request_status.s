'#line 1 "request_status.e"











' Catalina Code

DAT ' code segment

' Catalina Export _request_status

 alignl ' align long

C__request_status
 PRIMITIVE(#CALA)
 long @C__registry
 mov r4, r0
 sub r4, #(2*96)-(8*2*4) ' !!! NOTE: Must Match Catalina_Common !!!
 shl r2, #3
 add r4, r2
 rdlong r0, r4
 PRIMITIVE(#RETN)
' end

