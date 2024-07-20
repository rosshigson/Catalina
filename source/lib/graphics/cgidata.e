' The use of PRIMITIVE allows the library source files to be (mostly) 
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.
#ifndef PRIMITIVE
#ifdef P2
#ifdef NATIVE
#define PRIMITIVE(op) calld PA, op
#else
#define PRIMITIVE(op) jmp op
#endif
#else
#define PRIMITIVE(op) jmp op
#endif
#endif

'
' Return data about the CGI Block (load it from High Hub RAM)
'

' Catalina Code

DAT ' code segment

' Catalina Export _cgi_data

 alignl ' align long

C__cgi_data
#ifdef P2
#ifdef NATIVE
 mov RI, ##CGI_DATA
#else
 PRIMITIVE(#LODL)
 long CGI_DATA
#endif
#else
 PRIMITIVE(#LODL)
 long $7E40         ' !!! NOTE: Must Match Catalina_Common !!!
#endif
 rdlong r0, RI
 PRIMITIVE(#RETN)
' end
