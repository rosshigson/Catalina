' Catalina thread library functions ...

' avoid including the thread library functions twice ...

#ifndef THREAD_LIBRARY_INCLUDED
#define THREAD_LIBRARY_INCLUDED

DAT

' REL_AND_YIELD - release kernel lock, and give up the CPU to another task 

REL_AND_YIELD
        stalli            ' disable interrupts
        lockrel lock           ' release inter-cog lock
        bitl    lockbits,lock  ' release intra-cog lock
        mov     ticks,#1  ' indicate that we are finished processing
        allowi            ' enable interrupts 
        trgint3           ' trigger a context switch interrupt
        ret               ' return when we get scheduled again

' TRY_KERNEL_LOCK : try to get kernel lock (specified in lock) - return with
'                   carry set if successful

TRY_KERNEL_LOCK
        stalli
        bith    lockbits,lock wcz    ' have we acquired ...              
 if_nz  locktry lock wc              ' ... both intra-cog and inter-cog locks?
 if_nc_and_nz  bitl lockbits,lock    ' true = if_c_and_nz, false = if_nc_or_z
        allowi
        modc    _c_and_nz wc         ' return c set if c_and_nz
        ret

' REL_KERNEL_LOCK : release the kernel lock (specified in lock)

REL_KERNEL_LOCK
        stalli
        lockrel lock                 ' release inter-cog lock
        bitl    lockbits,lock        ' release intra-cog lock
        allowi
        ret

' TRY_POOL_LOCK : try to get pool lock (specified in r1) - return with
'                 carry set if successful

TRY_POOL_LOCK
        stalli
        bith    lockbits,r1 wcz    ' have we acquired ...              
 if_nz  locktry r1 wc              ' ... both intra-cog and inter-cog locks?
 if_nc_and_nz  bitl lockbits,r1    ' true = if_c_and_nz, false = if_nc_or_z
        allowi
        modc    _c_and_nz wc         ' return c set if c_and_nz
        ret

' REL_POOL_LOCK : release the pool lock (specified in r1)

REL_POOL_LOCK
        stalli
        lockrel r1                   ' release inter-cog lock
        bitl    lockbits,r1          ' release intra-cog lock
        allowi
        ret

#endif

