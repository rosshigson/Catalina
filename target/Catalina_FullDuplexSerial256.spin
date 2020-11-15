''********************************************
''*  Full-Duplex Serial Driver v1.2          *
''*  Author: Chip Gracey, Jeff Martin        *
''*  Copyright (c) 2006-2009 Parallax, Inc.  *
''*  See end of file for terms of use.       *
''********************************************
''*
''******************************************************************
''*  Ross Higson 2012                                              *
''*                                                                *
''*                                                                *
''*  THIS IS A MODIFIED VERSION OF Catalina_FullDuplexSerial       *
''*  BASED ON RAY RODRICKS AMEMDMENTS TO ADD 256 BYTE RX & TX      *
''*  BUFFERS - IT IS NOT COMPATIBLE WITH THE ORIGINAL, OR WITH     *
''*  THE CATALINA 'TTY' VERSION -  THIS VERSION IS ENABLED BY      *
''*  BY THE SYMBOL "libtty256" BY LINKING WITH THE APPROPRIATE     *
''*  LIBRARY using '-ltty256' - FOR EXAMPLE:                       *
''*                                                                *
''*         catalina test_tty.c -lc -ltty256                       *
''*                                                                *
''*                                                                *
''******************************************************************

{-----------------REVISION HISTORY-----------------
 v1.2 - 5/7/2009 fixed bug in dec method causing largest negative value (-2,147,483,648) to be output as -0.
 v1.1 - 3/1/2006 first official release.
}

CON
  BUFFSIZE        = 1<<8                  ' must be a power of 2
  BUFFMASK        = BUFFSIZE - 1

  TTY_BUFFER_SIZE = 9*4+BUFFSIZE+BUFFSIZE ' buffer size (bytes) 

  ' Calculate offsets from rx_head

  OFFS_rx_head    = 0*4          
  OFFS_rx_tail    = 1*4          
  OFFS_tx_head    = 2*4          
  OFFS_tx_tail    = 3*4
  OFFS_rx_pin     = 4*4
  OFFS_tx_pin     = 5*6
  OFFS_rxtx_mode  = 6*4
  OFFS_bit_ticks  = 7*4
  OFFS_buffer_ptr = 8*4
  OFFS_rx_buffer  = 9*4 
  OFFS_tx_buffer  = 9*4 + BUFFSIZE

OBJ

  Common : "Catalina_Common"

VAR

  ' From C, these variables used only during initialization. 
  ' From Spin, these variables can be used as normal.
  long cog
  long TTY_BLOCK

PUB Setup
  ' Allocate a block of Hub memory for buffers
  TTY_BLOCK := long[Common#FREE_MEM] - TTY_BUFFER_SIZE
  long[Common#FREE_MEM] := TTY_BLOCK
  long[TTY_BLOCK+OFFS_buffer_ptr] := TTY_BLOCK+OFFS_rx_buffer
  ' Configure for default pins, mode and baud
  Configure(Common#SI_PIN, Common#SO_PIN, Common#SIO_COMM_MODE, Common#SIO_BAUD)

PUB Get_Block
  ' Return the allocated buffer block
  return TTY_BLOCK

PUB Configure(rxpin, txpin, mode, baudrate)
''
'' mode bit 0 = invert rx
'' mode bit 1 = invert tx
'' mode bit 2 = open-drain/source tx
'' mode bit 3 = ignore tx echo on rx
''
  long[TTY_BLOCK+OFFS_bit_ticks] := clkfreq / baudrate
  longmove(TTY_BLOCK+OFFS_rx_pin, @rxpin, 3)

PUB Start : okay

'' Start serial driver - starts a cog
'' returns false if no cog available

  longfill(TTY_BLOCK+OFFS_rx_head, 0, 4)
  cog := cognew(@entry, TTY_BLOCK)
  if cog => 0 
    Common.Register(cog, Common#LMM_TTY)
    ' We need to remember our base buffer address, so use our comms 
    ' block for this, since this plugin does not implement service
    ' requests - all interaction is via the Hub RAM memory buffers.
    Common.SendInitializationData(cog, TTY_BLOCK, 0)

  okay := cog + 1

'------------------------------------------------------------------------------
#ifdef TTY_SPIN

PUB stop

'' Stop serial driver - frees a cog

  if cog
    cogstop(cog~ - 1)
  longfill(TTY_BLOCK+OFFS_rx_head, 0, 9)


PUB rxflush

'' Flush receive buffer

  repeat while rxcheck => 0
  
    
PUB rxcheck : rxbyte

'' Check if byte received (never waits)
'' returns -1 if no byte received, $00..$FF if byte

  rxbyte--
  if long[TTY_BLOCK+OFFS_rx_tail] <> long[TTY_BLOCK+OFFS_rx_head]
    rxbyte := byte[long[TTY_BLOCK+OFFS_buffer_ptr]+long[TTY_BLOCK+OFFS_rx_tail]]
    long[TTY_BLOCK+OFFS_rx_tail] := (LONG[TTY_BLOCK+OFFS_rx_tail] + 1) & BUFFMASK


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

  repeat until (long[TTY_BLOCK+OFFS_tx_tail] <> (long[TTY_BLOCK+OFFS_tx_head] + 1) & BUFFMASK)
  byte[long[TTY_BLOCK+OFFS_buffer_ptr]+BUFFSIZE+long[TTY_BLOCK+OFFS_tx_head]] := txbyte
  long[TTY_BLOCK+OFFS_tx_head] := (long[TTY_BLOCK+OFFS_tx_head] + 1) & BUFFMASK

  if long[TTY_BLOCK+OFFS_rxtx_mode] & %1000
    rx


PUB str(stringptr)

'' Send string                    

  repeat strsize(stringptr)
    tx(byte[stringptr++])
    

PUB dec(value) | i, x

'' Print a decimal number

  x := value == NEGX                                                            'Check for max negative
  if value < 0
    value := ||(value+x)                                                        'If negative, make positive; adjust for max negative
    tx("-")                                                                     'and output sign

  i := 1_000_000_000                                                            'Initialize divisor

  repeat 10                                                                     'Loop for 10 digits
    if value => i                                                               
      tx(value / i + "0" + x*(i == 1))                                          'If non-zero digit, output digit; adjust for max negative
      value //= i                                                               'and digit from value
      result~~                                                                  'flag non-zero found
    elseif result or i == 1
      tx("0")                                                                   'If zero digit (or only digit) output it
    i /= 10                                                                     'Update divisor


PUB hex(value, digits)

'' Print a hexadecimal number

  value <<= (8 - digits) << 2
  repeat digits
    tx(lookupz((value <-= 4) & $F : "0".."9", "A".."F"))


PUB bin(value, digits)

'' Print a binary number

  value <<= 32 - digits
  repeat digits
    tx((value <-= 1) & 1 + "0")

#endif
'------------------------------------------------------------------------------

DAT

'***********************************
'* Assembly language serial driver *
'***********************************

                        org
'
'
' Entry
'
entry                   mov     t1,par                'get structure address
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
                        add     txbuff,#BUFFSIZE

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

                        rdlong  t2,par                'save received byte and inc head
                        add     t2,rxbuff
                        wrbyte  rxdata,t2
                        sub     t2,rxbuff
                        add     t2,#1
                        and     t2,#BUFFMASK
                        wrlong  t2,par

                        jmp     #receive              'byte done, receive next byte
'
'
' Transmit
'
transmit                jmpret  txcode,rxcode         'run a chunk of receive code, then return

                        mov     t1,par                'check for head <> tail
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
                        and     t3,#BUFFMASK
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
'
'
' Uninitialized data
'
t1                      res     1
t2                      res     1
t3                      res     1

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

