''********************************
''*  PC- Keyboard Driver v0.3.0  *
''********************************
'' Replaces Keyboard.spin if you wish to use the PCs Keyboard instead of a PS2 Keyboard.
'' Needs PropTerminal.exe on PC to send keystrokes over the (USB-)serial link.
'  made by Andy Schenk

CON
  RXPIN     = 31           'customize if necessary
  BAUDRATE  = 115200
  RXINVERSE = 0
 
VAR

  long  cog , skey, kstat

  long  rx_head                 '6 contiguous longs
  long  rx_tail
  long  rx_pin
  long  rx_mode
  long  bit_ticks
  long  buffer_ptr
                     
  byte  rx_buffer[16]           'receive buffer


PUB start(dpin, cpin) : okay

'' Start the keyboard driver (starts a cog for SerialReceive here)
'' returns false if no cog available
''
''   dpin  = not used here, only for compatibility
''   cpin  = not used here, only for compatibility
''
  okay := startx(dpin, cpin, %0_000_100, %01_01000)


PUB startx(dpin, cpin, locks, auto) : okay

'' Like start, but allows in real driver to specify lock settings and auto-repeat
''
  kstat := 0
  
  stop
  longfill(@rx_head, 0, 2)
  rx_pin := RXPIN
  rx_mode := RXINVERSE
  bit_ticks := clkfreq / BAUDRATE
  buffer_ptr := @rx_buffer
  okay := cog := cognew(@entry, @rx_head) + 1


PUB stop

'' Stop Keybord driver - frees a cog  (stops Serial driver here)

  if cog
    cogstop(cog~ - 1)
  longfill(@rx_head, 0, 6)


PUB present : truefalse

'' Check if keyboard present - valid ~2s after start in real driver
'' returns t|f  (always True here)

  truefalse := true


PUB key : keycode

'' Get key (never waits)
'' returns key (0 if buffer empty)
'  (lowest Level)

  skey := rxcheck
  if skey < 0
    keycode := 0
  else
    case skey
      $01: keycode := 0             'shift
           kstat |= $100
      $02: keycode := 0             'ctrl
           kstat |= $200
      3:   kstat &= !$100           'shift off
      4:   kstat &= !$200           'ctrl off
      $DB: keycode := $D9 + kstat   'F12->F10  fix problems with F10
      other:  keycode := skey + kstat
       

PUB getkey : keycode

'' Get next key (may wait for keypress)
'' returns key

  repeat until (keycode := key)


PUB newkey : keycode

'' Clear buffer and get new key (always waits for keypress)
'' returns key

  repeat while rxcheck => 0
  keycode := getkey


PUB gotkey : truefalse

'' Check if any key in buffer
'' returns t|f

  truefalse := rx_tail <> rx_head


PUB clearkeys

'' Clear key buffer

  repeat while rxcheck => 0


PUB keystate(k) : state

'' Get the state of a particular key
'' not supported returns false!

  state := FALSE


PRI rxcheck : rxbyte

' Check if byte received (never waits)
' returns -1 if no byte received, $00..$FF if byte

  rxbyte--
  if rx_tail <> rx_head
    rxbyte := rx_buffer[rx_tail]
    rx_tail := (rx_tail + 1) & $F


DAT

'***********************************
'* Assembly language serial driver *
'***********************************

                        org
'
' Entry
'
entry                   mov     t1,par                'get structure address
                        add     t1,#2 << 2            'skip past heads and tails

                        rdlong  t2,t1                 'get rx_pin
                        mov     rxmask,#1
                        shl     rxmask,t2

                        add     t1,#4                 'get rx_mode
                        rdlong  rxmode,t1

                        add     t1,#4                 'get bit_ticks
                        rdlong  bitticks,t1

                        add     t1,#4                 'get buffer_ptr
                        rdlong  rxbuff,t1
'
' Receive
'
receive                 test    rxmode,#%001    wz    'wait for start bit on rx pin
                        test    rxmask,ina      wc
        if_z_eq_c       jmp     #receive

                        mov     rxbits,#9             'ready to receive byte
                        mov     rxcnt,bitticks
                        shr     rxcnt,#1
                        add     rxcnt,cnt                          

:bit                    add     rxcnt,bitticks        'ready next bit period

:wait                   mov     t1,rxcnt              'check if bit receive period done
                        sub     t1,cnt
                        cmps    t1,#0           wc
        if_nc           jmp     #:wait

                        test    rxmask,ina      wc    'receive bit on rx pin
                        rcr     rxdata,#1
                        djnz    rxbits,#:bit

                        shr     rxdata,#32-9          'justify and trim received byte
                        and     rxdata,#$FF
                        test    rxmode,#%001    wz    'if rx inverted, invert byte
        if_nz           xor     rxdata,#$FF

                        cmp     mscnt,#0        wz     'mouse receiving?
        if_nz           jmp     #getMsPar
                        
                        cmp     rxdata,#5      wz     'new mouse Event?
        if_nz           jmp     #toRxBuff             'no: write in buffer

                        mov     mscnt,#4              '4 bytes to ignore
                        
getMsPar                sub     mscnt,#1              'ignore byte
                        jmp     #receive
        
toRxBuff                rdlong  t2,par                'save received byte and inc head
                        add     t2,rxbuff
                        wrbyte  rxdata,t2
                        sub     t2,rxbuff
                        add     t2,#1
                        and     t2,#$0F
                        wrlong  t2,par
                        jmp     #receive
'
' Initialized data
'
mscnt                   long    0
'
' Uninitialized data
'
t1                      res     1
t2                      res     1

rxmode                  res     1
bitticks                res     1

rxmask                  res     1
rxbuff                  res     1
rxdata                  res     1
rxbits                  res     1
rxcnt                   res     1
rxcode                  res     1
  