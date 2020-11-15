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

' do_plugin - call a plugin
'
' On entry:
'       R3 = code:
'            - cog id if >= 128 (i.e. $80 + cog id)
'            - plugin type if < 128 (i.e. 0 .. 127)
'            - service id if < 0
'       R2 = data (optional pointer)
'
' NOTES: Locks are currently only supported when invoking via a service id.
'        When using service id, the data should only use the lower 24 bits.
'
' On exit:
'       R0 = result

do_plugin
        mov     t4,#8           ' t4 stores lock - default to none required
        mov     r0,r3 wc        ' get plugin type or cog id or service id
 if_b   jmp     #psvc           ' if < 0, code is a service id
        test    r0,#$80 wz      ' if bit 7 set ...
 if_nz  jmp     #pcog           ' code is a cog id ...
ptype                           ' ... otherwize it's a plugin type
        mov     t1,reg          ' point to registry
        mov     t2,#0           ' start at cog id 0
plgt1
        cmp     t2,#8 wcz       ' run out of cogs?
 if_ae  jmp     #plugerr        ' yes - no such plugin
        rdlong  t3,t1           ' no - check cog's plugin type
        shr     t3,#24          ' is it ...
        cmp     t3,r0 wz        ' ... the plugin type what we wanted?
 if_z   jmp     #plgt2          ' yes - invoke plugin at this cog id
 if_nz  add     t2,#1           ' no - try ...
 if_nz  add     t1,#4           ' ... next ...
 if_nz  jmp     #plgt1          ' ... cog id
plgt2
        mov     r0,t2           ' use the cog where we found the plugin
        jmp     #pcog           ' invoke plugin (via the cog id)
psvc
        shl     r0,#1           ' read entry ...
        add     r0,reg          ' ... from ...
        rdword  r0,r0           ' ... the service registry
        mov     t1,r0           ' save in t1 and extract ...
        shr     r0,#12          ' ... cog number to r0
        mov     t2,t1           ' save in t2 and extract ...
        shl     t1,#24 wz       ' ... request code to t1 (top 8 bits) ...
 if_z   jmp     #plugerr        ' ... or throw error if request code is zero
        mov     t4,t2           ' extract ...
        shr     t4,#8           ' ... lock number to t4
        test    t4,#8 wz        ' are we required to use a lock?
 if_nz  jmp     #no_lock        ' no - just make the request
set_lock
        locktry t4 wc           ' yes - loop ...
 if_nc  jmp     #set_lock       ' ... until we have set the lock
no_lock
        andn    r2,top8         ' combine data ...
        or      r2,t1           ' ... with request code
pcog
        and     r0,#7           ' mask off cog id to 0 .. 7
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
        test    t4,#8 wz        ' did we set a lock?
 if_z   lockrel t4              ' yes - release the lock we set
        ret
plugerr 
        neg     r0,#1           ' plugin error (e.g. not registered)
        jmp     #clr_lock       ' done - clear lock if required

#endif

