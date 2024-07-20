'
' CMM PASM implementations of fundamental multi-threading operations
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

' Catalina Import _thread_stall

' Catalina Import _thread_allow

' Catalina Import _unlocked_check

' Catalina Import _thread_halt

' Catalina Export _thread_start

 alignl ' align long

C__thread_start
 long I32_CALA + @C__thread_stall<<S32 ' get kernel lock
 word I16B_PASM
 alignl ' align long
   sub r4, #THREAD_BLOCK_SIZE*4          ' use top 34 longs of stack as thread block
 alignl ' align long
 long I32_CALA + @C__unlocked_check<<S32 ' check if thread id is already known
 alignl ' align long
 long I32_BRNZ + @:thr_start_error<<S32  ' if so return error 
 word I16A_MOV + RI<<D16A + r4<<S16A     ' set up ...
 word I16B_PASM
 alignl ' align long
   add RI, #THREAD_AFF_OFF*4    
 word I16B_PASM
 alignl ' align long
   cogid BC
 word I16A_SHLI + BC<<D16A + 8<<S16A
 word I16A_WRWORD + BC<<D16A + RI<<S16A  ' ... affinity with our cog id
 word I16A_ADDI + RI<<D16A + 2<<S16A     ' set up ...
 alignl ' align long
 long I32_MOVI + BC<<D32 + 100<<S32      ' ... (~10 milliseconds) ...
 word I16A_WRWORD + BC<<D16A + RI<<S16A  ' ... default tick count
 word I16A_MOV + RI<<D16A + r4<<S16A     ' set up ...
 word I16A_ADDI + RI<<D16A + ((THREAD_REG_OFF+2)*4)<<S16A
 word I16A_MOV + BC<<D16A + r2<<S16A
 word I16A_WRLONG + BC<<D16A + RI<<S16A  ' ... thread r2 (argv) 
 word I16A_MOV + RI<<D16A + r4<<S16A     ' set up ...
 word I16A_ADDI + RI<<D16A + ((THREAD_REG_OFF+3)*4)<<S16A
 word I16A_MOV + BC<<D16A + r3<<S16A
 word I16A_WRLONG + BC<<D16A + RI<<S16A  ' ... thread r3 (argc)
 word I16A_MOV + RI<<D16A + r4<<S16A     ' set up ...
 word I16B_PASM
 alignl ' align long
   add RI, #25*4
 word I16A_MOV + BC<<D16A + r5<<S16A
#ifndef P2
 ' On the P1, the first thing we do on switching (or returning) to a
 ' thread is increment the PC, so for the initial PC we decrement it 
 ' here before saving it ...
 word I16A_SUBI + BC<<D16A + 4<<S16A
 ' On the P2, the context switching is implemented differently (the code
 ' is in the kernel rather than Hub RAM) so we dont need to do anything
#endif
 word I16A_WRLONG + BC<<D16A + RI<<S16A  ' ... thread PC
 word I16A_MOV + r1<<D16A + r4<<S16A
 word I16A_SUBI + r1<<D16A + (4*3)<<S16A  ' reserve 3 longs of stack for args and return addr
 alignl ' align long
 long I32_LODA + @C__thread_halt<<S32    ' set up ...
 word I16A_MOV + BC<<D16A + RI<<S16A
 word I16A_MOV + RI<<D16A + r1<<S16A
 word I16A_WRLONG + BC<<D16A + RI<<S16A  ' ... thread return address
 word I16A_MOV + RI<<D16A + r4<<S16A     ' set up ...
 word I16B_PASM
 alignl ' align long
   add RI, #(THREAD_REG_OFF+25)*4
 word I16A_MOV + BC<<D16A + r1<<S16A
 word I16A_WRLONG + BC<<D16A + RI<<S16A  ' ... thread SP
 alignl ' align long
 long I32_MOV + RI<<D32 + TP<<S32        ' get ...
 word I16A_RDLONG + BC<<D16A + RI<<S16A  ' ... next block pointer of current thread block
 word I16A_MOV + RI<<D16A + r4<<S16A     ' set it as ...
 word I16A_WRLONG + BC<<D16A + RI<<S16A  ' ... next block pointer of new thread block
 alignl ' align long
 long I32_MOV + RI<<D32 + TP<<S32        ' set ...
 word I16A_MOV + BC<<D16A + r4<<S16A 
 word I16A_WRLONG + BC<<D16A + RI<<S16A  ' ... next block pointer of current block to new block
 word I16A_MOV + r0<<D16A + r4<<S16A     ' if ok, return thread block (Z clr)
 alignl ' align long
 long I32_JMPA + @:thr_start_exit<<S32
 alignl ' align long
:thr_start_error
 word I16A_MOVI + r0<<D16A + 0<<S16A     ' if error, return zero (Z set) 
 alignl ' align long
:thr_start_exit
 long I32_CALA + @C__thread_allow<<S32  ' release kernel lock
 word I16A_CMPI + r0<<D16A + 0<<S16A ' set/clr Z flag
 word I16B_RETN
' end
