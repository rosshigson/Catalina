''******************************************************************
''*  Based on                                                      *
''*  Full-Duplex Serial Driver v1.1                                *
''*  Author: Chip Gracey                                           *
''*  Copyright (c) 2006 Parallax, Inc.                             *
''*  See end of file for terms of use.                             *
''*                                                                *
''******************************************************************
''*  Ross Higson 2025                                              *
''*                                                                *
''*   Modified to support 256 byte rx and tx buffers.              *
''*                                                                *
''*  Ross Higson 2012                                              *
''*                                                                *
''*   Modified for use with Catalina - modified the  'Start' and   *
''*   'AddPort' methods, and added a 'Setup' method to allocate    *
''*   HUB RAM buffers. Other Spin methods were changed to suit the *
''*   use of the allocated Hub RAM buffers.                        *
''*                                                                *
''*   No changes to the PASM code were required.                   *
''*                                                                *
''*   NOTE : By default, all the unused Spin methods are removed.  *
''*          To use this object with Spin, add -D S4_SPIN to the   *
''*          compile command (Homespun or BST only).               *
''*                                                                *
''*   Here is the way in which this plugin COULD be started by a   *
''*   custom Catalina target:                                      *
''*                                                                *
''*   ----------------------------------------------------------   *
''*   OBJ                                                          *
''*     Common : "Catalina_Common"                                 *
''*                                                                *
''*     S4 : "Catalina_FullDuplexSerial4FC"                        *
''*                                                                *
''*   PUB Start                                                    *
''*     ' Set up the Registry - required before setting up plugins *
''*     Common.InitializeRegistry                                  *
''*                                                                *
''*     S4.Setup                                                   *
''*                                                                *
''*     ' may have up to 4 of these, specifying different ports    *
''*     S4.AddPort(port,rx,tx,cts,rts,threshold,mode,baud)         *
''*                                                                *
''*     S4.Start                                                   *
''*                                                                *
''*   ----------------------------------------------------------   *
''*                                                                *
''*   However, to avoid having to modify all targets, catalina     *
''*   embeds this in the special 'Extras' object designed for      *
''*   user plugins, and then enables the loading of the plugin     *
''*   via the symbol 'libserial4'.                                 *
''*                                                                *
''*   All port access is then done using the C routines in the     *
''*   library provided (libserial4) - the Spin functions are       *
''*   removed to save space.                                       *
''*                                                                *
''*   All this means that you can use the plugin smply by          *
''*   compiling yout program with a command such as:               *
''*                                                                *
''*     catalina program.c -lserial4                               *
''*                                                                *
''*   Catalina currently only supports using a single instance of  *
''*   this object. Supporting multiple instances is possible, but  *
''*   would make access more complex as you would need to add the  *
''*   ability to specify the cog in each C access routine.         *
''*                                                                *
''******************************************************************
''*  Tim Moore 2008                                                *
''*   Modified to support 4 serial ports                           *
''*   It should run 1 port faster than FullDuplexSerial or run     *
''*   up to 4 ports                                                *
''*   Merged 64 byte rx buffer change                              *
''*   Merged Debug_PC (Jon Williams)                               *
''*   Uses DAT rather than VAR so can be used in multiple objects  *
''*   If you want multiple objects using this driver, you must     *
''*   copy the driver to a new file and make sure version long is  *
''*   unique in each version                                       *
''*   Added txflush                                                *
''*   Optimization perf                                            *
''*    1 port up to 750kbps                                        *
''*    2 port up to 230kbps                                        *
''*    3 port up to 140kbps                                        *
''*    4 port up to 100kbps                                        *
''*   Tested 4 ports to 115Kbps with 6MHz crystal                  *
''*   These are approx theoretical worse case you may get faster   *
''*   if port is active but idle                                   *
''*   Added RTS/CTS flow control                                   *
''*                                                                *
''*   There is no perf penalty supporting 4 serial ports when they *
''*   are not enabled                                              *
''*   There is no perf penalty supporting CTS and RTS              *
''*   Enabling CTS on any port costs 4 clocks per port             *
''*   Enabling RTS on any port costs 32 clocks per port            *
''*   Main Rx+Tx loop is ~256 clocks per port (without CTS/RTS)    *
''*   compared with FullDuplexSerial at ~356 clocks                *
''*                                                                *
''*   There is a cost to read/write a byte in the transmit/        *
''*   receive routines. The transmit cost is greater than the      *
''*   receive cost so between propellors you can run at max baud   *
''*   rate. If receiving from another device, the sending device   *
''*   needs a delay between each byte once you are above ~470kbps  *
''*   with 1 port enabled                                          *
''*                                                                *
''*   Size:                                                        *
''*     Cog Initialzation code 1 x 8 + 4 x 25                      *
''*     Cog Receive code 4 x 30 words                              *
''*     Cog Transmit code 4 x 26 words                             *
''*     Spin/Cog circular buffer indexes 4 x 4 words               *
''*       Used in both spin and Cog and read/written in both       *
''*       directions                                               *
''*     Spin/Cog per port info 4 x 8 words                         *
''*       Passed from Spin to Cog on cog initialization            *
''*     Spin per port info 4 x 1 byte                              *
''*       Used by Spin                                             *
''*     Spin/Cog rx/tx buffer hub address 4 x 4 words              *
''*       Passed from Spin to Cog on cog initialization            *
''*     Spin/Cog rx/tx index hub address 4 x 4 words               *
''*       Passed from Spin to Cog on cog initialization            *
''*     Spin per port rx buffer 4 x 64 byte                        *
''*       Read by Spin, written by cog                             *
''*     Cog per port rx state 4 x 4 words (overlayed on rx buffer) *
''*       Used by Cog                                              *
''*     Spin per port tx buffer 4 x 16 byte                        *
''*       Written by Spin, read by Cog                             *
''*     Cog per port tx state 4 x 4 words (overlayed on tx buffer) *
''*       Used by Cog                                              *
''*     Cog constants 4 words                                      *
''*   A significant amount of space (4 x 16 words) is used for     *
''*   pre-calculated information: hub addresses, per port          *
''*   configuration. This speeds up the tx/rx routines at the cost *
''*   of this space.                                               *
''*                                                                *
''*   Note: There are 8 longs remaining in the cog's memory,       *
''*   expect to do some work to add features :).                   *
''*                                                                *
''*   7/1/08: Fixed bug of not receiving with only 1 port enabled  *
''*           Fixed bug of rts not working on ports 0, 2 and 3     *
''*  7/22/08: Missed a jmpret call in port 1 and 3 tx              *
''*           Fixed a bug in port 3 tx not increasing tx ptr       *
''*  7/24/08: Added version variable to change if need multiple    *
''*           copies of the driver                                 *
''*  8/14/08: CTS/RTS inverted by default, forgot that RS232 level *
''*           shifters invert, so changed the default invert logic *
''*                                                                *
''******************************************************************

CON

  FF                            = 12                    ' form feed
  CR                            = 13                    ' carriage return

  NOMODE                        = %000000
  INVERTRX                      = %000001
  INVERTTX                      = %000010
  OCTX                          = %000100
  NOECHO                        = %001000
  INVERTCTS                     = %010000
  INVERTRTS                     = %100000

  PINNOTUSED                    = -1                    'tx/tx/cts/rts pin is not used
  
  DEFAULTTHRESHOLD              = 0                     'rts buffer threshold

  BAUD1200                      = 1200
  BAUD2400                      = 2400
  BAUD4800                      = 4800
  BAUD9600                      = 9600
  BAUD19200                     = 19200
  BAUD38400                     = 38400
  BAUD57600                     = 57600
  BAUD115200                    = 115200

  S4_BUFFER_SIZE                = (16+33+32+8*64)*4     ' buffer size (bytes) 

  ' Calculate offsets from rx_head

  OFFSET_rx_head    = 0*4          
  OFFSET_rx_head1   = 1*4          
  OFFSET_rx_head2   = 2*4          
  OFFSET_rx_head3   = 3*4          
  OFFSET_rx_tail    = 4*4          
  OFFSET_rx_tail1   = 5*4          
  OFFSET_rx_tail2   = 6*4          
  OFFSET_rx_tail3   = 7*4          
  OFFSET_tx_head    = 8*4          
  OFFSET_tx_head1   = 9*4          
  OFFSET_tx_head2   = 10*4         
  OFFSET_tx_head3   = 11*4         
  OFFSET_tx_tail    = 12*4         
  OFFSET_tx_tail1   = 13*4         
  OFFSET_tx_tail2   = 14*4         
  OFFSET_tx_tail3   = 15*4
  OFFSET_rxtx_mode  = 32*4
  OFFSET_rxchar     = 48*4
  OFFSET_rx_buffer  = 81*4 + 0*64*4
  OFFSET_rx_buffer1 = 81*4 + 1*64*4
  OFFSET_rx_buffer2 = 81*4 + 2*64*4
  OFFSET_rx_buffer3 = 81*4 + 3*64*4
  OFFSET_tx_buffer  = 337*4 + 0*64*4
  OFFSET_tx_buffer1 = 337*4 + 1*64*4
  OFFSET_tx_buffer2 = 337*4 + 2*64*4
  OFFSET_tx_buffer3 = 337*4 + 3*64*4


OBJ

  Common : "Catalina_Common"

VAR

  ' From C, these variables used only during initialization. 
  ' From Spin, these variables can be used as normal.
  long S4_BLOCK

PUB Setup
  ' Allocate a block of Hub memory for buffers
  S4_BLOCK := long[Common#FREE_MEM] - S4_BUFFER_SIZE
  long[Common#FREE_MEM] := S4_BLOCK
  bytefill(S4_BLOCK, 0, S4_BUFFER_SIZE)

PUB AddPort(port,rxpin,txpin,ctspin,rtspin,rtsthreshold,mode,baudrate)
'' Call AddPort to define each port
'' port 0-3 port index of which serial port
'' rx/tx/cts/rtspin pin number                          XXX#PINNOTUSED if not used
'' rtsthreshold - buffer threshold before rts is used   XXX#DEFAULTTHRSHOLD means use default
'' mode bit 0 = invert rx                               XXX#INVERTRX
'' mode bit 1 = invert tx                               XXX#INVERTTX
'' mode bit 2 = open-drain/source tx                    XXX#OCTX
'' mode bit 3 = ignore tx echo on rx                    XXX#NOECHO
'' mode bit 4 = invert cts                              XXX#INVERTCTS
'' mode bit 5 = invert rts                              XXX#INVERTRTS
'' baudrate
  if cog OR (port > 3)
    abort
  if rxpin <> -1
    long[@rxmask][port] := |< rxpin
  if txpin <> -1
    long[@txmask][port] := |< txpin
  if ctspin <> -1
    long[@ctsmask][port] := |< ctspin
  if rtspin <> -1
    long[@rtsmask][port] := |< rtspin
    if (rtsthreshold > 0) AND (rtsthreshold < 256)
      long[@rtssize][port] := rtsthreshold
    else
      long[@rtssize][port] := 192                       'default rts threshold 3/4 of buffer
  long[@rxtx_mode][port] := mode
  long[S4_BLOCK+OFFSET_rxtx_mode][port] := mode ' save in S4_BLOCK (for runtime use by C)
  if mode & INVERTRX
    byte[@rxchar][port] := $ff
    byte[S4_BLOCK+OFFSET_rxchar][port] := $ff ' save in S4_BLOCK (for runtime use by C)
  long[@bit_ticks][port] := (clkfreq / baudrate)
  long[@bit4_ticks][port] := long[@bit_ticks][port] >> 2 - 150

PUB Start : okay
'' Call start to start cog
'' Start serial driver - starts a cog
'' returns false if no cog available
''
  rxbuff_head_ptr  := rxbuff_ptr  := S4_BLOCK + OFFSET_rx_buffer
  rxbuff_head_ptr1 := rxbuff_ptr1 := S4_BLOCK + OFFSET_rx_buffer1
  rxbuff_head_ptr2 := rxbuff_ptr2 := S4_BLOCK + OFFSET_rx_buffer2
  rxbuff_head_ptr3 := rxbuff_ptr3 := S4_BLOCK + OFFSET_rx_buffer3
  txbuff_tail_ptr  := txbuff_ptr  := S4_BLOCK + OFFSET_tx_buffer
  txbuff_tail_ptr1 := txbuff_ptr1 := S4_BLOCK + OFFSET_tx_buffer1
  txbuff_tail_ptr2 := txbuff_ptr2 := S4_BLOCK + OFFSET_tx_buffer2
  txbuff_tail_ptr3 := txbuff_ptr3 := S4_BLOCK + OFFSET_tx_buffer3
  rx_head_ptr  := S4_BLOCK + OFFSET_rx_head
  rx_head_ptr1 := S4_BLOCK + OFFSET_rx_head1
  rx_head_ptr2 := S4_BLOCK + OFFSET_rx_head2
  rx_head_ptr3 := S4_BLOCK + OFFSET_rx_head3
  rx_tail_ptr  := S4_BLOCK + OFFSET_rx_tail
  rx_tail_ptr1 := S4_BLOCK + OFFSET_rx_tail1
  rx_tail_ptr2 := S4_BLOCK + OFFSET_rx_tail2
  rx_tail_ptr3 := S4_BLOCK + OFFSET_rx_tail3
  tx_head_ptr  := S4_BLOCK + OFFSET_tx_head
  tx_head_ptr1 := S4_BLOCK + OFFSET_tx_head1
  tx_head_ptr2 := S4_BLOCK + OFFSET_tx_head2
  tx_head_ptr3 := S4_BLOCK + OFFSET_tx_head3
  tx_tail_ptr  := S4_BLOCK + OFFSET_tx_tail
  tx_tail_ptr1 := S4_BLOCK + OFFSET_tx_tail1
  tx_tail_ptr2 := S4_BLOCK + OFFSET_tx_tail2
  tx_tail_ptr3 := S4_BLOCK + OFFSET_tx_tail3


  cog := cognew(@entry, S4_BLOCK)
  if cog => 0 
    ' Register ourselves
    Common.Register(cog, Common#LMM_S4)
    ' We need to remember our base buffer address, so use our comms 
    ' block for this, since this plugin does not implement service
    ' requests - all interaction is via the Hub RAM memory buffers.
    Common.SendInitializationData(cog, S4_BLOCK, 0)
  okay := cog + 1 

'------------------------------------------------------------------------------
#ifdef S4_SPIN

PUB Init
''Always call init before adding ports
  Stop

PUB Stop
'' Stop serial driver - frees a cog
  if cog
    cogstop(cog~ - 1)
  bytefill(S4_BLOCK, 0, S4_BUFFER_SIZE)      'initialize head/tails,port info and hub buffer pointers

PUB getCogID : result
  return cog -1

PUB rxflush(port)
'' Flush receive buffer
  repeat while rxcheck(port) => 0
    
PUB rxcheck(port) : rxbyte
'' Check if byte received (never waits)
'' returns -1 if no byte received, $00..$FF if byte
  if port > 3
    abort
  rxbyte--
  if long[S4_BLOCK+16][port] <> long[S4_BLOCK][port]
    rxbyte := byte[S4_BLOCK+192][port] ^ byte[S4_BLOCK+324][(port<<6)+long[S4_BLOCK+256][port]]
    long[S4_BLOCK+16][port] := (long[S4_BLOCK+16][port] + 1) & $FF

PUB rxtime(port,ms) : rxbyte | t
'' Wait ms milliseconds for a byte to be received
'' returns -1 if no byte received, $00..$FF if byte
  t := cnt
  repeat until (rxbyte := rxcheck(port)) => 0 or (cnt - t) / (clkfreq / 1000) > ms

PUB rx(port) : rxbyte
'' Receive byte (may wait for byte)
'' returns $00..$FF
  repeat while (rxbyte := rxcheck(port)) < 0

PUB tx(port,txbyte)
'' Send byte (may wait for room in buffer)
  if port > 3
    abort
  repeat until (long[S4_BLOCK+48][port] <> (long[S4_BLOCK+32][port] + 1) & $FF)
  byte[S4_BLOCK+580][(port<<4)+long[S4_BLOCK+32][port]] := txbyte
  long[S4_BLOCK+32][port] := (long[S4_BLOCK+32][port] + 1) & $FF

  if long[@rxtx_mode][port] & NOECHO
    rx(port)

PUB txflush(port)
  repeat until (long[S4_BLOCK+48][port] == long[S4_BLOCK+32][port])

PUB str(port,stringptr)
'' Send string                    
  repeat strsize(stringptr)
    tx(port,byte[stringptr++])

PUB strln(port,strAddr)
'' Print a zero-terminated string
  str(port,strAddr)
  tx(port,CR)  

PUB dec(port,value) | i
'' Print a decimal number
  decl(port,value,10,0)

PUB decf(port,value, width) | i
'' Prints signed decimal value in space-padded, fixed-width field
  decl(port,value,width,1)

PUB decx(port,value, digits) | i
'' Prints zero-padded, signed-decimal string
'' -- if value is negative, field width is digits+1
  decl(port,value,digits,2)

PUB decl(port,value,digits,flag) | i
  digits := 1 #> digits <# 10
  if value < 0
    -value
    tx(port,"-")

  i := 1_000_000_000
  if flag & 3
    if digits < 10                                      ' less than 10 digits?
      repeat (10 - digits)                              '   yes, adjust divisor
        i /= 10

  repeat digits
    if value => i
      tx(port,value / i + "0")
      value //= i
      result~~
    elseif (i == 1) OR result OR (flag & 2)
      tx(port,"0")
    elseif flag & 1
      tx(port," ")
    i /= 10

PUB hex(port,value, digits)
'' Print a hexadecimal number
  value <<= (8 - digits) << 2
  repeat digits
    tx(port,lookupz((value <-= 4) & $F : "0".."9", "A".."F"))

PUB ihex(port,value, digits)
'' Print an indicated hexadecimal number
  tx(port,"$")
  hex(port,value,digits)

PUB bin(port,value, digits)
'' Print a binary number
  value <<= 32 - digits
  repeat digits
    tx(port,(value <-= 1) & 1 + "0")

PUB padchar(port,count, txbyte)
  repeat count
     tx(port,txbyte)

PUB ibin(port,value, digits)
'' Print an indicated binary number
  tx(port,"%")
  bin(port,value,digits)

PUB putc(port,txbyte)
'' Send a byte to the terminal
  tx(port,txbyte)
  
PUB newline(port)
  putc(port,CR)

PUB cls(port)
  putc(port,FF)

PUB getc(port)
'' Get a character
'' -- will not block if nothing in uart buffer
   return rxcheck(port)
'  return rx

#endif
'------------------------------------------------------------------------------

DAT
'***********************************
'* Assembly language serial driver *
'***********************************
'
                        org
'
' Entry
'                   
'To maximize the speed of rx and tx processing, all the mode checks are no longer inline
'The initialization code checks the modes and modifies the rx/tx code for that mode
'e.g. the if condition for rx checking for a start bit will be inverted if mode INVERTRX
'is it, similar for other mode flags
'The code is also patched depending on whether a cts or rts pin are supplied. The normal
' routines support cts/rts processing. If the cts/rts mask is 0, then the code is patched
'to remove the addtional code. This means I/O modes and CTS/RTS handling adds no extra code
'in the rx/tx routines which not required.
'Similar with the co-routine variables. If a rx or tx pin is not configured the co-routine
'variable for the routine that handles that pin is modified so the routine is never called
'We start with port 3 and work down to ports because we will be updating the co-routine pointers
'and the order matters. e.g. we can update txcode3 and then update rxcode3 based on txcode3
'port 3
entry
rxcode  if_never        mov     rxcode,#receive       'statically set these variables
txcode  if_never        mov     txcode,#transmit
rxcode1 if_never        mov     rxcode1,#receive1
txcode1 if_never        mov     txcode1,#transmit1
rxcode2 if_never        mov     rxcode2,#receive2
txcode2 if_never        mov     txcode2,#transmit2
rxcode3 if_never        mov     rxcode3,#receive3
txcode3 if_never        mov     txcode3,#transmit3
                        
                        test    rxtx_mode3,#OCTX wz   'init tx pin according to mode
                        test    rxtx_mode3,#INVERTTX wc
        if_z_ne_c       or      outa,txmask3
        if_z            or      dira,txmask3
                                                      'patch tx routine depending on invert and oc
                                                      'if invert change muxc to muxnc
                                                      'if oc change outa to dira
        if_z_eq_c       or      txout3,domuxnc        'patch muxc to muxnc
        if_nz           movd    txout3,#dira          'change destination from outa to dira
                                                      'patch rx wait for start bit depending on invert
                        test    rxtx_mode3,#INVERTRX wz 'wait for start bit on rx pin
        if_nz           xor     start3,doifc2ifnc     'if_c jmp to if_nc
                                                      'patch tx routine depending on whether cts is used
                                                      'and if it is inverted
                        or      ctsmask3,#0     wz    'cts pin? z not set if in use
        if_nz           test    rxtx_mode3,#INVERTCTS wc 'c set if inverted
        if_nz_and_c     or      ctsi3,doif_z_or_nc    'if_nc jmp
        if_nz_and_nc    or      ctsi3,doif_z_or_c     'if_c jmp
                                                      'if not cts remove the test by moving
                                                      'the transmit entry point down 1 instruction
                                                      'and moving the jmpret over the cts test
                                                      'and changing co-routine entry point
        if_z            mov     txcts3,transmit3      'copy the jmpret over the cts test
        if_z            movs    ctsi3,#txcts3         'patch the jmps to transmit to txcts0
        if_z            add     txcode3,#1            'change co-routine entry to skip first jmpret
                                                      'patch rx routine depending on whether rts is used
                                                      'and if it is inverted
                        or      rtsmask3,#0     wz
        if_nz           test    rxtx_mode3,#INVERTRTS wc
        if_nz_and_c     or      rts3,domuxnc          'patch muxc to muxnc
        if_z            mov     norts3,rec3i          'patch rts code to a jmp #receive3
        if_z            movs    start3,#receive3      'skip all rts processing                  
                                                      'patch all of tx routine out if not used                  
                        or      txmask3,#0      wz    'by changing the co-routine variable
'        if_z            mov     txcode3,#receive
                                                      'patch all of rx routine out if not used                  
                        or      rxmask3,#0      wz    'by changing the co-routine variable
'        if_z            mov     rxcode3,txcode3       'use variable in case it has been changed
'port 2
                        test    rxtx_mode2,#OCTX wz   'init tx pin according to mode
                        test    rxtx_mode2,#INVERTTX wc
        if_z_ne_c       or      outa,txmask2
        if_z            or      dira,txmask2
        if_z_eq_c       or      txout2,domuxnc        'patch muxc to muxnc
        if_nz           movd    txout2,#dira          'change destination from outa to dira
                        test    rxtx_mode2,#INVERTRX wz 'wait for start bit on rx pin
        if_nz           xor     start2,doifc2ifnc     'if_c jmp to if_nc
                        or      ctsmask2,#0     wz
        if_nz           test    rxtx_mode2,#INVERTCTS wc
        if_nz_and_c     or      ctsi2,doif_z_or_nc    'if_nc jmp
        if_nz_and_nc    or      ctsi2,doif_z_or_c     'if_c jmp
        if_z            mov     txcts2,transmit2      'copy the jmpret over the cts test
        if_z            movs    ctsi2,#txcts2         'patch the jmps to transmit to txcts0  
        if_z            add     txcode2,#1            'change co-routine entry to skip first jmpret
                        or      rtsmask2,#0     wz
        if_nz           test    rxtx_mode2,#INVERTRTS wc
        if_nz_and_c     or      rts2,domuxnc          'patch muxc to muxnc
        if_z            mov     norts2,rec2i          'patch to a jmp #receive2
        if_z            movs    start2,#receive2      'skip all rts processing                  
                        or      txmask2,#0      wz
'        if_z            mov     txcode2,rxcode3       'use variable in case it has been changed
                        or      rxmask2,#0      wz    
'        if_z            mov     rxcode2,txcode2       'use variable in case it has been changed
'port 1
                        test    rxtx_mode1,#OCTX wz   'init tx pin according to mode
                        test    rxtx_mode1,#INVERTTX wc
        if_z_ne_c       or      outa,txmask1
        if_z            or      dira,txmask1
        if_z_eq_c       or      txout1,domuxnc        'patch muxc to muxnc
        if_nz           movd    txout1,#dira          'change destination from outa to dira
                        test    rxtx_mode1,#INVERTRX wz 'wait for start bit on rx pin
        if_nz           xor     start1,doifc2ifnc     'if_c jmp to if_nc
                        or      ctsmask1,#0     wz
        if_nz           test    rxtx_mode1,#INVERTCTS wc
        if_nz_and_c     or      ctsi1,doif_z_or_nc    'if_nc jmp
        if_nz_and_nc    or      ctsi1,doif_z_or_c     'if_c jmp
        if_z            mov     txcts1,transmit1      'copy the jmpret over the cts test
        if_z            movs    ctsi1,#txcts1         'patch the jmps to transmit to txcts0  
        if_z            add     txcode1,#1            'change co-routine entry to skip first jmpret
                                                      'patch rx routine depending on whether rts is used
                                                      'and if it is inverted
                        or      rtsmask1,#0     wz
        if_nz           test    rxtx_mode1,#INVERTRTS wc
        if_nz_and_c     or      rts1,domuxnc          'patch muxc to muxnc
        if_z            mov     norts1,rec1i          'patch to a jmp #receive1
        if_z            movs    start1,#receive1      'skip all rts processing                  
                        or      txmask1,#0      wz
'        if_z            mov     txcode1,rxcode2       'use variable in case it has been changed
                        or      rxmask1,#0      wz
'        if_z            mov     rxcode1,txcode1       'use variable in case it has been changed
'port 0
                        test    rxtx_mode,#OCTX wz    'init tx pin according to mode
                        test    rxtx_mode,#INVERTTX wc
        if_z_ne_c       or      outa,txmask
        if_z            or      dira,txmask
                                                      'patch tx routine depending on invert and oc
                                                      'if invert change muxc to muxnc
                                                      'if oc change out1 to dira
        if_z_eq_c       or      txout0,domuxnc        'patch muxc to muxnc
        if_nz           movd    txout0,#dira          'change destination from outa to dira
                                                      'patch rx wait for start bit depending on invert
                        test    rxtx_mode,#INVERTRX wz  'wait for start bit on rx pin
        if_nz           xor     start0,doifc2ifnc     'if_c jmp to if_nc
                                                      'patch tx routine depending on whether cts is used
                                                      'and if it is inverted
                        or      ctsmask,#0     wz     'cts pin? z not set if in use
        if_nz           test    rxtx_mode,#INVERTCTS wc 'c set if inverted
        if_nz_and_c     or      ctsi0,doif_z_or_nc    'if_nc jmp
        if_nz_and_nc    or      ctsi0,doif_z_or_c     'if_c jmp
        if_z            mov     txcts0,transmit       'copy the jmpret over the cts test
        if_z            movs    ctsi0,#txcts0         'patch the jmps to transmit to txcts0  
        if_z            add     txcode,#1             'change co-routine entry to skip first jmpret
                                                      'patch rx routine depending on whether rts is used
                                                      'and if it is inverted
                        or      rtsmask,#0     wz     'rts pin, z not set if in use
        if_nz           test    rxtx_mode,#INVERTRTS wc
        if_nz_and_c     or      rts0,domuxnc          'patch muxc to muxnc
        if_z            mov     norts0,rec0i          'patch to a jmp #receive
        if_z            movs    start0,#receive       'skip all rts processing if not used
                                                      'patch all of tx routine out if not used                  
                        or      txmask,#0       wz
'        if_z            mov     txcode,rxcode1        'use variable in case it has been changed
                                                      'patch all of rx routine out if not used                  
                        or      rxmask,#0       wz
'        if_z            mov     rxcode,txcode         'use variable in case it has been changed
'
' Receive
'
receive                 jmpret  rxcode,txcode         'run a chunk of transmit code, then return
                                                      'patched to a jmp if pin not used                        
                        test    rxmask,ina      wc
start0  if_c            jmp     #norts0               'go check rts if no start bit
                                                      'will be patched to jmp #receive if no rts  

                        mov     rxbits,#9             'ready to receive byte
                        mov     rxcnt,bit4_ticks      '1/4 bits
                        add     rxcnt,cnt                          

:bit                    add     rxcnt,bit_ticks       '1 bit period
                        
:wait                   jmpret  rxcode,txcode         'run a chuck of transmit code, then return

                        mov     t1,rxcnt              'check if bit receive period done
                        sub     t1,cnt
                        cmps    t1,#0           wc
        if_nc           jmp     #:wait

                        test    rxmask,ina      wc    'receive bit on rx pin
                        rcr     rxdata,#1
                        djnz    rxbits,#:bit          'get remaining bits

                        jmpret  rxcode,txcode         'run a chunk of transmit code, then return
                        
                        shr     rxdata,#32-9          'justify and trim received byte

                        wrbyte  rxdata,rxbuff_head_ptr'{7-22}
                        add     rx_head,#1
                        and     rx_head,#$FF          '256 byte buffer
                        wrlong  rx_head,rx_head_ptr   '{8}
                        mov     rxbuff_head_ptr,rxbuff_ptr 'calculate next byte head_ptr
                        add     rxbuff_head_ptr,rx_head
norts0                  rdlong  rx_tail,rx_tail_ptr   '{7-22 or 8} will be patched to jmp #r3 if no rts
                        mov     t1,rx_head
                        sub     t1,rx_tail            'calculate number bytes in buffer
                        and     t1,#$FF               'fix wrap
                        cmps    t1,rtssize      wc    'is it more than the threshold
rts0                    muxc    outa,rtsmask          'set rts correctly

rec0i                   jmp     #receive              'byte done, receive next byte
'
' Receive1
'
receive1                jmpret  rxcode1,txcode1       'run a chunk of transmit code, then return
                        
                        test    rxmask1,ina     wc
start1  if_c            jmp     #norts1               'go check rts if no start bit

                        mov     rxbits1,#9            'ready to receive byte
                        mov     rxcnt1,bit4_ticks1    '1/4 bits
                        add     rxcnt1,cnt                          

:bit1                   add     rxcnt1,bit_ticks1     '1 bit period
                        
:wait1                  jmpret  rxcode1,txcode1       'run a chuck of transmit code, then return

                        mov     t1,rxcnt1             'check if bit receive period done
                        sub     t1,cnt
                        cmps    t1,#0           wc
        if_nc           jmp     #:wait1

                        test    rxmask1,ina     wc    'receive bit on rx pin
                        rcr     rxdata1,#1
                        djnz    rxbits1,#:bit1

                        jmpret  rxcode1,txcode1       'run a chunk of transmit code, then return
                        shr     rxdata1,#32-9         'justify and trim received byte

                        wrbyte  rxdata1,rxbuff_head_ptr1 '7-22
                        add     rx_head1,#1
                        and     rx_head1,#$FF         '256 byte buffers
                        wrlong  rx_head1,rx_head_ptr1
                        mov     rxbuff_head_ptr1,rxbuff_ptr1 'calculate next byte head_ptr
                        add     rxbuff_head_ptr1,rx_head1
norts1                  rdlong  rx_tail1,rx_tail_ptr1    '7-22 or 8 will be patched to jmp #r3 if no rts
                        mov     t1,rx_head1
                        sub     t1,rx_tail1
                        and     t1,#$FF
                        cmps    t1,rtssize1     wc
rts1                    muxc    outa,rtsmask1

rec1i                   jmp     #receive1             'byte done, receive next byte
'
' Receive2
'
receive2                jmpret  rxcode2,txcode2       'run a chunk of transmit code, then return
                        
                        test    rxmask2,ina     wc
start2 if_c             jmp     #norts2               'go check rts if no start bit
        
                        mov     rxbits2,#9            'ready to receive byte
                        mov     rxcnt2,bit4_ticks2    '1/4 bits
                        add     rxcnt2,cnt                          

:bit2                   add     rxcnt2,bit_ticks2     '1 bit period
                        
:wait2                  jmpret  rxcode2,txcode2       'run a chuck of transmit code, then return

                        mov     t1,rxcnt2             'check if bit receive period done
                        sub     t1,cnt
                        cmps    t1,#0           wc
        if_nc           jmp     #:wait2

                        test    rxmask2,ina     wc    'receive bit on rx pin
                        rcr     rxdata2,#1
                        djnz    rxbits2,#:bit2

                        jmpret  rxcode2,txcode2       'run a chunk of transmit code, then return
                        shr     rxdata2,#32-9         'justify and trim received byte

                        wrbyte  rxdata2,rxbuff_head_ptr2 '7-22
                        add     rx_head2,#1
                        and     rx_head2,#$FF         '256 byte buffers
                        wrlong  rx_head2,rx_head_ptr2
                        mov     rxbuff_head_ptr2,rxbuff_ptr2 'calculate next byte head_ptr
                        add     rxbuff_head_ptr2,rx_head2
norts2                  rdlong  rx_tail2,rx_tail_ptr2    '7-22 or 8 will be patched to jmp #r3 if no rts
                        mov     t1,rx_head2
                        sub     t1,rx_tail2
                        and     t1,#$FF
                        cmps    t1,rtssize2     wc
rts2                    muxc    outa,rtsmask2

rec2i                   jmp     #receive2             'byte done, receive next byte
'
' Receive3
'
receive3                jmpret  rxcode3,txcode3       'run a chunk of transmit code, then return

                        test    rxmask3,ina     wc
start3 if_c             jmp     #norts3               'go check rts if no start bit

                        mov     rxbits3,#9            'ready to receive byte
                        mov     rxcnt3,bit4_ticks3    '1/4 bits
                        add     rxcnt3,cnt                          

:bit3                   add     rxcnt3,bit_ticks3     '1 bit period
                        
:wait3                  jmpret  rxcode3,txcode3       'run a chuck of transmit code, then return

                        mov     t1,rxcnt3             'check if bit receive period done
                        sub     t1,cnt
                        cmps    t1,#0           wc
        if_nc           jmp     #:wait3

                        test    rxmask3,ina     wc    'receive bit on rx pin
                        rcr     rxdata3,#1
                        djnz    rxbits3,#:bit3

                        jmpret  rxcode3,txcode3       'run a chunk of transmit code, then return
                        shr     rxdata3,#32-9         'justify and trim received byte

                        wrbyte  rxdata3,rxbuff_head_ptr3 '7-22
                        add     rx_head3,#1
                        and     rx_head3,#$FF         '256 byte buffers
                        wrlong  rx_head3,rx_head_ptr3    '8
                        mov     rxbuff_head_ptr3,rxbuff_ptr3 'calculate next byte head_ptr
                        add     rxbuff_head_ptr3,rx_head3
norts3                  rdlong  rx_tail3,rx_tail_ptr3    '7-22 or 8, may be patched to jmp #r3 if no rts
                        mov     t1,rx_head3
                        sub     t1,rx_tail3
                        and     t1,#$FF
                        cmps    t1,rtssize3     wc    'is buffer more that 3/4 full?
rts3                    muxc    outa,rtsmask3

rec3i                   jmp     #receive3             'byte done, receive next byte
'
' Transmit
'
transmit                jmpret  txcode,rxcode1        'run a chunk of receive code, then return
                                                      'patched to a jmp if pin not used                        
                        
txcts0                  test    ctsmask,ina     wc    'if flow-controlled dont send
                        rdlong  t1,tx_head_ptr        '{7-22} - head[0]
                        cmp     t1,tx_tail      wz    'tail[0]
ctsi0   if_z            jmp     #transmit             'may be patched to if_z_or_c or if_z_or_nc

                        rdbyte  txdata,txbuff_tail_ptr '{8}
                        add     tx_tail,#1
                        and     tx_tail,#$FF    wz     '256 byte buffer
                        wrlong  tx_tail,tx_tail_ptr    '{8}  
        if_z            mov     txbuff_tail_ptr,txbuff_ptr 'reset tail_ptr if we wrapped
        if_nz           add     txbuff_tail_ptr,#1    'otherwise add 1
                        
                        jmpret  txcode,rxcode1

                        shl     txdata,#2
                        or      txdata,txbitor        'ready byte to transmit
                        mov     txbits,#11
                        mov     txcnt,cnt

txbit                   shr     txdata,#1       wc
txout0                  muxc    outa,txmask           'maybe patched to muxnc dira,txmask
                        add     txcnt,bit_ticks       'ready next cnt

:wait                   jmpret  txcode,rxcode1        'run a chunk of receive code, then return

                        mov     t1,txcnt              'check if bit transmit period done
                        sub     t1,cnt
                        cmps    t1,#0           wc
        if_nc           jmp     #:wait

                        djnz    txbits,#txbit         'another bit to transmit?
txjmp0                  jmp     ctsi0                 'byte done, transmit next byte
'
' Transmit1
'
transmit1               jmpret  txcode1,rxcode2       'run a chunk of receive code, then return
                        
txcts1                  test    ctsmask1,ina    wc    'if flow-controlled dont send
                        rdlong  t1,tx_head_ptr1
                        cmp     t1,tx_tail1     wz
ctsi1   if_z            jmp     #transmit1            'may be patched to if_z_or_c or if_z_or_nc

                        rdbyte  txdata1,txbuff_tail_ptr1
                        add     tx_tail1,#1
                        and     tx_tail1,#$FF   wz    '256 byte buffer
                        wrlong  tx_tail1,tx_tail_ptr1
        if_z            mov     txbuff_tail_ptr1,txbuff_ptr1 'reset tail_ptr if we wrapped
        if_nz           add     txbuff_tail_ptr1,#1   'otherwise add 1

                        jmpret  txcode1,rxcode2       'run a chunk of receive code, then return
                        
                        shl     txdata1,#2
                        or      txdata1,txbitor       'ready byte to transmit
                        mov     txbits1,#11
                        mov     txcnt1,cnt

txbit1                  shr     txdata1,#1      wc
txout1                  muxc    outa,txmask1          'maybe patched to muxnc dira,txmask
                        add     txcnt1,bit_ticks1     'ready next cnt

:wait1                  jmpret  txcode1,rxcode2       'run a chunk of receive code, then return

                        mov     t1,txcnt1             'check if bit transmit period done
                        sub     t1,cnt
                        cmps    t1,#0           wc
        if_nc           jmp     #:wait1

                        djnz    txbits1,#txbit1       'another bit to transmit?
txjmp1                  jmp     ctsi1                 'byte done, transmit next byte
'
' Transmit2
'
transmit2               jmpret  txcode2,rxcode3       'run a chunk of receive code, then return
                        
txcts2                  test    ctsmask2,ina    wc    'if flow-controlled dont send
                        rdlong  t1,tx_head_ptr2
                        cmp     t1,tx_tail2     wz
ctsi2   if_z            jmp     #transmit2            'may be patched to if_z_or_c or if_z_or_nc

                        rdbyte  txdata2,txbuff_tail_ptr2
                        add     tx_tail2,#1
                        and     tx_tail2,#$FF   wz    '256 byte buffer
                        wrlong  tx_tail2,tx_tail_ptr2
        if_z            mov     txbuff_tail_ptr2,txbuff_ptr2 'reset tail_ptr if we wrapped
        if_nz           add     txbuff_tail_ptr2,#1   'otherwise add 1

                        jmpret  txcode2,rxcode3

                        shl     txdata2,#2
                        or      txdata2,txbitor       'ready byte to transmit
                        mov     txbits2,#11
                        mov     txcnt2,cnt

txbit2                  shr     txdata2,#1      wc
txout2                  muxc    outa,txmask2          'maybe patched to muxnc dira,txmask
                        add     txcnt2,bit_ticks2     'ready next cnt

:wait2                  jmpret  txcode2,rxcode3       'run a chunk of receive code, then return

                        mov     t1,txcnt2             'check if bit transmit period done
                        sub     t1,cnt
                        cmps    t1,#0           wc
        if_nc           jmp     #:wait2

                        djnz    txbits2,#txbit2       'another bit to transmit?
txjmp2                  jmp     ctsi2                 'byte done, transmit next byte
'
' Transmit3
'
transmit3               jmpret  txcode3,rxcode        'run a chunk of receive code, then return
                        
txcts3                  test    ctsmask3,ina    wc    'if flow-controlled dont send
                        rdlong  t1,tx_head_ptr3
                        cmp     t1,tx_tail3     wz
ctsi3   if_z            jmp     #transmit3            'may be patched to if_z_or_c or if_z_or_nc

                        rdbyte  txdata3,txbuff_tail_ptr3
                        add     tx_tail3,#1
                        and     tx_tail3,#$FF   wz    '256 byte buffer
                        wrlong  tx_tail3,tx_tail_ptr3
        if_z            mov     txbuff_tail_ptr3,txbuff_ptr3 'reset tail_ptr if we wrapped
        if_nz           add     txbuff_tail_ptr3,#1   'otherwise add 1

                        jmpret  txcode3,rxcode

                        shl     txdata3,#2
                        or      txdata3,txbitor       'ready byte to transmit
                        mov     txbits3,#11
                        mov     txcnt3,cnt

txbit3                  shr     txdata3,#1      wc
txout3                  muxc    outa,txmask3          'maybe patched to muxnc dira,txmask
                        add     txcnt3,bit_ticks3     'ready next cnt

:wait3                  jmpret  txcode3,rxcode        'run a chunk of receive code, then return

                        mov     t1,txcnt3             'check if bit transmit period done
                        sub     t1,cnt
                        cmps    t1,#0           wc
        if_nc           jmp     #:wait3

                        djnz    txbits3,#txbit3       'another bit to transmit?
txjmp3                  jmp     ctsi3                 'byte done, transmit next byte
'
'These are used by SPIN and assembler, using DAT rather than VAR
'so all COGs share this instance of the object
'
startfill
  cog                   long      0                   'cog flag/id

  'Dont Change the order of any of these initialized variables without modifying
  'the code to match - both spin and assembler
  'Dont make any of the initialized variables, uninitialized, only the initialized
  'variables are duplicated in hub memory
  rx_head               long      0                   '16 longs for circular buffer head/tails
  rx_head1              long      0                           
  rx_head2              long      0
  rx_head3              long      0
  rx_tail               long      0
  rx_tail1              long      0 
  rx_tail2              long      0 
  rx_tail3              long      0 
  tx_head               long      0
  tx_head1              long      0
  tx_head2              long      0
  tx_head3              long      0
  tx_tail               long      0
  tx_tail1              long      0
  tx_tail2              long      0
  tx_tail3              long      0

  'This set of variables were initialized to the correct values in Spin and loaded into this cog
  'when it started
  rxmask                long      0                   '33 longs for per port info
  rxmask1               long      0
  rxmask2               long      0
  rxmask3               long      0
  txmask                long      0
  txmask1               long      0
  txmask2               long      0
  txmask3               long      0
  ctsmask               long      0
  ctsmask1              long      0
  ctsmask2              long      0
  ctsmask3              long      0
  rtsmask               long      0
  rtsmask1              long      0
  rtsmask2              long      0
  rtsmask3              long      0
  rxtx_mode             long      0
  rxtx_mode1            long      0
  rxtx_mode2            long      0
  rxtx_mode3            long      0
  bit4_ticks            long      0
  bit4_ticks1           long      0
  bit4_ticks2           long      0
  bit4_ticks3           long      0
  bit_ticks             long      0
  bit_ticks1            long      0
  bit_ticks2            long      0
  bit_ticks3            long      0
  rtssize               long      0
  rtssize1              long      0
  rtssize2              long      0
  rtssize3              long      0
  rxchar                byte      0
  rxchar1               byte      0
  rxchar2               byte      0
  rxchar3               byte      0
  
  'This set of variables were initialized to the correct values in Spin and loaded into this cog
  'when it started. They contain the hub memory address of the rx/txbuffers
  rxbuff_ptr            long      0                   '32 longs for per port buffer hub ptr
  rxbuff_ptr1           long      0
  rxbuff_ptr2           long      0
  rxbuff_ptr3           long      0
  txbuff_ptr            long      0
  txbuff_ptr1           long      0
  txbuff_ptr2           long      0
  txbuff_ptr3           long      0
  rxbuff_head_ptr       long      0
  rxbuff_head_ptr1      long      0
  rxbuff_head_ptr2      long      0
  rxbuff_head_ptr3      long      0
  txbuff_tail_ptr       long      0
  txbuff_tail_ptr1      long      0
  txbuff_tail_ptr2      long      0
  txbuff_tail_ptr3      long      0

  rx_head_ptr           long      0
  rx_head_ptr1          long      0
  rx_head_ptr2          long      0
  rx_head_ptr3          long      0
  rx_tail_ptr           long      0
  rx_tail_ptr1          long      0
  rx_tail_ptr2          long      0
  rx_tail_ptr3          long      0
  tx_head_ptr           long      0
  tx_head_ptr1          long      0
  tx_head_ptr2          long      0
  tx_head_ptr3          long      0
  tx_tail_ptr           long      0
  tx_tail_ptr1          long      0
  tx_tail_ptr2          long      0
  tx_tail_ptr3          long      0
endfill       'used to calculate size of variables for longfill with 0
'
  rxdata                long      0
  rxbits                long      0
  rxcnt                 long      0
  rxdata1               long      0
  rxbits1               long      0
  rxcnt1                long      0
  rxdata2               long      0
  rxbits2               long      0
  rxcnt2                long      0
  rxdata3               long      0
  rxbits3               long      0
  rxcnt3                long      0
  t1                    long      0
                        long      0
                        long      0
                        long      0                   ' 16
'
  txdata                long      0
  txbits                long      0
  txcnt                 long      0
  txdata1               long      0
  txbits1               long      0
  txcnt1                long      0
  txdata2               long      0
  txbits2               long      0
  txcnt2                long      0
  txdata3               long      0
  txbits3               long      0
  txcnt3                long      0
                        long      0
                        long      0
                        long      0
                        long      0                   ' 16
'
'values to patch the code
  doifc2ifnc            long      $003c0000           'patch condition if_c to if_nc using xor
  doif_z_or_c           long      $00380000           'patch condition if_z to if_z_or_c using or
  doif_z_or_nc          long      $002c0000           'patch condition if_z to if_z_or_nc using or
  domuxnc               long      $04000000           'patch muxc to muxnc using or
'
  txbitor               long      $0401               'bits to or for transmitting

'If you want multiple copys of this driver in a project, then copy the file to multiple files and change
'version in each to be unique
  version               long      1
'
        FIT
{{
                            TERMS OF USE: MIT License 

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
}}

