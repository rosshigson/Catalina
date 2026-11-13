'#line 1 "clkfreq.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _clockfreq

 alignl ' align long

C__clockfreq

 rdlong r0, #$14



 cmp r0, #0 wz              ' if clock freq not set ...


 if_nz jmp #@:clkfreq_set    ' ... return ...
 mov r0,##180_000_000       ' ... default












:clkfreq_set
 calld PA,#RETN
' end

