' Catalina Code

DAT ' code segment

' Catalina Export _outb

 alignl ' align long

C__outb
 word I16B_EXEC
 alignl ' align long
 mov r0, OUTB
 andn r0, r3
 and r2, r3
 or r2, r0
 mov r0, OUTB
 mov OUTB, r2
 jmp #EXEC_STOP
 word I16B_RETN
' end

