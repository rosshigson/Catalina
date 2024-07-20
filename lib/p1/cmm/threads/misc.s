#ifndef P2

' On the P2 when the code is assembled monolithically, we do not need to
' define these - in fact doing so confuses the assembler.
' We need these when we enable Quick Build, but in that case they are 
' defined in cmmbeg.t

CON

' NOTE: The following constants MUST MATCH the values in the threaded 
'       CMM kernel, and in threads.h !!! (P1 only)

dlsb       = $26
t1         = $27
t2         = $28
t3         = $29
t4         = $2a
t5         = $2b
t6         = $2c
SWITCH     = $13c
ticks      = $13d
flags      = $13e
lock       = $13f
TP         = $140
reg        = $141
req        = $142

#endif

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
 alignl ' align long
        long    I32_MOV + r0<<D32 + TP<<S32 ' return current thread id
        word    I16B_RETN
' end
'
' CMM PASM implementations of fundamental multi-threading operations
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
 alignl ' align long
        long    I32_MOV + r0<<D32 + lock<<S32 ' return lock currently allocated
        word    I16B_RETN

' end C__thread_get_lock

'
' void _thread_set_lock(int lock);
'    set lock to use for context switching (note this does not
'    release any previous lock - that must be done manually
'    by calling _thread_get_lock() and then _lockclr() on the result)
' on entry:
'    r2 = lock to use (0 .. 7 on P1, 0 .. 15 on P2)
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
        alignl ' align long
        long    I32_MOV + lock<<D32 + r2<<S32         ' set lock to use
        alignl ' align long
        long    I32_CALA + @C__memory_get_lock<<S32
        word    I16A_CMPSI + r0<<D16A + 0<<S16A
        alignl ' align long
        long    I32_BRAE + @C__thread_set_lock_1<<S32 ' return if lock already set
        long    I32_CALA + @C__locknew<<S32           ' allocate a lock
        word    I16A_CMPSI + r0<<D16A + 0<<S16A
        alignl ' align long
        long    I32_BR_B + @C__thread_set_lock_1<<S32 ' return if none available
        word    I16A_MOV + r2<<D16A + r0<<S16A        ' set allocated lock ...
        alignl ' align long
        long    I32_CALA + @C__memory_set_lock<<S32   ' ... as memory lock
        alignl ' align long
C__thread_set_lock_1
        word I16B_RETN

' end C__thread_set_lock


' void _thread_stall();
'    yield until the caller gets the kernel lock 
' on entry: none 
' on exit: none 

' Catalina Code

' Catalina Export _thread_stall

DAT ' code segment

 alignl ' align long

C__thread_stall
thread_stall_0
 long 0                                ' insert a NOP!
#ifdef P2
 word I16B_PASM
 alignl ' align long
   call #\TRY_KERNEL_LOCK              ' if we get kernel lock ...
 long I32_BR_B + @thread_stall_1<<S32  ' ... then proceed
#else
 word I16B_PASM
 alignl ' align long
   lockset lock wc                     ' if we get kernel lock ...
 long I32_BRAE + @thread_stall_1<<S32  ' ... then proceed
#endif
#ifdef P2
 word I16B_PASM                        ' otherwise force context switch
 alignl ' align long
   jmp #\CMM_force                       
#else
 long I32_CALA + @C__thread_force_switch<<S32 ' otherwise force context switch
#endif
 long I32_JMPA + @thread_stall_0<<S32  ' repeat until we get kernel lock 
 alignl ' align long
thread_stall_1
 word I16B_RETN
' end C__thread_stall


' Catalina Code

DAT ' code segment

' Catalina Export _thread_allow

 alignl ' align long

C__thread_allow
#ifdef P2
 alignl ' align long
 word I16B_PASM
 alignl ' align long
   call #REL_KERNEL_LOCK                ' release kernel lock
#else
 alignl ' align long
 word I16B_PASM
 alignl ' align long
   lockclr lock                         ' release kernel lock
#endif
 word I16B_RETN
' end C__thread_allow

'
' Catalina Code

DAT ' code segment

' Catalina Export _context_switch

 alignl ' align long

C__context_switch
        word    I16B_EXEC        ' start executing LMM
 alignl ' align long
        mov     ticks, #100      ' in case we cannot get lock, set up ticks to wait before retry
        muxc    flags, #1        ' save C ...
        muxnz   flags, #2        ' ... and Z flags
#ifdef P2
        bith    lockbits,lock wcz    ' have we acquired ...              
 if_nz  locktry lock wc              ' ... both ...
 if_nz_and_nc bitl    lockbits,lock  ' ... locks?   
 if_nc_or_z   add     PC, #(@C__context_resume-@:switch_0) ' no - cannot switch, so restore C & Z and resume
#else
        lockset lock wc         ' have we acquired the context switch lock?
 if_c   add     PC, #(@C__context_resume-@:switch_0) ' no - cannot switch, so restore C & Z and resume
#endif

:switch_0 
        rdlong  t2, TP           ' yes - load next thread block pointer
        rdlong  t1, req wz       ' is there an affinity request oustanding?
 if_nz  add     PC, #(@C__context_affine-@:switch_1) ' yes - service it
:switch_1 
        cmp     t2, TP wz        ' no - is there only one thread executing?
 if_z   add     PC, #(@C__context_unlock-@C__context_do_switch) ' yes - restore C & Z flags, unlock and resume
C__context_do_switch
        mov     t3, t2           ' no - get ...
        add     t3, #THREAD_AFF_OFF*4+1      ' ... affinity byte 
        rdbyte  t1, t3           ' ... of proposed next thread
        test    t1, #%11100000 wz ' affinity stop, or thread terminated or completed?
  if_z  add     PC, #(@C__context_next-@:switch_2) ' no - switch to next thread
:switch_2
        or      t1, #%10000000   ' yes - make sure ...
        wrbyte  t1, t3           ' ... thread terminated bit of next thread is set
        rdlong  t2, t2           ' remove next thread ...
        wrlong  t2, TP           ' ... from the executing thread list
C__context_next
        add     ticks, #1        ' ensure we do not switch at this point!
        jmp     #EXEC_STOP      ' switch ...
        word    I16B_FCACHE + ((@:fc_code_end-@:fc_code_start)/4)<<S16B ' ... to FCACHE mode
 alignl ' align long
'************* START OF FCACHE ***************
:fc_code_start
        mov     t1, TP           ' point to ...  
        add     t1, #THREAD_REG_OFF*4 ' ... current thread register save area
        mov     PC, t6           ' including original PC (saved in t6)
#ifdef P2
        setq    #32-1           ' save 32 registers ...
        wrlong  r0, t1           ' ... to register save area
        add     t1, #(THREAD_AFF_OFF-THREAD_REG_OFF)*4 ' point to flag save area
#else
        movd    FC_START+(@:save-@:fc_code_start)/4, #R0 ' starting from R0  ...
        mov     t3, #32          ' ... save 32 registers
:save   wrlong  0-0, t1
        add     t1, #4
        add     FC_START+(@:save-@:fc_code_start)/4, dlsb ' :save, dlsb
        djnz    t3, #FC_START+(@:save-@:fc_code_start)/4 ' #:save
#endif
        wrbyte  flags, t1        ' save C & Z flags
        mov     TP, t2           ' set TP to next thread block
        add     t2, #THREAD_REG_OFF*4 ' point to the thread register save area
#ifdef P2
        setq    #32-1           ' load 32 registers ...
        rdlong  r0, t2           ' ... from register save area
        add     t2, #(THREAD_AFF_OFF-THREAD_REG_OFF)*4        ' point to flag save area
#else
        movd    FC_START+(@:load-@:fc_code_start)/4, #R0 ' starting from R0 ...
        mov     t3, #32          ' ... load 32 registers
:load   rdlong  0-0, t2
        add     t2, #4
        add     FC_START+(@:load-@:fc_code_start)/4, dlsb ' :load, dlsb
        djnz    t3, #FC_START+(@:load-@:fc_code_start)/4 ' #:load
#endif
        rdbyte  flags, t2        ' load C & Z flags
        add     t2, #2           ' load ...
        rdword  ticks, t2 wz     ' ... tick count assigned to this thread ...
   if_z mov     ticks, #100      ' ... (use default tick count if zero)
#ifdef P2
        lockrel lock                 ' release inter-cog lock
        bitl    lockbits,lock        ' release intra-cog lock
        shr     flags, #1 wcz    ' restore Z & C flags
#else
        lockclr lock            ' release the context switch lock
        shr     flags, #1 wc,wz  ' restore Z & C flags
#endif
        jmp     #FC_INLINE      ' end of FCACHE code (will resume at PC as CMM)
:fc_code_end
'************* END OF FCACHE ***************
 alignl ' align long
C__context_unlock
#ifdef P2
        lockrel lock             ' release inter-cog lock
        bitl    lockbits,lock    ' release intra-cog lock
C__context_resume
        shr     flags, #1 wcz    ' restore Z & C flags
#else
        lockclr lock             ' release the context switch lock
C__context_resume
        shr     flags, #1 wc,wz  ' restore Z & C flags
#endif
        add     ticks, #1        ' ensure we do not switch at this point!
        jmp     #EXEC_STOP       ' stop executing LMM, resume executing CMM
 alignl ' align long
        long    I32_MOV + PC<<D32 + t6<<S32 ' restore original PC (i.e. resume)
 alignl ' align long
C__context_affine
        cmp     t2, TP wz        ' is there only one thread executing?
 if_nz  rdlong  t3, t2           ' no - get next thread of next thread ...        
 if_nz  wrlong  t3, t1           ' no - ... and make it next thread of new thread
 if_z   wrlong  t2, t1           ' yes - make new thread next thread of current thread 
        wrlong  t1, t2           ' make current thread next thread of new thread 
        mov     t2, t1           ' next thread should now be new thread
        mov     t4, #THREAD_AFF_OFF*4+1      ' update ...
        add     t4, t1           ' ...
        rdbyte  t5, t4           ' ...
        cogid   t1               ' ...
        andn    t5, #%111        ' ...
        or      t5, t1           ' ...
        wrbyte  t5, t4           ' ... thread affinity
        mov     t4, #0           ' zero ...
        wrlong  t4, req          ' ... request block
        sub     PC, #(@:switch_3-@C__context_do_switch) ' now switch to next thread
:switch_3

' end C__context_switch

'
' Catalina Code

DAT ' code segment

' Catalina Export _thread_force_switch

 alignl ' align long

C__thread_force_switch
        word    I16B_EXEC
 alignl ' align long
        rdlong  t2, TP           ' load next thread block pointer
        mov     t6, PC           ' after executing this instruction, 
                                 ' t6 will contain :switch_4 (this is in 
                                 ' case we have relocated the code!)
:switch_4
        add     t6, #(@:switch_5-@:switch_4-4) ' after this instruction, t6
                                              ' will contain :switch_5-4, 
                                              ' where we want to resume (we
                                              ' end up at FC_INLINE, which
                                              ' increments PC by 4)
        muxc    flags, #1        ' save C ...
        muxnz   flags, #2        ' ... and Z flags
        sub     PC, #(@:switch_5-@C__context_do_switch) ' now switch
:switch_5
        
        word    I16B_RETN

' end C__thread_force_switch

'
' Catalina Code

DAT ' code segment

' Catalina Export _inject_context_switch
'
' _inject_context_switch : setup context switching (used by dynamic kernel).
'                          This is not required on the P2.

 alignl ' align long

C__inject_context_switch
#ifndef P2
 alignl ' align long
        long     I32_MOVI + r0<<D32 + SWITCH<<S32   ' calculate ...
        word     I16A_SHLI + r0<<D16A + 2<<S16A     ' ... address in kernel image ...
        word     I16A_ADD + r0<<D16A + r2<<S16A     ' ... to inject switch function
 alignl ' align long
        long     I32_LODA + @C__context_switch<<S32 ' inject ...
        word     I16A_WRLONG + RI<<D16A + r0<<S16A  ' ... context switch
#endif
        word     I16B_RETN

' end C__inject_context_switch

'
' Catalina Code

DAT ' code segment

' Catalina Export thread_setup
'
' thread_setup : setup context switching (used by non-dynamic kernel). 
'                This is not required on the P2 (but it must exist).
'
C_thread_setup
#ifndef P2
 word I16B_EXEC
 alignl ' align long
 neg     BC,#1          ' write -1 ...
 mov     RI,TP          ' ... to thread block ...
 add     RI,#THREAD_EXT_OFF*4  ' ...
 wrlong  BC,RI          ' extended information
 jmp     #EXEC_STOP
 alignl ' align long
 long I32_LODA + @C__context_switch<<S32 ' point to context switch address
 alignl ' align long
 long I32_MOV + SWITCH<<D32 + RI<<S32   ' set it in kernel
#endif
 word I16B_RETN             ' done

 alignl ' align long

' end C_thread_setup

