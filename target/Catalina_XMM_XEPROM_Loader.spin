{{
'-------------------------------------------------------------------------------
'
' XMM_XEPROM_Loader - XMM EEPROM Loader for use in conjunction
'                     with the Catalina code generator when executing
'                     XMM programs from EEPROM.
'
' Note that this version supports programs built using -x2. The 
' image is assumed to be located in eeprom at the location given on
' startup (usually $8000). The image is not moved or relocated, it is
' executed from EEPROM by the XEPROM XMM API.
'
' Version 1.0 - Initial version by Ross Higson.
'
' Incorporates I2C code based on:
'
'    Basic_I2C_Driver.spin by Parallax and Michael Green
'
' This program incorporates XMM software derived from:
'
'    TriBladeProp Blade #2 Driver v0.201
'       (c) 2009 "Cluso99" (Ray Rodrick) 
'
'    HX512SRAM_ASM_DRV_101.spin by Andre' LaMothe, 
'       (C) 2007 Nurve Networks LLC
'
'    Morpheus System Architecture and Developer's Guide v0.90
'       (C) 2009 William Henning
'
'    SdramCache
'       (c) 2010 by John Steven Denson (jazzed), as modified by David Betz
'
'---------------------------------------------------------------
}}
CON
'
' Common Constants
'
PAGE_SIZE   = 32  ' Size of page in bytes. Must be divisible by 4.
                  ' Note that a page size > 32 may not work with
                  ' some types of eeprom. Also, must be a divisor
                  ' of SECTOR_SIZE
'
SECTOR_SIZE = 1<<Common#FLIST_LOG2  ' sector size is also prologue size
'
MAX_KERNEL_LONGS = $1f0  ' number of kernel longs to copy

'
' Prologue constants (offset from XMM_RO_BASE_ADDRESS)
'
INIT_BZ_OFF = $10 + (Common#LMM_INIT_BZ_OFF-Common#LMM_INIT_B0_OFF)<<2 + 8
INIT_PC_OFF = INIT_BZ_OFF + 4
LAYOUT_OFF  = INIT_PC_OFF + 4
CODE_OFF    = LAYOUT_OFF + 4    
CNST_OFF    = CODE_OFF + 4 
INIT_OFF    = CNST_OFF + 4
DATA_OFF    = INIT_OFF + 4
ENDS_OFF    = DATA_OFF + 4
ROBA_OFF    = ENDS_OFF + 4
RWBA_OFF    = ROBA_OFF + 4
ROEN_OFF    = RWBA_OFF + 4
RWEN_OFF    = ROEN_OFF + 4
TABLE_END   = RWEN_OFF + 4
'
CON
'
' I2C (EEPROM) Constants:
'
ACK      = 0                        ' I2C Acknowledge
NAK      = 1                        ' I2C No Acknowledge
Xmit     = 0                        ' I2C Direction Transmit
Recv     = 1                        ' I2C Direction Receive

I2C_DELAY_COUNT = 0                 ' clock counts to delay per I2C bit (on the
                                    ' Hydra this driver works with minimal delay,
                                    ' but higher values may be needed on other
                                    ' systems)

OBJ
  Common   : "Catalina_Common"                          ' Common Definitions
  
PUB Start(Kernel_Addr) : Cog | Pin, Device, Registry, Stack, Kernel, Image, Page

   ' Start the loader in another cog, and return the cog that was used, 
   ' or -1 if no cog is available.
   '
   ' Allocate a page for the loader (must be long aligned)
   '
   Page := long[Common#FREE_MEM] - PAGE_SIZE
   long[Common#FREE_MEM] := Page
   '
   Pin      := Common#I2C_PIN
   Device   := Common#I2C_DEV 
   Registry := Common#REGISTRY
   Stack    := long[Common#FREE_MEM]
   Kernel   := Kernel_Addr
   Image    := Common#IMAGE_ADDR

   Cog      := cognew(@entry, @Pin)

PUB Run(Kernel_Addr) : Cog | Pin, Device, Registry, Stack, Kernel, Image, Page

   ' Run restarts this cog as the loader, and never returns
   '
   ' Allocate a page for the loader (must be long aligned)
   '
   Page := long[Common#FREE_MEM] - PAGE_SIZE
   long[Common#FREE_MEM] := Page
   '
   Pin      := Common#I2C_PIN ' I2C Clock Pin - Data Pin must be Clock Pin + 1
   Device   := Common#I2C_DEV 
   Registry := Common#REGISTRY
   Stack    := long[Common#FREE_MEM]
   Kernel   := Kernel_Addr
   Image    := Common#IMAGE_ADDR

   coginit(cogid, @entry, @Pin)

DAT
        org 0

entry
        mov    r0,par                           ' point to parameters
        rdlong SCL,r0                           ' I2C Clock Pin
        mov    SDA,SCL                          ' set up pins and masks
        add    SDA,#1                           ' I2C Data Pin is Clock Pin + 1
        mov    SCLmask,#1
        shl    SCLmask,SCL
        mov    SDAmask,SCLmask
        shl    SDAmask,#1
        add    r0,#4
        rdlong I2C,r0                           ' I2C Device to use
        add    r0,#4
        rdlong reg_addr,r0                      ' address of Registry
        add    r0,#4
        rdlong stack_addr,r0                    ' address of top of stack
        add    r0,#4
        rdlong entry_addr,r0                    ' kernel entry address
        add    r0,#4
        rdlong load_addr,r0                     ' address of image in EEPROM
        add    r0,#4
        rdlong page_addr,r0                     ' address of page buffer

        call   #I2C_Setup

        call   #XMM_Activate

        ' retrieve the initial BZ, PC, layout and segment addresses
        ' from the image
        '
        ' Note: the initial BZ and PC in the image will be correct    
        ' once the data and code segments are moved - the BZ value
        ' is correct if we load the data segment to the place the
        ' compiler assumed it would be loaded, and the XMM Kernel
        ' adjusts the PC value to subtract the location of the code
        ' segment, assuming it will end up at location zero in XMM.
        ' If this is not the case, the intial PC value will need to
        ' be adjusted. Note all internal code segment references are
        ' relocated "on the fly" by the XMM Kernel.
        '
        call   #ClearPage                       ' ensure page buffer is empty
        mov    addrReg,load_addr                ' get address of image
        add    addrReg,#INIT_BZ_OFF             ' read first page ...
        mov    dataPtr,page_addr                ' 
        mov    count,#PAGE_SIZE                 '
        call   #I2C_ReadPage                    ' ... of prologue

        mov    r0,page_addr                     ' retrieve ...
        rdlong Init_BZ,r0                       '
        add    r0,#(LAYOUT_OFF - INIT_BZ_OFF)   '
        rdlong layout,r0                        ' ... prologue data

        call   #ClearPage                       ' ensure page buffer is empty
        mov    addrReg,load_addr                ' get address of image
        add    addrReg,#ROBA_OFF                ' read next page ...
        mov    dataPtr,page_addr                '
        mov    count,#PAGE_SIZE                 '
        call   #I2C_ReadPage                    ' ... of prologue

        mov    r0,page_addr                     ' retrieve ...
        rdlong ro_base,r0                       ' ... base ...
        add    r0,#(RWBA_OFF - ROBA_OFF)        ' ... 
        rdlong rw_base,r0                       ' ... and ...
        add    r0,#(ROEN_OFF - RWBA_OFF)        ' ... 
        rdlong ro_ends,r0                       ' ... ends ...
        add    r0,#(RWEN_OFF - ROEN_OFF)        ' ... 
        rdlong rw_ends,r0                       ' ... of ro & rw segments 
'
' NOTE: the following code implements only XMM Layout 2:
'
' XMM Layout 2:
'   [CNST,INIT,DATA,CODE] => [CODE] in XMM & [CNST,INIT,DATA] in HUB
'
        ' Copy the prologue from I2C to HUB RAM. Note that we don't 
        ' overwrite the first $10 bytes since they're special (i.e.
        ' clock freq etc) so we only copy from byte $10 onwards

        mov    src_addr,load_addr
        add    src_addr,#$10
        mov    dst_addr,#$10
        mov    page_count,#(SECTOR_SIZE/PAGE_SIZE)
        call   #Copy_I2C_To_RAM

        ' Check we know how to load the specified layout

        cmp    layout,#2 wz                     ' if not layout 2 ...
  if_nz jmp    #cannot_load                     ' ... cannot load

        ' For layout 2, copy rw segments from I2C to RAM

        mov    r0,rw_ends                       ' convert size ...
        sub    r0,rw_base                       ' ...
        add    r0,#PAGE_SIZE - 1                ' ...
        mov    r1,#PAGE_SIZE                    ' ...
        call   #f_d32u                          ' ...
        mov    page_count,r0                    ' ... to number of pages
        mov    src_addr,load_addr               ' copy rw segments ...
        add    src_addr,rw_base                 ' ... from rw_base ...
        add    src_addr,#$10                    ' ...
        mov    dst_addr,rw_base                 ' ... in I2C ...
        call   #Copy_I2C_To_RAM                 ' ... to Hub RAM

        ' Copy MAX_KERNEL_LONGS*4 bytes from the Kernel entry address  
        ' to straight after Init_BZ - this is just a temporary place 
        ' to put the kernel code - later, we will overwrite ourselves 
        ' with this code when we restart this cog. 

        mov    r0,kernel_size                   ' convert kernel size ...
        add    r0,#PAGE_SIZE - 1                '
        mov    r1,#PAGE_SIZE                    '
        call   #f_d32u                          '
        mov    page_count,r0                    ' ... to number of pages

        mov    src_addr,entry_addr
        mov    dst_addr,Init_BZ                 ' copy to ...
        add    dst_addr,#$10                    ' ... Init_BZ (+$0010)
        call   #Copy_I2C_To_RAM

        ' Set up the Catalina program base address for use by the Kernel

        cogid   r0                              ' convert ...
        shl     r0,#2                           ' ... my cog id ...
        add     r0,reg_addr                     ' ... to my registration addr
        rdlong  r2,r0                           ' get my request block addr

        add     r2,#4
        wrlong  stack_addr,r2
        sub     r2,#4
        mov     r1,#$10                         ' initial BA is always $10
        wrlong  r1,r2

        ' Then become the Kernel by restarting this cog with the Kernel code

        cogid   r0                              ' set the cog id
        cmp     layout,#5 wz                    ' for layout 5 ...
   if_z mov     r1,#TABLE_END                   ' ... kernel is after seg table 
  if_nz mov     r1,Init_BZ                      ' for other layouts ...
  if_nz add     r1,#$10                         ' ... it is at Init_BZ (+$0010)
        shl     r1,#2
        or      r0,r1                           ' set the code address
        mov     r1,reg_addr
        shl     r1,#16
        or      r0,r1                           ' set the par address

       ' call XMM_TriState to avoid side effects (e.g. resetting 
       ' other CPUs on the TriBladeProp) while restarting

        call #XMM_Tristate
                      
        ' Restart oursevles as the XMM Kernel

        coginit r0

cannot_load
        jmp #cannot_load

'-------------------------------- Utility routines -----------------------------


Copy_I2C_To_RAM
        cmp    page_count,#0 wz
 if_z   jmp    #Copy_I2C_To_RAM_ret
:Copy_loop
        mov    addrReg,src_addr
        mov    dataPtr,page_addr
        mov    count,#PAGE_SIZE
        call   #I2C_ReadPage
        mov    r0,#PAGE_SIZE/4
        mov    r1,page_addr
:Write_loop
        rdlong r2,r1
        wrlong r2,dst_addr
        add    r1,#4
        add    dst_addr,#4
        djnz   r0,#:Write_loop
        add    src_addr,#PAGE_SIZE
        djnz   page_count,#:Copy_loop
Copy_I2C_To_RAM_ret
        ret

'
'f_d32u - Unsigned 32 bit division
'         Divisor : r1
'         Dividend : r0
'         Result:
'             Quotient in r0
'             Remainder in r1

f_d32u
        mov    ftemp,#32
        mov    ftmp2, #0
:up2
        shl    r0,#1       WC
        rcl    ftmp2,#1    WC
        cmp    r1,ftmp2    WC,WZ
 if_a   jmp    #:down
        sub    ftmp2,r1
        add    r0,#1
:down
        sub    ftemp, #1   WZ
 if_ne  jmp    #:up2
        mov    r1,ftmp2
f_d32u_ret
        ret
'
ClearPage
        mov    r0,#0
        mov    r1,#PAGE_SIZE
        mov    r2,page_addr
:ClearPage_loop
        wrbyte r0,r2
        add    r2,#1
        djnz   r1,#:ClearPage_loop
ClearPage_ret
        ret

'---------------------------------- I2C routines -------------------------------

I2C_Delay
        mov    I2C_Count,cnt
        add    I2C_Count,I2C_Wait
        waitcnt I2C_Count,#0
I2C_Delay_ret
        ret
I2C_Count
        long   $0
I2C_Wait
        long   I2C_DELAY_COUNT+13                ' must be at least 13


I2C_SCL_On
        or     outa,SCLmask                      ' Drive SCL High
        or     dira,SCLmask
I2C_SCL_On_ret
        ret


I2C_SCL_Off
        andn   outa,SCLmask                      ' Drive SCL Low
        or     dira,SCLmask
I2C_SCL_Off_ret
        ret


I2C_SCL_Input
        andn   dira,SCLmask                      ' Set SCL as Input (or to float due to pullup)
I2C_SCL_Input_ret
        ret


I2C_SDA_On
        or     outa,SDAmask                      ' Drive SDA High
        or     dira,SDAmask
I2C_SDA_On_ret
        ret


I2C_SDA_Off
        andn   outa,SDAmask                      ' Drive SDA Low
        or     dira,SDAmask
I2C_SDA_Off_ret
        ret


I2C_SDA_Input
        andn   dira,SDAmask                      ' Set SDA as Input (or to float due to pullup)
I2C_SDA_Input_ret
        ret


I2C_Setup
        call   #I2C_SCL_On                       ' Drive SCL High
        call   #I2C_SDA_Input                    ' Set SDA as Input
        mov    r0,#9                             ' repeat 9 times
:Setup_loop
        call   #I2C_Delay                        '   #### delay ###
        call   #I2C_SCL_Off                      '   Pulse Clock
        call   #I2C_Delay                        '   #### delay ###
        call   #I2C_SCL_On
        mov    r1,ina
        test   r1,SDAmask wz                     '    if ina[SDA]      ' Repeat if SDA not driven high
 if_nz  jmp    #I2C_Setup_ret                    '       quit          '  by the EEPROM
        djnz   r0,#:Setup_loop                   '
I2C_Setup_ret
        ret

I2C_Start
        call   #I2C_SDA_On                       ' Initially drive SDA HIGH
        call   #I2C_Delay                        ' #### delay ###
        call   #I2C_SCL_On                       ' Initially drive SCL HIGH
        call   #I2C_Delay                        ' #### delay ###
        call   #I2C_SDA_Off                      ' Now drive SDA LOW
        call   #I2C_Delay                        ' #### delay ###
        call   #I2C_SCL_Off                      ' Leave SCL LOW
        call   #I2C_Delay                        ' #### delay ###
I2C_Start_ret
        ret


I2C_Stop
        call   #I2C_SDA_Off                      ' Drive SDA LOW
        call   #I2C_Delay                        ' #### delay ###
        call   #I2C_SCL_On                       ' Drive SCL HIGH
        call   #I2C_Delay                        ' #### delay ###
        call   #I2C_SDA_On                       ' Then drive SDA HIGH
        call   #I2C_Delay                        ' #### delay ###
'       call   #I2C_SCL_Input                    ' Now let them float (Note - differs from Mike's original driver)
'       call   #I2C_SDA_Input                    ' If pullups present, they'll stay HIGH (Note - differs from Mike's original driver)
I2C_Stop_ret
        ret


I2C_Write
        mov    ackbit,#0                         ' ackbit := 0
        mov    r1,data
        shl    r1,#24                            ' data <<= 24
        mov    r0,#8                             ' repeat 8            ' Output data to SDA
:Write_bit
        rol    r1,#1
        test   r1,#1 wz
 if_z   call   #I2C_SDA_Off
 if_nz  call   #I2C_SDA_On                       '   outa[SDA] := (data <-= 1) & 1
        call   #I2C_SCL_On                       '   Toggle SCL from LOW to HIGH to LOW
        call   #I2C_Delay                        '   #### delay ###
        call   #I2C_SCL_Off                      '
        djnz   r0,#:Write_bit
        call   #I2C_SDA_Input                    ' Set SDA to input for ACK/NAK
        call   #I2C_SCL_On                       ' Sample SDA when SCL is HIGH
        call   #I2C_Delay                        ' #### delay ###
        mov    ackbit,ina
        and    ackbit,SDAmask                    ' ackbit := ina[SDA]
        shr    ackbit,SDA
        call   #I2C_SCL_Off
'       call   #I2C_SDA_Off                      ' Leave SDA driven LOW (Note - differs from Mike's original driver) !!! ### !!! ###
I2C_Write_ret
        ret



I2C_Read
        mov    data,#0                           ' data := 0
        call   #I2C_SDA_Input                    ' Make SDA an Input
        mov    r0,#8                             ' repeat 8 times to recive a byte from SDA
:Read_bit
        call   #I2C_SCL_On                       ' Sample SDA when SCL is HIGH
        call   #I2C_Delay                        '   #### delay ###
        mov    r1,ina
        and    r1,SDAmask
        shr    r1,SDA
        shl    data,#1
        or     data,r1                          '   data := (data << 1) | ina[SDA]
        call   #I2C_SCL_Off                      '   Drive SCL LOW
        call   #I2C_Delay                        '   #### delay ###
        djnz   r0,#:Read_bit
        mov    r1,ackbit wz
 if_z   call   #I2C_SDA_Off
 if_nz  call   #I2C_SDA_On                       ' outa[SDA] := ackbit ' Output ACK/NAK to SDA
        call   #I2C_SCL_On                       ' Toggle SCL from LOW to HIGH to LOW
        call   #I2C_Delay                        ' #### delay ###
        call   #I2C_SCL_Off
'       call   #I2C_SDA_Off                      ' Leave SDA Low (Note - differs from Mike's original driver) !!! ### !!! ###
'       call   #I2C_Delay                        ' #### delay ###
        call   #I2C_SDA_On                       ' Leave SDA High (Note - differs from Mike's original driver) !!! ### !!! ###
I2C_Read_ret
        ret


'
' I2C_ReadPage : Read in a block of i2c data.
'
' Parameters:
'     devSel  : Device select code.
'     addrReg : Device starting address.
'     dataPtr : Data address.
'     count   : Number of bytes.
' Returns:
'     The acknowledge bits if an error occurred.
'
' NOTE : The device select code is modified using the upper 3 bits of the 19 bit addrReg.
'
I2C_ReadPage
        mov    r0,addrReg
        shr    r0,#15
        and    r0,#%1110
        mov    devSel,I2C
        or     devSel,r0                        ' devSel |= addrReg >> 15 & %1110
        call   #I2C_Start                       ' Start(SCL)           ' Select the device & send address
        mov    data,devSel
        or     data,#Xmit
        call   #I2C_Write
        mov    ackbitC,ackbit                   ' ackbit := Write(SCL, devSel | Xmit)
        mov    data,addrReg
        shr    data,#8
        and    data,#$ff
        call   #I2C_Write
        shl    ackbitC,#1
        or     ackbitC,ackbit                   ' ackbit := (ackbit << 1) | Write(SCL, addrReg >> 8 & $FF)
        mov    data,addrReg
        and    data,#$ff
        call   #I2C_Write
        shl    ackbitC,#1
        or     ackbitC,ackbit                   ' ackbit := (ackbit << 1) | Write(SCL, addrReg & $FF)
        call   #I2C_Start                       ' Start(SCL)           ' Reselect the device for reading
        mov    data,devSel
        or     data,#Recv
        call   #I2C_Write
        shl    ackbitC,#1
        or     ackbitC,ackbit                   ' ackbit := (ackbit << 1) | Write(SCL, devSel | Recv)
        mov    r2,count                         ' repeat count - 1 times
        sub    r2,#1 wz
 if_z   jmp    #:ReadPage_last
:ReadPage_loop
        mov    ackbit,#ACK
        call   #I2C_Read
        wrbyte data,dataPtr
        add    dataPtr,#1                       '   byte[dataPtr++] := Read(SCL, ACK)
        djnz   r2,#:ReadPage_loop
:ReadPage_last
        mov    ackbit,#NAK
        call   #I2C_Read
        wrbyte data,dataPtr
        add    dataPtr,#1                       ' byte[dataPtr++] := Read(SCL, NAK)
        call   #I2C_Stop                        ' Stop(SCL)
        mov    ackbit,ackbitC
I2C_ReadPage_ret
        ret                                     ' return ackbit

{
' not required for this loader ...
'

I2C_ReadByte
        mov   count,#1
        call  #I2C_ReadPage
        cmp   ackbit,#0 wz                      ' if ReadPage(SCL, devSel, addrReg, @data, 1)
I2C_ReadByte_ret
        ret                                     '   return -1


I2C_ReadWord
        mov   count,#2
        call  #I2C_ReadPage
        cmp   ackbit,#0 wz                      ' if ReadPage(SCL, devSel, addrReg, @data, 2)
I2C_ReadWord_ret
        ret                                     '   return -1


I2C_ReadLong
        mov   count,#4
        call  #I2C_ReadPage
        cmp   ackbit,#0 wz                      ' if ReadPage(SCL, devSel, addrReg, @data, 4)
I2C_ReadLong_ret
        ret                                     '   return -1
}

{
' not required for this loader ...
'
'
' I2C_WritePage : Write a block of i2c data. NOT TESTED !!!
'
' Parameters:
'     devSel  : Device select code.
'     addrReg : Device starting address.
'     dataPtr : Data address.
'     count   : Number of bytes.
' Returns:
'     The acknowledge bits if an error occurred.
'
' NOTE : The device select code is modified using the upper 3 bits of the 19 bit addrReg.
'
I2C_WritePage
        mov    r0,addrReg
        shr    r0,#15
        and    r0,#%1110
        mov    devSel,I2C
        or     devSel,r0                        ' devSel |= addrReg >> 15 & %1110
        call   #I2C_Start                       ' Start(SCL)           ' Select the device & send address
        mov    data,devSel
        or     data,#Xmit
        call   #I2C_Write
        mov    ackbitC,ackbit                   ' ackbit := Write(SCL, devSel | Xmit)
        mov    data,addrReg
        shr    data,#8
        and    data,#$ff
        call   #I2C_Write
        shl    ackbitC,#1
        or     ackbitC,ackbit                   ' ackbit := (ackbit << 1) | Write(SCL, addrReg >> 8 & $FF)
        mov    data,addrReg
        and    data,#$ff
        call   #I2C_Write
        shl    ackbitC,#1
        or     ackbitC,ackbit                   ' ackbit := (ackbit << 1) | Write(SCL, addrReg & $FF)
        mov    r2,count wz                      ' repeat count times
 if_z   jmp    #:WritePage_done
:WritePage_loop
        and    ackbitC,TOP_BIT wz
        shl    ackbitC,#1
 if_nz  or     ackbitC,TOP_BIT                  ' "Sticky" sign bit
        rdbyte data,dataPtr
        add    dataPtr,#1                       '   Write(SCL, byte[dataPtr++])
        call   #I2C_Write                       ' 
        or     ackbitC,ackbit
        djnz   r2,#:WritePage_loop
:WritePage_done
        call   #I2C_Stop                        ' Stop(SCL)
        mov    ackbit,ackbitC
I2C_WritePage_ret
        ret                                     ' return ackbit



I2C_WriteByte
        mov   count,#1
        call  #I2C_WritePage
        cmp   ackbit,#0 wz                      ' if WritePage(SCL, devSel, addrReg, @data, 1)
I2C_WriteByte_ret
        ret                                     '   return -1


I2C_WriteWord
        mov   count,#2
        call  #I2C_WritePage
        cmp   ackbit,#0 wz                      ' if WritePage(SCL, devSel, addrReg, @data, 2)
I2C_WriteWord_ret
        ret                                     '   return -1


I2C_WriteLong
        mov   count,#4
        call  #I2C_WritePage
        cmp   ackbit,#0 wz                      ' if WritePage(SCL, devSel, addrReg, @data, 4)
I2C_WriteLong_ret
        ret                                     '   return -1
}

'
' Common variables
'
r0            long      $0
r1            long      $0
r2            long      $0

page_addr     long      $0
load_addr     long      $0
reg_addr      long      $0
stack_addr    long      $0
entry_addr    long      $0

Init_BZ       long      $0

layout        long      $0
ro_base       long      $0
ro_ends       long      $0
rw_base       long      $0
rw_ends       long      $0

src_addr      long      $0
dst_addr      long      $0
page_count    long      $0
'
' temporary storage used in mul & div calculations
'
ftemp         long      $0
ftmp2         long      $0

kernel_size   long      MAX_KERNEL_LONGS*4      ' (max) kernel size in bytes
sect_size     long      SECTOR_SIZE             ' also size of prologue
hub_size      long      $8000                   ' size of Hub RAM

'-------------------------------------------------------------------------------
'
' I2C-specific variables
'
SCL           long      $0
SDA           long      $0
I2C           long      $0

SCLmask       long      $0
SDAmask       long      $0

ackbit        long      $0
ackbitC       long      $0                      ' cumulative ackbit
devSel        long      $0
data          long      $0
addrReg       long      $0
dataPtr       long      $0
count         long      $0

'---------------------------------
{

PUB WriteWait(SCL, devSel, addrReg) : ackbit
'' Wait for a previous write to complete.  Device select code is devSel.  Device
'' starting address is addrReg.  The device will not respond if it is busy.
'' The device select code is modified using the upper 3 bits of the 18 bit addrReg.
'' This returns zero if no error occurred or one if the device didn't respond.
   devSel |= addrReg >> 15 & %1110
   Start(SCL)
   ackbit := Write(SCL, devSel | Xmit)
   Stop(SCL)
   return ackbit
}
'
'=============================== XMM SUPPORT CODE ==============================
'
' The folling defines determine which XMM functions are included - comment out
' the appropriate lines to exclude the corresponding XMM function:
'
'#define NEED_XMM_READLONG
'#define NEED_XMM_WRITELONG
'#define NEED_XMM_READPAGE
#define NEED_XMM_WRITEPAGE
#define ACTIVATE_INITS_XMM      ' the HX512 does not allow this in the Kernel
'                                    
#ifdef CACHED
' When the cache is in use, all platforms use the same XMM code
#include "Cached_XMM.inc"
#else
' Include XMM API based on platform
#include "XMM.inc"
#endif
'
XMM_Addr      long 0
Hub_Addr      long 0
XMM_Len       long 0
'
'============================ END OF XMM SUPPORT CODE ==========================
'
              fit       $1f0                    ' max size
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
