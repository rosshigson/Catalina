' Catalina argument set up ...

DAT
 
' Argument initialization code ...

INITIALIZE_ARGUMENTS

         call    #.cogstore_size
         rdlong  r1, ##FREE_MEM
         cmps    r0, #0 wcz
 if_be   jmp     #.setup
         shl     r0, #2
         sub     r1, r0
         wrlong  r1, ##FREE_MEM
.setup
         call    #.cogstore_setup
         call    #.cogstore_stop
         cogid   r1
         mov     r0, #0
.stop_another
 cmp     r0, r1 wz
 if_nz   cogstop r0
         add r0, #1 
         cmp r0, #LAST_COG wcz
 if_be   jmp #.stop_another
         ret

' CogStore support routines ...

.cogstore_valid
         neg r0, #1
         wrlong r0, ##COGSTORE
         mov r1, ##1000
.valid_loop
         rdlong r0, ##COGSTORE
         cmp r0, ##CMD_RESPONSE wz
  if_z   neg r0, #1
  if_z   ret
         djnz r1, #.valid_loop
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

.cogstore_size
         call #.cogstore_valid
         cmp r0, #0 wz
  if_z   ret
         mov r1, ##CMD_SIZE
         or  r1, ##$FFFFFF
         wrlong r1, ##COGSTORE
         mov r2, ##1000
.size_loop
         rdlong r0, ##COGSTORE
         cmp r0, r1 wz
  if_nz  and r0, ##$FFFFFF
  if_nz  ret
         djnz r2, #.size_loop
  _ret_  neg r0, #2

.cogstore_setup
         mov r0, #0
         wrlong r0, ##ARGC_ADDR
         mov r3, ##ARGV_0
         wrlong r3, ##ARGV_ADDR
         mov r3, #ARGV_MAX-1
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
         mov r3, ##$006C756E ' nul
         wrlong r3, r2
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

