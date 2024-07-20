'#line 1 "misc.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.














' On the P2, where the code is assembled monolithically, we do not need to
' define these - in fact doing so confuses the assembler.

CON

' NOTE: The following constants MUST MATCH the values in the kernel !!!

LMM_force  = $18d
lock       = $195
TP         = $196
reg        = $199



'
' void * _thread_id();
'    return unique id of current thread
' on exit:
'    r0 = thread id
'
' Catalina Code

DAT ' code segment

' Catalina Export _thread_id

 alignl ' align long

C__thread_id
 mov r0, TP        ' return current thread id
 jmp #RETN
' end
'
' LMM PASM implementations of fundamental multi-threading operations
'
' int _thread_get_lock();
'    return lock allocated for context switching
' on exit:
'    r0 = lock in use (0 .. 7 on P1, 0 .. 15 on P2)
'
' Catalina Code

DAT ' code segment

' Catalina Export _thread_get_lock

 alignl ' align long

C__thread_get_lock
 mov r0, lock        ' return lock currently allocated
 jmp #RETN
' end
'
' void _thread_set_lock(int lock);
'    set lock to use for context switching (note this does not
'    release any previous lock - that must be done manually
'    by calling _thread_get_lock() and then _lockclr() on the result).
'    Also allocates a memory lock if one is not already in use.
' on entry:
'    r2 = thread lock to use (0 .. 7 on P1, 0 .. 15 on P2)
'
'
' Catalina Code

DAT ' code segment

' Catalina Export _thread_set_lock

' Catalina Import _locknew

' Catalina Import _memory_get_lock

' Catalina Import _memory_set_lock

 alignl ' align long

C__thread_set_lock
 mov lock, r2                      ' set thread lock to use
 jmp #CALA
 long @C__memory_get_lock
 cmps r0,#0 wc



 jmp #BRAE
 long @C__thread_set_lock_1       ' return if lock already set

 jmp #CALA
 long @C__locknew                 ' allocate a lock
 cmps r0,#0 wc



 jmp #BR_B
 long @C__thread_set_lock_1       ' return if no locks available

 mov r2,r0                        ' set allocated lock ...
 jmp #CALA
 long @C__memory_set_lock         ' ... as memory lock
C__thread_set_lock_1
 jmp #RETN
' end


' Catalina Code

DAT ' code segment

' void _thread_stall();
'    yield until the caller gets the kernel lock
' on entry: none
' on exit: none

' Catalina Export _thread_stall

DAT ' code segment

 alignl ' align long

C__thread_stall
       nop                     ' insert a NOP!
_thread_stall_0










       lockset lock wc         ' if we get kernel lock ...
 jmp #BRAE        '  ... then proceed
       long @_thread_stall_1
       jmp #LMM_force          ' otherwise force a context switch
 jmp #JMPA        ' repeat until we get kernel lock
       long @_thread_stall_0

_thread_stall_1
 jmp #RETN
' end C__thread_stall

' Catalina Code

DAT ' code segment

' Catalina Export _thread_allow

 alignl ' align long

C__thread_allow



 lockclr lock                 ' release kernel lock

 jmp #RETN
' end C__thread_allow


'
' thread_setup must exist on all platforms, since a call to it is generted
' by the Catalina code generator - but it only actually does anything in
' the COMPACT threaded kernel (see thread_switch_compact.c).
'

' Catalina Code

DAT ' code segment

' Catalina Export thread_setup

 alignl ' align long

C_thread_setup










 jmp #RETN

' end C_thread_setup

