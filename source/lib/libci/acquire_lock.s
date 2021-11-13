'#line 1 "acquire_lock.e"











' Catalina Code

DAT ' code segment

' Catalina Export _acquire_lock

 alignl ' align long

C__acquire_lock
C__acquire_lock_1

        bith    lockbits, r2 wcz   ' have we acquired ...
 if_nz  locktry r2 wc              ' ... both intra-cog and inter-cog locks?
 if_nc_and_nz  bitl lockbits, r2   ' true = if_c_and_nz, false = if_nc_or_z

 if_nc_or_z  jmp #C__acquire_lock_1











 PRIMITIVE(#RETN)
 ' end

