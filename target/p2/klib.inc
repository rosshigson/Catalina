' Catalina kernel library functions ...

' avoid including the kernel library functions twice ...

#ifndef KERNEL_LIBRARY_INCLUDED
#define KERNEL_LIBRARY_INCLUDED

DAT

' unsigned_d32 - 32 bit unsigned division

unsigned_d32
         qdiv   r0,r1
         getqx  r0
  _ret_  getqy  r1

' signed_d32 - 32 bit signed division

signed_d32
         mov    t3,r1           ' save sign for later
         mov    t4,r0
         abs    r1,r1
         abs    r0,r0
         xor    t3,t4
         call   #\unsigned_d32  ' perform unsigned division
         mov    t4,t4 WC        ' get bit #31 into carry
         negc   r1,r1           ' adjust the sign of the remainder
         mov    t3,t3 WC        ' get bit #31 into carry
  _ret_  negc   r0,r0           ' adjust the sign of the result


' find_ptype - find plugin by type
'
' On entry:
'      r0 = plugin type
'
' On exit:
'      t2 = cog id if found, -1 if not found 
'      t1 = registry entry if found
'      Z set if found, Z clr if not found
'      t3 lost

find_ptype
        mov     t1,reg          ' point to registry
        mov     t2,#0           ' start at cog id 0
plgt1
        cmp     t2,#MAX_COGS wcz ' run out of cogs?
 if_ae  jmp     #plgt2          ' yes - no such plugin
        rdlong  t3,t1           ' no - check cog's plugin type
        shr     t3,#24          ' is it ...
        cmp     t3,r0 wz        ' ... the plugin type what we wanted?
 if_z   ret                     ' yes - return cog id in r0, Z set
        add     t2,#1           ' no - try ...
        add     t1,#4           ' ... next ...
        jmp     #plgt1          ' ... cog id
plgt2
 _ret_  neg     t2,#1 wz        ' plugin type not found

' do_plugin - call a plugin
'
' On entry:
'       r3 = code:
'            - cog id if >= 128 (i.e. $80 + cog id)
'            - plugin type if < 128 (i.e. 0 .. 127)
'            - service id if < 0 (i.r. -1 .. -127)
'       r2 = data (optional pointer)
'
' NOTES: Locks are currently only supported when invoking via a service id.
'        When using service id, the data should only use the lower 24 bits.
'
' On exit:
'       R0 = result

do_plugin
        mov     t4,#MAX_LOCKS   ' t4 stores lock - default to none required
        mov     r0,r3 wc        ' get plugin type or cog id or service id
 if_b   jmp     #psvc           ' if < 0, code is a service id
        test    r0,#$80 wz      ' if bit 7 set ...
 if_nz  jmp     #pcog           ' code is a cog id ...
        mov     r0,r3           ' otherwise ...
        call    #\find_ptype    ' ... find plugin by type
 if_nz  jmp     #plugerr        ' if Z clr, no such plugin
        mov     r0,t2           ' use the cog where we found the plugin
        jmp     #pcog           ' invoke plugin (via the cog id)
psvc
        shl     r0,#1           ' read entry ...
        add     r0,reg          ' ... from ...
        rdword  r0,r0           ' ... the service registry
        mov     t1,r0           ' save in t1 and extract ...
        shr     r0,#12          ' ... cog number to r0
        and     r0,#$f          ' cog number is 4 bits
        mov     t2,t1           ' save in t2 and extract ...
        and     t1,#$7f         ' ... 7 bit plugin-specific code ...
        shl     t1,#24 wz       ' ... to t1 (top 8 bits) ...
 if_z   jmp     #plugerr        ' ... or throw error if request code is zero
        mov     t4,t2           ' extract ...
        shr     t4,#7           ' ... lock number to t4
        and     t4,#$1f         ' lock is 5 bits
        test    t4,#$10 wz      ' are we required to use a lock?
 if_nz  jmp     #no_lock        ' no - just make the request
set_lock
        bith    lockbits, t4 wcz ' have we acquired ...              
 if_nz  locktry t4 wc            ' ... both intra-cog and inter-cog locks?
 if_nc_and_nz bitl  lockbits, t4 ' true = if_c_and_nz, false = if_nc_or_z
 if_nc_or_z jmp  #set_lock       ' keep trying until we have set the lock
no_lock
        andn    r2,top8         ' combine data ...
        or      r2,t1           ' ... with request code
pcog
        and     r0,#$f          ' mask off cog id to 0 .. 15
        shl     r0,#2           ' point to ...
        add     r0,reg          ' ... registry entry for the cog
        rdlong  r0,r0           ' get request block from registry
        test    r0,top8 wz      ' is a plugin registered in this cog?
 if_z   jmp     #plugerr        ' no - throw error 
        andn    r0,top8         ' yes - write ...
        wrlong  r2,r0           ' ... request 
ploop
        rdlong  r3,r0   wz      ' wait till ...
 if_nz  jmp     #ploop          ' ... request completed
        add     r0,#4           ' get ...
        rdlong  r0,r0           ' ... result
clr_lock
        cmp     t4,#MAX_LOCKS wcz ' did we set a lock?
 if_b   lockrel t4              ' yes - release the lock we set
 if_b   bitl lockbits, t4
        ret
plugerr 
        neg     r0,#1           ' plugin error (e.g. not registered)
        jmp     #clr_lock       ' done - clear lock if required

' do_register - register a plugin
'
' On entry:
'
'        r0 - initial value to write to request block
'        r1 - cog to register (lost)
'        r2 - lost
'        r3 - plugin type to register (lost)

do_register
        shl     r1, #2          ' register ...
        add     r1, ##REGISTRY  ' ... plugin ...
        rdlong  r2, r1          ' ...
        and     r2, ##$00FFFFFF ' ... as ...
        shl     r3, #24         ' ...
        or      r2, r3          ' ...
        wrlong  r2, r1          ' ... plugin type
  _ret_ wrlong  r0, r2          ' save in request block

' do_copy
'
' On entry:
'
'       r0 - dst addr
'       r1 - number of bytes to copy (must not be zero!)
'       r2 - src addr
'
' On exit:
'
'       r0 incremented by r1 (i.e. number of bytes)
'       r1 lost
'       r2 incremented by r1 (i.e. number of bytes)
'       r3 lost

do_copy
       rdbyte  r3, r2           '
       wrbyte  r3, r0                 
       add     r0, #1
       add     r2, #1
       djnz    r1, #do_copy     ' 
       ret

' do_loadlut_hub
'
' On entry:
'
'       r0 - Hub src addr
'       r1 - LUT dst addr
'       RI - number of longs to copy - 1
'
' On exit:
'       t1 lost
'       t2 lost

do_loadlut_hub
       rdlut   t1, ##.lutsrc  ' we can't use sets on code in the LUT ...
       sets    t1, r1         ' ... so we have ...
       wrlut   t1, ##.lutsrc  ' ... to do this instead!
       rdlong  t2, r0         ' read signature from hub
       nop                    ' need this!
.lutsrc
       rdlut   t1, #0-0        ' read signature from LUT
       cmp     t1, t2 wz      ' do we need to load?
       rdlut   t1, ##.lutdst  ' yes - we can't use setd on code in the LUT ...
       setd    t1, r1         ' ... so we have ...
       wrlut   t1, ##.lutdst  ' ... to do this instead!
       setq2   RI           '
.lutdst
 _ret_ rdlong  0-0, r0

#endif

