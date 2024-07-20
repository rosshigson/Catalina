' Catalina kernel functions that are specific to the CMM kernels ...

' avoid including the kernel library functions twice ...

#ifndef CMM_SPECIAL_LIBRARY_INCLUDED
#define CMM_SPECIAL_LIBRARY_INCLUDED

DAT

#ifdef libthreads

'
' context_switch - perform a context switch if we can acquire the locks
'
context_switch
        mov     ticks, #100      ' in case we cannot get lock, set ticks before retry
        muxc    flags, #1        ' save C ...
        muxnz   flags, #2        ' ... and Z flags
        cmps    lock,#0 wcz      ' lock set yet?
  if_b  jmp     #CMM_resume      ' no - cannot switch yet
        bith    lockbits,lock wcz    ' yes - have we acquired ...              
 if_nz  locktry lock wc              ' ... both ...
 if_nc_and_nz  bitl lockbits,lock    ' ... locks?   
 if_nc_or_z  jmp  #CMM_resume    ' no - cannot switch, so restore C & Z and resume
        rdlong  t2, TP           ' yes - load next thread block pointer
        rdlong  t1, req wz       ' is there an affinity request oustanding?
 if_nz  jmp     #CMM_affine      ' yes - service it
        cmp     t2, TP wz        ' no - is there only one thread executing?
 if_z   jmp     #CMM_unlock      ' yes - restore C & Z flags, unlock and resume

CMM_switch
        mov     t3, t2           ' no - get ...
        add     t3, #THREAD_AFF_OFF*4+1  ' ... affinity byte 
        rdbyte  t1, t3           ' ... of proposed next thread
        test    t1, #%11100000 wz ' affinity stop, or thread terminated or completed?
  if_z  jmp     #:next           ' no - switch to next thread
        or      t1, #%10000000   ' yes - make sure ...
        wrbyte  t1, t3           ' ... thread terminated bit of next thread is set
        rdlong  t2, t2           ' remove next thread ...
        wrlong  t2, TP           ' ... from the executing thread list
:next   mov     t1, TP           ' point to ...  
        add     t1, #THREAD_REG_OFF*4 ' ... current thread register save area
        setq    #32-1            ' save 32 registers ...
        wrlong  r0, t1           ' ... to register save area
        add     t1, #(THREAD_AFF_OFF-THREAD_REG_OFF)*4 ' point to flag save area
        wrbyte  flags, t1        ' save C & Z flags
        mov     TP, t2           ' set TP to next thread block
        add     t2, #THREAD_REG_OFF*4 ' point to the thread register save area
        setq    #32-1            ' load 32 registers ...
        rdlong  r0, t2           ' ... from register save area
        add     t2, #(THREAD_AFF_OFF-THREAD_REG_OFF)*4 ' point to flag save area
        rdbyte  flags, t2        ' load C & Z flags
        add     t2, #2           ' load ...
        rdword  ticks, t2 wz     ' ... tick count assigned to this thread ...
 if_z   mov     ticks, #100      ' ... (use default tick count if zero)

CMM_unlock
        lockrel lock                 ' release inter-cog lock
        bitl    lockbits,lock        ' release intra-cog lock

CMM_resume
 _ret_  shr     flags, #1 wcz    ' restore Z & C flags and return

CMM_affine
        cmp     t2, TP wz        ' is there only one thread executing?
 if_nz  rdlong  t3, t2           ' no - get next thread of next thread ... 
 if_nz  wrlong  t3, t1           ' ... and make it next thread of new thread
 if_z   wrlong  t2, t1           ' yes - make new thread next thread of current thread 
        wrlong  t1, t2           ' make current thread next thread of new thread 
        mov     t2, t1           ' next thread should now be new thread
        mov     t4, #THREAD_AFF_OFF*4+1 ' update ...
        add     t4, t1           ' ...
        rdbyte  t5, t4           ' ...
        cogid   t1               ' ...
        andn    t5, #%111        ' ...
        or      t5, t1           ' ...
        wrbyte  t5, t4           ' ... thread affinity
        mov     t4, #0           ' zero ...
        wrlong  t4, req          ' ... request block
        jmp     #CMM_switch      ' now switch to next thread

'
' CMM_force : force a context switch (assumes we have acquired the locks!)
'
CMM_force
        muxc    flags, #1        ' save C ...
        muxnz   flags, #2        ' ... and Z flags
        rdlong  t2, TP           ' load next thread block pointer
        cmp     t2, TP wz        ' is there only one thread executing?
 if_z   jmp     #:unlock         ' yes - unlock, restore C & Z and resume
        call    #CMM_switch      ' no - perform context switch ...
        jmp     #read_next       ' ... and resume
:unlock
        call    #CMM_unlock      ' unlock, restore C & Z ...
        jmp     #read_next       ' ... and resume

#endif

#endif

