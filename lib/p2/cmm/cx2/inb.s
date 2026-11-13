' Catalina Code

DAT ' code segment

' Catalina Export _inb

 alignl ' align long

C__inb
 word I16B_PASM
 alignl ' align long
 mov r0, INB
 word I16B_RETN
' end

