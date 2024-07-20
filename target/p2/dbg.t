
' Target-specific PASM for the BlackCat or BlackBox Debugger ...

' The use of PRIMITIVE allows the source files to be (mostly) 
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.
#ifndef PRIMITIVE
#ifdef P2
#ifdef NATIVE
#define PRIMITIVE(op) calld PA, op
#else
#define PRIMITIVE(op) jmp op
#endif
#else
#define PRIMITIVE(op) jmp op
#endif
#endif

CON

#if defined(COMPACT)
  DEBUG_MARKER  = $18             ' Cog location to write to DEBUG_BREAK at breakpoint (PC)                   
#elif defined(LARGE)
  DEBUG_MARKER  = $2b             ' Cog location to write to DEBUG_BREAK at breakpoint (PC)                   
#elif defined(SMALL)
  DEBUG_MARKER  = $2b             ' Cog location to write to DEBUG_BREAK at breakpoint (PC)                   
#else
  DEBUG_MARKER  = $2b             ' Cog location to write to DEBUG_BREAK at breakpoint (PC)                   
#endif

#if defined(LARGE)
#define XMM_OVERLAY
  DEBUG_OVERLAY = $5a
  DEBUG_VECTORS = $1eb
  OVERLAY_SIZE  = 26              ' 26 Longs for XMM LARGE
#elif defined(SMALL)
#define XMM_OVERLAY
  DEBUG_OVERLAY = $5a
  DEBUG_VECTORS = $1eb
  OVERLAY_SIZE  = 26              ' 26 Longs for XMM SMALL
#elif defined(COMPACT)
#define CMM_OVERLAY
  OVERLAY_SIZE  = 25              ' 25 Longs for CMM
#elif defined(TINY)
#define LMM_OVERLAY
  OVERLAY_SIZE  = 17              ' 17 Longs for LMM
#else
#define NMM_OVERLAY
  OVERLAY_SIZE  = 29              ' 29 Longs for NMM
#endif

' Catalina Code

DAT ' code segment

' C_debug_init : load debug code into kernel, set up debug vectors, then BREAK
'              NOTE: must preserve r2 & r3 (argc & argv)

C_debug_init

#if defined(CMM_OVERLAY)

 long I32_LODA + @C_debug_overlay<<S32     ' hub addr of code to overlay ...
 word I16A_MOV + r1<<D16A + RI<<S16A       ' ... goes in r1
 alignl ' align long
 long I32_LODA + @:load_inst<<S32          ' hub addr of load inst goes in RI
 word I16B_EXEC                            ' start execution of LMM
 alignl ' align long
 mov r0, #DEBUG_OVERLAY                    ' cog addr of DEBUG_OVERLAY goes in r0
 mov BC, #OVERLAY_SIZE                     ' inst count goes in BC
:load_loop
 rdlong r6,RI                              ' update dst ...
 setd r6,r0                                ' ... of load inst ...
 wrlong r6,RI                              ' ... with r0
 nop                                       ' required on P2
:load_inst
 rdlong 0-0, r1                            ' load inst
 add r1, #4                                ' next hub addr
 add r0, #1                                ' next cog addr
 sub BC, #1 wz                             ' continue ...
 if_nz sub PC,#(@:load_done-@:load_loop)   ' ... until all inst loaded
:load_done
 neg r0,#1                                 ' indicate special breakpoint ...
 wrlong r0,DEBUG_VECTORS+1                 ' ... by setting DEBUG_ADDR to -1
 jmp #EXEC_STOP
 word I16B_BRKP                            ' !!! BREAKPOINT!!! (jump to debug overlay)
 alignl ' align long
 word I16B_RETN                            ' done
 alignl 'align long

#elif defined(NMM_OVERLAY)

 mov r0,##@C_debug_overlay ' load OVERLAY_SIZE longs  ...  
 setq #OVERLAY_SIZE-1      ' ... from C_debug_overlay ...
 rdlong DEBUG_OVERLAY,r0   ' ... to DEBUG_OVERLAY
 neg r0,#1                 ' indicate special breakpoint ...
 wrlong r0,DEBUG_VECTORS+1 ' ... by setting DEBUG_ADDR to -1
 PRIMITIVE(#INIT)          ' !!! BREAKPOINT !!!
 PRIMITIVE(#RETN)          ' done

#else

 mov r6,#OVERLAY_SIZE      ' load overlay code ...
 mov r0,#DEBUG_OVERLAY     ' ... from C_debug_overlay ...
 PRIMITIVE(#LODL)          ' ... to replace ...
 long @C_debug_overlay     ' ... cog ... 
 mov r1,RI                 ' ... initialization code
 PRIMITIVE(#CALA)          ' do ...
 long @C_overlay_loader    ' ... the load
 neg r0,#1                 ' indicate special breakpoint ...
 wrlong r0,DEBUG_VECTORS+1 ' ... by setting DEBUG_ADDR to -1
 PRIMITIVE(#INIT)          ' !!! BREAKPOINT !!!
 PRIMITIVE(#RETN)          ' done

' C_overlay_loader : load code into kernel (not required for CMM or NMM)
'                    NOTE: must preserve r2 & r3 (argc & argv)
'   On entry:
'     r0 = first register in cog to load
'     r1 = address of first long in hub RAM to load
'     r6 = size in longs
'   On exit:
'     r0,r1,r4,r5,r6 lost

C_overlay_loader
#if defined(XMM_OVERLAY)
 jmp #LODL                 ' set up ...
 long @C_overlay_loader_2  ' ... initial ...
 jmp #RLNG                 '
 setd BC,r0                ' ... register ...
 jmp #WLNG                 '
C_overlay_loader_1
 sub r6,#1 wcz             ' if all ...
 jmp #BR_B                 ' ... data loaded ...
 long @C_overlay_loader_3  ' ... then exit
 mov RI,r1                 '
 jmp #RLNG                 '
C_overlay_loader_2
 mov 0-0,BC                '
 add r1,#4                 ' point to next long
 jmp #LODL                 ' increment ...
 long @C_overlay_loader_2  ' ...
 jmp #RLNG                 '
 mov r0,BC                 '
 jmp #LODL                 ' ... destination ...
 long @C_d_inc             ' ... 
 jmp #RLNG                 '
 add BC,r0                 ' ... 
 jmp #LODL                 ' 
 long @C_overlay_loader_2  ' ...
 jmp #WLNG                 '
 jmp #JMPA                 ' load ...
 long @C_overlay_loader_1  ' ... more longs
C_overlay_loader_3         ' done
 jmp #RETN
#else
 jmp #LODL                 ' set up ...
 long @C_overlay_loader_2  ' ... initial ...
 rdlong r5,RI              ' ... destination ...
 setd r5,r0                ' ... register ...
 wrlong r5,RI              ' ... to be loaded ...
C_overlay_loader_1
 sub r6,#1 wcz             ' if all ...
 jmp #BR_B                 ' ... data loaded ...
 long @C_overlay_loader_3  ' ... then exit
C_overlay_loader_2
 rdlong 0-0,r1             ' load a long into the cog
 add r1,#4                 ' point to next long
 jmp #LODL                 ' increment ...
 long @C_overlay_loader_2  ' ...
 mov r4,RI                 ' ...
 rdlong r0,r4              ' ...
 jmp #LODL                 ' ... destination ...
 long @C_d_inc             ' ... 
 rdlong r5,RI              ' ...
 add r0,r5                 ' ... 
 wrlong r0,r4              ' ... register
 jmp #JMPA                 ' load ...
 long @C_overlay_loader_1  ' ... more longs
C_overlay_loader_3         ' done
 jmp #RETN
#endif

' end C_overlay_loader

#endif

' C_debug_overlay : debug code to load into kernel
'
' The code was previously assembled, using the appropriate definitions for the following:
'  
'  opAddr     =  cog address used as register
'  temp       =  cog address used as register
'  breakFlag  =  vector to be set to DEBUG_BREAK
'  addr       =  vector to be set to DEBUG_ADDR
'  kernelOut  =  vector to be set to DEBUG_OUT
'  kernelIn   =  vector to be set to DEBUG_IN
'  opFlag     =  vector to be set to DEBUG_FLAG
'
'=====================================================================================================================
' HERE IS THE NMM CODE (FOR REFERENCE - BINARY VERSIONS INCLUDED BELOW):
'
'                         org     DEBUG_OVERLAY
' brkpCode                wrlong  PA,breakFlag            '1 Let the host know that we are at a breakpoint
'                         mov     cont_addr,PA            '2 save our return address (in case the instr disrupts it)              
' readFlags               rdlong  temp,breakFlag          '3 Test for host presenting continuation instruction          
'                         tjz     temp,#continue          '4 go here to replace breakpoint instruction and run        
'                         rdlong  opAddr,addr             '5 opAddr now holds the address for a kernel read/write      
'                         tjz     opAddr,#readFlags       '6 but address zero means no read/write is requested        
'                         setd    kernelRead,opAddr       '7 opAddr contains the kernel address to be read ...          
'                         setd    kernelWrite,opAddr      '8 ... or written (don't know which yet,so set up both)       
'                         rdlong  temp,opFlag             '9 Is it a read?                                              
'                         tjz     temp,#kernelWrite       '10 no - write to kernel                                       
' kernelRead              wrlong  0-0,kernelOut           '11 Write from cog location to DEBUG_OUT.                      
'                         jmp     #finish                 '12                                                            
' kernelWrite             rdlong  0-0,kernelIn            '13 Read from DEBUG_IN to cog location.                        
' finish                  mov     temp,#0                 '14                                                            
'                         wrlong  temp,addr               '15 Write a zero to DEBUG_ADDR so host sees operation complete.
'                         jmp     #readFlags              '16 wait for continuation or next command.                     
' continue                rdlong  cont_inst_1,kernelIn    '17 Read replacement instruction from DEBUG_IN to inst_1 
'                         mov     cont_inst_2,#0          '18 in case it is not an AUG instruction, put a nop as inst_2
'                         mov     temp,cont_inst_1        '19 Is it ... 
'                         and     temp,aug_mask           '20 ... an ....
'                         sub     temp,aug_mask           '21 ... AUG instruction?
'                         tjnz    temp,#cont_inst_1       '22 no - we can execute it now   
'                         rdlong  cont_inst_2,PA          '23 yes - copy second half of AUG instruction to inst_2
'                         add     cont_addr,#4            '24 ... and also update the address we will return to
' cont_inst_1             nop                             '25 execute ...
' cont_inst_2             nop                             '26 ... the instruction
'                         jmp     cont_addr               '27 if we get here, return to original instruction stream
' cont_addr               long    $0                      '28
' aug_mask                long    $0F000000               '29
' 
'=====================================================================================================================
' HERE IS THE LMM CODE (FOR REFERENCE - BINARY VERSIONS INCLUDED BELOW):
'
'                         org     DEBUG_OVERLAY
' brkpCode                wrlong  DEBUG_MARKER,breakFlag  '1 Let the host know that we are at a breakpoint              
' readFlags               rdlong  temp,breakFlag          '2 Test for host presenting continuation instruction          
'                         tjz     temp,#continue          '3 go here to replace breakpoint instruction and run        
'                         rdlong  opAddr,addr             '4 opAddr now holds the address for a kernel read/write       
'                         tjz     opAddr,#readFlags       '5 but address zero means no read/write is requested        
'                         setd    kernelRead,opAddr       '6 opAddr contains the kernel address to be read ...          
'                         setd    kernelWrite,opAddr      '7 ... or written (don't know which yet,so set up both)       
'                         rdlong  temp,opFlag             '8 Is it a read?                                              
'                         tjz     temp,#kernelWrite       '9 no - write to kernel                                       
' kernelRead              wrlong  0-0,kernelOut           '10 Write from cog location to DEBUG_OUT.                      
'                         jmp     #finish                 '11                                                            
' kernelWrite             rdlong  0-0,kernelIn            '12 Read from DEBUG_IN to cog location.                        
' finish                  mov     temp,#0                 '13                                                            
'                         wrlong  temp,addr               '14 Write a zero to DEBUG_ADDR so host sees operation complete.
'                         jmp     #readFlags              '15 wait for continuation or next command.                     
' continue                rdlong  LMM_1_OFF,kernelIn      '16 Read replacement instruction from DEBUG_IN                
'                         jmp     #LMM_1_OFF              '17 ..and restart the kernel
'
'=====================================================================================================================
' HERE IS THE CMM CODE (FOR REFERENCE - BINARY VERSIONS INCLUDED BELOW):
'
'                         org     DEBUG_OVERLAY                                                                            
' brkpCode                mov     temp,DEBUG_ADJUST       '1  Add DEBUG_ADJUST ...                                         
'                         add     temp,DEBUG_MARKER       '2  ... to DEBUG_MARKER                                          
'                         wrlong  temp,breakFlag          '3  Let the host know that we are at a breakpoint                  
' readFlags               rdlong  temp,breakFlag          '4  Test for host presenting continuation instruction            
'                         tjz     temp,#continue          '5  go here to replace breakpoint instruction and run          
'                         rdlong  opAddr,addr             '6  opAddr now holds the address for a kernel read/write         
'                         tjz     opAddr,#readFlags       '7  but address zero means no read/write is requested          
'                         setd    kernelRead,opAddr       '8  opAddr contains the kernel address to be read ...            
'                         setd    kernelWrite,opAddr      '9  ... or written (don't know which yet,so set up both)         
'                         rdlong  temp,opFlag             '10 Is it a read?                                                
'                         tjz     temp,#kernelWrite       '11 no - write to kernel                                         
' kernelRead              wrlong  0-0,kernelOut           '12 Write from cog location to DEBUG_OUT.                        
'                         jmp     #finish                 '13                                                              
' kernelWrite             rdlong  0-0,kernelIn            '14 Read from DEBUG_IN to cog location.                          
' finish                  mov     temp,#0                 '15                                                              
'                         wrlong  temp,addr               '16 Write a zero to DEBUG_ADDR so host sees operation complete.  
'                         jmp     #readFlags              '17 wait for continuation or next command.                       
' continue                tjnz    DEBUG_ADJUST,#upper     '18 jump if we are executing the upper word of the long          
'                         rdword  temp,kernelIn           '19 replace lower word ...                                       
'                         and     INST_OFF,upper16        '20                                                              
'                         or      INST_OFF,temp           '21                                                              
'                         jmp     #DECODE_OFF             '22 ... then execute it                                          
' upper                   rdword  INST_OFF,kernelIn       '23 replace upper word ...                                       
'                         jmp     #DECODE_OFF             '24 ... then execute it                                          
' upper16                 long    $FFFF_0000              '25                                                              
'
'
'=======================================================================================================================
' HERE IS THE XMM CODE (FOR REFERENCE - BINARY VERSIONS INCLUDED BELOW):
'
'                         org     DEBUG_OVERLAY
' brkpCode                wrlong  DEBUG_MARKER,breakFlag  '1 Let the host know that we are at a breakpoint                
' readFlags               rdlong  temp,breakFlag          '2 Test for host presenting continuation instruction            
'                         tjz     temp,#continue          '3 go here to replace breakpoint instruction and run          
'                         rdlong  XMM_Addr,addr           '4 XMM_Addr holds the address to read/write (cog or XMM addr)   
'                         tjz     XMM_Addr,#readFlags     '5 but address zero means no read/write is requested                        
'                         setd    kernelRead,XMM_Addr     '6 for kernel read, XMM_Addr contains the cog address to read   
'                         setd    kernelWrite,XMM_Addr    '7 for kernel write,  XMM_Addr contains the cog address to write
'                         rdlong  temp,opFlag             '8 if command ...                                               
'                         tjnz    temp,#decodeRead        '9 ... is not kernel write, then decode further                 
' kernelWrite             rdlong  0-0,kernelIn            '10 write to cog address from DEBUG_IN                          
'                         jmp     #finish                 '11 ... to cog address                                          
' decodeRead              djnz    temp,#decodeXMM         '12 read from kernel?                                           
' kernelRead              wrlong  0-0,kernelOut           '13 yes - write to DEBUG_OUT ...                                
'                         jmp     #finish                 '14 ... from cog address                                        
' decodeXMM               sub     XMM_Addr,CS             '15 correct for moved code segment                              
'                         djnz    temp,#xmmRead           '16 write to XMM?                                               
' xmmWrite                rdlong  temp,kernelIn           '17 write ...                                                   
'                         call    #XMM_WriteReg           '18 ... in kernelIn
'                         jmp     #finish                 '19 ... from DEBUG_IN
' xmmRead                 call    #XMM_ReadReg            '20 read the value ...
'                         wrlong  temp,kernelOut          '21 ... to kernelOut 
' finish                  mov     temp,#0                 '22 write a zero ... 
'                         wrlong  temp,addr               '23 ... to DEBUG_ADDR to indicate command completed
'                         jmp     #readFlags              '24 wait for continuation, or next command
' continue                rdlong  LMM_1_OFF,kernelIn      '25 read replacement instruction from DEBUG_IN ...
'                         jmp     #LMM_1_OFF              '26 ... and restart the kernel processing
'
'=======================================================================================================================

C_debug_overlay  ' binary overlay starts here

#if defined(LMM_OVERLAY)

' ALL LMM PLATFORMS USE THE SAME OVERLAY CODE:

 long $fc6057eb ' 1
 long $fb0063eb ' 2
 long $fb94620c ' 3
 long $fb0061ec ' 4
 long $fb9461fc ' 5
 long $f9b0c630 ' 6
 long $f9b0ca30 ' 7
 long $fb0063ef ' 8
 long $fb946202 ' 9
 long $fc6001ed ' 10
 long $fd900004 ' 11
 long $fb0001ee ' 12
 long $f6046200 ' 13
 long $fc6063ec ' 14
 long $fd9fffc8 ' 15
 long $fb00e7ee ' 16
 long $fd900020 ' 17

#elif defined(CMM_OVERLAY)

' ALL CMM PLATFORMS USE THE SAME OVERLAY CODE:

 long $f6003e6f ' 1
 long $f1003e18 ' 2
 long $fc603feb ' 3
 long $fb003feb ' 4
 long $fb943e0c ' 5
 long $fb003dec ' 6
 long $fb943dfc ' 7
 long $f9b0c21e ' 8
 long $f9b0c61e ' 9
 long $fb003fef ' 10
 long $fb943e02 ' 11
 long $fc6001ed ' 12
 long $fd900004 ' 13
 long $fb0001ee ' 14
 long $f6043e00 ' 15
 long $fc603fec ' 16
 long $fd9fffc8 ' 17
 long $fb9cde04 ' 18
 long $fae03fee ' 19
 long $f5004a6e ' 20
 long $f5404a1f ' 21
 long $fd900034 ' 22
 long $fae04bee ' 23
 long $fd90002c ' 24
 long $ffff0000 ' 25

#elif defined(NMM_OVERLAY)

 long $fc63edeb ' 1
 long $f600bdf6 ' 2
 long $fb0085eb ' 3
 long $fb94840c ' 4
 long $fb0083ec ' 5
 long $fb9483fc ' 6
 long $f9b09a41 ' 7
 long $f9b09e41 ' 8
 long $fb0085ef ' 9
 long $fb948402 ' 10
 long $fc6001ed ' 11
 long $fd900004 ' 12
 long $fb0001ee ' 13
 long $f6048400 ' 14
 long $fc6085ec ' 15
 long $fd9fffc8 ' 16
 long $fb00b7ee ' 17
 long $f604b800 ' 18
 long $f600845b ' 19
 long $f500845f ' 20
 long $f180845f ' 21
 long $fb9c8402 ' 22
 long $fb00b9f6 ' 23
 long $f104bc04 ' 24
 long $00000000 ' 25
 long $00000000 ' 26
 long $fd60bc2c ' 27
 long $00000000 ' 28
 long $0f000000 ' 29

#elif defined(XMM_OVERLAY)

 long $fc6057eb ' 1
 long $fb0055eb ' 2
 long $fb945415 ' 3
 long $fb00ebec ' 4
 long $fb94ebfc ' 5
 long $f9b0cc75 ' 6
 long $f9b0c675 ' 7
 long $fb0055ef ' 8
 long $fb9c5402 ' 9
 long $fb0001ee ' 10
 long $fd900028 ' 11
 long $fb6c5402 ' 12
 long $fc6001ed ' 13
 long $fd90001c ' 14
 long $f180ea32 ' 15
 long $fb6c5403 ' 16
 long $fb0055ee ' 17
 long $fdb00058 ' 18
 long $fd900008 ' 19
 long $fdb00044 ' 20
 long $fc6055ed ' 21
 long $f6045400 ' 22
 long $fc6055ec ' 23
 long $fd9fffa4 ' 24
 long $fb00f9ee ' 25
 long $fd900020 ' 26

#endif
C_debug_overlay_end


' C_d_inc : constant used to increment instruction destination register

C_d_inc
 long 1<<9

