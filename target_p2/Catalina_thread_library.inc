' Catalina thread library functions ...

' avoid including the thread library functions twice ...

#ifndef THREAD_LIBRARY_INCLUDED
#define THREAD_LIBRARY_INCLUDED

DAT

' GET_KERNEL_LOCK : do not return until we get kernel lock (specified in lock)

GET_KERNEL_LOCK
        stalli
        bith    lockbits,lock wcz    ' have we acquired ...              
 if_nz  locktry lock wc              ' ... both intra-cog and inter-cog locks?
 if_nc_and_nz  bitl lockbits,lock    ' true = if_c_and_nz, false = if_nc_or_z
 if_nc_or_z    jmp #\GET_KERNEL_LOCK
        allowi
        ret

' REL_KERNEL_LOCK : release the kernel lock (specified in lock)

REL_KERNEL_LOCK
        stalli
        lockrel lock                 ' release inter-cog lock
        bitl    lockbits,lock        ' release intra-cog lock
	allowi
        ret

' GET_POOL_LOCK : do not return until we get pool lock (specified in r1)

GET_POOL_LOCK
        stalli
        bith    lockbits,lock wcz    ' have we acquired ...              
 if_nz  locktry r1 wc                ' ... both intra-cog and inter-cog locks?
 if_nc_and_nz  bitl lockbits,lock    ' true = if_c_and_nz, false = if_nc_or_z
 if_nc_or_z    jmp #\GET_POOL_LOCK
        allowi
        ret

' REL_POOL_LOCK : release the pool lock (specified in r1)

REL_POOL_LOCK
        stalli
        lockrel r1                   ' release inter-cog lock
        bitl    lockbits,lock        ' release intra-cog lock
	allowi
        ret

#endif

