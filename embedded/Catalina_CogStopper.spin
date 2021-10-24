{{
   CogStopper - a replacement for CogStore for programs that do not accept
                arguments. All this module does is provide a Stop method.
                The main reason for having this is to save space in programs
                that don't need to process command-line arguments. 

   Version 3.0 - make the Stop method independent of cog used.

}}

' #define HYBRID_DEBUG ' flash led so we know it's running

CON

COGSTORE   = common#COGSTORE    ' LONG location monitored by CogStore

CMD_STOP   = $5000_0000         ' Command to stop the CogStore cog

CMD_RESPONSE = $FEED_FACE       ' COGSTORE response to any unknown command

OBJ

   common : "Catalina_Common"
   
PUB Stop

  long[COGSTORE] := -1 ' any invalid command

  repeat 1000
    if long[COGSTORE] == CMD_RESPONSE
      quit

  if long[COGSTORE] == CMD_RESPONSE
    ' CogStore loaded - so stop it!
    long[COGSTORE] := CMD_STOP
    ' Give CogStore time to stop before returning
    repeat 10000
      if long[COGSTORE] == 0
        quit
      