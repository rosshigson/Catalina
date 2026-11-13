' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Data

DAT ' uninitialized data segment

' Catalina Export _malloc_store

 alignl ' align long
C__malloc_store ' <symbol:_malloc_store>
 byte 0[128]

' Catalina Export ml_last

 alignl ' align long
C_ml_last ' <symbol:ml_last>
 byte 0[4]

' Catalina Code

DAT ' code segment
' end
