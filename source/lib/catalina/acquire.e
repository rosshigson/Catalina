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

DAT ' code segment

' Catalina Export _acquire_lock

 alignl ' align long

C__acquire_lock
C__acquire_lock_1
#ifdef P2
        bith    lockbits, r2 wcz   ' have we acquired ...              
 if_nz  locktry r2 wc              ' ... both intra-cog and inter-cog locks?
 if_nc_and_nz  bitl lockbits, r2   ' true = if_c_and_nz, false = if_nc_or_z
#ifdef NATIVE
 if_nc_or_z  jmp #C__acquire_lock_1
#else
 PRIMITIVE(#BRAE)
 long @C__acquire_lock_1
 PRIMITIVE(#BR_Z)
 long @C__acquire_lock_1
#endif
#else
 lockset r2 wc
 PRIMITIVE(#BR_B)
 long @C__acquire_lock_1
#endif
 PRIMITIVE(#RETN)
 ' end

