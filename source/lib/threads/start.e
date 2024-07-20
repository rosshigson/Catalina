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

'
' LMM PASM implementations of fundamental multi-threading operations
'
' void * _thread_start(void * PC, void * SP, int argc, char *argv[]);
'    intiate a new thread
' on entry:
'    r5 = initial PC
'    r4 = initial SP (must be at least 40 longs below this !)
'    r3 = argc
'    r2 = argv
' on exit:
'    r0 = thread id (Z clear) on success
'    r0 = 0 and Z flag set on error
'
' Catalina Code

DAT ' code segment

' Catalina Import _thread_id

' Catalina Import _thread_stall

' Catalina Import _thread_allow

' Catalina Import _unlocked_check

' Catalina Import _thread_halt

' Catalina Export _thread_start

 alignl ' align long

C__thread_start
 PRIMITIVE(#CALA)
 long @C__thread_stall
 sub r4, #THREAD_BLOCK_SIZE*4 ' use top longs of stack as thread block
 PRIMITIVE(#CALA)
 long @C__unlocked_check ' check if thread id is already known
#if defined(P2) && defined(NATIVE)
 if_nz jmp #@:thr_start_error ' if so return error 
#else
 PRIMITIVE(#BRNZ)
 long @:thr_start_error ' if so return error
#endif
 mov RI, r4             ' set up ...
 add RI, #THREAD_AFF_OFF*4    
 cogid BC
 shl BC, #8
#ifdef LARGE
 PRIMITIVE(#WWRD)
#else
 wrword BC, RI          ' ... affinity with our cog id
#endif
 add RI, #2             ' set up ...
 mov BC, #100           ' ... (~10 milliseconds) ...
#ifdef LARGE
 PRIMITIVE(#WWRD)
#else
 wrword BC, RI          ' ... default tick count
#endif
 mov RI, r4             ' set up ...
#if defined(P2) && defined(NATIVE)
 add RI, #(THREAD_REG_OFF+4)*4
#else
 add RI, #(THREAD_REG_OFF+10)*4
#endif
 mov BC, r2
#ifdef LARGE
 PRIMITIVE(#WLNG)
#else
 wrlong BC, RI          ' ... thread r2 (argv) 
#endif
 mov RI, r4             ' set up ...
#if defined(P2) && defined(NATIVE)
 add RI, #(THREAD_REG_OFF+5)*4
#else
 add RI, #(THREAD_REG_OFF+11)*4
#endif
 mov BC, r3
#ifdef LARGE
 PRIMITIVE(#WLNG)
#else
 wrlong BC, RI          ' ... thread r3 (argc)
#endif
 mov RI, r4             ' set up ...
#if defined(P2) && defined(NATIVE)
 add RI, #(THREAD_REG_OFF+26)*4
#else
 add RI, #(THREAD_REG_OFF)*4             
#endif
 mov BC, r5
#ifdef LARGE
 PRIMITIVE(#WLNG)
#else
 wrlong BC, RI           ' ... thread PC
#endif
 mov r1, r4
 sub r1, #4*3           ' reserve 3 longs of stack for args and return addr
#if defined(P2) && defined(NATIVE)
 mov BC, ##@C__thread_halt ' set up ...
#else
 PRIMITIVE(#LODL)       ' set up ...
 long @C__thread_halt
 mov BC, RI
#endif
 mov RI, r1
#ifdef LARGE
 PRIMITIVE(#WLNG)
#else
 wrlong BC, RI          ' ... thread return address
#endif
 mov RI, r4             ' set up ...
#if defined(P2) && defined(NATIVE)
 add RI, #(THREAD_REG_OFF+28)*4
#else
 add RI, #(THREAD_REG_OFF+1)*4
#endif
 mov BC, r1
#ifdef LARGE
 PRIMITIVE(#WLNG)
#else
 wrlong BC, RI          ' ... thread SP
#endif
 mov RI, TP             ' get ...
#ifdef LARGE
 PRIMITIVE(#RLNG)
#else
 rdlong BC, RI          ' ... next block pointer of current thread block
#endif
 mov RI, r4             ' set it as ...
#ifdef LARGE
 PRIMITIVE(#WLNG)
#else
 wrlong BC, RI          ' ... next block pointer of new thread block
#endif
 mov RI, TP             ' set ...
 mov BC, r4
#ifdef LARGE
 PRIMITIVE(#WLNG)
#else
 wrlong BC, RI          ' ... next block pointer of current block to new block
#endif
 mov r0, r4 wz          ' if ok, return thread block (and Z clr)
#if defined(P2) && defined(NATIVE)
 jmp #@:thr_start_exit
#else
 PRIMITIVE(#JMPA)
 long @:thr_start_exit
#endif
:thr_start_error
 mov r0, #0 wz          ' if error, return zero (and Z set) 
:thr_start_exit
 PRIMITIVE(#CALA)
 long @C__thread_allow
 PRIMITIVE(#RETN)
' end
