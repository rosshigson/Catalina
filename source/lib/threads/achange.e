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

'
' LMM PASM implementations of affinity multi-threading operations
'
' void * _thread_affinity_change();
'    request affinity change for specified thread
' on entry:
'    r3 = thread id
'    r2 = new affinity
' on exit:
'    r0 = thread id on success (Z clr)
'    r0 = 0 (Z set) on error
'       
'
' Catalina Code

DAT ' code segment

' Catalina Import _thread_id

' Catalina Import _thread_stall

' Catalina Import _thread_allow

' Catalina Export _thread_affinity_change

 alignl ' align long

C__thread_affinity_change
 PRIMITIVE(#CALA)
 long @C__thread_stall
 and r2, #%111          ' ensure new affinity is in range 0 .. 7
 mov RI, r2             ' get request block address ...
 shl RI, #2
 add RI, reg          
#ifdef LARGE
 PRIMITIVE(#RLNG)
#else
 rdlong BC, RI          ' ... of new cog 
#endif
 mov r4, BC             ' save in r4
 mov RI, r4             ' is there ...
#ifdef LARGE
 PRIMITIVE(#RLNG)
#else
 rdlong BC, RI          ' 
#endif
 cmp BC, #0 wz          ' ... an affinity request outstanding for that cog?
#if defined(P2) && defined(NATIVE)
 if_nz jmp #@:aff_ch_error ' yes - return error
#else
 PRIMITIVE(#BRNZ)
 long @:aff_ch_error    ' yes - return error
#endif
 mov r1, TP             ' no - start with current thread block
:aff_ch_next
 mov RI, r1             ' get ...
#ifdef LARGE
 PRIMITIVE(#RLNG)
#else
 rdlong BC, RI          ' ... the next thread pointer from that block
#endif
 cmp BC, r3 wz          ' is it the thread block we are looking for?
#if defined(P2) && defined(NATIVE)
 if_z jmp #@:aff_ch_found ' yes - found the block pointing to the thread block to change
#else
 PRIMITIVE(#BR_Z)
 long @:aff_ch_found    ' yes - found the block pointing to the thread block to change 
#endif
 cmp BC, TP wz          ' no - last thread? (points to current thread block)
#if defined(P2) && defined(NATIVE)
 if_z jmp #@:aff_ch_error ' yes - return error
#else
 PRIMITIVE(#BR_Z)
 long @:aff_ch_error    ' yes - return error
#endif
 mov r1, BC             ' no - step to ...
#if defined(P2) && defined(NATIVE)
 jmp #@:aff_ch_next     ' ... this thread block, and keep looking
#else
 PRIMITIVE(#JMPA)
 long @:aff_ch_next     ' ... this thread block, and keep looking
#endif
:aff_ch_found           ' now r1 points to block that points to r3
 cogid r0               ' are we trying to change the cog ...
 cmp r0, r2 wz          ' .. to be the same as the current cog id?
#if defined(P2) && defined(NATIVE)
 if_z jmp #@:aff_ch_done ' yes - no need to do anything!
#else
 PRIMITIVE(#BR_Z)
 long @:aff_ch_done     ' yes - no need to do anything!
#endif
 cmp r3, TP wz          ' are we changing affinity of the current thread?
#if defined(P2) && defined(NATIVE)
 if_nz jmp #@:aff_ch_remove ' no - can just update the appropriate block pointers
#else
 PRIMITIVE(#BRNZ)
 long @:aff_ch_remove   ' no - can just update the appropriate block pointers
#endif
 mov RI, TP             ' yes - get ...
#ifdef LARGE
 PRIMITIVE(#RLNG)
#else
 rdlong BC, RI          ' ... the next thread block pointer 
#endif
 cmp BC, TP wz          ' is only one thread executing?
#if defined(P2) && defined(NATIVE)
 if_z jmp #@:aff_ch_error ' yes - cannot change affinity of the last thread using this function
#else
 PRIMITIVE(#BR_Z)
 long @:aff_ch_error    ' yes - cannot change affinity of the last thread using this function
#endif
:aff_ch_remove
 mov RI, r3             ' get ...
#ifdef LARGE
 PRIMITIVE(#RLNG)
#else
 rdlong BC, RI          ' ... the next thread pointer of block being changed
#endif
 mov RI, r1             ' write it to ...
#ifdef LARGE
 PRIMITIVE(#WLNG)
#else
 wrlong BC, RI          ' ... the next block of the previous block pointer
#endif
 mov RI, r4             ' notify new cog ...
 mov BC, r3
#ifdef LARGE
 PRIMITIVE(#WLNG)
#else
 wrlong BC, RI          ' ... of cog change request
#endif
 cmp r3, TP wz          ' are we changing the affinity of the current thread?
#if defined(P2) && defined(NATIVE)
 if_nz jmp #:aff_ch_done ' if not then we are done
#else
 PRIMITIVE(#BRNZ)
 long @:aff_ch_done     ' if not then we are done
#endif
#ifdef P2
#ifdef NATIVE
 calld PA,#\NMM_force   ' force a context switch immediately
#else
 jmp #\LMM_force        ' force a context switch immediately
#endif
#else
 jmp #LMM_force         ' force a context switch immediately
#endif
 mov r0, r3 wz          ' return thread id
#if defined(P2) && defined(NATIVE)
 jmp #@:aff_ch_no_unlock ' NOTE: locks already released by context switch!
#else
 PRIMITIVE(#JMPA)      
 long @:aff_ch_no_unlock ' NOTE: locks already released by context switch!
#endif
:aff_ch_done
 mov r0, r3 wz          ' return thread id
#if defined(P2) && defined(NATIVE)
 jmp #@:aff_ch_exit
#else
 PRIMITIVE(#JMPA)
 long @:aff_ch_exit
#endif
:aff_ch_error
 mov r0, #0 wz           ' if error, return zero (and Z set)
:aff_ch_exit
 PRIMITIVE(#CALA)
 long @C__thread_allow
:aff_ch_no_unlock
 PRIMITIVE(#RETN)
' end
