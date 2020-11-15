'#line 1 "release_lock.e"











' Catalina Code

DAT ' code segment

' Catalina Export _release_lock

 alignl ' align long

C__release_lock

 lockrel r2
 bitl lockbits, r2





 PRIMITIVE(#RETN)
' end

