'#line 1 "yield.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.












'
' LMM PASM implementations of fundamental multi-threading operations
'
' void * _thread_yield();
'    force a context switch
'
' NOTE: If this code changes, check memory_lock.e, which has the same code.
'
' Catalina Code

DAT ' code segment

' Catalina Import _thread_id

' Catalina Export _thread_yield

 alignl ' align long

C__thread_yield








 lockset lock wc        ' if we get a lock ...
 if_nc jmp #LMM_force   ' ... force a context switch immediately

 jmp #RETN
' end
