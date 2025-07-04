' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

' Catalina Export __pstart

 alignl_label
C___pstart ' <symbol:__pstart>
 long $ffffffff

' Catalina Data

DAT ' uninitialized data segment

' Catalina Export __vi

 alignl_label
C___vi ' <symbol:__vi>
 byte 0[52]

' Catalina Export __fdtab

 alignl_label
C___fdtab ' <symbol:__fdtab>
 byte 0[80]

' Catalina Code

DAT ' code segment
' end
