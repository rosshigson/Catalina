'#line 1 "lockset.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.













' Catalina Code

' PASM implementations of fundamental multi-threading lock operations
'
' int _lockset(int lockid);
'    set a lock, and return 1 on success, 0 on failure
' on entry:
'    r2 = lock id
' on exit:
'    r0 = 1 if we locked it, 0 if it was already locked

DAT ' code segment

' Catalina Export _lockset

 alignl ' align long

C__lockset









             lockset r2 wc
 if_c        mov     r0, #0           ' if lock was already set, return 0
 if_nc       mov     r0, #1           ' if we set the lock, return 1

 jmp #RETN
 ' end

