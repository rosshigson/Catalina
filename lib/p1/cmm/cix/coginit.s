' Catalina Code

DAT ' code segment

' Catalina Export _coginit

 alignl ' align long

C__coginit
#ifdef P2
 word I16B_FCACHE + ((@C_coginit_fc_end-@C_coginit_fc_start)/4)<<S16B
 alignl ' align long
C_coginit_fc_start
 mov r0, r2
 and r0, #$1f
 shl r3, #2        ' P2 needs actual hub address
 shl r4, #2        ' P2 needs actual hub address
 setq r4           ' this will end up in PTRA of new cog
 coginit r0, r3 wc
 if_c neg r0, #1
 jmp #FC_RETURN    ' last inst returns from function
C_coginit_fc_end
#else
 alignl ' align long
 long I32_LODA + $3FFF<<S32 ' 14 bits
 word I16B_EXEC
 alignl ' align long
 mov r0, r4
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
 jmp #EXEC_STOP
#endif
 word I16B_RETN
' end

