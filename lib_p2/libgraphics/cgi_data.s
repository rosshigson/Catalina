'#line 1 "cgi_data.e"











'
' Return data about the CGI Block (load it from High Hub RAM)
'

' Catalina Code

DAT ' code segment

' Catalina Export _cgi_data

 alignl ' align long

C__cgi_data




 PRIMITIVE(#LODL)
 long CGI_DATA





 rdlong r0, RI
 PRIMITIVE(#RETN)
' end
