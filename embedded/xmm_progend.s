' Catalina Code

DAT ' code segment

'
' Final PASM goes here (if any) ...
'

' Catalina Data

DAT ' unitialized data segment

 long ' align long
'
' sbrkinit is used by sbrk - it must be after all variables and data
'
sbrkinit  ' heap starts here

 long 0 ' this long is required to workaround an obscure homespun bug!!!

