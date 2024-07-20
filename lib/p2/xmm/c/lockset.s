'#line 1 "lockset.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
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

             stalli
             bith    lockbits, r2 wcz ' have we acquired ...
 if_nz       locktry r2 wc            ' ... both intra-cog and inter-cog locks?
 if_nc_and_nz  bitl    lockbits, r2   ' true = if_c_and_nz, false = if_nc_or_z
             allowi
 if_nc_or_z  mov     r0, #0           ' if we failed to get both, return 0
 if_c_and_nz mov     r0, #1           ' if we got both, return 1





 jmp #RETN
 ' end

