'#line 1 "cgidata.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












'
' Return data about the CGI Block (load it from High Hub RAM)
'

' Catalina Code

DAT ' code segment

' Catalina Export _cgi_data

 alignl ' align long

C__cgi_data


 mov RI, ##CGI_DATA








 rdlong r0, RI
 calld PA,#RETN
' end
