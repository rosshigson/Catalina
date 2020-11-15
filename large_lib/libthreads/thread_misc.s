'#line 1 "thread_misc.e"


' Until we modify the P1 compilation process to include calling spinpp,
' we must explicitly define this here and preprocess all the library
' files to create different libraries for the P1 and the P2. This allows
' us to keep the library source files (mostly) identical for the P1 and P2.







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
'    r0 = lock in use (0 .. 7)
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
'    by calling _thread_get_lock() and then _lockclr() on the result)
' on entry:
'    r2 = lock to use (0 .. 7)
'
'
' Catalina Code

DAT ' code segment

' Catalina Export _thread_set_lock

 alignl ' align long

C__thread_set_lock
 mov lock, r2        ' set lock to use
 jmp #RETN
' end
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

