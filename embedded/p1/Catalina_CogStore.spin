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
'   Version 5.4  - Fixed a problem processing 12 or more arguments
}}

CON

#include "Custom_CFG.inc"

CON

#ifdef DEBUG_LED_COGSTORE
  LED_MASK   = |<Common#DEBUG_PIN
#endif

MAX_LONGS  = common#COGSTORE_MAX ' store up to 400 LONGS (1200 chars)

COGSTORE   = common#COGSTORE    ' LONG location used by this cog for commands

ARGC_ADDR  = common#ARGC_ADDR   ' argc will be saved in this WORD

ARGV_ADDR  = common#ARGV_ADDR   ' address of argv will be saved in this WORD

ARGV_0     = common#ARGV_0      ' default argv array (of LONGs)

ARGV_MAX   = common#ARGV_MAX    ' default max size of argv array


CMD_READ   = $1000_0000         ' copy Hub to Cog (address in lower 24 bits)
                                ' COGSTORE set to zero when complete

CMD_WRITE  = $2000_0000         ' copy Cog to Hub (address in lower 24 bits)
                                ' COGSTORE set to zero when complete

CMD_SIZE   = $3000_0000         ' return size of stored data (in LONGs) - set
                                ' lower 24 bits to $FFFFFF on call - lower 24 
                                ' bits (set to size when complete)

CMD_SETUP  = $4000_0000         ' setup argc and argv array with the stored 
                                ' data (set to zero when complete)

CMD_STOP   = $5000_0000         ' stop the CogStore cog.

CMD_RESPONSE = $FEED_FACE       ' COGSTORE set to this on any other command

QUOTE_CHAR = $22

OBJ

   common : "Catalina_Common"
   
PUB Start

  ' start the COGSTORE as cog STORE_COG
  coginit(Common#STORE_COG, @entry, 0)


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

  word[ARGC_ADDR] := 0
  word[ARGV_ADDR] := 0
  repeat i from 0 to ARGV_MAX-1
    long[ARGV_0][i] := 0
    
  if not Valid
    word[ARGC_ADDR] := 1
    word[ARGV_ADDR] := ARGV_0
    ' use "null" as name if no arguments
    long[ARGV_0] := ARGV_0 + 4*(ARGV_MAX-2)
    long[ARGV_0][ARGV_MAX-2] := $6C6C756E ' null
  else
    long[COGSTORE] := CMD_SETUP | Addr
    repeat 10000
      if long[COGSTORE] == 0
        return -1
    return 0

DAT
              org       0
entry
#ifdef DEBUG_LED_COGSTORE
              mov       dira,DEBUG_LED          ' for debug
              mov       outa,DEBUG_LED          ' for debug
#endif
done
              mov       t0,#0
              wrlong    t0,command
#ifdef DEBUG_LED_COGSTORE
              mov       count,count_init        ' for debug
#endif
'
' loop - until we get a valid command
'
loop
#ifdef DEBUG_LED_COGSTORE
              sub       count,#1 wz             ' for debug
        if_z  xor       outa,DEBUG_LED          ' for debug
        if_z  mov       count,count_init        ' for debug
#endif
              rdlong    t0,command wz           ' loop ...
        if_z  jmp       #loop                   ' ... till ...
              cmp       t0,response wz          ' ... we get ...
        if_z  jmp       #loop                   ' ... a command
              mov       t1,t0                   ' extract ...
              and       t1,low24                ' ... address argument
              shr       t0,#28                  ' extract command
              cmp       t0,#CMD_READ>>28 wz     ' do ...
        if_z  jmp       #do_read                ' ... read
              cmp       t0,#CMD_WRITE>>28 wz    ' do ... 
        if_z  jmp       #do_write               ' ... write               
              cmp       t0,#CMD_SIZE>>28 wz     ' do ...
        if_z  jmp       #do_size                ' ... size
              cmp       t0,#CMD_SETUP>>28 wz    ' do ...
        if_z  jmp       #do_setup               ' ... setup
              cmp       t0,#CMD_STOP>>28 wz     ' do ...
        if_z  jmp       #do_stop                ' ... stop
identify        
              wrlong    response,command        ' otherwise return unlikely response ...
              jmp       #loop                   ' ... and loop till we get a known command
'
' do_read - read a zero-terminated string (up to MAX_LONGS * 4 chars incl terminator) from cog RAM
'
do_read
              movd      rd_inst,#storage        ' read a copy ...                                
              mov       t0,len wz               ' ... of ...                                
rd_loop                                         ' ... the ...                                  
        if_z  jmp       #done                   ' ... string ...                                
rd_inst       wrlong    0-0,t1                  ' ... to ...                              
              add       rd_inst,d_inc           ' ... the ...                                 
              add       t1,#4                   ' ... address ...                                   
              sub       t0,#1 wz                ' ... provided ...                              
              jmp       #rd_loop                ' ... (assume there is enough space!)
'
' do_write - write a zero-terminated string (up to MAX_LONGS * 4 chars incl terminator) to cog RAM
'
do_write
              movd      wr_inst,#storage        ' write ...
              mov       len,#0                  ' ... a ...
wr_loop                                         ' ... copy ...
              rdlong    t2,t1                   ' ... of ...
wr_inst       mov       0-0,t2                  ' ... the ...
              add       wr_inst,d_inc           ' ... string ...
              add       t1,#4                   ' ... to ...
              add       len,#1                  ' ... cog ...
              cmp       len,#MAX_LONGS wz       ' ... RAM ...
        if_z  jmp       #done                   ' ... stopping ...
              mov       t0,#4                   ' ... when ... 
wr_test       test      t2,#$FF wz              ' ... cog ...
      if_z    jmp       #done                   ' ... full ...
              shr       t2,#8                   ' ... or ...
              djnz      t0,#wr_test             ' ... termination ... 
              jmp       #wr_loop                ' ... detected
'
' do_size - return the size (in LONGs) of the stored string (incl terminator)
'
do_size
              cmp       t1,low24 wz             ' return ...
        if_nz jmp       #loop                   ' ... the ...                     
              mov       t0,len                  ' ... size (in LONGs) ...
              or        t0,size_cmd             ' ... of ...
              wrlong    t0,command              ' ... the stored ...
              jmp       #loop                   ' ... command line
'
' do_setup - read the string to the address specified, then decompose it to argc/argv
'
do_setup                                        
              tjz       len,#no_args            ' if no stored string, set argc/argv to default values
              mov       t2,t1                   ' save the address argument
              movd      su_inst,#storage        ' otherwise ...
              mov       t0,len wz               ' ... read ...
su_loop                                         ' ... the ...             
        if_z  jmp       #su_count_args          ' ... stored ...
su_inst       wrlong    0-0,t1                  ' ... string ...
              add       su_inst,d_inc           ' ... to ...
              add       t1,#4                   ' ... the ...
              sub       t0,#1 wz                ' ... address ...
              jmp       #su_loop                ' ... provided (assume there is enough space!) 
su_count_args
              mov       t1,t2                   ' count the number of arguments in the string
              mov       n,#0                    ' no arguments yet           
              mov       q,#0                    ' not in a quoted string                                                    
su_count_loop
              call      #skip_to_non_space      ' find next non-space
              cmp       t0,#0 wz                ' end of string?
        if_z  jmp       #su_save_argc           ' yes - set up argc
              add       n,#1                    ' no - found an argument
              call      #skip_to_space          ' skip to next space (i.e. end of argument)                            
              jmp       #su_count_loop                         
su_save_argc
              cmp       n,#ARGV_MAX wz,wc       ' set up argc and first element of argv                                 
        if_a  mov       n,#ARGV_MAX             '                                    
              wrword    n,argc                  ' word[common#ARGC_ADDR] := n                                              
              wrword    argv_start,argv         ' word[common#ARGV_ADDR] := argv_0                               
              mov       t1,t2      
              call      #skip_to_non_space      ' find start of first argument ...
              mov       t3,argv_start           ' ... and save it ...                                
              wrlong    t1,t3                   ' ... in long[common#ARGV_0] 
              mov       q,#0                    ' not currently within quoted string
              mov       n,#0                    ' start processing again at argument 0
su_argv_loop
              rdbyte    t0,t1 wz                ' deconstruct command line, creating the argv array as we go                 
        if_z  jmp       #su_argv_done           ' end of string found - terminate the argv array                                                                    
              cmp       t0,#QUOTE_CHAR wz       ' found a quote?                                                            
        if_nz jmp       #su_argv_notquote       ' no - just copy character (or terminate argument of it is a space)
              xor       q,#1 wz                 ' yes - toggle marker indicating we are within quoted string
        if_nz jmp       #su_argv_nextchar       ' if this is the start of a quoted string, just keep processing
              mov       t0,t1                   ' otherwise, is the end ...
              add       t0,#1                   ' ... of the quoted string ...
              rdbyte    t0,t0 wz                ' ... also ... 
        if_z  jmp       #su_argv_chkquote       ' ... the end ...
              cmp       t0,#" " wz              ' ... of the argument?
        if_nz jmp       #su_argv_nextchar       ' no - just keep processing 
su_argv_chkquote
              rdlong    t0,t3                   ' yes - is there a quote ...
              rdbyte    t0,t0                   ' ... at the start ...
              cmp       t0,#QUOTE_CHAR wz       ' ... of the argument?
        if_z  jmp       #su_argv_delquote       ' yes - delete the start and end quotes 
              add       t1,#1                   ' no - do not delete the start or end quotes ...
              jmp       #su_argv_nextarg        ' ... just save the argument        
su_argv_delquote             
              rdlong    t0,t3                   ' remove quote ...
              add       t0,#1                   ' ... from start ...     
              wrlong    t0,t3                   ' ... of string
              jmp       #su_argv_nextarg        ' save next argument
su_argv_notquote                                 
              cmp       t0,#" " wz              ' found a space?              
        if_nz jmp       #su_argv_nextchar       ' no - just keep processing                                       
              tjnz      q,#su_argv_nextchar     ' yes - are we within a quote? If yes, just keep processing
su_argv_nextarg              
              add       n,#1                    ' no - found the end of an argument                                       
              cmp       n,#ARGV_MAX wz,wc       ' too many arguments?                                      
        if_a  jmp       #su_argv_done           ' yes - done                                       
              mov       t0,#0                   ' no - zero terminate ...
              wrbyte    t0,t1                   ' ... the current argument                                          
              add       t1,#1                   ' find the start ...    
              call      #skip_to_non_space      ' ... of the next argument
              rdbyte    t0,t1 wz                ' end of string?
        if_z  jmp       #su_argv_done           ' yes - terminate qrgv array
              add       t3,#4                   ' no - save new pointer ...          
              wrlong    t1,t3                   ' ... in the argv array          
              jmp       #su_argv_loop           ' ... and keep processing
su_argv_nextchar        
              add       t1,#1                   '  process ...              
              jmp       #su_argv_loop           '  ... the next character          
su_argv_done                                                        
              jmp       #done                   '   
no_args                                         ' 
              mov       t0,#0                   ' if no stored string ...   
              wrword    t0,argc                 ' ... set argc ...                    
              wrlong    t0,argv_start           ' ... and argv_0 to zero                 
              wrword    argv_start,argv         ' set argv to argv_0          
              jmp       #done                   
'
' do_stop - stop ourselves
'
do_stop
              cogid     t0
              cogstop   t0
'
' skip_to_non_space - skip to next non-space byte in string pointed to by t1, returning byte in t0
'
skip_to_non_space
              rdbyte    t0,t1
              cmp       t0,#" " wz
        if_z  add       t1,#1     
        if_z  jmp       #skip_to_non_space          
skip_to_non_space_ret
              ret
'
' skip_to_space - skip to next space in string pointed to by t1 (or end of string), returning byte in t0
'                 note that we take quotes into account by skipping over any spaces within quotes
'
skip_to_space
              rdbyte    t0,t1 wz
        if_z  jmp       #skip_to_space_ret
              cmp       t0,#QUOTE_CHAR wz
        if_z  xor       q,#1
        if_z  jmp       #:skip_char
              cmp       t0,#" " wz
        if_nz jmp       #:skip_char
              tjz       q,#skip_to_space_ret
:skip_char              
              add       t1,#1
              jmp       #skip_to_space          
skip_to_space_ret
              ret

'
t0            long      0
t1            long      0
t2            long      0
t3            long      0
low24         long      $FFFFFF
command       long      COGSTORE   
size_cmd      long      CMD_SIZE
response      long      CMD_RESPONSE
argc          long      ARGC_ADDR
argv          long      ARGV_ADDR
argv_start    long      ARGV_0
d_inc         long      1<<9
len           long      0                       ' storage used (longs)

n             long      0
q             long      0

#ifdef DEBUG_LED_COGSTORE
count_init    long      1000000                 ' for debug
count         long      0                       ' for debug
DEBUG_LED     long      LED_MASK
#endif

              fit       196                     ' make sure at least 300 longs are available                      

storage       long      0                       ' long storage starts here      
