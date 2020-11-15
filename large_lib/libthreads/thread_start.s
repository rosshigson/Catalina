'#line 1 "thread_start.e"


' Until we modify the P1 compilation process to include calling spinpp,
' we must explicitly define this here and preprocess all the library
' files to create different libraries for the P1 and the P2. This allows
' us to keep the library source files (mostly) identical for the P1 and P2.





'
' LMM PASM implementations of fundamental multi-threading operations
'
' void * _thread_start(void * PC, void * SP, int argc, char *argv[]);
'    intiate a new thread
' on entry:
'    r5 = initial PC
'    r4 = initial SP (must be at least 39 longs below this !)
'    r3 = argc
'    r2 = argv
' on exit:
'    r0 = thread id (Z clear) on success
'    r0 = 0 and Z flag set on error
'
' Catalina Code

DAT ' code segment

' Catalina Import _thread_id

' Catalina Import _unlocked_check

' Catalina Import _thread_halt

' Catalina Export _thread_start

 alignl ' align long

C__thread_start



C__thread_start_1
 lockset lock wc
 jmp #BR_B
 long @C__thread_start_1 ' loop till we get a kernel lock

 sub r4, #34*4          ' use top 34 longs of stack as thread block
 jmp #CALA
 long @C__unlocked_check ' check if thread id is already known



 jmp #BRNZ
 long @:thr_start_error ' if so return error

 mov RI, r4             ' set up ...
 add RI, #33*4
 cogid BC
 shl BC, #8

 jmp #WWRD



 add RI, #2             ' set up ...
 mov BC, #100           ' ... (~10 milliseconds) ...

 jmp #WWRD



 mov RI, r4             ' set up ...



 add RI, #11*4

 mov BC, r2

 jmp #WLNG



 mov RI, r4             ' set up ...



 add RI, #12*4

 mov BC, r3

 jmp #WLNG



 mov RI, r4             ' set up ...



 add RI, #1*4

 mov BC, r5

 jmp #WLNG



 mov r1, r4
 sub r1, #4*3           ' reserve 3 longs of stack for args and return addr



 jmp #LODL       ' set up ...
 long @C__thread_halt
 mov BC, RI

 mov RI, r1

 jmp #WLNG



 mov RI, r4             ' set up ...



 add RI, #2*4

 mov BC, r1

 jmp #WLNG



 mov RI, TP             ' get ...

 jmp #RLNG



 mov RI, r4             ' set it as ...

 jmp #WLNG



 mov RI, TP             ' set ...
 mov BC, r4

 jmp #WLNG



 mov r0, r4 wz          ' if ok, return thread block (and Z clr)



 jmp #JMPA
 long @:thr_start_exit

:thr_start_error
 mov r0, #0 wz          ' if error, return zero (and Z set)
:thr_start_exit



 lockclr lock           ' release kernel lock

 jmp #RETN
' end
