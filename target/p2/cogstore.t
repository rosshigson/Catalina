{{
'   CogStore - a simple program to store and retrieve up to 1200 characters
'   of a zero terminated string in cog ram. Supports write, read and validate
'   (to see if this program is runnning), plus a request to use the stored
'   data to set up argc and argv for use by a Catalina C program. 
'
'   All interaction is done using the long at COGSTORE.
'
'   NOTE: CogStore  always uses cog STORE_COG
'
'   Version 3.0 - Fixed bug in Stop method.
'                 Make Stop method independent of cog used.
'   Version 3.1 - use STORE_COG
'
'   Version 3.3 - Tidy up platform dependencies
'
'   Version 3.15 - P2 support.
'
'   Version 5.4  - Fixed a problem processing 12 or more arguments
'
'   Version 6.4  - Add support for storing a second string in LUT RAM.
'                  This is used to transfer an environment string to 
'                  programs started by Catalyst. Up to 2k bytes (512
'                  longs) inlcuding terminator can be stored.
'
}}

CON

#include <constant.inc>

CON

{{
PUB Start

  ' start the COGSTORE as cog STORE_COG
  coginit(STORE_COG, @entry, 0)


PUB Valid : ok

  long[COGSTORE] := -1 ' any invalid command
  repeat 1000
    if long[COGSTORE] == CMD_RESPONSE
      return -1
  return 0

PUB Stop

  if Valid
    ' stop the COGSTORE  
    long[COGSTORE] := CMD_STOP
    repeat 10000
      if long[COGSTORE] == 0
        return -1
    return 0

PUB Write(Addr) : ok

  if Valid
    long[COGSTORE] := CMD_WRITE | Addr
    repeat 10000
      if long[COGSTORE] == 0
        return -1
    return 0
  else
    return 0


PUB Read(Addr) : ok

  if Valid
    long[COGSTORE] := CMD_READ | Addr
    repeat 10000
      if long[COGSTORE] == 0
        return -1
    return 0
  else
    return 0


PUB Size | s

  if not Valid
    return -1
    
  long[COGSTORE] := CMD_SIZE | $FFFFFF 
  repeat 1000
    if long[COGSTORE] <> CMD_SIZE | $FFFFFF
      return long[COGSTORE] & $FFFFFF
  return -2

PUB Setup(addr) : i

  long[ARGC_ADDR] := 0
  long[ARGV_ADDR] := 0
  repeat i from 0 to ARGV_MAX-1
    long[ARGV_0][i] := 0
    
  if not Valid
    long[ARGC_ADDR] := 1
    long[ARGV_ADDR] := ARGV_0
    ' use "null" as name if no arguments
    long[ARGV_0] := ARGV_0 + 4*(ARGV_MAX-2)
    long[ARGV_0][ARGV_MAX-2] := $6C6C756E ' null
  else
    long[COGSTORE] := CMD_SETUP | Addr
    repeat 10000
      if long[COGSTORE] == 0
        return -1
    return 0
}}

{{

' NOTE: These are the above Spin functions translated to PASM
' in case they are ever needed - they have not been tested!

DAT           orgh

cogstore_start
              mov r0, #STORE_COG
              mov r1, ##@START_COGSTORE
       _ret_  coginit r0, r1 wc

cogstore_valid
              neg r0, #1
              wrlong r0, ##COGSTORE
              mov r1, ##1000
.valid_loop   rdlong r0, ##COGSTORE
              cmp r0, ##CMD_RESPONSE wz
       if_z   neg r0, #1
       if_z   ret
              djnz r1, #.valid_loop
       _ret_  mov r0, #0

cogstore_stop
              call #cogstore_valid
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

cogstore_write
              call #cogstore_valid
              cmp r0, #0 wz
       if_z   ret
              mov r0, ##CMD_WRITE
              or  r0, r1
              wrlong r0, ##COGSTORE
              mov r1, ##10000
.write_loop
              rdlong r0, ##COGSTORE wz
       if_z   neg r0, #1
       if_z   ret
              djnz r1, #.write_loop
       _ret_  mov r0, #0

cogstore_read
              call #cogstore_valid
              cmp r0, #0 wz
       if_z   ret
              mov r0, ##CMD_READ
              or  r0, r1
              wrlong r0, ##COGSTORE
              mov r1, ##10000
.read_loop
              rdlong r0, ##COGSTORE wz
       if_z   neg r0, #1
       if_z   ret
              djnz r1, #.read_loop
       _ret_  mov r0, #0

cogstore_size
              call #cogstore_valid
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

cogstore_setup
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
              call #cogstore_valid
              cmp r0, #0 wz
       if_nz  jmp #.setup_valid
              mov r0, #1
              wrlong r0, ##ARGC_ADDR
              mov r2, ##(ARGV_0 + 3 * ARGV_MAX-2)
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

}} 

DAT
              org       0

START_COGSTORE

#ifdef DEBUG_LED_COGSTORE
              drvl      #_DEBUG_PIN              ' for debug
#endif
.done
              mov       .t0,#0
              wrlong    .t0,.command
#ifdef DEBUG_LED_COGSTORE
              mov       .count,.count_init      ' for debug
#endif
'
' loop - until we get a valid command
'
.loop
#ifdef DEBUG_LED_COGSTORE
              sub       .count,#1 wz            ' for debug
        if_z  drvnot    #_DEBUG_PIN             ' for debug
        if_z  mov       .count,.count_init      ' for debug
#endif
              rdlong    .t0,.command wz         ' loop ...
        if_z  jmp       #.loop                  ' ... till ...
              cmp       .t0,.response wz        ' ... we get ...
        if_z  jmp       #.loop                  ' ... a command
              mov       .t1,.t0                 ' extract ...
              and       .t1,.low24              ' ... address argument
              shr       .t0,#28                 ' extract command
              djz       .t0,#.do_read           ' read
              djz       .t0,#.do_write          ' write
              djz       .t0,#.do_size           ' size
              djz       .t0,#.do_setup          ' setup
              djz       .t0,#.do_stop           ' stop
              djz       .t0,#.lut_read          ' lut_read
              djz       .t0,#.lut_write         ' lut_write
              djz       .t0,#.lut_size          ' lut_size
.identify        
              wrlong    .response,.command      ' otherwise return unlikely response ...
              jmp       #.loop                  ' ... and loop till we get a known command
'
' do_read - read a zero-terminated string (up to MAX_LONGS * 4 chars incl terminator) from cog RAM
'
.do_read
              setd      .rd_inst,#.storage      ' read a copy ...                                
              mov       .t0,.len wz             ' ... of ...                                
.rd_loop                                        ' ... the ...                                  
        if_z  jmp       #.done                  ' ... string ...                                
.rd_inst      wrlong    0-0,.t1                 ' ... to ...                              
              add       .rd_inst,.d_inc         ' ... the ...                                 
              add       .t1,#4                  ' ... address ...                                   
              sub       .t0,#1 wz               ' ... provided ...                              
              jmp       #.rd_loop               ' ... (assume there is enough space!)
'
' do_write - write a zero-terminated string (up to MAX_LONGS * 4 chars incl terminator) to cog RAM
'
.do_write
              setd      .wr_inst,#.storage      ' write ...
              mov       .len,#0                 ' ... a ...
.wr_loop                                        ' ... copy ...
              rdlong    .t2,.t1                 ' ... of ...
.wr_inst      mov       0-0,.t2                 ' ... the ...
              add       .wr_inst,.d_inc         ' ... string ...
              add       .t1,#4                  ' ... to ...
              add       .len,#1                 ' ... cog ...
              cmp       .len,#MAX_LONGS wz      ' ... RAM ...
        if_z  jmp       #.done                  ' ... stopping ...
              mov       .t0,#4                  ' ... when ... 
.wr_test      test      .t2,#$FF wz             ' ... cog ...
      if_z    jmp       #.done                  ' ... full ...
              shr       .t2,#8                  ' ... or ...
              djnz      .t0,#.wr_test           ' ... termination ... 
              jmp       #.wr_loop               ' ... detected
'
' do_size - return the size (in LONGs) of the stored string (incl terminator)
'
.do_size
              cmp       .t1,.low24 wz           ' return ...
        if_nz jmp       #.loop                  ' ... the ...                     
              mov       .t0,.len                ' ... size (in LONGs) ...
              or        .t0,##CMD_SIZE          ' ... of ...
              wrlong    .t0,.command            ' ... the stored ...
              jmp       #.loop                  ' ... command line
'
' lut_read - read zero terminated LONGs (including terminator) from LUT
'
.lut_read
              mov       .t3,#0                  ' read a copy ...                                
              mov       .t0,.lut_len wz         ' ... of ...                                
.rl_loop                                        ' ... the ...                                  
        if_z  jmp       #.done                  ' ... LUT ...
              rdlut     .t2,.t3                 ' ... LONGs ...
              wrlong    .t2,.t1                 ' ... to ...                              
              add       .t3,#1                  ' ... the ...                                 
              add       .t1,#4                  ' ... address ...                                   
              sub       .t0,#1 wz               ' ... provided ...                              
              jmp       #.rl_loop               ' ... (assume there is enough space!)
'
' lut_write - write zero terminated LONGs (up to LUT_LONGS incl terminator) to LUT
'
.lut_write
              mov       .t3,#0                  ' write ...
              mov       .lut_len,#0             ' ... a ...
.wl_loop                                        ' ... copy ...
              rdlong    .t2,.t1                 ' ... of ...
              wrlut     .t2,.t3                 ' ... the ...
              add       .t3,#1                  ' ... LONGs ...
              add       .t1,#4                  ' ... to ...
              add       .lut_len,#1             ' ... LUT ...
              cmp       .lut_len,##LUT_LONGS wz ' ... RAM ...
        if_nz tjnz      .t2,#.wl_loop           ' ... including ... 
              jmp       #.done                  ' ... terminator
'
' lut_size - return the size (in LONGs) of the stored LUT string (incl terminator)
'
.lut_size
              cmp       .t1,.low24 wz           ' return ...
        if_nz jmp       #.loop                  ' ... the ...                     
              mov       .t0,.lut_len            ' ... size (in LONGs) ...
              or        .t0,##LUT_SIZE          ' ... of ...
              wrlong    .t0,.command            ' ... the stored ...
              jmp       #.loop                  ' ... LUT data
'
' do_setup - read the string to the address specified, then decompose it to argc/argv
'
.do_setup                                        
              tjz       .len,#.no_args          ' if no stored string, set argc/argv to default values
              mov       .t2,.t1                 ' save the address argument
              setd      .su_inst,#.storage      ' otherwise ...
              mov       .t0,.len wz             ' ... read ...
.su_loop                                        ' ... the ...             
        if_z  jmp       #.su_count_args         ' ... stored ...
.su_inst       wrlong    0-0,.t1                ' ... string ...
              add       .su_inst,.d_inc         ' ... to ...
              add       .t1,#4                  ' ... the ...
              sub       .t0,#1 wz               ' ... address ...
              jmp       #.su_loop               ' ... provided (assume there is enough space!) 
.su_count_args
              mov       .t1,.t2                 ' count the number of arguments in the string
              mov       .n,#0                   ' no arguments yet           
              mov       .q,#0                   ' not in a quoted string                                                    
.su_count_loop
              call      #.skip_to_non_space     ' find next non-space
              cmp       .t0,#0 wz               ' end of string?
        if_z  jmp       #.su_save_argc          ' yes - set up argc
              add       .n,#1                   ' no - found an argument
              call      #.skip_to_space         ' skip to next space (i.e. end of argument)                            
              jmp       #.su_count_loop                         
.su_save_argc
              cmp       .n,#ARGV_MAX wcz        ' set up argc and first element of argv                                 
        if_a  mov       .n,#ARGV_MAX            '                                    
              wrlong    .n,.argc                ' long[ARGC_ADDR] := n                                              
              wrlong    .argv_start,.argv       ' long[ARGV_ADDR] := argv_0                               
              mov       .t1,.t2      
              call      #.skip_to_non_space     ' find start of first argument ...
              mov       .t3,.argv_start         ' ... and save it ...                                
              wrlong    .t1,.t3                 ' ... in long[ARGV_0] 
              mov       .q,#0                   ' not currently within quoted string
              mov       .n,#0                   ' start processing again at argument 0
.su_argv_loop
              rdbyte    .t0,.t1 wz              ' deconstruct command line, creating the argv array as we go                 
        if_z  jmp       #.su_argv_done          ' end of string found - terminate the argv array                                                                    
              cmp       .t0,#QUOTE_CHAR wz      ' found a quote?                                                            
        if_nz jmp       #.su_argv_notquote      ' no - just copy character (or terminate argument of it is a space)
              xor       .q,#1 wz                ' yes - toggle marker indicating we are within quoted string
        if_nz jmp       #.su_argv_nextchar      ' if this is the start of a quoted string, just keep processing
              mov       .t0,.t1                 ' otherwise, is the end ...
              add       .t0,#1                  ' ... of the quoted string ...
              rdbyte    .t0,.t0 wz              ' ... also ... 
        if_z  jmp       #.su_argv_chkquote      ' ... the end ...
              cmp       .t0,#" " wz              ' ... of the argument?
        if_nz jmp       #.su_argv_nextchar      ' no - just keep processing 
.su_argv_chkquote
              rdlong    .t0,.t3                 ' yes - is there a quote ...
              rdbyte    .t0,.t0                 ' ... at the start ...
              cmp       .t0,#QUOTE_CHAR wz      ' ... of the argument?
        if_z  jmp       #.su_argv_delquote      ' yes - delete the start and end quotes 
              add       .t1,#1                  ' no - do not delete the start or end quotes ...
              jmp       #.su_argv_nextarg       ' ... just save the argument        
.su_argv_delquote             
              rdlong    .t0,.t3                 ' remove quote ...
              add       .t0,#1                  ' ... from start ...     
              wrlong    .t0,.t3                 ' ... of string
              jmp       #.su_argv_nextarg       ' save next argument
.su_argv_notquote                                 
              cmp       .t0,#" " wz             ' found a space?              
        if_nz jmp       #.su_argv_nextchar      ' no - just keep processing                                       
              tjnz      .q,#.su_argv_nextchar   ' yes - are we within a quote? If yes, just keep processing
.su_argv_nextarg              
              add       .n,#1                   ' no - found the end of an argument                                       
              cmp       .n,#ARGV_MAX wcz        ' too many arguments?                                      
        if_a  jmp       #.su_argv_done          ' yes - done                                       
              mov       .t0,#0                  ' no - zero terminate ...
              wrbyte    .t0,.t1                 ' ... the current argument                                          
              add       .t1,#1                  ' find the start ...    
              call      #.skip_to_non_space     ' ... of the next argument
              rdbyte    .t0,.t1 wz              ' end of string?
        if_z  jmp       #.su_argv_done          ' yes - terminate qrgv array
              add       .t3,#4                  ' no - save new pointer ...          
              wrlong    .t1,.t3                 ' ... in the argv array          
              jmp       #.su_argv_loop          ' ... and keep processing
.su_argv_nextchar        
              add       .t1,#1                  '  process ...              
              jmp       #.su_argv_loop          '  ... the next character          
.su_argv_done                                                        
              jmp       #.done                  '   
.no_args                                        ' 
              mov       .t0,#0                  ' if no stored string ...   
              wrlong    .t0,.argc               ' ... set argc ...                    
              wrlong    .t0,.argv_start         ' ... and argv_0 to zero                 
              wrlong    .argv_start,.argv       ' set argv to argv_0          
              jmp       #.done                   
'
' do_stop - stop ourselves
'
.do_stop
              cogid     .t1
              mov       .t0,#0
              wrlong    .t0,.command
              cogstop   .t1
'
' skip_to_non_space - skip to next non-space byte in string pointed to by t1, returning byte in .t0
'
.skip_to_non_space
              rdbyte    .t0,.t1
              cmp       .t0,#" " wz
        if_z  add       .t1,#1     
        if_z  jmp       #.skip_to_non_space          
.skip_to_non_space_ret
              ret
'
' skip_to_space - skip to next space in string pointed to by t1 (or end of string), returning byte in .t0
'                 note that we take quotes into account by skipping over any spaces within quotes
'
.skip_to_space
              rdbyte    .t0,.t1 wz
        if_z  jmp       #.skip_to_space_ret
              cmp       .t0,#QUOTE_CHAR wz
        if_z  xor       .q,#1
        if_z  jmp       #.skip_char
              cmp       .t0,#" " wz
        if_nz jmp       #.skip_char
              tjz       .q,#.skip_to_space_ret
.skip_char              
              add       .t1,#1
              jmp       #.skip_to_space          
.skip_to_space_ret
              ret

'
.t0            long      0
.t1            long      0
.t2            long      0
.t3            long      0
.low24         long      $FFFFFF
.command       long      COGSTORE   
.response      long      CMD_RESPONSE
.argc          long      ARGC_ADDR
.argv          long      ARGV_ADDR
.argv_start    long      ARGV_0
.d_inc         long      1<<9
.len           long      0                      ' CMD storage used (longs)
.lut_len       long      0                      ' LUT storage used (longs)

.n             long      0
.q             long      0

#ifdef DEBUG_LED_COGSTORE
.count_init    long      1000000                ' for debug
.count         long      0                      ' for debug
#endif

              fit       196                     ' make sure at least 300 longs are available                      

.storage       long      0                      ' long storage starts here      
