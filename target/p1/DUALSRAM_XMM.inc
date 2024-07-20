'Segment Is DUALSRAM_XMM.INC
'Dual SRAM Memory Driver For Prop1
'Last Revision On 11Jul23

'===============================================================================
{
' The XMM functions included are controlled via Catalina symbols defined 
' internally as required within various Catalina files:
'
'   CACHED             : defined if CACHE in use (any size)
'
'   NEED_FLASH         : defined if FLASH support required
'
'   NEED_XMM_READLONG  : defined if XMM_ReadLong (and XMM_ReadMult) required
'
'   NEED_XMM_WRITELONG : defined if XMM_WriteLong (and XMM_WriteMult) required
'
'   NEED_XMM_READPAGE  : defined if XMM_ReadPage required
'
'   NEED_XMM_WRITEPAGE : defined if XMM_WritePage required
}
'=============================== CACHE CHECK ===================================
'
' If this platform does not need the cache enabled, delete the following:
'
'#ifndef CACHED
'#error : PLATFORM REQUIRES CACHE OPTION (CACHED_1K .. CACHED_8K or CACHED)
'#endif
'
'====================================== FLASH CHECK ==========================================
'
' If this platform has FLASH RAM, delete the following:
'
'#ifdef NEED_FLASH
'#error : FLASH NOT SUPPORTED ON THIS PLATFORM
'#endif
'
'=============================CONSTANTS FOR THIS CONFIGURATION================================

CON

Ram_CS_Pin         =  27
Ram_CLK_Pin        =  26

Ram_D7_Pin         =  25  'SRAM1 D3 --> HOLD
Ram_D6_Pin         =  24  'SRAM1 D2 --> DNU
Ram_D5_Pin         =  23  'SRAM1 D1 --> SO
Ram_D4_Pin         =  22  'SRAM1 D0 --> SI
Ram_D3_Pin         =  21  'SRAM2 D3 --> HOLD
Ram_D2_Pin         =  20  'SRAM2 D2 --> DNU
Ram_D1_Pin         =  19  'SRAM2 D1 --> SO
Ram_D0_Pin         =  18  'SRAM2 D0 --> SI

Ram_CLK            =  (|< Ram_CLK_Pin)

Ram_CS             =  (|< Ram_CS_Pin)

Ram_HOLD           =  (|< Ram_D7_Pin) | (|< Ram_D3_Pin)

Ram_DNU            =  (|< Ram_D6_Pin) | (|< Ram_D2_Pin)

Ram_SO             =  (|< Ram_D5_Pin) | (|< Ram_D1_Pin)

Ram_SI             =  (|< Ram_D4_Pin) | (|< Ram_D0_Pin)

Ram_Bus            =  Ram_HOLD | Ram_DNU | Ram_SO | Ram_SI

Ram_CS_CLK_SI_HOLD =  Ram_CS | Ram_CLK | Ram_SI | Ram_HOLD

Ram_CS_SI_HOLD     =  Ram_CS | Ram_SI | Ram_HOLD

Ram_CS_CLK_SI      =  Ram_CS | Ram_CLK | Ram_SI

Ram_Cs_Clk_Bus     =  Ram_CS | Ram_CLK | Ram_Bus

WaitClk            =  $02

RamRead            =  $03

RamWrite           =  $02

QuadEnter          =  $38

QuadExit           =  $FF

QuadEnterRev       =  QuadEnter >< 8

DAT

'====================================== MINIMAL API FUNCTIONS =====================================

'---------------------------------------XMM_ACTIVATE FUNCTION--------------------------------------
'14 longs
XMM_Activate                   or  dira,RamCsClkSiHold          'RamCS=O,RamCLK=O,RamSI=O,RamHOLD=O
                               or  outa,RamCsSiHold             'RamCS=H,RamCLK=L,RamSI=H,RamHOLD=H
                              mov  RamLoop,#08                  'RamLoop=0x08
:QuadLoop                    andn  outa,RamCsClkSi              'RamCS=L,RamCLK=L,RamSI=L,RamHOLD=H
                              mov  RamData,#QuadEnterRev        'RamData=QuadEnterRev
                              shl  RamData,RamLoop              'RamData=RamData << 0x08
                              and  RamData,#$100                'RamData=RamData & 0x100
                              tjz  RamData,#:QuadClk            'if(RamData == 0) goto QuadClk
                               or  outa,RamBus                  'RamSI=H
:QuadClk                       or  outa,RamCLK                  'RamCLK=H
                             djnz  RamLoop,#:QuadLoop           'if(--RamLoop) goto QuadLoop
                             andn  outa,RamCsClkBus             'RamCS=L,RamCLK=L,RamSI=L
                               or  outa,RamCS                   'RamCS=H
XMM_Activate_ret              ret                               'Return

'-----------------------------------------XMM_TRISTATE FUNCTION------------------------------------
'2 longs
XMM_TriState                  nop
XMM_TriState_ret              ret                               'Return

'----------------------------Send Read Or Write Memory Request To SRAM-----------------------------
'17 longs
SendRamMemReq                 mov  RamLoop,#08                  'RamLoop=0x08
                              shl  RamData,#24                  'RamData=RamData << 24
                               or  RamData,XMM_Addr             'RamData=RamData | XMM_Addr
                               or  dira,RamBus                  'RamBus=OOOOOOOO
:MemLoop                     andn  outa,RamCsClkBus             'RamCS=L,RamCLK=L,RamBus=LLLLLLLL
                              rol  RamData,#04                  'RamData=RamData <- 0x04
                              mov  RamTemp,RamData              'RamTemp=RamData
                              and  RamTemp,#$0F                 'RamTemp=RamTemp & 0x0f
                              mov  RamCopy,RamTemp              'RamCopy=RamTemp
                              shl  RamTemp,#04                  'RamTemp=RamTemp << 0x04
                               or  RamCopy,RamTemp              'RamCopy=RamCopy | RamTemp
                              shl  RamCopy,#Ram_D0_Pin          'RamCopy=RamCopy << Ram_D0_Pin
                               or  outa,RamCopy                 'RamBus=RamCopy
                               or  outa,RamCLK                  'RamCLK=H
                             djnz  RamLoop,#:MemLoop            'if(--RamLoop) goto MemLoop
                             andn  outa,RamCsClkBus             'RamCS=L,RamCLK=L,RamBus=LLLLLLLL
SendRamMemReq_ret             ret                               'Return


'==================================== DIRECT API FUNCTIONS ========================================

'--------------------------XMM_WriteLong & XMM_WriteMult (Cog -> XMM)------------------------------
'17 longs          
#ifdef NEED_XMM_WRITELONG

XMM_WriteLong                
XMM_WriteMult                mov   RamData,#RamWrite            'RamData=RamWrite
                            call   #SendRamMemReq               'Send Memory Write Request
                             add   XMM_Addr,XMM_Len             'XMM_Addr=XMM_Addr + XMM_Len
XMM_Src                      mov   RamData,0-0                  'CogRam -> RamData
:WriteLoop                  andn   outa,RamCsClkBus             'RamCS=L,RamCLK=L,RamBus=LLLLLLLL
                             mov   RamCopy,RamData              'RamCopy=RamData
                             and   RamCopy,#$FF                 'RamCopy=RamCopy & 0xff
                             shl   RamCopy,#Ram_D0_Pin          'RamCopy=RamCopy << Ram_D0_Pin
                              or   outa,RamCopy                 'RamBus=RamCopy
                              or   outa,RamCLK                  'RamCLK=H \
                            andn   outa,RamCLK                  'RamCLK=L  \_Required For Quad Mode
                              or   outa,RamCLK                  'RamCLK=H  /
                             shr   RamData,#08                  'RamData=RamData >> 0x08
                            djnz   XMM_Len,#:WriteLoop          'if(--XMM_Len) goto WriteLoop
                            andn   outa,RamCsClkBus             'RamCS=L,RamCLK=L,RamBus=LLLLLLLL
                              or   outa,RamCS                   'RamCS=H
XMM_WriteMult_ret
XMM_WriteLong_ret            ret                                'Return                             

#endif 

'---------------------------XMM_ReadLong & XMM_ReadMult (XMM -> Cog)-------------------------------
'23 longs
#ifdef NEED_XMM_READLONG

XMM_ReadLong                 
XMM_ReadMult                 mov   RamData,#RamRead             'RamData=ReadCmd
                            call   #SendRamMemReq               'Send Memory Read Request
                            andn   dira,RamBus                  'RamBus=IIIIIIII
                             mov   RamData,#WaitClk             'RamData=0x02
:WaitLoop                     or   outa,RamCLK                  'RamCLK=H
                            andn   outa,RamCLK                  'RamCLK=L
                            djnz   RamData,#:WaitLoop           'if(--RamData) goto WaitLoop
                             add   XMM_Addr,XMM_Len             'XMM_Addr=XMM_Addr + XMM_Len
                             mov   RamTemp,#0                   'RamTemp=0x00
:ReadLoop                    mov   RamCopy,ina                  'RamCopy=RamBus
                             shr   RamCopy,#Ram_D0_Pin          'RamCopy=RamCopy >> Ram_D0_Pin
                             and   RamCopy,#$FF                 'RamCopy=RamCopy & 0xff
                              or   outa,RamCLK                  'RamCLK=H \
                            andn   outa,RamCLK                  'RamCLK=L  \_Required For Quad Mode
                              or   outa,RamCLK                  'RamCLK=H  /
                            andn   outa,RamCLK                  'RamCLK=L /
                             shl   RamCopy,RamTemp              'RamCopy=RamCopy << RamTemp
                              or   RamData,RamCopy              'RamData=RamData | RamCopy
                             add   RamTemp,#08                  'RamTemp=RamTemp + 0x08
                            djnz   XMM_Len,#:ReadLoop           'if(--XMM_Len) goto ReadLoop
XMM_Dst                      mov   0-0,RamData                  'XMM_Dst=RamData
                              or   outa,RamCS                   'RamCS=H
XMM_ReadMult_ret
XMM_ReadLong_ret             ret                                'Return                         

#endif

'====================================XMM MEMORY CACHING FUNCTIONS==================================

'----------------------------XMM_WRITEPAGE FUNCTION (HubRam -> XMM)--------------------------------

#ifdef NEED_XMM_WRITEPAGE
'16 longs
XMM_WritePage               andn  outa,RamCS                    'RamCS=Lo (SRAM Active)
                             mov  RamData,#RamWrite             'RamData=RamWrite
                            call  #SendRamMemReq                'Send Memory Write Request
                             add  XMM_Addr,XMM_Len              'XMM_Addr=XMM_Addr + XMM_Len
:HubData                    andn  outa,RamCsClkBus              'RamCS=L,RamCLK=L,RamBus=LLLLLLLL
                          rdbyte  RamData,Hub_Addr              'HubRam -> RamData
                             shl  RamData,#Ram_D0_Pin           'RamData=RamData << Ram_D0_Pin
                              or  outa,RamData                  'RamBus=RamData                            
                              or  outa,RamCLK                   'RamCLK=H \
                            andn  outa,RamCLK                   'RamCLK=L  \_Required For Quad Mode
                              or  outa,RamCLK                   'RamCLK=H  /
                            andn  outa,RamCLK                   'RamCLK=L /
                             add  Hub_Addr,#01                  'Hub_Addr=Hub_Addr + 1
                            djnz  XMM_Len,#:HubData             'if(--XMM_Len) goto HubData
                              or  outa,RamCS                    'RamCS=Hi (SRAM Inactive)
XMM_WritePage_ret            ret                                'Return

#endif

'----------------------------XMM_READPAGE FUNCTION (XMM -> HubRam)---------------------------------

#ifdef NEED_XMM_READPAGE
'21 longs
XMM_ReadPage                andn  outa,RamCS                    'RamCS=L (SRAM Active)
                             mov  RamData,#RamRead              'RamData=RamRead
                            call  #SendRamMemReq                'Send Memory Read Request
                            andn  dira,RamBus                   'RamBus=IIIIIIII
                             mov  RamData,#WaitClk              'RamData=WaitClk
:WaitLoop                     or  outa,RamCLK                   'RamCLK=H 
                            andn  outa,RamCLK                   'RamCLK=L
                            djnz  RamData,#:WaitLoop            'if(--RamData) goto WaitLoop
                             add  XMM_Addr,XMM_Len              'XMM_Addr=XMM_Addr + XMM_Len
:XmmData                     mov  RamData,ina                   'RamData=RamBus
                             shr  RamData,#Ram_D0_Pin           'RamData=RamData >> Ram_D0_Pin
                             and  RamData,#$FF                  'RamData=RamData & 0xff
                          wrbyte  RamData,Hub_Addr              'RamData -> HubRam
                              or  outa,RamCLK                   'RamCLK=H \
                            andn  outa,RamCLK                   'RamCLK=L  \_Required For Quad Mode
                              or  outa,RamCLK                   'RamCLK=H  /
                            andn  outa,RamCLK                   'RamCLK=L /
                             add  Hub_Addr,#01                  'Hub_Addr=Hub_Addr + 1
                            djnz  XMM_Len,#:XmmData             'if(--XMM_Len) goto XmmData
                              or  outa,RamCS                    'RamCS=H (SRAM Inactive)
 XMM_ReadPage_ret            ret                                'Return

#endif

'==================================== FLASH API FUNCTIONS =========================================

DAT

#ifdef NEED_FLASH

XMM_FlashActivate          nop     ' <== INSERT CODE HERE
XMM_FlashActivate_ret      ret

XMM_FlashTristate          nop     ' <== INSERT CODE HERE
XMM_FlashTristate_ret      ret

XMM_FlashWritePage         nop     ' <== INSERT CODE HERE
XMM_FlashWritePage_ret     ret

XMM_FlashReadPage          nop     ' <== INSERT CODE HERE
XMM_FlashReadPage_ret      ret

XMM_FlashCheckEmpty        nop     ' <== INSERT CODE HERE
XMM_FlashCheckEmpty_ret    ret

XMM_FlashComparePage       nop     ' <== INSERT CODE HERE
XMM_FlashComparePage_ret   ret

XMM_FlashEraseChip         nop     ' <== INSERT CODE HERE
XMM_FlashEraseChip_ret     ret

XMM_FlashEraseBlock        nop     ' <== INSERT CODE HERE
XMM_FlashEraseBlock_ret    ret

XMM_FlashUnprotect         nop     ' <== INSERT CODE HERE
XMM_FlashUnprotect_ret     ret

XMM_FlashWriteEnable       nop     ' <== INSERT CODE HERE
XMM_FlashWriteEnable_ret   ret

XMM_FlashWaitUntilDone     nop     ' <== INSERT CODE HERE
XMM_FlashWaitUntilDone_ret ret

#endif

'======================================SRAM Signals================================================
'7 longs
RamCsClkSiHold  long  Ram_CS_CLK_SI_HOLD
RamCsSiHold     long  Ram_CS_SI_HOLD
RamCsClkSi      long  Ram_CS_CLK_SI
RamCsClkBus     long  Ram_CS_CLK_BUS
RamCS           long  Ram_CS
RamCLK          long  Ram_CLK
RamBus          long  Ram_BUS

'=====================================SRAM Variables===============================================
'4 longs
RamData         long  0
RamCopy         long  0
RamLoop         long  0
RamTemp         long  0