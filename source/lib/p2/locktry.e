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
' int _locktry(int lockid);
'    try and get a lock, and return 1 on success, 0 on failure
' on entry:
'    r2 = lock id
' on exit:
'    r0 = 1 if we locked it, 0 if it was already locked

DAT ' code segment

' Catalina Export _locktry

 alignl ' align long

C__locktry
 locktry r2 wc
 if_c mov r0, #1
 if_nc mov r0, #0
 PRIMITIVE(#RETN)
 ' end

