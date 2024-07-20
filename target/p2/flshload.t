{'Modified by RJA to automate loading of flash

 'Modified by rossh to '#include' file to load (e.g. produced by bindump)

Prop2 Flash loader
Version 1.2 17th January 2019 - ozpropdev


Writes user code (.obj) and loader into flash.
On P2-ES Eval board "FLASH" switch must be on.


"CODE" is stored in FLASH starting @ $1_0000
First long is code size in bytes.

See end of program for examples of how to include users .obj file.

}

con
        crystal = 20_000_000
        dv = 40
        mlt = 360 '180 Mhz
        clk = 1 << 24 | (dv-1) << 18 | (mlt-1) << 8
        sys_clk = crystal / dv * mlt

        spi_do = 58
        spi_di = 59
        spi_clk = 60
        spi_cs = 61

        write_enable = $06
        block_erase_64k = $D8
        read_status = 5
        enable_reset = $66
        device_reset = $99
        read_data = 3
        page_program = 2

'==============================================================================================

dat     org

        hubset  #0          
        hubset  ##clk | %1111_01_00 'enable crystal+PLL, stay in 20MHz+ mode
        waitx   ##20_000_000/100    'wait ~10ms for crystal+PLL to stabilize
        hubset  ##clk | %1111_01_11 'now switch to PLL running at 180 MHz

        drvh    #spi_cs
        drvl    #spi_clk
        drvl    #spi_di


'compute checksum for SPI flash boot

        call    #checksum
        subr    pa,##$706F7250 'Prop'
        wrlong  pa,ptra[-1]

'reset flash
    
        callpa  #enable_reset,#send_command
        callpa  #device_reset,#send_command

'erase flash

erase_stage1    mov addr,#0
        call    #erase_64k

erase_code  mov addr,##$1_0000
        mov blocks,##512 / 64
.loop       call    #erase_64k
        add addr,##$1_0000
        djnz    blocks,#.loop

'copy stage1 loader

        call    #copy_stage1


DAT 'copy code to $1_0000
        'RJA commented out these lines
        'mov byte_count,##@code_end - @code
        'loc ptra,#@size
        'wrlong  byte_count,ptra
        rdlong byte_count,##size

        call    #copy_code

        hubset  ##%0001 << 28   'hard reset

        jmp #$

erase_64k   callpa  #write_enable,#send_command
        outl    #spi_cs
        mov data,#block_erase_64k
        call    #send_byte
        call    #send_addr24
        outh    #spi_cs     
        call    #busy
        ret

copy_stage1 mov pages,#4
        mov addr,#0
        loc ptra,#@stage1
.loop2      callpa  #write_enable,#send_command
        mov byte_count,#256
        outl    #spi_cs
        mov data,#page_program
        call    #send_byte
        call    #send_addr24
.loop       rdbyte  data,ptra++
        call    #send_byte
        djnz    byte_count,#.loop
        outh    #spi_cs
        call    #busy
        add addr,#256
        djnz    pages,#.loop2
        ret

copy_code   mov pages,byte_count
        shr pages,#8
        add pages,#2
        mov addr,##$1_0000
        loc ptra,#@size
.loop2      callpa  #write_enable,#send_command
        mov byte_count,#256
        outl    #spi_cs
        mov data,#page_program
        call    #send_byte
        call    #send_addr24
.loop       rdbyte  data,ptra++
        call    #send_byte
        djnz    byte_count,#.loop
        outh    #spi_cs
        call    #busy
        add addr,#256
        djnz    pages,#.loop2
        ret

send_command    drvl    #spi_cs
        mov data,pa
        call    #send_byte
        drvh    #spi_cs
        ret

read_byte   mov count,#8
.loop       call    #clock
        testp   #spi_do wc
        rcl val,#1
        djnz    count,#.loop
        ret

send_addr24 getbyte data,addr,#2
        call    #send_byte
        getbyte data,addr,#1
        call    #send_byte
        getbyte data,addr,#0
        call    #send_byte
        ret

send_byte   mov count,#8
.loop       testb   data,#7 wc
        drvc    #spi_di
        shl data,#1
        call    #clock
        djnz    count,#.loop
        ret

clock       drvh    #spi_clk
        drvl    #spi_clk
        ret

busy        outl    #spi_cs
        mov data,#read_status
        call    #send_byte
        call    #read_byte
        outh    #spi_cs
        testb   val,#0 wc   'write in progress
    if_c    jmp #busy
        ret
DAT 'checksum
checksum    loc ptra,#@stage1
        mov pa,#0
        rep @loop,#256
        rdlong  pb,ptra++
        add pa,pb
loop        ret

blocks      long    0
count       long    0
addr        long    0
data        long    0
pages       long    0
xx      long    0
byte_count  long    0
val     long    0

'==============================================================================================

        orgh    $400
        org

stage1  
        hubset  ##clk & $FFFFFFFC 'disable PLL
        hubset  #0          
        hubset  ##clk | %1111_01_00 'enable crystal+PLL, stay in 20MHz+ mode
        waitx   ##20_000_000/100    'wait ~10ms for crystal+PLL to stabilize
        hubset  ##clk | %1111_01_11 'now switch to PLL running at 180 MHz

        drvh    #spi_cs
        drvl    #spi_clk
        drvl    #spi_di

'load code @$1_0000 to hub address 0

        mov pb,##$1_0000
        mov ptra,#0
        outl    #spi_cs
        callpa  #read_data,#send_byte2

        getbyte pa,pb,#2
        call    #send_byte2
        getbyte pa,pb,#1
        call    #send_byte2
        getbyte pa,pb,#0
        call    #send_byte2

        call    #read_byte2
        call    #read_byte2
        call    #read_byte2
        call    #read_byte2
        movbyts pa,#%%0123  'endian swap 24bit address

        mov pb,pa       'bytes to load
.loop       call    #read_byte2
        wrbyte  pa,ptra++
        djnz    pb,#.loop

        outh    #spi_cs
        coginit #0,#0

send_byte2  rep @.loop,#8
        testb   pa,#7 wc
        outc    #spi_di
        outh    #spi_clk
        outl    #spi_clk
        shl pa,#1
.loop       
        ret

read_byte2  rep @.loop,#8
        outh    #spi_clk
        outl    #spi_clk
        testp   #spi_do wc
        rcl pa,#1
.loop       
        ret

        orgf    $100

'==============================================================================================

        orgh

size     long code_end - code

code

#include "flash_program.inc"

code_end





