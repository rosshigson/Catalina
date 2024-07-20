'
' Return data about the CGI Block (load it from High Hub RAM)
'

' Catalina Code

DAT ' code segment

' Catalina Export _cgi_data

 alignl ' align long

C__cgi_data
 alignl ' align long
#ifdef P2
#ifdef NATIVE
 long I32_LODI + CGI_DATA<<S32
#else
 long I32_LODI + $7E40<<S32 ' !!! NOTE: Must Match Catalina_Common !!!
#endif
#else
 long I32_LODI + $7E40<<S32 ' !!! NOTE: Must Match Catalina_Common !!!
#endif
 word I16A_MOV + r0<<D16A + RI<<S16A
 word I16B_RETN

' end
