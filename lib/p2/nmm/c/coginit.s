'#line 1 "coginit.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _coginit

 alignl ' align long

C__coginit

 mov r0, r2
 and r0, #$1f
 shl r3, #2  ' 1 needs actual hub address
 shl r4, #2  ' 1 needs actual hub address

 setq r4    ' this will end up in PTRA of the new cog
 coginit r0, r3 wc

























 if_c neg r0, #1
 calld PA,#RETN

' Catalina Init






' end

