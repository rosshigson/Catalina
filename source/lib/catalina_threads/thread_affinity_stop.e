
#ifndef P2
' Until we modify the P1 compilation process to include calling spinpp, 
' we must explicitly define this here and preprocess all the library 
' files to create different libraries for the P1 and the P2. This allows 
' us to keep the library source files (mostly) identical for the P1 and P2.
#ifndef PRIMITIVE
#define PRIMITIVE(op) jmp op
#endif
#endif

'
' LMM PASM implementations of affinity multi-threading operations
'
' void * _thread_affinity_stop();
'    request affinity stop of specified thread 
' on entry:
'    r2 = thread id 
' on exit:
'    r0 = thread affinity byte if ok (and Z clr)
'    r0 = zero if error (and Z set)
'
' Catalina Code

DAT ' code segment

' Catalina Import _thread_id

' Catalina Export _thread_affinity_stop

 alignl ' align long

C__thread_affinity_stop
#ifdef P2
 call #GET_KERNEL_LOCK        ' get kernel lock
#else
C__thread_affinity_stop_1
 lockset lock wc
 PRIMITIVE(#BR_B)
 long @C__thread_affinity_stop_1 ' loop till we get a kernel lock 
#endif
 mov RI, r2             ' get ...
 add RI, #33*4+1
#ifdef LARGE
 PRIMITIVE(#RBYT)
#else
 rdbyte BC, RI          ' ... affinity byte 
#endif
 test BC, #%11100000 wz ' thread terminated, or oustanding affnity request?
#if defined(P2) && defined(NATIVE)
 if_nz jmp #@:aff_stop_error  ' yes - return error 
#else
 PRIMITIVE(#BRNZ)
 long @:aff_stop_error  ' yes - return error
#endif
 or BC, #%00100000      ' no - set ...
#ifdef LARGE
 PRIMITIVE(#WBYT)
#else
 wrbyte BC, RI          ' ... affinity stop request bit
#endif 
 mov r0, BC wz          ' on ok, return non-zero (and Z clr)
#if defined(P2) && defined(NATIVE)
 jmp #@:aff_stop_exit
#else
 PRIMITIVE(#JMPA)
 long @:aff_stop_exit
#endif
:aff_stop_error
 mov r0, #0 wz          ' on error, return 0 (and Z set)
:aff_stop_exit
#ifdef P2
 call #REL_KERNEL_LOCK         ' release kernel lock
#else
 lockclr lock           ' release kernel lock
#endif
 PRIMITIVE(#RETN)
' end
