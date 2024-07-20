''********************************************
''*  Full-Duplex Serial Driver v1.2          *
''*  Author: Chip Gracey, Jeff Martin        *
''*  Copyright (c) 2006-2009 Parallax, Inc.  *
''*  See end of file for terms of use.       *
''********************************************

{-----------------REVISION HISTORY-----------------
 v1.2 - 5/7/2009 fixed bug in dec method causing largest negative value
                (-2,147,483,648) to be output as -0.
 v1.1 - 3/1/2006 first official release.
}

'
' Modified for use by Catalina by removal of VAR and replacement with
' an io_block passed in by a higher level object. Also, removal of
' unused SPIN methods.
'
' This driver is started as if it was a Catalina plugin - but for
' for speed reasons, it must be used by manipulating the shared
' io_block, which can be found using the SIO_Block function (if
' it is not already known).
'
'
' Version 3.11 - support preconfiguration when used as part of Catalyst
'                (this allows us to use pin definitons etc from the
'                Catalina_Common.spin file). When used this way, the
'                plugin can be simply started as pure PASM. To enable
'                this mode, compile with the symbol CATALYST defined.
'
CON
'
' this plugin type:
'
LMM_SIO    = Common#LMM_SIO
'
' size of io block in bytes:
'
BLOCK_SIZE = IO_COUNT * 4
'
' number of contiguous longs in io block:
'
IO_COUNT   = 17

'
' offset (longs) into io_block:
'
rx_head    = 0
rx_tail    = 1
tx_head    = 2
tx_tail    = 3
rx_pin     = 4
tx_pin     = 5
rxtx_mode  = 6
bit_ticks  = 7
buffer_ptr = 8
rx_buffer  = 9
tx_buffer  = 13
'
' commands that can be sent to the plugin
'
SIO_Init    = 1
SIO_Enable  = 2
SIO_Disable = 3
'
' SIO commands:
'
' The command to perform is encoded in the top 8 bits of the parameter
' The io block address is encoded in the bottom 24 bits. Note that
' service 2 (SIO_Enable) must be called to enable this plugin to use
' the I/O pins. Once initialized and enabled all other SIO functions
' are done via the io_block,

'name: SIO_Init - Initialize the driver (but don't start until enabled)
'code: 1
'type: short request
'data: i/o block address
'rslt: i/o block address
'
'name: SIO_Enable - enable the SIO plugin (start listening)
'code: 2
'type: short request
'data: (none)
'rslt: i/o block address
'
'name: SIO_Disable - disable the SIO plugin (stop listening)
'code: 3
'type: short request
'data: (none)
'rslt: i/o block address
'
{
VAR

  long  rx_head                 '9 contiguous longs
  long  rx_tail
  long  tx_head
  long  tx_tail
  long  rx_pin
  long  tx_pin
  long  rxtx_mode
  long  bit_ticks
  long  buffer_ptr
                     
  byte  rx_buffer[16]           'transmit and receive buffers
  byte  tx_buffer[16]  
}
CON
' include platform-specific constants
#include "Constants.inc"

OBJ
   Common : "Catalina_Common"

PUB Start(io_block, rxpin, txpin, mode, baudrate, enable) : cog

'' Start serial driver - starts a cog (returns false if no cog available)
''
'' Note that we accept rxpin and txpin rather than using the ones in
'' Catalina_Common - this is because if two cogs use this plugin to
'' communicate, one will have to reverse their rx/tx pins. Also, it
'' may be desirable to start several plugins on different pins -
'' although note that this requires invoking the plugin services via
'' the cog id instead of by plugin type (which is the usual method)
''
'' mode bit 0 = invert rx
'' mode bit 1 = invert tx
'' mode bit 2 = open-drain/source tx
'' mode bit 3 = ignore tx echo on rx

  longfill(io_block, 0, IO_COUNT)
  longmove(@long[io_block][rx_pin], @rxpin, 3)
  long[io_block][bit_ticks]  := Common#CLOCKFREQ / baudrate
  long[io_block][buffer_ptr] := @long[io_block][rx_buffer]

  cog := cognew(@entry, Common#REGISTRY)

  if (cog => 0)
  
    ' wait till the io plugin has registered
    repeat until long[Common#REGISTRY][cog] & $FF000000 <> 0

    ' initialize the io plugin with the io_block address to use
    common.SendInitializationDataAndWait(cog, SIO_Init<<24 + io_block, 0)

    if enable
      ' if requested, enable the plugin straight away
      common.SendInitializationData(cog, SIO_Enable<<24, 0)

  cog += 1

{
PUB rxflush

'' Flush receive buffer

  repeat while rxcheck => 0
  
    
PUB rxcheck : rxbyte

'' Check if byte received (never waits)
'' returns -1 if no byte received, $00..$FF if byte

  rxbyte--
  if rx_tail <> rx_head
    rxbyte := rx_buffer[rx_tail]
    rx_tail := (rx_tail + 1) & $F


PUB rxtime(ms) : rxbyte | t

'' Wait ms milliseconds for a byte to be received
'' returns -1 if no byte received, $00..$FF if byte

  t := cnt
  repeat until (rxbyte := rxcheck) => 0 or (cnt - t) / (clkfreq / 1000) > ms
  

PUB rx : rxbyte

'' Receive byte (may wait for byte)
'' returns $00..$FF

  repeat while (rxbyte := rxcheck) < 0


PUB tx(txbyte)

'' Send byte (may wait for room in buffer)

  repeat until (tx_tail <> (tx_head + 1) & $F)
  tx_buffer[tx_head] := txbyte
  tx_head := (tx_head + 1) & $F

  if rxtx_mode & %1000
    rx


PUB str(stringptr)

'' Send string                    

  repeat strsize(stringptr)
    tx(byte[stringptr++])
    
}
DAT

'***********************************
'* Assembly language serial driver *
'***********************************

                        org
'
'
' Entry
'
entry
                        cogid   t1                    ' get ...
                        shl     t1,#2                 ' ... our ...
                        add     t1,par                ' ... registry block entry
                        rdlong  rqstptr,t1            ' register ...
                        and     rqstptr,Low24         ' ... this ...
                        mov     t2,#LMM_SIO           ' ... plugin ...
                        shl     t2,#24                ' ... as the ...
                        or      t2,rqstptr            ' ... appropriate ...
                        wrlong  t2,t1                 ' ... type
                        mov     rsltptr,rqstptr       ' set up a pointer to ...
                        add     rsltptr,#4            ' ... our result address
#ifdef CATALYST
#ifdef MULTI_CPU_LOADER
                        mov     t1,rxmask             ' check we have ...
                        or      t1,txmask wz          ' ... non-zero pins
               if_nz    jmp     #enabled              ' yes - ready to go!
#endif
                        cogid   t1                    ' no - stop ...
                        cogstop t1                    ' ... this cog

#else

init
                        rdlong  t1,rqstptr wz         ' wait ...
              if_z      jmp     #init                 ' ... for ... 
                        mov     t2,t1                 ' ... plugin ...
                        shr     t2,#24                ' ... to ...
                        cmp     t2,#SIO_Init wz       ' ... be ...
              if_nz     jmp     #init                 ' ... initialized
#endif

reinit              
                        and     t1,low24              ' save ...
                        mov     pblkaddr,t1           ' ... parameter block address 
              
                        add     t1,#4 << 2            'skip past heads and tails

                        rdlong  t2,t1                 'get rx_pin
                        mov     rxmask,#1
                        shl     rxmask,t2

                        add     t1,#4                 'get tx_pin
                        rdlong  t2,t1
                        mov     txmask,#1
                        shl     txmask,t2

                        add     t1,#4                 'get rxtx_mode
                        rdlong  rxtxmode,t1

                        add     t1,#4                 'get bit_ticks
                        rdlong  bitticks,t1

                        add     t1,#4                 'get buffer_ptr
                        rdlong  rxbuff,t1
                        mov     txbuff,rxbuff
                        add     txbuff,#16

                        mov     t1,#0                 ' request ...
                        wrlong  t1,rqstptr            ' ... done            
disabled
                        rdlong  t1,rqstptr wz         ' wait ...
              if_z      jmp     #disabled             ' ... for ... 
                        mov     t2,t1                 ' ... plugin ...
                        shr     t2,#24                ' ... to ...
                        cmp     t2,#SIO_Init          ' ... be ...
              if_z      jmp     #reinit               ' ... initialized ...
                        cmp     t2,#SIO_Enable wz     ' ... or ...
              if_nz     jmp     #disabled             ' ... enabled
                        mov     t2,pblkaddr           ' result of enable request is ...
                        wrlong  t2,rsltptr            ' ... parameter block address            
                        mov     t2,#0                 ' request ...
                        wrlong  t2,rqstptr            ' ... done
enabled                        
                        test    rxtxmode,#%100  wz    'init tx pin according to mode
                        test    rxtxmode,#%010  wc
        if_z_ne_c       or      outa,txmask
        if_z            or      dira,txmask

                        mov     txcode,#transmit      'initialize ping-pong multitasking
'
'
' Receive
'
receive                 jmpret  rxcode,txcode         'run a chunk of transmit code, then return

                        test    rxtxmode,#%001  wz    'wait for start bit on rx pin
                        test    rxmask,ina      wc
        if_z_eq_c       jmp     #receive

                        mov     rxbits,#9             'ready to receive byte
                        mov     rxcnt,bitticks
                        shr     rxcnt,#1
                        add     rxcnt,cnt                          

:bit                    add     rxcnt,bitticks        'ready next bit period

:wait                   jmpret  rxcode,txcode         'run a chuck of transmit code, then return

                        mov     t1,rxcnt              'check if bit receive period done
                        sub     t1,cnt
                        cmps    t1,#0           wc
        if_nc           jmp     #:wait

                        test    rxmask,ina      wc    'receive bit on rx pin
                        rcr     rxdata,#1
                        djnz    rxbits,#:bit

                        shr     rxdata,#32-9          'justify and trim received byte
                        and     rxdata,#$FF
                        test    rxtxmode,#%001  wz    'if rx inverted, invert byte
        if_nz           xor     rxdata,#$FF

                        rdlong  t2,pblkaddr           'save received byte and inc head
                        add     t2,rxbuff
                        wrbyte  rxdata,t2
                        sub     t2,rxbuff
                        add     t2,#1
                        and     t2,#$0F
                        wrlong  t2,pblkaddr
'
' Service requests - except for init requests, the result is always the same (note that
' executing this code after receiving each byte may slow down the maximum baud rate that
' this plugin can use!)
'
                        rdlong  t1,rqstptr wz         ' any requests?
        if_z            jmp     #receive              ' no - just keep receiving
                        mov     t2,t1                 ' yes - get ... 
                        shr     t2,#24                ' ... command
                        cmp     t2,#SIO_Init wz       ' init request?
        if_z            jmp     #reinit               ' yes - completely re-initialize
                        cmp     t2,#SIO_Disable wz    ' no - disable request?
        if_z            andn    dira,txmask           ' yes - disable tx ...
        if_z            jmp     #disabled             ' ... and wait for enable or init
                        mov     t2,pblkaddr           ' no - result of any other request is ...
                        wrlong  t2,rsltptr            ' ... parameter block address            
                        mov     t2,#0                 ' request ...
                        wrlong  t2,rqstptr            ' ... done

                        jmp     #receive              ' receive next byte
'
'
' Transmit
'
transmit                jmpret  txcode,rxcode         'run a chunk of receive code, then return

                        mov     t1,pblkaddr           'check for head <> tail
                        add     t1,#2 << 2
                        rdlong  t2,t1
                        add     t1,#1 << 2
                        rdlong  t3,t1
                        cmp     t2,t3           wz
        if_z            jmp     #transmit

                        add     t3,txbuff             'get byte and inc tail
                        rdbyte  txdata,t3
                        sub     t3,txbuff
                        add     t3,#1
                        and     t3,#$0F
                        wrlong  t3,t1

                        or      txdata,#$100          'ready byte to transmit
                        shl     txdata,#2
                        or      txdata,#1
                        mov     txbits,#11
                        mov     txcnt,cnt

:bit                    test    rxtxmode,#%100  wz    'output bit on tx pin according to mode
                        test    rxtxmode,#%010  wc
        if_z_and_c      xor     txdata,#1
                        shr     txdata,#1       wc
        if_z            muxc    outa,txmask        
        if_nz           muxnc   dira,txmask
                        add     txcnt,bitticks        'ready next cnt

:wait                   jmpret  txcode,rxcode         'run a chunk of receive code, then return

                        mov     t1,txcnt              'check if bit transmit period done
                        sub     t1,cnt
                        cmps    t1,#0           wc
        if_nc           jmp     #:wait

                        djnz    txbits,#:bit          'another bit to transmit?

                        jmp     #transmit             'byte done, transmit next byte

'-------------------------------------------------------------------------------
'
' Initialized data
'
Low24                   long    $00FFFFFF
'
#ifdef CATALYST
'
' Catalyst preconfigures this plugin so it does not need to be explicitly
' initialized or enabled, it can just be started as a pure PASM program
'
t1                      long    0
t2                      long    0
t3                      long    0

pblkaddr                long    Common#FLIST_SIOB
rqstptr                 long    0
rsltptr                 long    0

rxtxmode                long    Common#SIO_LOAD_MODE
bitticks                long    Common#CLOCKFREQ/Common#SIO_BAUD

rxmask                  long    |< Common#RX_PIN
rxbuff                  long    Common#FLIST_SIOB + (rx_buffer * 4) 
rxdata                  long    0
rxbits                  long    0
rxcnt                   long    0
rxcode                  long    0

txmask                  long    |< Common#TX_PIN
txbuff                  long    Common#FLIST_SIOB + (tx_buffer * 4)
txdata                  long    0
txbits                  long    0
txcnt                   long    0
txcode                  long    0

#else

'
' Uninitialized data
'
t1                      res     1
t2                      res     1
t3                      res     1

pblkaddr                res     1
rqstptr                 res     1
rsltptr                 res     1

rxtxmode                res     1
bitticks                res     1

rxmask                  res     1
rxbuff                  res     1
rxdata                  res     1
rxbits                  res     1
rxcnt                   res     1
rxcode                  res     1

txmask                  res     1
txbuff                  res     1
txdata                  res     1
txbits                  res     1
txcnt                   res     1
txcode                  res     1

#endif

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

