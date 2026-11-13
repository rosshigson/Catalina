' Catalina Code

#ifndef P2
CON
MEM_LOCK = $7E44           ' !!! Note: MUST match Catalina_Common !!!
#endif

'
' WARNING - The following code only supports the compact memory model.
'           See memory_lock.e for all other memory model versions
'

DAT ' code segment


' Catalina Export _memory_get_lock

 alignl ' align long

C__memory_get_lock
 alignl ' align long
 long I32_LODA + MEM_LOCK<<S32
 word I16A_RDLONG + r0<<D16A + RI<<S16A
 word I16B_RETN

' end C__memory_get_lock

' Catalina Export _memory_set_lock

 alignl ' align long

C__memory_set_lock
 alignl ' align long
 long I32_LODA + MEM_LOCK<<S32
 word I16A_RDLONG + r0<<D16A + RI<<S16A
 word I16A_WRLONG + r2<<D16A + RI<<S16A
 word I16B_RETN

' end C__memory_set_lock


' Catalina Export _memory_lock

 alignl ' align long

C__memory_lock
 alignl ' align long
 long I32_LODA + MEM_LOCK<<S32
 word I16A_RDLONG + r2<<D16A + RI<<S16A
 word I16A_CMPSI + r2<<D16A + 0<<S16A   ' C = 1 if no lock currently in use
 alignl ' align long
 long I32_BR_B + @C__memory_lock_1<<S32 ' if no lock in use, just return
 alignl ' align long
C__memory_lock_0
#ifdef P2
 word I16B_EXEC
 alignl ' align long
        bith    lockbits, r2 wcz  ' have we acquired ...              
 if_nz  locktry r2 wc             ' ... both intra-cog and inter-cog locks?
 if_nc_and_nz bitl lockbits, r2   ' true = if_c_and_nz, false = if_nc_or_z
 jmp  #EXEC_STOP
 long I32_BRAE + @C__memory_lock_2<<S32 ' if we failed to get lock try again
 long I32_BR_Z + @C__memory_lock_2<<S32 ' if we failed to get lock try again
 long I32_JMPA + @C__memory_lock_1<<S32 ' if we got the lock just return
#else
 word I16B_PASM                         ' try and get ...
 alignl ' align long
 lockset r2 wc                          ' ... the lock
 long I32_BRAE + @C__memory_lock_1<<S32 ' if we got lock just return
#endif
 alignl ' long align
C__memory_lock_2
#ifdef __CATALINA_libthreads
' NOTE: We would like to just call _thread_yield here, but we cannot 
'       import it unless we link with the thread library, so we don't
'       try to import it - we copy the relevant code instead:
#ifdef P2
 word I16B_PASM
 alignl ' align long
 call #TRY_KERNEL_LOCK                 ' if we can't get kernel lock ...
 long I32_BRAE + @mem_yield_1<<S32  ' ... then try setting ticks
 word I16B_PASM                        ' otherwise force context switch
 alignl ' align long
   jmp #\CMM_force                       
#else
 word I16B_PASM 
 alignl ' align long
   lockset lock wc                     ' if we can't get kernel lock ...
 long I32_BR_B + @mem_yield_1<<S32  ' ... then try settng ticks
 long I32_CALA + @C__thread_force_switch<<S32 ' otherwise force context switch
#endif
 long I32_JMPA + @C__memory_lock_0<<S32 ' ... and try again
mem_yield_1
 word I16B_PASM                        ' force a context switch ...
 alignl ' align long
   mov ticks, #1                       ' ... after the next instruction
#endif
 long I32_JMPA + @C__memory_lock_0<<S32 ' ... and try again
 alignl ' align long
C__memory_lock_1
 word I16B_RETN

' end C__memory_lock


' Catalina Export _memory_unlock

 alignl ' align long

C__memory_unlock
 alignl ' align long
 long I32_LODA + MEM_LOCK<<S32
 word I16A_RDLONG + r2<<D16A + RI<<S16A
 word I16A_CMPSI + r2<<D16A + 0<<S16A       ' C = 1 if no lock currently in use
 alignl ' align long
 long I32_BR_B + @C__memory_unlock_1<<S32   ' return if no lock in use
#ifdef P2
 word I16B_EXEC
 alignl ' align long
 lockrel r2                                 ' if a lock is in use ...
 bitl lockbits, r2                          ' ... unlock it
 jmp #EXEC_STOP
#else
 word I16B_PASM                         
 alignl ' align long
 lockclr r2                                 ' if a lock is in use unlock it
#endif
 alignl ' align long
C__memory_unlock_1
 word I16B_RETN

' end C__memory_unlock

