'
' Target-specific PASM for the BlackCat or BlackBox Debugger ...
'
{
'
' Should really include this, but it changes too many offsets ...
'
OBJ
  Common : "Catalina_Common.spin"
'
' So instead we just include the necessary constants below,
' which must match the ones in Catalina_Common.spin ...
'
}

CON
  DEBUG_BREAK   = $7E4C           ' Non-zero when at breakpoint and executing debug support code
  DEBUG_ADDR    = $7E50           ' Holds address in kernel for a host requested read or write
  DEBUG_OUT     = $7E54           ' Holds information written out from kernel space
  DEBUG_IN      = $7E58           ' Holds information to be written into kernel space
  DEBUG_FLAG    = $7E5C           ' Indicates read operation requested when non-zero
  DEBUG_OVERLAY = $53             ' Cog location to overlay debug code
  DEBUG_VECTORS = $1eb            ' Cog location to overlay hub vectors (last 5 longs!!!)
#ifdef COMPACT
  DEBUG_MARKER  = $18             ' Cog location to write to DEBUG_BREAK at breakpoint (PC)                   
#else
  DEBUG_MARKER  = $2b             ' Cog location to write to DEBUG_BREAK at breakpoint (PC)                   
#endif
  DEBUG_END     = $7E6B           ' Last hub address reseved for debugger - next address is $7E6C

  VECTOR_SIZE   = 5               ' 5  Longs of vectors

#ifdef LARGE
#define XMM_OVERLAY
  OVERLAY_SIZE  = 26              ' 26 Longs for XMM LARGE
#elseifdef SMALL
#define XMM_OVERLAY
  OVERLAY_SIZE  = 26              ' 26 Longs for XMM SMALL
#elseifdef COMPACT
#define CMM_OVERLAY
  OVERLAY_SIZE  = 25              ' 25 Longs for CMM
#else
#define LMM_OVERLAY
  OVERLAY_SIZE  = 17              ' 17 Longs for LMM
#endif

'
' Catalina Code

DAT ' code segment

'
' C_debug_init : load debug code into kernel, set up debug vectors, then BREAK
'
C_debug_init

#ifdef CMM_OVERLAY

 long I32_CALA + @C_load_debug_vectors<<S32 ' load debug vectors

 long I32_LODA + @C_debug_overlay<<S32     ' hub addr of code to overlay ...
 word I16A_MOV + r1<<D16A + RI<<S16A       ' ... goes in r1
 long I32_LODI + @C_debug_addr_vector<<S32 ' debug address vector ...
 word I16A_MOV + r2<<D16A + RI<<S16A       ' ... goes in r2
 long I32_LODA + @:load_inst<<S32          ' hub addr of load inst goes in RI
 word I16B_EXEC                            ' start execution of LMM
 mov r0, #FC_START                         ' cog addr of FCACHE goes in r0
 mov BC, #(C_debug_overlay_end-C_debug_overlay) ' inst count goes in BC
:load_loop
 rdlong FC_TMP,RI                          ' update dst ...
 movd FC_TMP,r0                            ' ... of load inst ...
 wrlong FC_TMP,RI                          ' ... with r0
:load_inst
 rdlong 0-0, r1                            ' load inst
 add r1, #4                                ' next hub addr
 add r0, #1                                ' next cog addr
 sub BC, #1 wz                             ' continue ...
 if_nz sub PC,#(@:load_done-@:load_loop)   ' ... until all inst loaded
:load_done
 neg r0,#1                                 ' set ...
 wrlong r0,r2                              ' ... DEBUG_ADDR to -1
 jmp #EXEC_STOP
 word I16B_BRKP                            ' !!! BREAKPOINT!!! (jump to debug overlay)
 long ' align long
 word I16B_RETN                            ' done
 long 'align long

#else

 mov r2,#OVERLAY_SIZE      ' load overlay code ...
 mov r0,#DEBUG_OVERLAY     ' ... from C_debug_overlay ...
 jmp #LODL                 ' ... to replace ...
 long @C_debug_overlay     ' ... cog ... 
 mov r1,RI                 ' ... initialization code
 jmp #CALA                 ' do ...
 long @C_overlay_loader    ' ... the load
 mov r2,#VECTOR_SIZE       'load vectors ...
 mov r0,#DEBUG_VECTORS     ' ... from C_debug_vectors ...
 jmp #LODL                 ' ... to ... 
 long @C_debug_vectors     ' ... cog ...
 mov r1,RI                 ' ... vector table
 jmp #CALA                 ' do ...
 long @C_overlay_loader    ' ... the load
 jmp #LODL                 ' indicate ...
 long @C_debug_addr_vector ' ... special ...
#ifdef LARGE
 jmp #RLNG
#elseifdef SMALL
 jmp #RLNG
#else
 rdlong BC,RI              ' ... breakpoint ...
#endif
 neg r0,#1                 ' ... by setting ...
 wrlong r0,BC              ' ... DEBUG_ADDR to -1
 jmp #INIT                 ' !!! BREAKPOINT !!!
 jmp #RETN                 ' done

'
' C_overlay_loader : load code into kernel (not required for CMM)
'   On entry:
'     r0 = first register in cog to load
'     r1 = address of first long in hub RAM to load
'     r2 = size in longs
'   On exit:
'     r0,r1,r2,r3,r4 lost
'
C_overlay_loader

#ifdef XMM_OVERLAY
 jmp #LODL                 ' set up ...
 long @C_overlay_loader_2  ' ... initial ...
 jmp #RLNG                 '
 movd BC,r0                ' ... register ...
 jmp #WLNG                 '
C_overlay_loader_1
 sub r2,#1 wz,wc           ' if all ...
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
 rdlong r3,RI              ' ... destination ...
 movd r3,r0                ' ... register ...
 wrlong r3,RI              ' ... to be loaded ...
C_overlay_loader_1
 sub r2,#1 wz,wc           ' if all ...
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
 rdlong r3,RI              ' ...
 add r0,r3                 ' ... 
 wrlong r0,r4              ' ... register
 jmp #JMPA                 ' load ...
 long @C_overlay_loader_1  ' ... more longs
C_overlay_loader_3         ' done
 jmp #RETN

#endif

' end C_overlay_loader

#endif

'
' C_debug_overlay : debug code to load into kernel
'
' The code was previously assembled, using the following constant definitions:
'  
'  opAddr     = $00    ' cog address 0 used as register (normally reserved for POD)
'  temp       = $01    ' LMM: cog address 1 used as register (normally reserved for POD)
'  temp       = $28    ' CMM: cog address $28 used as register (normally t2)
'  breakFlag  = $1eb   ' vector to be set to Common#DEBUG_BREAK
'  addr       = $1ec   ' vector to be set to Common#DEBUG_ADDR
'  kernelOut  = $1ed   ' vector to be set to Common#DEBUG_OUT
'  kernelIn   = $1ee   ' vector to be set to Common#DEBUG_IN
'  opFlag     = $1ef   ' vector to be set to Common#DEBUG_FLAG
'
' The LMM code is common to all platforms, but the XMM code is platform
' specififc because of the different sizes of the XMM support code.
'
'=====================================================================================================================
' HERE IS THE LMM CODE (FOR REFERENCE - BINARY VERSIONS INCLUDED BELOW):
'
'                         org     DEBUG_OVERLAY
' brkpCode                wrlong  DEBUG_MARKER,breakFlag  '1 Let the host know that we are at a breakpoint              
' readFlags               rdlong  temp,breakFlag          '2 Test for host presenting continuation instruction          
'                         tjz     temp,#continue          '3 ..go here to replace breakpoint instruction and run        
'                         rdlong  opAddr,addr             '4 opAddr now holds the address for a kernel read/write       
'                         tjz     opAddr,#readFlags       '5 ..but address zero means no read/write is requested        
'                         movd    kernelRead,opAddr       '6 opAddr contains the kernel address to be read ...          
'                         movd    kernelWrite,opAddr      '7 ... or written (don't know which yet,so set up both)       
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
'                         tjz     temp,#continue          '5  ..go here to replace breakpoint instruction and run          
'                         rdlong  opAddr,addr             '6  opAddr now holds the address for a kernel read/write         
'                         tjz     opAddr,#readFlags       '7  ..but address zero means no read/write is requested          
'                         movd    kernelRead,opAddr       '8  opAddr contains the kernel address to be read ...            
'                         movd    kernelWrite,opAddr      '9  ... or written (don't know which yet,so set up both)         
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
'                         tjz     temp,#continue          '3 ..go here to replace breakpoint instruction and run          
'                         rdlong  XMM_Addr,addr           '4 XMM_Addr holds the address to read/write (cog or XMM addr)   
'                         tjz     XMM_Addr,#readFlags     '5 zero means no read/write is requested                        
'                         movd    kernelRead,XMM_Addr     '6 for kernel read, XMM_Addr contains the cog address to read   
'                         movd    kernelWrite,XMM_Addr    '7 for kernel write,  XMM_Addr contains the cog address to write
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

#ifdef LMM_OVERLAY

' ALL LMM PLATFORMS USE THE SAME OVERLAY CODE:
'
 long $083c57eb ' 1
 long $08bc03eb ' 2
 long $ec7c0262 ' 3
 long $08bc01ec ' 4
 long $ec7c0054 ' 5
 long $54bcb800 ' 6
 long $54bcbc00 ' 7
 long $08bc03ef ' 8
 long $ec7c025e ' 9
 long $083c01ed ' 10
 long $5c7c005f ' 11
 long $08bc01ee ' 12
 long $a0fc0200 ' 13
 long $083c03ec ' 14
 long $5c7c0054 ' 15
 long $08bccfee ' 16
 long $5c7c0067 ' 17

#elseifdef CMM_OVERLAY

' ALL CMM PLATFORMS USE THE SAME OVERLAY CODE:
'
 long $a0bc506c ' 1
 long $80bc5018 ' 2
 long $083c51eb ' 3
 long $08bc51eb ' 4
 long $ec7c5064 ' 5
 long $08bc01ec ' 6
 long $ec7c0056 ' 7
 long $54bcbc00 ' 8
 long $54bcc000 ' 9
 long $08bc51ef ' 10
 long $ec7c5060 ' 11
 long $083c01ed ' 12
 long $5c7c0061 ' 13
 long $08bc01ee ' 14
 long $a0fc5000 ' 15
 long $083c51ec ' 16
 long $5c7c0056 ' 17
 long $e87cd869 ' 18
 long $04bc51ee ' 19
 long $60bc4a6b ' 20
 long $68bc4a28 ' 21
 long $5c7c0074 ' 22
 long $04bc4bee ' 23
 long $5c7c0074 ' 24
 long $ffff0000 ' 25

#elseifdef XMM_OVERLAY

 long $083c57eb ' 1
 long $08bc03eb ' 2
 long $ec7c026b ' 3
 long $08bce7ec ' 4
 long $ec7ce654 ' 5
 long $54bcbe73 ' 6
 long $54bcb873 ' 7
 long $08bc03ef ' 8
 long $e87c025e ' 9
 long $08bc01ee ' 10
 long $5c7c0068 ' 11
 long $e4fc0261 ' 12
 long $083c01ed ' 13
 long $5c7c0068 ' 14
 long $84bce632 ' 15
 long $e4fc0266 ' 16
 long $08bc03ee ' 17
 long $5cfce470 ' 18
 long $5c7c0068 ' 19
 long $5cfcde6d ' 20
 long $083c03ed ' 21
 long $a0fc0200 ' 22
 long $083c03ec ' 23
 long $5c7c0054 ' 24
 long $08bcf3ee ' 25
 long $5c7c0079 ' 26

#endif
C_debug_overlay_end

'
' C_d_inc : constant used to increment instruction destination register
'
C_d_inc
 long 1<<9

'
' C_debug_vectors : hub ram vectors to load into kernel 
' 
' Note: DEBUG_ADDR must be set to -1 to indicate first breakpoint
'
' Note: C_load_debug_vectors is only used for CMM
'
#ifdef CMM_OVERLAY
C_load_debug_vectors
 word I16B_FCACHE + (C_load_debug_vectors_end - C_load_debug_vectors_start)<<S16B
 long ' align long
C_load_debug_vectors_start
 mov DEBUG_VECTORS+0,(FC_START+C_debug_vectors-C_load_debug_vectors_start+0)
 mov DEBUG_VECTORS+1,(FC_START+C_debug_vectors-C_load_debug_vectors_start+1)
 mov DEBUG_VECTORS+2,(FC_START+C_debug_vectors-C_load_debug_vectors_start+2)
 mov DEBUG_VECTORS+3,(FC_START+C_debug_vectors-C_load_debug_vectors_start+3)
 mov DEBUG_VECTORS+4,(FC_START+C_debug_vectors-C_load_debug_vectors_start+4)
 jmp #FC_RETURN
#endif
C_debug_vectors
 long DEBUG_BREAK
C_debug_addr_vector
 long DEBUG_ADDR 
 long DEBUG_OUT  
 long DEBUG_IN
 long DEBUG_FLAG 
C_load_debug_vectors_end
