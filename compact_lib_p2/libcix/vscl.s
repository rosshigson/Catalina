' Catalina Code

DAT ' code segment

' Catalina Export _vscl

 alignl ' align long

C__vscl
#ifdef P2
 ERROR: "vscl not implemented on the P2"
#else
 word I16B_EXEC
 alignl ' align long
 mov r0, VSCL
 andn r0, r3
 and r2, r3
 or r2, r0
 mov r0, VSCL
 mov VSCL, r2
 jmp #EXEC_STOP
 word I16B_RETN
#endif
' end

