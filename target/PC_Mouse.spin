''*****************************
''*  PC- Mouse Driver v0.2.0  *
''*****************************
'' Replaces Mouse.spin if you wish to use the PCs Mouse instead of a PS2 Mouse.
'' Needs PropTerminal.exe on PC to send mouseevents over the (USB-)serial link.
'  made by Andy Schenk

CON
  RXPIN       =  31           'customize if necessary
  BAUDRATE    =  115200
  RXINVERSE   =  0
  MSY_INVERS  =  1            'Mouse Y direction
 
VAR

  long  cog , ignor

  long  rx_head                 '6 contiguous longs  for SerialDriver
  long  rx_tail
  long  rx_pin
  long  rx_mode
  long  bit_ticks
  long  buffer_ptr
                     
  long  oldx, oldy, oldz        'must be followed by parameters (10 contiguous longs)

  long  par_x                   'absolute x     read-only       (7 contiguous longs)
  long  par_y                   'absolute y     read-only
  long  par_z                   'absolute z     read-only
  long  par_buttons             'button states  read-only
  long  par_present             'mouse present  read-only
  long  par_dpin                'data pin       write-only
  long  par_cpin                'clock pin      write-only
                                                        
  long  bx_min, by_min, bz_min  'min/max must be contiguous
  long  bx_max, by_max, bz_max
  long  bx_div, by_div, bz_div
  long  bx_acc, by_acc, bz_acc

  byte  rx_buffer[16]           'receive buffer (4 longs)


PUB start(dpin, cpin) : okay

'' Start mouse driver - (starts a cog for SerialReceive here)
'' returns false if no cog available
''
''   dpin  = data signal on PS/2 jack
''   cpin  = clock signal on PS/2 jack   both not used, only for compatibelity
''

  par_buttons := 0
  
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


PUB present : type

'' Check if mouse present - valid ~2s after start in real driver
'' returns mouse type:
''
''   always 1 = two-button or three-button mouse

  type := 1


PUB button(b) : state

'' Get the state of a particular button
'' returns t|f

  state := -(par_buttons >> b & 1)


PUB buttons : states

'' Get the states of all buttons
'' returns buttons:
''
''   bit2 = center/scrollwheel button  (not yet implemented)
''   bit1 = right button
''   bit0 = left button

  states := par_buttons & $0F


PUB abs_x : x

'' Get absolute-x

  x := par_x + (par_buttons>>5 & 1)


PUB abs_y : y

'' Get absolute-y

  y := par_y + (par_buttons>>4 & 1)
  if MSY_INVERS
    y := 230-y 


PUB abs_z : z

'' Get absolute-z (scrollwheel)

  z := par_z


PUB delta_reset

'' Reset deltas

  oldx := par_x
  oldy := par_y
  oldz := par_z


PUB delta_x : x | newx

'' Get delta-x

  newx := par_x
  x := newx - oldx
  oldx := newx


PUB delta_y : y | newy

'' Get delta-y

  newy := par_y
  y := newy - oldy
  oldy := newy
  if MSY_INVERS
    y := 0-y 


PUB delta_z : z | newz

'' Get delta-z (scrollwheel)

  newz := par_z
  z := newz - oldz
  oldz := newz


PUB bound_limits(xmin, ymin, zmin, xmax, ymax, zmax) | i

'' Set bounding limits

  longmove(@bx_min, @xmin, 6)           

  
PUB bound_scales(x_scale, y_scale, z_scale)

'' Set bounding scales (usually +/-1's, bigger values divide)

  longmove(@bx_div, @x_scale, 3)


PUB bound_preset(x, y, z) | i, d

'' Preset bound coordinates

  repeat i from 0 to 2
    d := ||bx_div[i]
    bx_acc[i] := (x[i] - bx_min[i]) * d + d >> 1

  
PUB bound_x : x

'' Get bound-x

  x := bound(0, delta_x)


PUB bound_y : y

'' Get bound-y

  y := bound(1, delta_y)


PUB bound_z : z

'' Get bound-z

  z := bound(2, delta_z)


PRI bound(i, delta) : b | d

  d := bx_div[i]
  b := bx_min[i] + (bx_acc[i] := bx_acc[i] + delta * (d < 0) | 1 #> 0 <# (bx_max[i] - bx_min[i] + 1) * ||d - 1) / ||d
     

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

                        add     t1,#6 << 2            'set par_y pointer
                        mov     pz,t1
                        mov     pb,t1
                        mov     cmd,#0                'mouse command
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

                        rdlong  t2,par                'save received byte and inc head
                        add     t2,rxbuff
                        wrbyte  rxdata,t2
                        sub     t2,rxbuff
                        add     t2,#1
                        and     t2,#$0F
                        wrlong  t2,par

                        cmp     pb,pz          wz     'mouse receiving?
        if_nz           jmp     #getMsPar
                        
                        cmp     rxdata,#5      wz     'new mouse Event?
        if_nz           jmp     #receive              'no: byte done, receive next byte

                        add     pb,#1 << 2            'start receiving  pointer to par_button
                        jmp     #receive
                        
getMsPar                cmp     pb,pz         wz,wc
        if_a            mov     cmd,rxdata
        if_a            and     cmd,#$80
        if_b            shl     rxdata,#1             'x,y *2
                        tjnz    cmd,#nomouse
                        wrlong  rxdata,pb             'write par
nomouse
        if_a            sub     pb,#4 << 2            'pointer from par_button to par_x
                        add     pb,#1 << 2            'pointer to next par until par_z
                        jmp     #receive
        
'
' Uninitialized data
'
t1                      res     1
t2                      res     1
pz                      res     1
pb                      res     1
cmd                     res     1

rxmode                  res     1
bitticks                res     1

rxmask                  res     1
rxbuff                  res     1
rxdata                  res     1
rxbits                  res     1
rxcnt                   res     1
rxcode                  res     1
  