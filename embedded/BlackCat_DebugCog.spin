VAR

  long  rx_pin
  long  tx_pin
  ' rxtx mode is similar to SIO_mode, but the only bit used is bit 1, which tells
  ' the debug cog to invert the bits before transmitting - this is required on the
  ' Hydra, which has unusual mouse (and keyboard) circuitry.
  long  rxtx_mode
  long  bit_ticks
  ' outputVectorAddress is the Hub address of an array of 5 longs.
  ' For debugging purposes, we will store the packet received from the host. That is,
  ' cmd, long1, long2 and two checksum longs will appear there so BlackCat can let 
  ' us view them.
  long  outputVectorAddress 

OBJ 

  Common : "Catalina_Common"

PUB Setup
'' Allocate output vector
  outputVectorAddress   := long[Common#FREE_MEM] - Common#BLACKCAT_SIZE
  long[Common#FREE_MEM] := outputVectorAddress


PUB Start : okay
'' Start DebugCog
  rx_pin              := Common#BLACKCAT_RXPIN
  tx_pin              := Common#BLACKCAT_TXPIN
  rxtx_mode           := Common#BLACKCAT_MODE
  bit_ticks           := (clkfreq + (Common#BLACKCAT_BAUD/2)) / Common#BLACKCAT_BAUD 

  okay := (cognew(@entry, @rx_pin) => 0)

CON
  ' This block defines symbols that reference hub locations (whether in high or low ram)

  ' These definitions must match the ones in Catalina_Common.spin:
  
  ' The following two locations must be initalized to zero...
  
  breakFlagAdr  = $7E4C    ' Non-zero when we are at breakpoint and executing the debug support code.
                          ' ..Host sets this to zero just before supplying a continuation instruction.

  addrAdr       = $7E50    ' Holds address in kernel for a host requested read or write.

  ' The following three locations do not need to be initialized...
  ' Note: as the usage of kernelOut and kernelIn never overlaps, they can be the same location.
  
  kernelOutAdr  = $7E54    ' Holds information written out from kernel space
  kernelInAdr   = $7E58    ' Holds information to be written into kernel space
  kernelCmdAdr  = $7E5C    ' 0 = kernel write  1 = kernel read   2 = XMM write   3 = XMM read 

  ACK = $06
  NAK = $15
  BEL = $07

  small_h = $68
  big_h   = $48
  small_w = $77
  big_w   = $57
  small_x = $78
  big_x   = $58 
  small_c = $63
  big_c   = $43
  small_i = $69

DAT

'' symbolicConstants ACK NAK BEL small_h big_h small_w big_w small_c big_c small_i big_x small_x 

'***************************************
'* cog code for debugger communication *
'***************************************

                        org     0

entry                   mov     t1,par                'get structure address

                        rdlong  t2,t1                 'get rx_pin
                        mov     rxmask,#1
                        shl     rxmask,t2

                        add     t1,#4                 'move pointer to second parameter
                        rdlong  t2,t1                 't2 = tx_pin
                        mov     txmask,#1
                        shl     txmask,t2
                        
                        or      outa,txmask
                        or      dira,txmask           'set tx_pin to output

                        add     t1,#4                 'get mode bits
                        rdlong  rxtxmode,t1
                        
                        add     t1,#4                 'get bit_ticks
                        rdlong  bitticks,t1

                        add     t1,#4                 'get pointer to hub array where we can store
                        rdlong  hubBuff,t1            'cmd, long1, and long2 during debugging
                        
nextCmd                 mov     state,#0

receive                 mov     t1,#0
                                               
                        waitpeq t1,rxmask             'Wait for start bit.
                        mov     t1,cnt                'record time of start transition
                        
                        mov     rxcnt,bitticks
                        shr     rxcnt,#1              'set rxcnt to half of a bit time
                        add     rxcnt,bitticks        'set rxcnt to 1.5 bit times
                        add     rxcnt,t1              'set rxcnt to time of middle of bit 0
                        
                        mov     rxbits,#9             'initialize bit counter

:wait                   waitcnt rxcnt,bitticks
                        test    rxmask,ina      wc    'receive bit on rx pin
                        rcr     rxdata,#1
                        djnz    rxbits,#:wait

                        shr     rxdata,#32-9          'justify and trim received byte
                        and     rxdata,#$FF

                        jmp     #procChar

''transmit_byte         add     chkSumCalc, txdata
transmit_byte  add      chkSumCalc, txdata
                        or      txdata,#$100          'ready byte to transmit -- add stop bit
                        shl     txdata,#2             'add start bit (always a 0) and
                        or      txdata,#1             '  an idle bit
                        test    rxtxmode,#%0010 wz    'invert tx bits before transmitting?
              if_nz     xor     txdata,all_ones       'yes
                        mov     txbits,#11            'initialize bit counter
                        mov     txcnt,cnt
                        add     txcnt,bitticks

:bit                    waitcnt txcnt,bitticks
                        shr     txdata,#1       wc
                        muxc    outa,txmask
                        djnz    txbits,#:bit          'another bit to transmit?

transmit_byte_ret       ret

''transmit_long         mov     txdata,longOut
transmit_long  mov      txdata, longOut
                        shr     txdata,#24             ' send hi byte first
                        call    #transmit_byte
                        mov     txdata,longOut
                        shr     txdata,#16
                        call    #transmit_byte         ' send next byte
                        mov     txdata,longOut
                        shr     txdata,#8
                        call    #transmit_byte         ' send next byte
                        mov     txdata,longOut
                        call    #transmit_byte         ' send lo byte last
transmit_long_ret       ret                                


' This routine is jumped to whenever a byte has been received from the PC host.  The first
' byte of the packet is a command character (currently h, H, w, W, c, and i).  After the command
' character, either 1 or 2 longs are sent as 4 or 8 bytes respectively.  The hi-order byte
' is sent first.  The command character is examined to determine whether to expect 1 or 2 longs
' (4 or 8 bytes). In all cases, a checksum byte is sent.  It is the simple sum of the command byte and the
' payload bytes.

''procChar              if state == 0         ' This code block is executed for states 0..4
''                        cmd   = rxdata      ' First byte is a command character.
''                        state += 1          ' State is a count of bytes rcvd in current packet
''                        long1 = 0           ' Initialize the two longs that will
''                        long2 = 0           ' ..contain the packet payload
''                        chkSumCalc = cmd
''                        goto receive        ' Go wait for the next byte to arrive
''                      elseif state < 5      ' States 1..4 are handled here
''                        long1 << 8          ' This code assumes hi byte sent first
''                        long1 += rxdata
''                        state += 1
''                        chkSumCalc += rxData
''                        chkSumCalc &= $ff
''                        goto receive
''                      endif

procChar      cmp       state, #0               wc,wz
        if_ne jmp       #aac1
              mov       cmd, rxdata
              add       state, #1
              mov       long1, #0
              mov       long2, #0
              mov       chkSumCalc, cmd
              jmp       #receive
aac1          cmp       state, #5               wc,wz
        if_ae jmp       #aac3
              shl       long1, #8
              add       long1, rxdata
              add       state, #1
              add       chkSumCalc, rxData
              and       chkSumCalc, #$ff
              jmp       #receive
aac3
aac2

''                      case cmd                    ' This code is entered for states > 4
''                        is small_w big_w big_x    ' W  w  and X commands have a payload of 2 longs
''                          if state < 9            ' This executes for states 5..8
''                            long2 << 8
''                            long2 += rxdata
''                            state += 1
''                            chkSumCalc += rxdata
''                            chkSumCalc &= $ff
''                            goto receive
''                          else                    ' This executes for state 9
''                            chkSumRead = rxdata
''                            goto procPacket
''                          endif
''                        otherwise                 ' This executes when state is 5 and the cmd
''                          chkSumRead = rxdata     ' ..only has a single long payload
''                          goto procPacket
''                      endcase

              cmp       cmd, #small_w           wz,wc
        if_ne cmp       cmd, #big_w             wz,wc
        if_ne cmp       cmd, #big_x             wz,wc
        if_ne jmp       #aac5
              cmp       state, #9               wc,wz
        if_ae jmp       #aac6
              shl       long2, #8
              add       long2, rxdata
              add       state, #1
              add       chkSumCalc, rxdata
              and       chkSumCalc, #$ff
              jmp       #receive
aac6
              mov       chkSumRead, rxdata
              jmp       #procPacket
aac7
aac5
              mov       chkSumRead, rxdata
              jmp       #procPacket
aac4

''procPacket            wrlong cmd,hubBuff          ' Write packet parts to hub ram so that
''                      hubBuff += 4                ' ..ViewPort can let us look at what's going on.
''                      wrlong long1,hubBuff
''                      hubBuff += 4
''                      wrlong long2,hubBuff
''                      hubBuff += 4
''                      wrlong chkSumRead,hubBuff
''                      hubBuff += 4
''                      wrlong chkSumCalc,hubBuff
''                      hubBuff -= 16
''
''                      if chkSumCalc != chkSumRead ' Compare what we calculated against what was sent.
''                        goto packetError
''                      endif
''
''                      case cmd
''                        is small_h          ' h (lower case h) = read long from hub
''                          goto do_h_cmd
''                        is big_h            ' H (upper case H) = read 8 longs from hub
''                          goto do_h8_cmd
''                        is small_c          ' c (lower case c) = read long from kernel cog 
''                          goto do_c_cmd
''                        is big_c            ' C (upper case C) = report and zero comm stats
''                          goto do_stats_cmd
''                        is small_w          ' w (lower case w) = write long to hub
''                          goto do_whub_cmd
''                        is big_w            ' W (upper case W) = write long to kernel cog
''                          goto do_wcog_cmd
''                        is small_i          ' i (lower case i) = give kernel replacement instruction
''                          goto do_i_cmd
''                        is small_x          ' x (lower case x) = XMM read
''                          goto do_xmm_read
''                        is big_x            ' X (upper case X) = XMM write
''                          goto do_xmm_write
''                        otherwise
''                          goto invalidCmd
''                      endcase

procPacket    wrlong    cmd, hubBuff
              add       hubBuff, #4
              wrlong    long1, hubBuff
              add       hubBuff, #4
              wrlong    long2, hubBuff
              add       hubBuff, #4
              wrlong    chkSumRead, hubBuff
              add       hubBuff, #4
              wrlong    chkSumCalc, hubBuff
              sub       hubBuff, #16
              cmp       chkSumCalc, chkSumRead  wc,wz
        if_e  jmp       #aac9
              jmp       #packetError
aac9
aac10
              cmp       cmd, #small_h           wz,wc
        if_ne jmp       #aac12
              jmp       #do_h_cmd
aac12         cmp       cmd, #big_h             wz,wc
        if_ne jmp       #aac13
              jmp       #do_h8_cmd
aac13         cmp       cmd, #small_c           wz,wc
        if_ne jmp       #aac14
              jmp       #do_c_cmd
aac14         cmp       cmd, #big_c             wz,wc
        if_ne jmp       #aac15
              jmp       #do_stats_cmd
aac15         cmp       cmd, #small_w           wz,wc
        if_ne jmp       #aac16
              jmp       #do_whub_cmd
aac16         cmp       cmd, #big_w             wz,wc
        if_ne jmp       #aac17
              jmp       #do_wcog_cmd
aac17         cmp       cmd, #small_i           wz,wc
        if_ne jmp       #aac18
              jmp       #do_i_cmd
aac18         cmp       cmd, #small_x           wz,wc
        if_ne jmp       #aac19
              jmp       #do_xmm_read
aac19         cmp       cmd, #big_x             wz,wc
        if_ne jmp       #aac20
              jmp       #do_xmm_write
aac20
              jmp       #invalidCmd
aac11

' All response packets start with an ACK character.  The following subroutine sends the
' standard packet header and initializes the checksum that will be later added to during
' calls to transmit_long()

''sendPktHdr            txdata     = ACK
''                      chkSumCalc = 0
''                      call #transmit_byte  ' This routine updates chkSumCalc (adds ACK to it)
''sendPktHdr_ret        ret

' All response packets end with a checksum, which is the simple 8 bit sum of all preceding
' bytes in the packet, including the header (i.e., ACK)

''sendPktTail           txdata = chkSumCalc
''                      call  #transmit_byte
''                      goto nextCmd
 
sendPktHdr    mov       txdata, #ACK
              mov       chkSumCalc, #0
              call      #transmit_byte
sendPktHdr_ret  ret
sendPktTail   mov       txdata, chkSumCalc
              call      #transmit_byte
              jmp       #nextCmd

' This code reads one long from hub ram.  The h command gave us the address to read.  This
' address will be a hub byte address long aligned and is found in long1 after a succcessful
' packet reception.

''do_h_cmd              call   #sendPktHdr 
''                      rdlong longOut,long1  ' longOut is the input to the transmit_long routine.
''                      call   #transmit_long ' transmit_long updates chkSumCalc as each byte is sent.
''                      goto   sendPktTail

do_h_cmd      call      #sendPktHdr
              rdlong    longOut, long1
              call      #transmit_long
              jmp       #sendPktTail
' This code responds to a comm stats query.  It returns 2 longs (NAKcount and BELcount) and then
' zeroes same.

''do_stats_cmd          call   #sendPktHdr
''                      longOut = NAKcount
''                      call   #transmit_long
''                      longOut = BELcount
''                      call   #transmit_long
''                      NAKcount = 0
''                      BELcount = 0
''                      goto sendPktTail

do_stats_cmd  call      #sendPktHdr
              mov       longOut, NAKcount
              call      #transmit_long
              mov       longOut, BELcount
              call      #transmit_long
              mov       NAKcount, #0
              mov       BELcount, #0
              jmp       #sendPktTail

' This code reads 8 consecutive longs from hub ram.  The H command gave us the starting address.
' The starting address is long aligned byte address in hub ram.
  
''do_h8_cmd             call  #sendPktHdr

''                      cntr = 8
''                      loop
''                        rdlong longOut,long1
''                        call #transmit_long
''                        long1 += 4
''                        cntr -= 1
''                        exitIf cntr == 0
''                      endLoop
''                      goto sendPktTail

do_h8_cmd     call      #sendPktHdr
              mov       cntr, #8
aac22
              rdlong    longOut, long1
              call      #transmit_long
              add       long1, #4
              sub       cntr, #1
              cmp       cntr, #0                wc,wz
        if_e  jmp       #aac23
              jmp       #aac22
aac23
              jmp       #sendPktTail

' This code communicates with the LMM kernel to honor a request from the host to
' read a location inside the kernel cog.  The payload of the command from host
' provided the address in cog memory to be read.
                    
''do_c_cmd              wrlong readOp, kernelCommand  'Set operation to request a "read"
''                      wrlong long1, addrPtr         '..of this kernel location
''                      loop
''                        rdlong addr, addrPtr
''                        exitIf addr == 0   'Wait for kernel to say read is complete
''                      endLoop
''                      call    #sendPktHdr
''                      rdlong  longOut,kernelOutPtr
''                      call    #transmit_long
''                      goto sendPktTail

do_c_cmd      wrlong    readOp, kernelCommand
              wrlong    long1, addrPtr
aac24
              rdlong    addr, addrPtr
              cmp       addr, #0                wc,wz
        if_e  jmp       #aac25
              jmp       #aac24
aac25
              call      #sendPktHdr
              rdlong    longOut, kernelOutPtr
              call      #transmit_long
              jmp       #sendPktTail

' This code communicates with an XMM kernel to honor a request from the host to
' read an XMM location.
                    
''do_xmm_read           wrlong xmmReadOp, kernelCommand  'Set operation to request a "read"
''                      wrlong long1, addrPtr            '..of this XMM location
''                      loop
''                        rdlong addr, addrPtr
''                        exitIf addr == 0   'Wait for kernel to say read is complete
''                      endLoop
''                      call    #sendPktHdr
''                      rdlong  longOut,kernelOutPtr
''                      call    #transmit_long
''                      goto sendPktTail

do_xmm_read   wrlong    xmmReadOp, kernelCommand
              wrlong    long1, addrPtr
aac26
              rdlong    addr, addrPtr
              cmp       addr, #0                wc,wz
        if_e  jmp       #aac27
              jmp       #aac26
aac27
              call      #sendPktHdr
              rdlong    longOut, kernelOutPtr
              call      #transmit_long
              jmp       #sendPktTail

' This code writes a long into hub memory.  long1 from the command packet payload provides
' the long aligned hub byte address where long2 is to be written.
                     
''do_whub_cmd           wrlong long2,long1
''                      call   #sendPktHdr   'Send ACK packet so the host knows we're done.
''                      goto   sendPktTail

do_whub_cmd   wrlong    long2, long1
              call      #sendPktHdr
              jmp       #sendPktTail

' This code writes a long into the kernel cog memory.  long1 from the command packet payload provides
' the cog address where long2 is to be written.

''do_wcog_cmd           wrlong  writeOp,kernelCommand  'Set operation to "write"
''                      wrlong  long2, KernelInPtr     'kernelIn contains long to be put into kernel
''                      wrlong  long1,  addrPtr         '..at this cog address
''                      loop
''                        rdlong addr, addrPtr
''                        exitIf addr == 0   'Wait for kernel to say write is complete
''                      endLoop
''                      call   #sendPktHdr   'Send ACK packet so the host knows we're done.
''                      goto   sendPktTail

do_wcog_cmd   wrlong    writeOp, kernelCommand
              wrlong    long2, KernelInPtr
              wrlong    long1, addrPtr
aac28
              rdlong    addr, addrPtr
              cmp       addr, #0                wc,wz
        if_e  jmp       #aac29
              jmp       #aac28
aac29
              call      #sendPktHdr
              jmp       #sendPktTail

' This code writes a long into XMM memory.  long1 from the command packet payload provides
' the XMM address where long2 is to be written.

''do_xmm_write          wrlong  xmmWriteOp,kernelCommand  'Set operation to "write"
''                      wrlong  long2, KernelInPtr        'kernelIn contains long to be written
''                      wrlong  long1,  addrPtr           '..to this XMM address
''                      loop
''                        rdlong addr, addrPtr
''                        exitIf addr == 0   'Wait for kernel to say write is complete
''                      endLoop
''                      call   #sendPktHdr   'Send ACK packet so the host knows we're done.
''                      goto   sendPktTail

do_xmm_write  wrlong    xmmWriteOp, kernelCommand
              wrlong    long2, KernelInPtr
              wrlong    long1, addrPtr
aac30
              rdlong    addr, addrPtr
              cmp       addr, #0                wc,wz
        if_e  jmp       #aac31
              jmp       #aac30
aac31
              call      #sendPktHdr
              jmp       #sendPktTail

''do_i_cmd              wrlong long1, kernelInPtr 'Store replacement instruction where kernel expects it.
''                      wrlong zero, breakFlagPtr 'Let kernel know it's there (it polls this location while
''                                                '..paused at a breakpoint.  breakFlag will remain zero until
''                                                '..the kernel hits the next breakpoint. Host polls breakFlag
''                                                '..to find out when the kernel is again at a breakpoint.
''                      call   #sendPktHdr   'Send ACK packet so the host knows we're done.
''                      goto   sendPktTail

do_i_cmd      wrlong    long1, kernelInPtr
              wrlong    zero, breakFlagPtr
              call      #sendPktHdr
              jmp       #sendPktTail

''packetError           txdata = NAK         'Send a NAK when a checksum error is detected
''                      call  #transmit_byte
''                      txdata = NAK
''                      call  #transmit_byte 'Add checksum (= NAK in this case) to complete the packet.
''                      NAKcount += 1
''                      goto nextCmd

packetError   mov       txdata, #NAK
              call      #transmit_byte
              mov       txdata, #NAK
              call      #transmit_byte
              add       NAKcount, #1
              jmp       #nextCmd

''invalidCmd            txdata = BEL         'Send a BEL when an invalid command is found
''                      call  #transmit_byte
''                      txdata = BEL
''                      call  #transmit_byte 'Add checksum (= BEL in this case) to complete the packet.
''                      BELcount += 1
''                      goto nextCmd
''
invalidCmd    mov       txdata, #BEL
              call      #transmit_byte
              mov       txdata, #BEL
              call      #transmit_byte
              add       BELcount, #1
              jmp       #nextCmd

' Initialize pointers to hub ram locations that are to be used for cog communication.  It is
' done this way so that it doesn't matter whether the locations are in high or low hub ram.

all_ones                long    $ffffffff
breakFlagPtr            long    breakFlagAdr
addrPtr                 long    addrAdr
kernelCommand           long    kernelCmdAdr
kernelInPtr             long    kernelInAdr
kernelOutPtr            long    kernelOutAdr
zero                    long    0
writeOp                 long    0
readOp                  long    1
xmmWriteOp              long    2
xmmReadOp               long    3

NAKcount                long    0    ' Accumulates NAKs for comm stats query
BELcount                long    0    ' Accumulates BELs for comm stats query
                              
' Uninitialized data
'
t1                      res     1
t2                      res     1

addr                    res     1

bitticks                res     1
rxtxmode                res     1
rxmask                  res     1
hubBuff                 res     1
rxdata                  res     1
rxbits                  res     1
rxcnt                   res     1
rxcode                  res     1

txdata                  res     1
txbits                  res     1
txcnt                   res     1
txmask                  res     1

'' finishCodeSection
'
' Auto generated variable allocation.....
'
chkSumCalc                res       1
longOut                   res       1
state                     res       1
cmd                       res       1
long1                     res       1
long2                     res       1
chkSumRead                res       1
cntr                      res       1

CogLocCount1  fit  496  ' Version 1.01  January 13 2010
