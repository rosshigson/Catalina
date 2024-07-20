' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

' Catalina Export __stdin

 alignl ' align long
C___stdin ' <symbol:__stdin>
 long 0
 long 0
 long 1
 long 0
 long $0
 long $0

' Catalina Export __stdout

 alignl ' align long
C___stdout ' <symbol:__stdout>
 long 0
 long 1
 long 2
 long 0
 long $0
 long $0

' Catalina Export __stderr

 alignl ' align long
C___stderr ' <symbol:__stderr>
 long 0
 long 2
 long 66
 long 0
 long $0
 long $0

' Catalina Export __iotab

 alignl ' align long
C___iotab ' <symbol:__iotab>
 long @C___stdin
 long @C___stdout
 long @C___stderr
 long $0
 byte 0[64]

' Catalina Code

DAT ' code segment
' end
