' The use of PRIMITIVE allows the library source files to be (mostly) 
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.
#ifndef PRIMITIVE
#ifdef P2
#ifdef NATIVE
#define PRIMITIVE(op) calld PA, op
#else
#define PRIMITIVE(op) jmp op
#endif
#else
#define PRIMITIVE(op) jmp op
#endif
#endif


' Catalina Code

' PASM implementations of fundamental multi-threading lock operations
'
' int _lockset(int lockid);
'    set a lock, and return 1 on success, 0 on failure
' on entry:
'    r2 = lock id
' on exit:
'    r0 = 1 if we locked it, 0 if it was already locked

DAT ' code segment

' Catalina Export _lockset

 alignl ' align long

C__lockset
#ifdef P2
             stalli
             bith    lockbits, r2 wcz ' have we acquired ...              
 if_nz       locktry r2 wc            ' ... both intra-cog and inter-cog locks?
 if_nc_and_nz  bitl    lockbits, r2   ' true = if_c_and_nz, false = if_nc_or_z
             allowi
 if_nc_or_z  mov     r0, #0           ' if we failed to get both, return 0
 if_c_and_nz mov     r0, #1           ' if we got both, return 1
#else
             lockset r2 wc
 if_c        mov     r0, #0           ' if lock was already set, return 0 
 if_nc       mov     r0, #1           ' if we set the lock, return 1
#endif
 PRIMITIVE(#RETN)
 ' end

