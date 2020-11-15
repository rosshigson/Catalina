' Catalina Code

DAT ' code segment

' Catalina Export _get_status

 alignl ' align long

C__get_status
   word I16B_PASM
 alignl ' align long
   GETBRK r0 wcz
   word I16B_RETN
' end

