'#line 1 "lockset.e"











' Catalina Code

DAT ' code segment

' Catalina Export _lockset

 alignl ' align long

C__lockset

             stalli
             bith    lockbits, r2 wcz ' have we acquired ...
 if_nz       locktry r2 wc            ' ... both intra-cog and inter-cog locks?
 if_nc_and_nz  bitl    lockbits, r2   ' true = if_c_and_nz, false = if_nc_or_z
             allowi
 if_nc_or_z  mov     r0, #0
 if_c_and_nz mov     r0, #1





 PRIMITIVE(#RETN)
 ' end

