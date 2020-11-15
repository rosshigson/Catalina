'#line 1 "thread_yield.e"











'
' LMM PASM implementations of fundamental multi-threading operations
'
' void * _thread_yield();
'    force a context switch
'
' Catalina Code

DAT ' code segment

' Catalina Import _thread_id

' Catalina Export _thread_yield

 alignl ' align long

C__thread_yield

 call #GET_KERNEL_LOCK  ' get kernel lock



 calld PA, #\LMM_force  ' force a context switch immediately





 PRIMITIVE(#RETN)
' end
