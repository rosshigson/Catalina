{
'
'  Catalyst_Arguments - an object to allow a SPIN program to
'  retrieve a command line stored by Catalyst. It simulates
'  the kind of argc/argv processing used in C programs. 
'
'
'  To use this module (assuming it is called CogStore, and that
'  we have a function called Print) we would do something like:
'
'    VAR
'      long arguments[CogStore#Max_LONGS]
'
'    PUB MyProgram | i
'      CogStore.Init (arguments)
'      if (CogStore.argc > 0)
'        repeat i from 0 to CogStore.argc - 1 
'          Print (CogStore.argv(i))
'
'
'   Version 3.0 - make Stop method independent of cog used
'
}

CON

' These values must match the ones defined in Catalina_Common.spin. They are 
' included here rather than being included so that SPIN programs only need to 
' include this file to allow them to be run under Catalyst - i.e. they do not 
' need to include Catalina_Common.spin (which would mean they could only be 
' compiled using the HomeSpun SPIN compiler).

MAX_LONGS  = 300                ' store up to 300 LONGS (1200 chars)

COGSTORE   = $7FF8              ' LONG location monitored by this cog for commands

ARGC_ADDR  = $7E6C              ' argc will be saved in this WORD

ARGV_ADDR  = $7E6E              ' address of argv will be saved in this WORD

ARGV_0     = $7E70              ' default argv array (of LONGs)

ARGV_MAX   = 24                 ' default max size of argv array

CMD_READ   = $1000_0000         ' copy from Hub to Cog (address in lower 24 bits)
                                ' COGSTORE set to zero when complete

CMD_WRITE  = $2000_0000         ' copy from Cog to Hub (address in lower 24 bits)
                                ' COGSTORE set to zero when complete

CMD_SIZE   = $3000_0000         ' returns size of stored data (in LONGs) - set the
                                ' lower 24 bits to FFFFFF on call - lower 24 bits
                                ' COGSTORE set to size when complete

CMD_SETUP  = $4000_0000         ' setup argc and argv array with the stored data
                                ' COGSTORE set to zero when complete

CMD_STOP   = $5000_0000         ' stop the CogStore cog.

CMD_RESPONSE = $FEED_FACE       ' COGSTORE set to this on any other command

QUOTE_CHAR = $22


PUB Init (arguments)
   ' set up arguments taken from command line (if there were any)
   Setup (arguments)
   ' no longer need the aruments cog, so stop it (if started)
   Stop

PUB argc : n
  ' return the count of arguments
  n := WORD[ARGC_ADDR]
 
PUB argv(n) : addr

  ' return a pointer to the nth argument
  addr := LONG[ARGV_0][n]
 
PRI Valid : ok

  long[COGSTORE] := -1 ' any invalid command
  repeat 1000
    if long[COGSTORE] == CMD_RESPONSE
      return -1
  return 0

PRI Stop

  if Valid
    ' stop the COGSTORE  
    long[COGSTORE] := CMD_STOP
    repeat 10000
      if long[COGSTORE] == 0
        return -1
    return 0

PRI Write(Addr) : ok

  if Valid
    long[COGSTORE] := CMD_WRITE | Addr
    repeat 10000
      if long[COGSTORE] == 0
        return -1
    return 0
  else
    return 0


PRI Read(Addr) : ok

  if Valid
    long[COGSTORE] := CMD_READ | Addr
    repeat 10000
      if long[COGSTORE] == 0
        return -1
    return 0
  else
    return 0


PRI Size | s

  if not Valid
    return -1
    
  long[COGSTORE] := CMD_SIZE | $FFFFFF 
  repeat 1000
    if long[COGSTORE] <> CMD_SIZE | $FFFFFF
      return long[COGSTORE] & $FFFFFF
  return -2

PUB Setup(addr)

  if not Valid
    word[ARGC_ADDR] := 0
    word[ARGV_ADDR] := 0
    long[ARGV_0] := 0

  else
    long[COGSTORE] := CMD_SETUP | Addr
    repeat 10000
      if long[COGSTORE] == 0
        return -1
    return 0

      
