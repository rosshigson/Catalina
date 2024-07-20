'#line 1 "clkfreq.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _clockfreq

 alignl ' align long

C__clockfreq



 rdlong r0, #0

 cmp r0, #0 wz              ' if clock freq not set ...











 jmp #BRNZ
 long @:clkfreq_set
 jmp #LODL
 long 80_000_000            ' ... default

:clkfreq_set
 jmp #RETN
' end

