'#line 1 "reqstat.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.












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

