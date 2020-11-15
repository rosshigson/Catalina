{{
''=============================================================================
'' Catalina_Plugin - A Generic Plugin for Catalina.
''
'' This code is intended just as an example of how to construct a Plugin.
''
'' Since this Plugin does nothing, it has no platform-dependent code. If it
'' did have any platform dependencies (or dependencies on other plugins) then
'' it would not be called "Catalina_Plugin.spin" and live in the target
'' directory - instead, it would be called "Catalina_Plugin_Input.spin" and
'' live in the "input" subdirectory (and be mentioned in the Catalina.input
'' file in that directory). Then it would be re-created on every compile with 
'' the command line parameters defined appropriately, and you could use
'' constructs like:
''
''    #ifdef PLATFORM
''       ... platform dependent code ...
''    #endif
''
'' History:
''   3.1 - Simplified Version
''
''   3.10 - incorporate Kuroneko's optimization
''
''=============================================================================
}}
CON
' 
' Note that the following definitions are only for use in this program - they
' must be defined again (usually in a C header file) for use from a C program
'
' Specify the type of this plugin (This plugin is a dummy):
'
PTYPE = Common#LMM_DUM
'
' Specify the size of a Hub RAM block to be allocated for this plugin
' (this is an example only - a plugin may not need a Hub RAM block at all):
'
BLOCK_SIZE = 100
'
' Specify the services that this Plugin will accept (examples only):
'
Service_1 = 1 << 24
Service_2 = 2 << 24
Service_3 = 3 << 24
Service_4 = 4 << 24
'
SERV_MAX = 4 ' maximum service request that will be accepted
'
' Define the services accepted by this plugin (examples only):
'
'name: Service_1
'code: 1
'type: short initialization request
'data: initialization data (loaded but never used)
'rslt: -1 

'name: Service_2
'code: 2
'type: short service request
'data: outputs to turn on (can only turn on up to 24 outputs)
'rslt: -2 

'name: Service_3
'code: 3
'type: long service request
'data: outputs to turn on (can turn on all 32 outputs)
'rslt: -3 

'name: Service_4
'code: 4
'type: long service request
'data: outputs to turn off, and a delay to wait before doing so
'      (can turn off all 32 outputs)
'rslt: -4
'
OBJ
'
' Include common definitions:
'
   Common : "Catalina_Common"
'
VAR
   ' These variables are used only during initialization:
   long PLUGIN_BLOCK
'
' This function is called by the target to allocate data blocks or set up 
' other details for the extra plugins. If it does not need to do anything
' it can simply be a null routine.
'   
PUB Setup
  PLUGIN_BLOCK          := long[Common#FREE_MEM] - BLOCK_SIZE
  long[Common#FREE_MEM] := PLUGIN_BLOCK
'
' This method is called by the target to start the plugins:
'
PUB Start : cog

'' Start - this will be called to start the plugin
'' returns false (zero) if no cog available, or cog number + 1

  cog := cognew(@entry, Common#REGISTRY)
   
  if (cog => 0)
  
    ' wait till cog has registered
    repeat until long[Common#REGISTRY][cog] >> 24 == PTYPE
    ' send the parameter to the cog (via Service_1)    
    Common.SendInitializationDataAndWait(cog, Service_1<<24, PLUGIN_BLOCK)

  cog += 1
    
DAT
              org       0
entry
              cogid     t1                      ' get ...
              shl       t1,#2                   ' ... our ...
              add       t1,par                  ' ... registry block
              rdlong    rqstptr,t1              ' register ...
              and       rqstptr,low_24          ' ... this ...
              wrlong    zero,rqstptr            ' ... plugin ...
              mov       t2,#PTYPE               ' ... as ...
              shl       t2,#24                  ' ... the ...
              or        t2,rqstptr              ' ... appropriate ...
              wrlong    t2,t1                   ' ... type

get_service
              rdlong    rqst,rqstptr wz         ' any service requests?
        if_z  jmp       #do_stuff               ' no - do other stuff!
              mov       t1,rqst                 ' yes - get ...
              shr       t1,#24                  ' ... service ...
              cmp       t1,#SERV_MAX wz,wc      ' ... request code
        if_be add       :jmp, t1
        if_a  jmp       #err_service            ' illegal service request
:jmp          jmpret    $, $+1                  ' jump to service
'             
' table of service entry points:
'
              long      err_service             ' unused (covers t1 == 0)
              long      _Service_1              ' Service 1 entry point         
              long      _Service_2              ' Service 2 entry point 
              long      _Service_3              ' Service 3 entry point 
              long      _Service_4              ' Service 4 entry point 
'             ... etc ...
'
' we can do other stuff while waiting for a service request if we need to:
'
do_stuff
              nop                               ' example 
              jmp       #get_service               
'
' some handy common service exit points:
'        
err_service
              neg       rslt,#1                 ' set result to -1 on error
end_service
              mov       t1,rqstptr              ' return result ...
              add       t1,#4                   ' ... in second long ... 
              wrlong    rslt,t1                 ' ... of request block 
done_service
              wrlong    zero,rqstptr            ' clear request block
              jmp       #get_service            ' process next service request 

'---------------------------------- Services -----------------------------------
'
' _Service_1 - example only - just accept a 32 bit configuration parameter.
'              The value is loaded, but never actually used for anything.
'
_Service_1
              mov       t1,rqstptr              ' fetch ...
              add       t1,#4                   ' ... the ...
              rdlong    param,t1                ' ... parameter
              neg       rslt,#1                 ' return -1
              jmp       #end_service
'
' _Service_2 - example only - turn on the specfied output(s).
'              Since this is a short request, the data is the lower 24 bits of
'              the actual request - so we can only turn ON the first 24 outputs.
'              If we need more than this, we have to use a service that accepts 
'              a long request - such as Service_3.
'
_Service_2
              and       rqst,low_24             ' lower 24 bits is data
              or        dira,rqst               ' set direction as outputs
              or        outa,rqst               ' turn outputs on
              neg       rslt,#2                 ' return -2
              jmp       #end_service
'
' _Service_3 - example only - turn on the specified output(s).
'              Since this is a long request, the data is pointed to by
'              the lower 24 bits of the actual request (since this
'              must be in Hub RAM, 24 bits is always enough) and this
'              means we can turn ON all 32 outputs.
'
_Service_3
              and       rqst,low_24             ' lower 24 bits is ...
              rdlong    t1,rqst                 ' ... address of data
              or        dira,t1                 ' set direction as outputs
              or        outa,t1                 ' turn outputs on
              neg       rslt,#3                 ' return -3
              jmp       #end_service
'
' _Service_4 - example only - turn off the specified output(s) after the
'              specified delay.
'              Since this is a long request, the data is pointed to by
'              the lower 24 bits of the actual request (since this
'              must be in Hub RAM, 24 bits is always enough) and this
'              means we can turn OFF all 32 outputs.
'
_Service_4
              and       rqst,low_24             ' lower 24 bits is ...
              rdlong    t1,rqst                 ' ... address of block ...
              add       rqst,#4                 ' ... containing two longs ...
              rdlong    t2,rqst                 ' ... of data
              mov       t3,CNT                  ' wait ...
              add       t3,t2                   ' ... specified ...
              waitcnt   t3,t2                   ' ... time
              or        dira,t1                 ' set direction as outputs
              andn      outa,t1                 ' turn outputs off
              neg       rslt,#4                 ' return -4
              jmp       #end_service
'
'---------------------------------- Storage ------------------------------------
'
zero          long      0                       ' handy value (zero)
low_24        long      $00FFFFFF               ' handy value (lower 24 bits)
rqstptr       long      0                       ' request address
rqst          long      0                       ' service request
rslt          long      0                       ' service result
t1            long      0                       ' temporary variable
t2            long      0                       ' temporary variable
t3            long      0                       ' temporary variable
'
param         long      0                       ' saved initialization data
'
              fit       $1f0

