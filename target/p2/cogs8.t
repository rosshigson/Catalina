{{
'' +--------------------------------------------------------------------------+
'' | Cluso's mpx_multiportserialdriver for P2                           v0.20 |
'' +--------------------------------------------------------------------------+
'' | Author(s):        (c) 2020-2021 Ray Rodrick         (Cluso99)            |
'' | Acknowledgements: Jon Mcphalen (jonnymac) for his jm_fullduplexseria     |
'' | License:          MIT License - See end of file for terms of use         |
'' +--------------------------------------------------------------------------+
'' RR20201117       commence
'' RR20210122 020   wkg & rename mpx_demo.spin2, mpx_fullduplexserial.spin2, mpx_multiportserialdriver.spin2
'' RR20210122 v020  first release
''
'' Modified by Ross Higson for use with Catalina
'' (simply by commenting out all Spin functions, except as noted below)
'' 
'' Version 5.9 - discard received characters if receive buffer is full
''

'' =================================================================================================
''   This driver supports up to 16 half-duplex (uni-directional) serial ports.
''   Each port may be a transmitter or a receiver which allows for up to 16 ports total, 
''     in any configuration of transmitters and receivers.
''   Each port uses a smartpin configured to be either a tx uart or a rx uart.
''   Each port has a buffer in hub of a size determined by the calling routine.
''   This driver mearly takes a character from the buffer (transmitter), 
''     or places a character into the buffer (receiver). No manipulation of the character takes place.
''   The calling routine is responsible for starting and stopping the relevant smartpins.
'' =================================================================================================


pub null()
'' This is not a top level object

PUB start(p_config) : cog
' This routine starts the driver cog and is called once the port_control & port_params are setup.
' The port_control may all be cleared in which case the driver will wait until the port_control is set
'   before the respective port_params are examined.
' p_config points to a hub address where the port_control and Port_params are located

  cog := coginit(COGEXEC_NEW, @uart_start, p_config) + 1        ' start uart cog (PTRA=p_config=@port_control)

}}

DAT { cog pasm driver code }

                org       0

uart_start      mov       p_params, ptra                        ' PTRA     = ptr to port_control (16 bytes)
                add       p_params, #16                         ' p_params = ptr to port_params  (up to 16*4 longs)

main_loop       setq      #4-1                                  ' get port_control from hub (all 16 bytes)
                rdlong    control, ptra                         ' ...

.port0          mov       portnum, #0                           ' set port[0]
                mov       control, control              wz      ' all ports 0-3 inactive?
    if_nz       call      #proc_active                          ' n: go process
.port4          mov       portnum, #4                           ' set port[4]
                mov       control, control+1            wz      ' all ports 4-7 inactive?
    if_nz       call      #proc_active                          ' n: go process
.port8          mov       portnum, #8                           ' set port[8]
                mov       control, control+2            wz      ' all ports 8-11 inactive?
    if_nz       call      #proc_active                          ' n: go process
.port12         mov       portnum, #12                          ' set port[12]
                mov       control, control+3            wz      ' all ports 12-15 inactive?
    if_nz       call      #proc_active                          ' n: go process
                jmp       #main_loop                            ' all done

' process active ports (try all 4 port subsets)
proc_active
.p0             testb     control, #7                   wc      ' port +0 active?
    if_c        call      #proc_this_port                       '
                add       portnum, #1                           ' port++
                shr       control, #8                           '
.p1             testb     control, #7                   wc      ' port +1 active?
    if_c        call      #proc_this_port                       '
                add       portnum, #1                           ' port++
                shr       control, #8                           '
.p2             testb     control, #7                   wc      ' port +2 active?
    if_c        call      #proc_this_port                       '
                add       portnum, #1                           ' port++
                shr       control, #8                           '
.p3             testb     control, #7                   wc      ' port +3 active?
    if_c        call      #proc_this_port                       '
                ret                                             ' done +0..+3

' process active port[n]
proc_this_port  mov       xpin, control                         ' set pin#
                testb     xpin, #6                      wc      ' t: 1=tx
                and       xpin, #$3F                            '
    if_c        jmp       #tx_serial                            ' j if tx

' recv serial...
rx_serial       testp     xpin                          wc      ' anything waiting?
    if_nc       ret                                             ' n: abort if nothing
' get port[n] params...
                mov       ptrb, portnum                         ' current port[n]  (0-15)
                shl       ptrb, #4                              ' *4*4 = offset to current port[n] params
                add       ptrb, p_params                        ' add base
                setq      #4-1                                  ' read...
                rdlong    p_head, ptrb                          ' ... current port[n] params (4 longs: head/tail/start/end)
' read serial...
                rdpin     chr, xpin                             ' chr := uart[rx]       (read char from uart)
                shr       chr, #24                              ' align lsb             (get into bottom 8-bits)
                wrbyte    chr, p_head                           ' rxbuf[head] := ch     (write char into buffer)
                add       p_head, #1                            ' p_head++
                cmp       p_head, p_tail                wz      ' buffer full?
    if_e        sub       p_head, #1                            ' y: do not increment p_head
    if_e        ret                                             ' y: just return
                cmp       p_head, p_end                 wz      ' end of buf?
    if_e        mov       p_head, p_start                       ' wrap
    _ret_       wrlong    p_head, ptrb[0]                       ' write head back to hub

' xmit serial...
tx_serial       rdpin     chr, xpin                     wc      ' check busy flag?
    if_c        ret                                             ' y: return if busy
' get port[n] params...
                mov       ptrb, portnum                         ' current port[n]  (0-15)
                shl       ptrb, #4                              ' *4*4 = offset to current port_params[n]
                add       ptrb, p_params                        ' add base
                setq      #4-1                                  ' read...
                rdlong    p_head, ptrb                          ' ... current port_params[n] (4 longs: head/tail/start/end)
' anything to xmit...
                cmp       p_head, p_tail                wz      ' byte(s) to tx?
    if_e        ret                                             ' n: return if nothing to xmit
' write serial...
                rdbyte    chr, p_tail                           ' chr := txbuf[tail]    (read char from buffer)
                wypin     chr, xpin                             ' uart[tx] := chr       (write char to uart)
                add       p_tail, #1                            ' p_tail++
                cmp       p_tail, p_end                 wz      ' end of buf?
    if_e        mov       p_tail, p_start                       ' wrap
    _ret_       wrlong    p_tail, ptrb[1]                       ' write tail back to hub

' --------------------------------------------------------------------------------------------------
control         res       4                                     '\ ptr to start of port_control (always 16 ports) %atpppppp where...
                                                                '/   a: 1 = port active; t: 1 = tx, 0 = rx; pppppp: = port pin
p_head          res       1                                     '\ current port_params[n]:  p_head  (pointers to hub addresses...)
p_tail          res       1                                     '|                          p_tail
p_start         res       1                                     '|                          p_start
p_end           res       1                                     '/                          p_end   (=last+1=p_start+bufsize)

p_params        res       1                                     ' ptr to start of port_params
portnum         res       1                                     ' current port no. 0-15
xpin            res       1                                     ' current port pin %atpppppp
chr             res       1                                     ' chr
' --------------------------------------------------------------------------------------------------
                fit       472

{{
dat
' --------------------------------------------------------------------------------------------------
' Main hub interface (allows up to 16 uni-directional ports)    ' defined in calling program !!!
port_control    byte      0[16]                                 '\ port_control (always 16 ports) %atpppppp where...
                                                                '|   a: 1 = port active; t: 1 = tx, 0 = rx; pppppp: = port pin
                                                                '|     eg:  byte  1<<7 | 0<<6 | 63  ' active, rx, P63
                                                                '|     eg:  byte  1<<7 | 1<<6 | 62  ' active, tx, P62
port_params     long      0[4*MAX_PORTS]                        '| port_params max (16 ports) of 4 longs...  (no need to fill/reserve unused ports)
                                                                '|   port[n]: (pointers to hub addresses...) p_head; p_tail; p_start; p_end
                                                                '|     eg:  long  @xbuf_n      ' p_head
                                                                '|     eg:  long  @xbuf_n      ' p_tail
                                                                '|     eg:  long  @xbuf_n      ' p_start
                                                                '/     eg:  long  @xbuf_n_end  ' p_end   (=last+1=p_start+bufsize)
' --------------------------------------------------------------------------------------------------
}}

dat  { license }                                                  
{{
+------------------------------------------------------------------------------------------------------------------------------+
|                                                   TERMS OF USE: MIT License                                                  |                                                            
+------------------------------------------------------------------------------------------------------------------------------+
|Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation    | 
|files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy,    |
|modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software|
|is furnished to do so, subject to the following conditions:                                                                   |
|                                                                                                                              |
|The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.|
|                                                                                                                              |
|THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE          |
|WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR         |
|COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,   |
|ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.                         |
+------------------------------------------------------------------------------------------------------------------------------+
}}
