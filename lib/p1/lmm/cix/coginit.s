'#line 1 "coginit.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _coginit

 alignl ' align long

C__coginit













 mov r0, r4
 jmp #LODL
 long @C__coginit_L1




 rdlong RI, RI

 and r0, RI
 shl r0, #18
 mov r1, r3
 and r1, RI
 shl r1, #4
 or r0, r1
 mov r1, r2
 and r1, #$f
 or r0, r1
 coginit r0 wc, wr

 if_c neg r0, #1
 jmp #RETN

' Catalina Init


DAT ' initialized data segment
 alignl ' align long
C__coginit_L1 long $3fff ' 14 bits

' end

