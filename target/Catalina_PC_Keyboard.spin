''********************************
''*  PC- Keyboard Driver v0.3.0  *
''********************************
'' Replaces Keyboard.spin if you wish to use the PCs Keyboard instead of a PS2 Keyboard.
'' Needs PropTerminal.exe on PC to send keystrokes over the (USB-)serial link.
'  made by Andy Schenk

'' modified for Catalina by the removal of VAR space and unused SPIN methods -
'' data block and buffer data must be provided by a higher level object 

'' RR20120403 specify rxbuffersize (in bytes; must be binary eg 16/32/64/128/256 bytes)
CON
  RXINVERSE = 0


  kb_rxbuffersize = 32                     ' rx buffer size(bytes): binary! 16/32/64/128/256
  kb_rxtailmask = kb_rxbuffersize -1       ' mask bits eg $F/1F/3F/7F/FF

  kb_count = 6 + (kb_rxbuffersize/4)       ' 10+ contiguous longs

  rx_head = 0
  rx_tail = 1
  rx_pin = 2
  rx_mode = 3
  rx_ticks = 4
  rx_bufptr = 5                  
  rx_buffer = 6
  

{{ 
VAR

  long  rx_head                 '6 contiguous longs
  long  rx_tail
  long  rx_pin
  long  rx_mode
  long  bit_ticks
  long  buffer_ptr
                     
  byte  rx_buffer[kb_rxbuffersize] 'receive buffer

}}

OBJ
  Common : "Catalina_Common"
  
PUB start(kb_block, basepin, baudrate) : okay

'' Start the keyboard driver (starts a cog for SerialReceive here)
'' returns false if no cog available
''
  longfill(kb_block, 0, kb_count)
  long[kb_block][rx_pin]    := basepin
  long[kb_block][rx_mode]   := RXINVERSE
  long[kb_block][rx_ticks]  := Common#CLOCKFREQ / baudrate
  long[kb_block][rx_bufptr] := kb_block + rx_buffer*4 
  okay := cognew(@entry, kb_block) + 1


DAT

'***********************************
'* Assembly language serial driver *
'***********************************

                        org     0
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
'                       and     t2,#$0F
                        and     t2,#kb_rxtailmask     'RR20120403 mask bits to wrap head
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
  
