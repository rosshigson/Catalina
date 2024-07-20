' The use of PRIMITIVE allows the library source files to be (mostly) 
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.
#ifndef PRIMITIVE
#ifdef P2
#ifdef NATIVE
#define PRIMITIVE(op) calld PA,op
#else
#define PRIMITIVE(op) jmp op
#endif
#else
#define PRIMITIVE(op) jmp op
#endif
#endif

' Catalina Code

#ifndef P2
CON
MEM_LOCK = $7E44           ' !!! Note: MUST match Catalina_Common !!!
#endif

DAT ' code segment

' Catalina Export _memory_get_lock

 alignl ' align long

C__memory_get_lock
#ifdef P2
#ifdef NATIVE
 rdlong r0,##MEM_LOCK
#else
 PRIMITIVE(#LODL)
 long MEM_LOCK
 rdlong r0,RI
#endif
#else
 PRIMITIVE(#LODL)
 long MEM_LOCK
 rdlong r0,RI
#endif
 PRIMITIVE(#RETN)

' end C__memory_get_lock


' Catalina Export _memory_set_lock

 alignl ' align long

C__memory_set_lock
#ifdef P2
#ifdef NATIVE
 mov RI,##MEM_LOCK
#else
 PRIMITIVE(#LODL)
 long MEM_LOCK
#endif
#else
 PRIMITIVE(#LODL)
 long MEM_LOCK
#endif
 rdlong r0,RI
 wrlong r2,RI
 PRIMITIVE(#RETN)

' end C__memory_set_lock


' Catalina Export _memory_lock

 alignl ' align long

C__memory_lock
#ifdef P2
#ifdef NATIVE
 mov RI,##MEM_LOCK
#else
 PRIMITIVE(#LODL)
 long MEM_LOCK
#endif
 rdlong r2,RI 
 cmps r2, #0 wc              ' C = 1 if no lock currently in use
#ifdef NATIVE
 if_c jmp #@C__memory_lock_1 ' if no lock in use, just return
#else
 PRIMITIVE(#BR_B)
 long @C__memory_lock_1      ' if no lock in use, just return
#endif
C__memory_lock_0
        bith    lockbits, r2 wcz   ' have we acquired ...              
 if_nz  locktry r2 wc              ' ... both intra-cog and inter-cog locks?
 if_nc_and_nz  bitl lockbits, r2   ' true = if_c_and_nz, false = if_nc_or_z
#ifdef NATIVE
 if_c_and_nz  jmp #@C__memory_lock_1 ' if we got the lock just return
#else
 PRIMITIVE(#BRAE)
 long @C__memory_lock_2            ' if we failed to get the lock try again
 PRIMITIVE(#BR_Z)
 long @C__memory_lock_2            ' if we failed to get the lock try again
 PRIMITIVE(#JMPA)
 long @C__memory_lock_1            ' if we got the lock just return
#endif
C__memory_lock_2
#ifdef __CATALINA_libthreads
' NOTE: We would like to just call _thread_yield here, but we cannot 
'       import it unless we link with the thread library, so we don't
'       try to import it - we copy the relevant code instead:
 call #TRY_KERNEL_LOCK             ' if we get kernel lock ...
#ifdef NATIVE
 if_c calld PA,#\NMM_force        ' ... force a context switch immediately
#else
 if_c jmp #\LMM_force              ' ... force a context switch immediately
#endif
#endif
#ifdef NATIVE
 jmp #@C__memory_lock_0            ' keep trying
#else
 PRIMITIVE(#JMPA)
 long @C__memory_lock_0            ' keep trying
#endif
#else
 PRIMITIVE(#LODL)
 long MEM_LOCK
 rdlong r2,RI
 cmps r2,#0 wc             ' C = 1 if no lock currently in use
 PRIMITIVE(#BR_B)          ' if no lock in use just return
 long @C__memory_lock_1
C__memory_lock_0
 lockset r2 wc             ' C = 1 if we got the lock
 PRIMITIVE(#BRAE)          ' if we got the lock just return
 long @C__memory_lock_1
#ifdef __CATALINA_libthreads
' NOTE: We would like to just call _thread_yield here, but we cannot 
'       import it unless we link with the thread library, so we don't
'       try to import it - we copy the relevant code instead:
 lockset lock wc        ' if we get a lock ...
 if_nc jmp #LMM_force   ' ... force a context switch immediately
#endif
 PRIMITIVE(#JMPA)          ' keep trying
 long @C__memory_lock_0
#endif
C__memory_lock_1
 PRIMITIVE(#RETN)

' end C__memory_lock


' Catalina Export _memory_unlock

 alignl ' align long

C__memory_unlock
#ifdef P2
#ifdef NATIVE
 mov RI,##MEM_LOCK
#else
 PRIMITIVE(#LODL)
 long MEM_LOCK
#endif
 rdlong r2,RI wc             ' C = 1 if no lock currently in use
#ifdef NATIVE
 if_c jmp #@C__memory_unlock_1 ' return if no lock in use
#else
 PRIMITIVE(#BR_B)
 long @C__memory_unlock_1    ' return if no lock in use
#endif
 lockrel r2                  ' if a lock is in use ...
 bitl lockbits, r2           ' ... unlock it
#else
 PRIMITIVE(#LODL)
 long MEM_LOCK
 rdlong r2,RI
 cmps r2,#0 wc               ' C = 1 if no lock currently in use
 PRIMITIVE(#BR_B)
 long @C__memory_unlock_1    ' return if no lock in use
  lockclr r2                 ' if a lock is in use unlock it
#endif
C__memory_unlock_1
 PRIMITIVE(#RETN)

' end C__memory_unlock

