'#line 1 "request_status.e"


' Until we modify the P1 compilation process to include calling spinpp,
' we must explicitly define this here and preprocess all the library
' files to create different libraries for the P1 and the P2. This allows
' us to keep the library source files (mostly) identical for the P1 and P2.





' Catalina Code

DAT ' code segment

' Catalina Export _request_status

 alignl ' align long

C__request_status
 jmp #CALA
 long @C__registry
 mov r4, r0
 sub r4, #(2*96)-(8*2*4) ' !!! NOTE: Must Match Catalina_Common !!!
 shl r2, #3
 add r4, r2
 rdlong r0, r4
 jmp #RETN
' end

