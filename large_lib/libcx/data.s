' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

' Catalina Export __iotab

 long ' align long
C___iotab ' <symbol:__iotab>
 long 0
 long 0
 long 1
 long 0
 long $0
 long $0
 long 0
 long 1
 long 2
 long 0
 long $0
 long $0
 long 0
 long 2
 long 6
 long 0
 long $0
 long $0
 byte 0[120]

' Catalina Export __iolock

 long ' align long
C___iolock ' <symbol:__iolock>
 long -1

' Catalina Export __ioused

 long ' align long
C___ioused ' <symbol:__ioused>
 long 0

' Catalina Data

DAT ' uninitialized data segment

' Catalina Export __iostdb

 long ' align long
C___iostdb ' <symbol:__iostdb>
 byte 0[256]

' Catalina Export __iobuff

 long ' align long
C___iobuff ' <symbol:__iobuff>
 byte 0[512]

' Catalina Code

DAT ' code segment
' end
