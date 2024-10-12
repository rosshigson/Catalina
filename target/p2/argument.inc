' Catalina argument and environment set up ...

#ifndef NO_ENV

DAT

' Argument initialization code ...

INITIALIZE_ENVIRON

         call    #.cogstore_valid
         cmp     r0, #0 wz
  if_z   ret
         mov     r1, ##(LUT_READ|ENVIRON)
         wrlong  r1, ##COGSTORE
         mov r2, ##10000
.lut_loop
         rdlong  r0, ##COGSTORE wz
  if_nz  djnz    r2, #.lut_loop
         call    #.cogstore_stop
         ret
#endif

#ifndef NO_ARGS

DAT

' Argument initialization code ...

INITIALIZE_ARGUMENTS

         call    #.cogstore_size
         rdlong  r1, ##FREE_MEM
         cmps    r0, #0 wcz
 if_be   jmp     #.no_buffer ' no buffer required
         shl     r0, #2 ' convert size in long to bytes
         sub     r1, r0
         wrlong  r1, ##FREE_MEM
.no_buffer
         call    #.cogstore_setup
#ifdef NO_ENV
         call    #.cogstore_stop
#endif
         ret

#endif

#if !defined(NO_ARGS) || !defined(NO_ENV)

' CogStore support routines ...

.cogstore_valid
         neg r0, #1
         wrlong r0, ##COGSTORE
         mov r3, ##10000
.valid_loop
         rdlong r0, ##COGSTORE
         cmp r0, ##CMD_RESPONSE wz
  if_z   neg r0, #1
  if_z   ret
         djnz r3, #.valid_loop
  _ret_  mov r0, #0

.cogstore_stop
         call #.cogstore_valid
         cmp r0, #0 wz
  if_z   ret
         mov r0, ##CMD_STOP
         wrlong r0, ##COGSTORE
         mov r1, ##10000
.stop_loop
         rdlong r0, ##COGSTORE wz
  if_z   neg r0, #1
  if_z   ret
         djnz r1, #.stop_loop
  _ret_  mov r0, #0

#endif

#ifndef NO_ARGS

.cogstore_size
#if CONST_ARGS
         mov r0, #MAX_LONGS
         ret
#else
         call #.cogstore_valid
         cmp r0, #0 wz
  if_z   ret
         mov r1, ##CMD_SIZE
         or  r1, ##$FFFFFF
         wrlong r1, ##COGSTORE
         mov r2, ##10000
.size_loop
         rdlong r0, ##COGSTORE
         cmp r0, r1 wz
  if_nz  and r0, ##$FFFFFF
  if_nz  ret
         djnz r2, #.size_loop
  _ret_  neg r0, #2
#endif

.cogstore_setup
         mov r0, #0
         wrlong r0, ##ARGC_ADDR
         mov r3, ##ARGV_0
         wrlong r3, ##ARGV_ADDR
         mov r3, #ARGV_MAX
         mov r2, ##ARGV_0
.setup_loop1
         wrlong r0, r2
         add r2, #4
         djnz r3, #.setup_loop1
         call #.cogstore_valid
         cmp r0, #0 wz
  if_nz  jmp #.setup_valid
         mov r0, #1
         wrlong r0, ##ARGC_ADDR
         mov r2, ##(ARGV_0 + 4 * (ARGV_MAX-2))
         wrlong r2, ##ARGV_0
         mov r3, ##$6C6C756E ' null
         wrlong r3, r2
         add r2, #4
         mov r0, #0
         wrlong r0, r2
  _ret_  neg r0, #1
.setup_valid
         mov r0, ##CMD_SETUP
         or  r0, r1
         wrlong r0, ##COGSTORE
         mov r1, ##10000
.setup_loop2
         rdlong r0, ##COGSTORE wz
  if_z   neg r0, #1
  if_z   ret
         djnz r1, #.setup_loop2
  _ret_  mov r0, #0

#endif


