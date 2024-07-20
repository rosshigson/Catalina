'#line 1 "memlock.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code


CON
MEM_LOCK = $7E44           ' !!! Note: MUST match Catalina_Common !!!


DAT ' code segment

' Catalina Export _memory_get_lock

 alignl ' align long

C__memory_get_lock









 jmp #LODL
 long MEM_LOCK
 rdlong r0,RI

 jmp #RETN

' end C__memory_get_lock


' Catalina Export _memory_set_lock

 alignl ' align long

C__memory_set_lock








 jmp #LODL
 long MEM_LOCK

 rdlong r0,RI
 wrlong r2,RI
 jmp #RETN

' end C__memory_set_lock


' Catalina Export _memory_lock

 alignl ' align long

C__memory_lock
















































 jmp #LODL
 long MEM_LOCK
 rdlong r2,RI
 cmps r2,#0 wc             ' C = 1 if no lock currently in use
 jmp #BR_B          ' if no lock in use just return
 long @C__memory_lock_1
C__memory_lock_0
 lockset r2 wc             ' C = 1 if we got the lock
 jmp #BRAE          ' if we got the lock just return
 long @C__memory_lock_1







 jmp #JMPA          ' keep trying
 long @C__memory_lock_0

C__memory_lock_1
 jmp #RETN

' end C__memory_lock


' Catalina Export _memory_unlock

 alignl ' align long

C__memory_unlock

















 jmp #LODL
 long MEM_LOCK
 rdlong r2,RI
 cmps r2,#0 wc               ' C = 1 if no lock currently in use
 jmp #BR_B
 long @C__memory_unlock_1    ' return if no lock in use
  lockclr r2                 ' if a lock is in use unlock it

C__memory_unlock_1
 jmp #RETN

' end C__memory_unlock

