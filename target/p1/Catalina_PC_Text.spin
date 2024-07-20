''*****************************
''*  PC Text 40x13 v0.2       *
''*****************************
'' Replaces TV_Text.spin if you wish to use the PCs as Monitor instead of a TV.
'' Needs PropTerminal.exe on PC to receive the characters over the (USB-)serial link.
'  made by Andy Schenk

'' modified for Catalina by the removal of VAR space and unused SPIN methods -
'' data block and buffer data must be provided by a higher level object 
 
CON
  BUFFSIZE   = 512          ' buffer must be 512 bytes

  STARTDELAY = 0            'seconds (0=Off)

  cols = 40
  rows = 13                 

  tv_count   = 5            ' size of data block (contiguous longs)

  tx_head   = 0             ' data block offset
  tx_tail   = 1             '        "
  tx_pin    = 2             '        "
  tx_ticks  = 3             '        "
  tx_buffer = 4             '        "
                             
{                            
VAR

  long  tx_head                  '5 contiguous longs  for SerialDriver
  long  tx_tail
  long  tx_pin
  long  bit_ticks
  long  buffer_ptr
                     
  byte  tx_buffer[512]           'txbuffer  
}

OBJ
  Common : "Catalina_Common"
  
PUB start(tv_block, basepin, baudrate, buffer) : okay

'' Start terminal - starts a cog
'' returns false if no cog available
                                             
  longfill(tv_block, 0, tv_count)
  long[tv_block][tx_pin] := basepin
  long[tv_block][tx_ticks]:= Common#CLOCKFREQ / baudrate
  long[tv_block][tx_buffer] := buffer
  
  okay := cognew(@entry, tv_block) + 1 

DAT

'***********************************
'* Assembly language serial driver *
'***********************************

                        org     0
'
'
' Entry
'
entry                   mov     t1,par                'get structure address
                        add     t1,#2 << 2            'skip past heads and tails

                        rdlong  t2,t1                 'get tx_pin
                        mov     txmask,#1
                        shl     txmask,t2 
                        or      outa,txmask           'idle = 1  
                        or      dira,txmask           'Pin30 = output

                        add     t1,#4                 'get bit_ticks
                        rdlong  bittime,t1

                        add     t1,#4                 'get buffer_ptr
                        rdlong  txbuff,t1

transmit                mov     t1,par                'check for head <> tail
                        rdlong  t2,t1
                        add     t1,#1 << 2
                        rdlong  t3,t1
                        cmp     t2,t3           wz
        if_z            jmp     #transmit

sendloop                add     t3,txbuff             'get byte and inc tail
                        rdbyte  txdata,t3
                        sub     t3,txbuff
                        add     t3,#1
                        and     t3,#$1FF
                        wrlong  t3,t1
                        
                        mov     txcnt,#10
                        or      txdata,#$100          'add stoppbit
                        shl     txdata,#1             'add startbit
                        mov     dtime,cnt
                        add     dtime,bittime

sendbit                 shr     txdata,#1    wc       'test LSB
                        mov     t2,outa
              if_nc     andn    t2,txmask             'bit=0  or
              if_c      or      t2,txmask             'bit=1
                        mov     outa,t2
                        waitcnt dtime,bittime         'wait 1 bit
                        djnz    txcnt,#sendbit        '10 times
               
                        waitcnt dtime,bittime         '2 stopbits

                        jmp     #transmit             'done,wait for next

'
' Uninitialized data
'
t1                      res     1
t2                      res     1
t3                      res     1
dtime                   res     1
bittime                 res     1
txmask                  res     1
txdata                  res     1
txcnt                   res     1
txbuff                  res     1
