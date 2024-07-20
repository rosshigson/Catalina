{{
'-------------------------------------------------------------------------------
'
'  Catalina_XMM_RamTest - A Memory Test program for XMM RAM.
'  
'  Load the program. It will print "To begin, Press key" and wait for a key
'  to be pressed. If the PRINT_FIRST option is enabled, it will then print an 
'  "SRAM:" banner and display the contents of XMM RAM, 16 longs at a time, and 
'  to proceed to the first test you must press N at the "More?" prompt. 
'
'  The first test simply reads/writes the first few locations of XMM RAM as 
'  a trivial test that it can read/write XMM RAM at all. This test should 
'  print a "TRIV:" banner, followed by a few lines like:
'
'     A 000000xx 000000xx DEADBEEF
'
'  Everything is ok if the first two values are the same, and the second value
'  is DEADBEEF, otherwise the program cannot read/write XMM RAM even when no 
'  paging is required. The test will continue in any case, but is doomed to 
'  fail.
'
'  The trivial test will print "Again?" when complete. Press Y to repeat the 
'  trivial test, or N to proceed to a more complex test. The program will
'  print the banner "CMPX:" and then proceed with the test. If it works,
'  the program will simply print "Complete" and then "Again?" to ask if you
'  want to repeat the test. Press Y to repeat the complex test, or N to 
'  proceed to the FLASH test (or to end the program, if the platform being
'  tested has no FLASH). 
'
'  In the complex test, the program initializes the RAM and repeatedly reads 
'  it back in each of multiple test passes. After each pass it will print 
'  "Complete". If any memory cells fail it will print "FAIL" and details of
'  each XMM memory failure. Note the XMM base address is not included in 
'  the address printed, so XMM address 00000000 is always the first XMM 
'  location. The base address of the XMM RAM must be set in Catalina_Common.
'
'  If you press a key in the middle of a pass, the program will print "Abort"
'  and abandon the current pass, and return to the "Again?" prompt.
'
'  Normally, the complex test prints nothing for successful passes, although
'  this can be modified by defining the PRINT_DETAIL or PRINT_PROGRESS 
'  options. But on detecting a memory failure the program prints:
'  
'      "FAIL XXXXXXXX=YYYYYYYY(ZZZZZZZZ)"
'
'  which means XMM address XXXXXXXX contained the value YYYYYYYY, and not 
'  the expected value of ZZZZZZZZ.
'
'  Note that once a memory location fails, it will fail every pass from then
'  on if the memory location has actually been corrupted. If you continue to 
'  test, more memory locations may fail. Note that even if the memory is 
'  faulty, it may take many passes to fail - it often depends on the size of 
'  the test. A test of a few hundred longs may take many dozens of passes to 
'  make a location fail, while a large test (more than a few thousand longs) 
'  may show a failure on the first pass. Set the number of bytes to include 
'  in the test using the RAM_SIZE constant.
'
'  A memory test of only a small number of longs may never fail - especially 
'  on page-based XMM systems where the problem is with the paging code and 
'  the number of longs is small enough that the program never needs to 
'  change the XMM page.
'
'  Note that the complex test also includes long writes, long reads and also 
'  page reads and writes - but a failure in a page read or write will only 
'  be detected during the next test pass - so you should always do at least 
'  two passes of the complex test.
'
'  The program normally uses XMM_ReadLong and XMM_WriteLong to access the
'  XMM RAM, but it can be configured to use XMM_ReadMult and XMM_WriteMult
'  instead, by defining one of the following for reads:
'     READ_LONG - use XMM_ReadMult with XMM_LEN = 4 
'     READ_WORD - use XMM_ReadMult with XMM_LEN = 2 
'     READ_BYTE - use XMM_ReadMult with XMM_LEN = 1 
'  and/or one of the following for writes:
'     WRITE_LONG - use XMM_WriteMult with XMM_LEN = 4 
'     WRITE_WORD - use XMM_WriteMult with XMM_LEN = 2 
'     WRITE_BYTE - use XMM_WriteMult with XMM_LEN = 1 
'
'  On platforms that support SPI FLASH, a Flash test is conducted after the
'  complex test. This test simply displays the contents of the Flash RAM in
'  blocks of 64 bytes (press Y to display another block at the "More?" prompt
'  or N to proceed to the next step) and then erases the whole flash (Again
'  displaying the contents). Then it writes to the first 512 bytes and then
'  displays the contents again. The whole test can be repeated at the final 
'  "Again?" prompt.
'
'  On platforms with multiple SRAM chips, a page write may fail if the page
'  overlaps the boundary between chips. This will show up as a failure in the
'  second iteration of the complex test. If this occurs, you can define the
'  symbol NO_OVERLAP to adjust the page size used. 
'
'  Is it recommended to use a PC terminal emulator for I/O (e.g. the Parallax 
'  Serial Terminal) so that the output is not lost as soon as it scrolls off 
'  the screen.
'
'   
' Version 2.5 - Add RamBlade support and minor tweaks to XMM code.
' Version 2.8 - Minor changes to the trivial test, and add support for SPI 
'               Ram on Morpheus and the C3. 
'
' Version 3.0 - Improve user interaction and messgaes for all tests.
'               Add a simple XMM RAM display prior to doing any testing -
'               very useful for diagnosing program or loader problems!
'
' Version 3.0.1 - Add the option of zeroing read/write XMM RAM before starting
'                 the RAM test - this must be enabled on compile by defining
'                 the symbol ZERO_RAM, and enabling this option also disables
'                 the initial display of XMM RAM.
'               - Add the option to dump only the contents of the FLASH when
'                 displaying XMM RAM on on startup. To enable this, define 
'                 the symbol PRINT_FLASH_ONLY.
'               - Added the ability to print continuously. To enable this,
'                 define the symbol PRINT_CONTINUOUS. Printing will continue 
'                 until a key is pressed instead of stopping after 16 bytes.
'
' Version 3.1 - Femove RESERVE_COG functionality. 
'               Added NO_OVERLAP and PRINT_FIRST
'               Fix bug in zero ram loop.
'
' Version 3.3 - Added ability to have XMM FLASH without having any XMM RAM 
'               (required to support the FLASHPOINT boards).
'               You can now specify whether to disable the RAM test test 
'               using the NO_RAM symbol. 
'               Improved the FLASH test - now writes at least 512 bytes.
'
' Version 3.5 - Correct code to no longer assume that XMM_Src and XMM_Dst are
'               preserved by all XMM access calls - when the caching driver
'               is used they are destroyed by some XMM functions.
'
' Version 3.6 - Use LF as line terminator, not CR LF. To reinstate the old
'               behaviour, define the symbol CR_ON_LF when compiling.
'
' Version 3.11 - Modified to fix 'order of compilation' issue with spinnaker
'
' Version 3.12 - Added the FILL_RAM option which fills RAM with FF between
'                each complex test iteraion. This tests writes more intensively.
'                Added the SDCARD option, which activates the SDCARD between
'                tests, to see if that disrupts XMM RAM access.
'
' Version 5.9  - Added READ_BYTE, WRITE_BYTE, READ_WORD, WRITE_WORD, READ_LONG
'                and WRITE_LONG options, to use XMM_ReadMult and XMM_WriteMult
'                using lengths or 1, 2 or 4 in place of XMM_ReadLong and 
'                XMM_WriteLong.
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
'-------------------------------------------------------------------------------
}}
CON
'
' various options can be defined here or on the program compile command line 
' (note on some platforms there is not enough room for some of the options!)
'
'#define INVERT 
'#define INTENSIVE
'#define NO_OVERLAP
'#define PRINT_PAGE
'#define PRINT_FIRST
'#define PRINT_INIT
'#define PRINT_DETAIL
'#define PRINT_PROGRESS
'#define PRINT_CONTINUOUS
'#define ZERO_RAM
'#define FILL_RAM
'#define SDCARD
'#define READ_BYTE
'#define READ_WORD
'#define READ_LONG
'#define WRITE_BYTE
'#define WRITE_WORD
'#define WRITE_LONG
'
' Set up Proxy, HMI and CACHE symbols and constants:
'
#include "Constants.inc"
'
' Specify number of LONGs for trivial test (same on all platforms):
'
TRIVIAL_SIZE = $10 
'
' Make sure NO_RAM is not specified without FLASH (otherwise nothing to do!):
'
#ifndef FLASH
#ifdef NO_RAM
#error : NO_RAM CANNOT BE SPECIFIED WITHOUT FLASH!
#endif
#endif
'
' FLASH always requires the CACHE to be enabled:
'
#ifdef FLASH
#ifndef CACHED
#error : FLASH REQUIRES CACHE OPTION (CACHED_1K .. CACHED_8K or CACHED)
#endif
#endif

#ifdef NO_OVERLAP
PAGE_SIZE  = 32     ' number of BYTEs in page for testing page read/write 
                    ' NOTE: this page size will not cross a chip boundary.
#else
PAGE_SIZE  = 31     ' number of BYTEs in page for testing page read/write 
                    ' NOTE: this is best if a prime number, but if this page
                    ' size causes a page to span multiple SRAM chips, then 
                    ' the complex memory test will fail. In that case, this
                    ' should be set to a number that will not cross a chip
                    ' address boundary (e.g. 16, 32, 128, 256 etc).
#endif

#ifndef NO_RAM
PAGES      = Common#XMM_RW_SIZE / PAGE_SIZE ' number of pages to read/write
#endif

LMM_HMI    = Common#LMM_HMI
LMM_FIL    = Common#LMM_FIL

#ifndef NO_RAM
RAM_SIZE   = Common#XMM_RW_SIZE   ' Size of R/W RAM - must be EVEN 
#endif

#ifdef FLASH
FLASH_SIZE = Common#XMM_RO_SIZE   ' size of FLASH RAM
#endif

'-------------------------------------------------------------------------------

OBJ
   Common : "Catalina_Common"

PUB Run(Xfer_Buffer, Page_Buffer) | Reg, Xfer, Page
'
' Initiate the XMM Tester 
'

  Reg    := Common#REGISTRY
  Xfer   := Xfer_Buffer
  Page   := Page_Buffer

  coginit(cogid, @entry, @Reg)

DAT
        org 0

entry
        mov    r0,par           ' point to parameters
        rdlong reg_addr,r0      ' get registry address
        add    r0,#4
        rdlong xfer_addr,r0     ' get xfer buffer address
        add    r0,#4
        rdlong page_addr,r0     ' get page buffer address

        call   #XMM_Activate    ' Set up the XMM hardware

        call   #delay_2sec
        call   #HMI_KeyClear

        mov    r2, #begin_str
        call   #HMI_String
        call   #press_a_key

#ifndef NO_RAM

#ifdef ZERO_RAM

'
' initialize all XMM RAM longs to zero
'
        mov    Count,CmplxSize
        mov    Addr,#0
        mov    Data,#0
zero_loop
        mov    XMM_Addr,Addr
        add    Addr,#4
        call   #WriteLong
        djnz   Count,#zero_loop
#endif

#ifdef PRINT_FIRST

'
' ram display - just display XMM RAM (useful for diagnosing load problems!)
'
ram_display
        mov    r2,#ram_str
        call   #HMI_String
ram_loop
#ifdef PRINT_FLASH_ONLY
        mov    XMM_Addr,flash_zero
#else
        mov    XMM_Addr,#0
#endif
        call   #print_xmm_page

        mov    r2,#again_str
        call   #HMI_String            
        call   #test_for_y
  if_z  jmp    #ram_loop

#endif

#endif
  
#ifndef NO_RAM
'
' trivial test to make sure read/write is working at all (no paging required)
'
trivial_test
        mov    r2, #trivial_str
        call   #HMI_String
        mov    Count,TrivSize
        mov    Addr,#0
trivial_loop
        mov    r2,#"A"
        call   #HMI_Char        
        call   #HMI_Space       
        mov    Data,Addr
        mov    XMM_Addr,Addr
        mov    r2,XMM_Addr
        call   #HMI_Hex         
        call   #HMI_Space       
        call   #WriteLong
#ifdef SDCARD
        call   #Sector_Read
#endif
        mov    Data,#0
        mov    XMM_Addr,Addr
        call   #ReadLong
        mov    r2,Data
        call   #HMI_Hex         
        call   #HMI_Space       
        mov    Data,TestVal
        mov    XMM_Addr,Addr
        call   #WriteLong
        mov    Data,#0
        mov    XMM_Addr,Addr
        call   #ReadLong
#ifdef SDCARD
        call   #Sector_Read
#endif
        mov    r2,Data
        call   #HMI_Hex         
        call   #HMI_Space       
        call   #HMI_EOL
        add    Addr,#4
        djnz   Count,#trivial_loop

trivial_again
        mov    r2,#again_str
        call   #HMI_String
        call   #test_for_y
   if_z jmp    #trivial_test

'   
' complex test - test all RAM by writing and reading all longs, and all pages
'
complex_test
        mov    r2, #complex_str
        call   #HMI_String

#ifdef FILL_RAM

complex_loop

        mov    Count,CmplxSize
        mov    Addr,#0
        neg    Data,#1
zero_loop
        mov    XMM_Addr,Addr
        add    Addr,#4
        call   #WriteLong
        djnz   Count,#zero_loop

#endif

' code to initializa all RAM longs with test data
        mov    Count,CmplxSize
        mov    Addr,#0
init_loop
        call   #Calc_XMM_Addr
#ifdef INVERT
' enable this code to invert the contents of RAM - may help uncover memory problems
        neg    Data,Count
#else
        mov    Data,Count
#endif        
        call   #WriteLong
        add    Addr,#4
        djnz   Count,#init_loop
        
#ifdef PRINT_INIT
' enable this code to print the value assigned to each memory cell 
' (AFTER initialization)
        mov    Addr,CmplxSize
        shl    Addr,#2
        mov    Count,CmplxSize

init_loop_2
        sub    Addr,#4
#ifdef INVERT        
        neg    Data,Count
#else
        mov    Data,Count
#endif
        mov    XMM_Addr,Addr        
        call   #ReadLong
        mov    r2,#"C"           
        call   #HMI_Char        
        call   #HMI_Space       
        mov    r2,Addr
        call   #HMI_Hex         
        call   #HMI_Space       
        mov    r2,Data
        call   #HMI_Hex         
        call   #HMI_EOL        
        djnz   Count,#init_loop_2
        call   #press_a_key        
#endif

#ifndef FILL_RAM

complex_loop

#endif

#ifdef INTENSIVE
' enable this code to read longs more intensively during each test pass 
' (may help uncover memory problems)
        mov    Count,CmplxSize
        mov    Addr,#0
stress_test
        call   #Calc_XMM_Addr
        call   #ReadLong
        add    Addr,#4
        djnz   Count, #stress_test
#endif

        mov    Count,CmplxSize
        mov    Addr,#0
'
' complex_read - read and compare all values
'
complex_read
        call   #Calc_XMM_Addr
        call   #ReadLong
#ifdef INVERT        
        neg    Value,Count
#else
        mov    Value,Count
#endif        
        cmp    Data,Value wz
 if_nz  jmp    #complex_fail        

complex_ok
#ifdef PRINT_DETAIL
' enable this code to print the actual value read on each successful comparison
        mov    r2,#pass_str
        call   #HMI_String       
        jmp    #complex_print
#elseifdef PRINT_PROGRESS        
' enable this code to just print a '.' for each successful comparison       
        mov    r2,#"."               
        call   #HMI_Char            
#endif
        jmp    #complex_next

complex_fail
        mov    r2,#fail_str
        call   #HMI_String
complex_print        
        call   #HMI_Space                   
        mov    r2,Addr
        call   #HMI_Hex                     
        mov    r2,#"="
        call   #HMI_Char                    
        mov    r2,Data
        call   #HMI_Hex                     
        mov    r2,#"("
        call   #HMI_Char                    
        mov    r2,Value
        call   #HMI_Hex                     
        mov    r2,#")"
        call   #HMI_Char                    
        call   #HMI_EOL                    

complex_next
        add    Addr,#4
        call   #HMI_KeyReady
        tjnz   r0,#complex_abort
        djnz   Count,#complex_read

complex_pass
        mov    r4,page_count
        mov    r5,#0        

:page_loop
        mov    XMM_Addr,r5
        mov    Hub_Addr,page_addr
        mov    XMM_Len,max_page 
        call   #XMM_ReadPage

#ifdef PRINT_PAGE
' enable this code to print the page read as LONGS, and then as read as a PAGE
' NOTE: If you enable this code, make sure PAGE_SIZE is an exact number of 
' LONGS! 
        mov    XMM_Addr,r5
        mov    r3,max_page
        shr    r3,#2
        add    r3,#1
:long_print
        movd   XMM_Dst,#r2
        call   #XMM_ReadLong
        call   #HMI_Hex                     
        mov    r2,#" "
        call   #HMI_Char
        djnz   r3,#:long_print                    
        call   #HMI_EOL                    
'
        mov    Hub_Addr,page_addr
        mov    r3,max_page
        shr    r3,#2
        add    r3,#1
:page_print
        rdlong r2,Hub_Addr
        call   #HMI_Hex                     
        mov    r2,#" "
        call   #HMI_Char
        add    Hub_Addr,#4
        djnz   r3,#:page_print                    
        call   #HMI_EOL                    
        call   #HMI_EOL                    
        call   #HMI_KeyGet
#endif

        mov    r2,r5
        mov    r3,max_page
        mov    r0,#0
:zero_page               
        mov    XMM_Addr,r2
        movs   XMM_Src,#r0
        mov    XMM_Len,#1
        call   #XMM_WriteMult
        add    r2,#1
        djnz   r3,#:zero_page
        
        mov    XMM_Addr,r5
        mov    Hub_Addr,page_addr
        mov    XMM_Len,max_page 
        call   #XMM_WritePage
        add    r5,max_page
        djnz   r4,#:page_loop

        mov    r2,#done_str
        call   #HMI_String        
        jmp    #complex_again

complex_abort       
        mov    r2,#abort_str
        call   #HMI_String            
        call   #HMI_KeyGet       ' consume key that caused abort

complex_again
        mov    r2,#again_str
        call   #HMI_String            
        call   #test_for_y
  if_z  jmp    #complex_loop
'  
#endif

#ifdef FLASH
'
' flash test - test read/write of SPI Flash 
'              (only enabled when Caching is in use!)
'
flash_test
        mov    r2,#flash_str
        call   #HMI_String
flash_loop
        mov    XMM_Addr,FlashAddr
        call   #print_xmm_page
        mov    r2,#erase_str
        call   #HMI_String
        call   #XMM_FlashErase
        mov    XMM_Addr,FlashAddr
        call   #print_xmm_page

        mov    r2,#write_str
        call   #HMI_String

        mov    r4,#0
        mov    r5,#(512/PAGE_SIZE + 1) ' program at least 512 longs!
        mov    r6,#$ff

:flash_pages
        mov    r1,page_addr
        mov    r2,max_page
:fill_page
        wrbyte r6,r1
        sub    r6,#1
        add    r1,#1
        djnz   r2,#:fill_page
        mov    r0,xfer_addr
        wrlong page_addr,r0
        add    r0,#4
        wrlong max_page,r0
        add    r0,#4
        wrlong r4,r0
        mov    Hub_Addr,xfer_addr
        call   #XMM_FlashWrite
        add    r4,max_page
        djnz   r5,#:flash_pages

        mov    XMM_Addr,FlashAddr
        call   #print_xmm_page

        mov    r2,#again_str
        call   #HMI_String            
        call   #test_for_y
  if_z  jmp    #flash_loop
  
#endif
        mov    r2,#boot_str
        call   #HMI_String
        call   #press_a_key
        mov    r0,#$80           ' reboot
        clkset r0
'
' print_xmm_page - print address and 16 longs (64 bytes) of 
'                  XMM RAM (addr in XMM_Addr) to screen,
'                  continue until told to stop (or a key 
'                  is pressed, if in PRINT_CONTINUOUS mode)
'
print_xmm_page
        mov    r2,#addr_str
        call   #HMI_String
        mov    r2,XMM_Addr
        call   #HMI_Hex
        call   #HMI_EOL
        mov    r3,#4
print_loop1        
        mov    r4,#4
print_loop2        
        movd   XMM_Dst,#r2
        call   #XMM_ReadLong
        call   #HMI_Hex
        call   #HMI_Space         
        djnz   r4,#print_loop2
        call   #HMI_EOL
        djnz   r3,#print_loop1
#ifdef PRINT_CONTINUOUS
        call   #HMI_KeyReady
        cmp    r0,#0 wz
 if_z   jmp    #print_xmm_page
        call   #HMI_KeyGet
#else
        mov    r2,#more_str
        call   #HMI_String            
        call   #test_for_y
 if_z   jmp    #print_xmm_page
#endif
print_xmm_page_ret
        ret        
'        
'
' press_a_key - press any key to continue
'
press_a_key
        mov    r2,#press_key_str
        call   #HMI_String        
        call   #HMI_KeyGet
press_a_key_ret
        ret
'
' test for "Y" or "y" pressed - return Z set if so
'        
test_for_y        
        call   #HMI_KeyGet
        mov    r2,r0
        mov    r3,r0                        
        call   #HMI_Char                    
        call   #HMI_EOL
        cmp    r3, #"Y" wz
  if_nz cmp    r3, #"y" wz
test_for_y_ret
        ret

' read multiple bytes to MulTmp
ReadMult
        movd   XMM_Dst,#MultTmp
        call   #XMM_ReadMult
ReadMult_ret
        ret
' write multiple bytes from MultTmp
WriteMult
        movs   XMM_Src,#MultTmp
        call   #XMM_WriteMult
WriteMult_ret
        ret
' read long from XMM_Addr to Data, using XMM_ReadMult or XMM_ReadLong
ReadLong
#ifdef READ_BYTE
        mov    XMM_Len,#1
        call   #ReadMult
        mov    Data,MultTmp
        mov    XMM_Len,#1
        call   #ReadMult
        shl    MultTmp,#8
        or     Data,MultTmp
        mov    XMM_Len,#1
        call   #ReadMult
        shl    MultTmp,#16
        or     Data,MultTmp
        mov    XMM_Len,#1
        call   #ReadMult
        shl    MultTmp,#24
        or     Data,MultTmp
#elseifdef READ_WORD
        mov    XMM_Len,#2
        call   #ReadMult
        mov    Data,MultTmp
        mov    XMM_Len,#2
        call   #ReadMult
        shl    MultTmp,#16
        or     Data,MultTmp
#elseifdef READ_LONG
        movd   XMM_Dst,#Data
        mov    XMM_Len,#4
        call   #XMM_ReadMult
#else
        movd   XMM_Dst,#Data
        call   #XMM_ReadLong
#endif
ReadLong_ret
        ret

' write the long in Data to XMM_Addr, using XMM_WriteMult or XMM_WriteLong
WriteLong
#ifdef WRITE_BYTE
        mov    MultTmp,Data
        mov    XMM_Len,#1
        call   #WriteMult
        mov    MultTmp,Data
        shr    MultTmp,#8
        mov    XMM_Len,#1
        call   #WriteMult
        mov    MultTmp,Data
        shr    MultTmp,#16
        mov    XMM_Len,#1
        call   #WriteMult
        mov    MultTmp,Data
        shr    MultTmp,#24
        mov    XMM_Len,#1
        call   #WriteMult
#elseifdef WRITE_WORD
        mov    MultTmp,Data
        mov    XMM_Len,#2
        call   #WriteMult
        mov    MultTmp,Data
        shr    MultTmp,#16
        mov    XMM_Len,#2
        call   #WriteMult
#elseifdef WRITE_LONG
        movs   XMM_Src,#Data
        mov    XMM_Len,#4
        call   #XMM_WriteMult
#else
        movs   XMM_Src,#Data
        call   #XMM_WriteLong
#endif
WriteLong_ret
        ret

MultTmp long 0

'-------------------------------- Test variables -------------------------------

#ifndef NO_RAM

TrivSize  long  TRIVIAL_SIZE     ' size of trivial test (longs)

CmplxSize long  RAM_SIZE/4       ' number of XMM longs to test - must be even!

#endif

#ifdef FLASH

FlashAddr long  Common#XMM_RO_BASE_ADDRESS - Common#HUB_SIZE
FlashSize long  FLASH_SIZE       ' size of FLASH RAM

#endif        

Data     long  $0000_0000        ' actual value read/written
Value    long  $0000_0000        ' value expected

Count    long  0
Addr     long  0        

Delay1   long  80_000_000
TestVal  long  $DEADBEEF 

#ifdef PRINT_FLASH_ONLY
flash_zero  long  Common#XMM_RO_BASE_ADDRESS - Common#XMM_RW_BASE_ADDRESS
#endif

#ifndef NO_RAM
'-------------------------------- Utility routines -----------------------------
'
' Calc_XMM_Addr - calculate interleaving addresses to force many XMM memory
'                 page changes - i.e. we end up with an interleaved memory 
'                 usage pattern like the following:
'
'                    (for 10 cells): 0,9,2,7,4,5,6,3,8
'
Calc_XMM_Addr
        test Addr,#%0000_00100 wz  ' odd address?
 if_z   jmp #Calc_Even
        mov  r0,CmplxSize
        shl  r0,#2
        sub  r0,Addr
        mov  XMM_Addr,r0
        jmp  #Calc_Print
Calc_Even
        mov  XMM_Addr,Addr
Calc_Print
{
' enable this code to print the actual interleaved XMM address used for each
' nominal address                
        mov    r2,XMM_Addr
        call   #HMI_Hex                    
        call   #HMI_Space                  
}        
Calc_XMM_Addr_ret
        ret

#endif

' delay one second
delay_1sec        
        mov    r1,cnt           
        add    r1,Delay1
        waitcnt r1,#0
delay_1sec_ret

' delay two seconds
delay_2sec
        call   #delay_1sec        
        call   #delay_1sec        
delay_2sec_ret
        ret
        
'-------------------------------- Plugin Routines -------------------------------

' Send_Command - send a request to a Plugin for execution
' On Entry
'          r0 = plugin
'          r1 = command
'          r2 = data
'
Send_Command

#ifdef SHARED_XMM
        call    #XMM_Tristate   ' disable XMM while using HMI
#endif

        shl     r1,#24          ' construct ...  
        and     r2,Low24        ' ... 
        or      r2,r1           ' ... request

        mov     ftemp,reg_addr  ' point to registry
        mov     ftmp2,#0        ' start at cog 0
send1
        cmp     ftmp2,#8 wc,wz  ' run out of plugins?
 if_ae  jmp     #sendErr        ' yes - no such plugin
        rdlong  ftmp3,ftemp     ' no - check next plugin type
        shr     ftmp3,#24       ' is it ...
        cmp     ftmp3,r0 wz     ' ... the type what we wanted?
 if_z   jmp     #send2          ' yes - use this plugin
        add     ftmp2,#1        ' no ...
        add     ftemp,#4        ' ... check ...
        jmp     #send1          ' ... next cog
send2
        mov     r0,ftmp2        ' use the cog where we found the plugin
        shl     r0,#2           ' multiply plugin (cog) id by 4 ...
        add     r0,reg_addr     ' add registry base to get registry entry
        rdlong  r0,r0           ' get request block from registry
        test    r0,top8 wz      ' plugin registered?
 if_z   jmp     #sendErr        ' no - return error
        and     r0,low24        ' yes - write request ...
        wrlong  r2,r0           ' ... to request block
loop2   rdlong  r2,r0   wz      ' wait till ...
 if_nz  jmp     #loop2          ' ... request completed
        add     r0,#4           ' get results ...
        rdlong  r0,r0           ' ... from request block
        jmp     #sendDone
sendErr
        neg     r0,#1           ' return -1 on any error
sendDone

#ifdef SHARED_XMM
        call    #XMM_Activate   ' enable XMM again
#endif

        jmp     #Send_Command_ret
Send_Command_ret
HMI_XferCmd_ret
        ret
        
top8    long    $FF000000
low24   long    $00FFFFFF

ftemp   long    $0
ftmp2   long    $0
ftmp3   long    $0

' HMI_XferCmd - send a short request to HMI Plugin for execution
'               using an xfer block to hold the data
' On Entry
'          r1 = command
'          r2 = data
'
HMI_XferCmd
        wrlong r2,xfer_addr     ' put data in xfer block
        mov    r2,xfer_addr     ' use xfer block as data
        or     r2,cursor
        mov    r0,#LMM_HMI
        jmp    #Send_Command    ' then same as short command
'
' HMI_KeyReady - see if key (return in r0, or 0 if not ready)
'
HMI_KeyReady
        mov    r1,#5                         
        call   #HMI_XferCmd                  
HMI_KeyReady_ret
        ret
'
' HMI_KeyClear - see Clear Keyboard
'
HMI_KeyClear
        mov    r1,#6                         
        call   #HMI_XferCmd                  
HMI_KeyClear_ret
        ret
'
' HMI_KeyGet - get a key (return in r0).
' This used to call the HMI function, but that function has now been removed
' due to lack of space in the HMI plugins.
'
HMI_KeyGet
        call   #HMI_KeyReady
        tjz    r0,#HMI_KeyGet
        mov    r1,#2                         
        call   #HMI_XferCmd                  
HMI_KeyGet_ret
        ret
'
' HMI_Hex - print r2 as 8 hex digits
'        
HMI_Hex
        mov     number,r2      
        mov     digits,#8       ' print 8 digits
:t_hex1
        rol     number,#4       ' convert 4 bits ...
        mov     r2,number       ' ... to '0' .. '9'
        and     r2,#$f          ' ... or ...
        cmp     r2,#10 wc,wz    ' ... 'A' .. 'F' ...
 if_ae  add     r2,#($41-$30-10)' ... depending ...
        add     r2,#$30         ' ... on the digit value
        call    #HMI_Char       ' write char to screen
        djnz    digits,#:t_hex1 ' continue with next digit
HMI_Hex_ret
        ret
digits long 0
number long 0
'
'
' HMI_Char - send a char (char in r2)
'
HMI_Char
        mov    r1,#22
        or     r2,cursor
        mov    r0,#LMM_HMI
        call   #Send_Command                  
HMI_Char_ret
        ret
'
' HMI_Space - send a space
'
HMI_Space
        mov    r2,#32                        
        call   #HMI_Char                     
HMI_Space_ret
        ret
'
' HMI_EOL - send EOL (LF)
'
HMI_EOL
        mov    r2,#10                        
        call   #HMI_Char                     
HMI_EOL_ret
        ret
'
'
' HMI_String - send a String (null terminated string at cog address in r2)
'
HMI_String
        movs   :HMI_St,r2
:HMI_Lp mov    r3,#4
:HMI_St mov    HMI_Tmp,0-0
:HMI_Ch mov    r2,HMI_Tmp
        and    r2,#$FF wz
   if_z jmp    #HMI_String_ret
        call   #HMI_Char
        shr    HMI_Tmp,#8
        djnz   r3,#:HMI_Ch
        add    :HMI_St,#1
        jmp    #:HMI_Lp                     
HMI_String_ret
        ret
'        
HMI_Tmp long 0                
'
#ifdef SDCARD
'
' read a sector (sector number in sector)
'
Sector_Read
        mov    r0,#LMM_FIL      ' SD Card Plugin
        mov    r1,#2            ' SD_Read
        mov    r2,xfer_addr
        wrlong buffer,r2        ' put buffer addr in xfer block
        add    r2,#4            ' put ...
        wrlong sector,r2        ' ... sector in xfer block
        sub    r2,#4
        call   #Send_Command
Sector_Read_ret
        ret
'
buffer  long   Common#FLIST_BUFF
sector  long   $0
'
#endif        
'
'------------------------------- Common Variables ------------------------------
'
r0            long      $0
r1            long      $0
r2            long      $0
r3            long      $0
r4            long      $0
r5            long      $0
r6            long      $0

reg_addr      long      $0
xfer_addr     long      $0
page_addr     long      $0
max_page      long      PAGE_SIZE

#ifndef NO_RAM
page_count    long      PAGES
#endif

src_addr      long      $0
dst_addr      long      $0
end_addr      long      $0

cursor        long      1<<23   ' use cursor 1 (srcolls and has visible cursor)
'
begin_str     byte      "To begin, ",0
              long      ' align long
trivial_str   byte      "TRIV:",10,0
              long      ' align long
complex_str   byte      "CMPX:",10,0
              long      ' align long
flash_str     byte      "FLASH:",10,0
              long      ' align long
ram_str       byte      "SRAM:",10,0
              long      ' align long
again_str     byte      "Again? ",0
              long      ' align long
more_str      byte      "More? ",0
              long      ' align long
done_str      byte      "Complete",10,0
              long      ' align long
abort_str     byte      "Abort!",10,0
              long      ' align long
pass_str      byte      "Passed",0
              long      ' align long
fail_str      byte      "Failed",0
              long      ' align long
erase_str     byte      "Erasing...",10,0
              long      ' align long
write_str     byte      "Writing...",10,0
              long      ' align long
addr_str      byte      "Address ",0
              long      ' align long
boot_str      byte      "Finished - ",0
              long      ' align long
press_key_str byte      "Press key",10,0
              long      ' align long
'
'=============================== XMM SUPPORT CODE ==============================
'
' The following defines determine which XMM functions are included - comment 
' out the appropriate lines to exclude the corresponding XMM function:
'
#define NEED_XMM_READLONG
#define NEED_XMM_WRITELONG
#define NEED_XMM_READPAGE
#define NEED_XMM_WRITEPAGE
#define ACTIVATE_INITS_XMM      ' the HX512 does not allow this in the Kernel
'
#define NEED_XMM_FLASHERASE
#define NEED_XMM_FLASHWRITE
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
