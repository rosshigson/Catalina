{
'------------------------ XMM EEPROM Support Routines --------------------------
'
' This file contains API functions for using EEPROM as XMM. The EEPROM must 
' be larger than 32k to be used for XMM (note that a 64k EEPROM is better 
' used as CMM or LMM, which can be done using just the EEPROM loader). 
' 
' Contains code based on PASM I2C Driver  Version 1.0
' Copyright (c) 2010 Dave Hein
' June 6, 2010
' See end of file for terms of use
'
}
'=============================== CACHE CHECK ===================================
'
#ifndef CACHED
#error : USING EEPROM AS XMM REQUIRES CACHE OPTION (CACHED_1K .. CACHED_8K or CACHED)
#endif
'
'=============================== FLASH CHECK ===================================
'
#ifdef NEED_FLASH
#error : FLASH NOT SUPPORTED WHEN USING EEPROM AS XMM
#endif
'
'=============================== LARGE CHECK ===================================
'
#ifdef LARGE
#error : LARGE MEMORY MODEL NOT SUPPORTED WHEN USING EEPROM AS XMM
#endif
'
'=========================== MINIMAL API FUNCTIONS =============================
'
CON
   ACK           = 0            ' I2C Acknowledge
   NAK           = 1            ' I2C No Acknowledge
   Xmit          = 0            ' I2C Direction Transmit
   Recv          = 1            ' I2C Direction Receive

   CMD_START     = 1            ' Issue a start bit
   CMD_STOP      = 2            ' Issue a stop bit
   CMD_READ      = 3            ' Transmit a byte to the I2C bus
   CMD_INIT      = 5            ' Initialize the I2C bus
   CMD_READPAGE  = 6            ' Read one or more bytes in the page mode
   
   DELAY_CYCLES  = 52           ' I2C Delay time.  Must be between 12 and 511

DAT
'
' XMM_Activate : Activate the XMM bus.
' On entry:
'    None.
' On exit:
'    None.
'
XMM_Activate
              call #InitializeFunc
XMM_Activate_ret
              ret
'
'
'XMM_Tristate : Give up the XMM bus. Use this to use other hardware that 
'               shares pins with the XMM RAM. To reactivate the XMM bus, 
'               call XMM_Activate. If the platform has only FLASH, this
'               should be the same as XMM_FlashTristate
' On entry:
'    None.
' On exit:
'    None.
'            
XMM_Tristate
              nop                               ' <== INSERT CODE HERE
XMM_Tristate_ret
              ret
'
#ifdef NEED_XMM_WRITEPAGE
'
' XMM_WritePage : Write (program) bytes from Hub RAM to XMM RAM. Note that
'                 we can only read and write LONGs, so the Hub address should
'                 be long aligned, and the Len should be a multiple of 4.
' On entry:
'    XMM_Addr  (32-bit): destination address in Flash
'    Hub_Addr  (32-bit): source address in main memory
'    XMM_Len   (32-bit): number of bytes to write 
' On exit:
'    XMM_Addr incremented by the number of bytes written
'
XMM_WritePage
              nop                               ' <== INSERT CODE HERE
XMM_WritePage_ret
              ret
'
#endif
'
#ifdef NEED_XMM_READPAGE
'
' XMM_ReadPage : Read bytes from XMM RAM to Hub RAM. Note that we can only 
'                read and write LONGs, so the Hub address should be long 
'                aligned, and the Len should be a multiple of 4.
' On Entry: 
'    XMM_Addr  (32-bit): source address in Flash
'    Hub_Addr  (32-bit): destination address in main memory
'    XMM_Len   (32-bit): number of bytes to read 
' On exit:
'    XMM_Addr incremented by the number of bytes read
'
XMM_ReadPage
              mov     addrreg1, XMM_Addr
              add     addrreg1, image_addr
              mov     dataptr1, Hub_Addr
              mov     count2, XMM_Len
              mov     lt1, addrreg1
              shr     lt1, #15
              and     lt1, #%1110
              mov     devsel1, i2c_dev
              or      devsel1, lt1
              call    #startfunc
              mov     parm1, devsel1
              or      parm1, #Xmit
              call    #writebytefunc
              mov     ackbit2, parm1
              mov     parm1, addrreg1
              shr     parm1, #8
              and     parm1, #$ff
              call    #writebytefunc
              shl     ackbit2, #1
              or      ackbit2, parm1
              mov     parm1, addrreg1
              and     parm1, #$ff
              call    #writebytefunc
              shl     ackbit2, #1
              or      ackbit2, parm1
              call    #startfunc
              mov     parm1, devsel1
              or      parm1, #Recv
              call    #writebytefunc
              shl     ackbit2, #1
              or      ackbit2, parm1
:loop         cmp     count2, #1 wz
        if_z  mov     parm1, #NAK
        if_nz mov     parm1, #ACK
              call    #readbytefunc
              wrbyte  parm1, dataptr1
              add     dataptr1, #1
              djnz    count2, #:loop
              call    #stopfunc
              add     XMM_Addr,XMM_Len
XMM_ReadPage_ret
              ret
'
'' This routine reads a byte and sends the ACK bit.  It assumes the clock
'' and data lines have been low for at least the minimum low clock time.
'' It exits with the clock and data low for the minimum low clock time.                        
readbytefunc            mov     ackbit1, parm1 ' Get the ACK bit
                        mov     data1, #0     ' Initialize data byte to zero
                        andn    dira, sda_bit ' Set SDA as input
                        call    #delay
                        mov     count1, #8    ' Set loop count for 8

:loop                   call    #delay
                        or      outa, scl_bit ' Set SCL HIGH
                        call    #delay
                        shl     data1, #1     ' data byte left one bit
                        test    sda_bit, ina    wz
        if_nz           or      data1, #1     ' Set LSB if input bit is HIGH
                        andn    outa, scl_bit ' Set SCL LOW
                        call    #delay
                        djnz    count1, #:loop

                        cmp     ackbit1, #0     wz
        if_z            andn    outa, sda_bit ' Set SDA LOW if ACK
        if_nz           or      outa, sda_bit ' Set SDA HIGH if NAK
                        or      dira, sda_bit ' Set SDA as output
                        call    #delay
                        or      outa, scl_bit ' Set SCL HIGH
                        call    #delay
                        andn    outa, scl_bit ' Set SCL LOW
                        call    #delay
                        mov     parm1, data1  ' Return the data byte
readbytefunc_ret        ret

'' This routine writes a byte and reads the ACK bit.  It assumes that the clock
'' and data are set as outputs, and the clock has been low for at least half the
'' minimum low clock time.  It exits with the clock and data set as outputs, and
'' with the clock low for half the minimum low clock time.                        
writebytefunc           mov     data1, parm1  ' Get the data byte
                        mov     count1, #8    ' Set loop count for 8 bits

:loop                   shl     data1, #1     ' Shift left one bit
                        test    data1, #$100    wz ' Check MSB
        if_z            andn    outa, sda_bit ' Set SDA LOW if zero
        if_nz           or      outa, sda_bit ' Set SDA HIGH if not zero
                        call    #delay
                        or      outa, scl_bit ' Set SCL HIGH
                        call    #delay
                        andn    outa, scl_bit ' Set SCL LOW
                        call    #delay
                        djnz    count1, #:loop

                        andn    dira, sda_bit ' Set SDA as input
                        call    #delay
                        or      outa, scl_bit ' Set SDA HIGH
                        call    #delay
                        test    sda_bit, ina    wz ' Check SDA input
        if_z            mov     ackbit1, #0   ' Set to zero if LOW
        if_nz           mov     ackbit1, #1   ' Set to one if HIGH
                        andn    outa, scl_bit ' Set SCL LOW
                        call    #delay
                        or      dira, sda_bit ' Set SDA as output
                        mov     parm1, ackbit1 ' Return the ack bit
writebytefunc_ret       ret

#endif
'

'' This routine transmits the stop sequence, which consists of the data line
'' going from low to high while the clock is high.  It assumes that data and
'' clock are set as outputs, and the clock has been low for half the minimum
'' low clock time.  It exits with the clock and data floating high for the
'' minimum  high clock time.
stopfunc                andn    outa, sda_bit ' Set SDA LOW
                        call    #delay
                        or      outa, scl_bit ' Set SCL HIGH
                        call    #delay
                        or      outa, sda_bit ' Set SDA HIGH
                        call    #delay
                        andn    dira, scl_bit ' Float SCL HIGH
                        andn    dira, sda_bit ' Float SDA HIGH
stopfunc_ret            ret

'' This routine transmits the start sequence, which consists of the data line
'' going from high to low while the clock is high.  It assumes that the clock
'' and data were floating high for the minimum high clock time, and it exits
'' with the clock and data low for half the minimum low clock time.
startfunc               or      outa, sda_bit ' Set SDA HIGH
                        or      dira, sda_bit ' Set SDA as output
                        call    #delay
                        or      outa, scl_bit ' Set SCL HIGH
                        or      dira, scl_bit ' Set SCL as output
                        call    #delay
                        andn    outa, sda_bit ' Set SDA LOW
                        call    #delay
                        andn    outa, scl_bit ' Set SCL LOW
                        call    #delay
startfunc_ret           ret

'' This routine puts the I2C bus in a known state.  It issues up to nine clock
'' pulses waiting for the input to be in a high state.  It exits with the clock
'' driven high and the data floating in the high state for the minimum high
'' clock time.
initializefunc          andn    dira, sda_bit ' Set SDA as input
                        or      outa, scl_bit ' Set SCL HIGH
                        or      dira, scl_bit ' Set SCL as output
                        call    #delay
                        mov     count1, #9    ' Set for up to 9 loops
:loop                   andn    outa, scl_bit ' Set SCL LOW
                        call    #delay
                        call    #delay
                        or      outa, scl_bit ' Set SCL HIGH
                        call    #delay
                        test    sda_bit, ina    wz
        if_nz           jmp     #initializefunc_ret ' Quit if input is HIGH
                        djnz    count1, #:loop
initializefunc_ret      ret                   ' Quit after nine clocks

'' This routine delays for the minimum high clock time, or half the minimum
'' low clock time.  This delay routine is also used for the setup and hold
'' times for the start and stop signals, as well as the output data changes.
delay                   mov     delaycnt, cnt
                        add     delaycnt, #DELAY_CYCLES
                        waitcnt delaycnt, #0
delay_ret               ret
'
'================================= XMM VARIABLES ===============================
'
DAT

image_addr      long    Common#IMAGE_ADDR
scl_bit         long    |<(Common#I2C_PIN)
sda_bit         long    |<(Common#I2C_PIN+1)
i2c_dev         long    Common#I2C_DEV
count1          long    0
lt1             long    0
data1           long    0
ackbit1         long    0
delaycnt        long    0
parm1           long    0
devsel1         long    0
addrreg1        long    0
dataptr1        long    0
count2          long    0
ackbit2         long    0
'
'===============================================================================
'
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

