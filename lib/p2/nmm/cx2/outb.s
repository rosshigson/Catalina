'#line 1 "outb.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _outb

 alignl ' align long

C__outb
 mov r0, OUTB
 andn r0, r3
 and r2, r3
 or r2, r0
 mov r0, OUTB
 mov OUTB, r2
 calld PA,#RETN
' end

