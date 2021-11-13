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

 call #TRY_KERNEL_LOCK  ' if we get kernel lock ...

 if_c calld PA, #\NMM_force  ' ... release kernel lock and force a context switch







 PRIMITIVE(#RETN)
' end
