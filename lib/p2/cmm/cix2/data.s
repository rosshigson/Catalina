' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

' Catalina Export __stdin

 alignl_label
C___stdin ' <symbol:__stdin>
 long 0
 long 0
 long 1
 long 0
 long $0
 long $0

' Catalina Export __stdout

 alignl_label
C___stdout ' <symbol:__stdout>
 long 0
 long 1
 long 2
 long 0
 long $0
 long $0

' Catalina Export __stderr

 alignl_label
C___stderr ' <symbol:__stderr>
 long 0
 long 2
 long 66
 long 0
 long $0
 long $0

' Catalina Export __iotab

 alignl_label
C___iotab ' <symbol:__iotab>
 long @C___stdin
 long @C___stdout
 long @C___stderr
 long $0
 byte 0[240]

' Catalina Code

DAT ' code segment
' end
