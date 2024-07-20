'#line 1 "acquire.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _acquire_lock

 alignl ' align long

C__acquire_lock
C__acquire_lock_1













 lockset r2 wc
 jmp #BR_B
 long @C__acquire_lock_1

 jmp #RETN
 ' end

