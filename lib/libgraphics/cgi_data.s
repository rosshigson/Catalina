'#line 1 "cgi_data.e"


' Until we modify the P1 compilation process to include calling spinpp,
' we must explicitly define this here and preprocess all the library
' files to create different libraries for the P1 and the P2. This allows
' us to keep the library source files (mostly) identical for the P1 and P2.





'
' Return data about the CGI Block (load it from High Hub RAM)
'

' Catalina Code

DAT ' code segment

' Catalina Export _cgi_data

 alignl ' align long

C__cgi_data








 jmp #LODL
 long $7E44         ' !!! NOTE: Must Match Catalina_Common !!!

 rdlong r0, RI
 jmp #RETN
' end
