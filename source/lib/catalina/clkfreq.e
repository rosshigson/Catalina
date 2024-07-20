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

' Catalina Export _clockfreq

 alignl ' align long

C__clockfreq
#ifdef P2
 rdlong r0, #$14
#else
 rdlong r0, #0
#endif
 cmp r0, #0 wz              ' if clock freq not set ...
#ifdef P2
#ifdef NATIVE
 if_nz jmp #@:clkfreq_set    ' ... return ...
 mov r0,##180_000_000       ' ... default 
#else
 PRIMITIVE(#BRNZ)
 long @:clkfreq_set
 PRIMITIVE(#LODL)
 long 180_000_000           ' ... default
#endif
#else
 PRIMITIVE(#BRNZ)
 long @:clkfreq_set
 PRIMITIVE(#LODL)
 long 80_000_000            ' ... default
#endif
:clkfreq_set 
 PRIMITIVE(#RETN)
' end

