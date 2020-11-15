{
'-------------------------- RAMPAGE2 XMM Definitions ---------------------------
}
'============================= XMM DEFINITIONS =================================
'
'
' RP2 SPI FLASH & SRAM Pins
'
SIO0_PIN  = 0                   ' BASE PIN (RP2) - See also SHIFT_LEFT (below)
SIO1_PIN  = SIO0_PIN + 1
SIO2_PIN  = SIO1_PIN + 1
SIO3_PIN  = SIO2_PIN + 1
SIO4_PIN  = SIO3_PIN + 1
SIO5_PIN  = SIO4_PIN + 1
SIO6_PIN  = SIO5_PIN + 1
SIO7_PIN  = SIO6_PIN + 1
'
MOSI1_PIN = SIO0_PIN            ' Output from Prop to chip 1 (SRAM or FLASH)
MISO1_PIN = SIO1_PIN            ' Input from chip 1 (SRAM or FLASH) to Prop
MOSI2_PIN = SIO4_PIN            ' Output from Prop to chip 2 (SRAM or FLASH)
MISO2_PIN = SIO5_PIN            ' Input from chip 2 (SRAM or FLASH) to Prop 
'
SIO_CLK_PIN   = 8
SIO_FLASH_PIN = 9
SIO_SRAM_PIN  = 10
'
' Since Homespun has no general "#if" capability, we cannot tell from the
' PIN numbers defined above whether or not we have to shift bits left to 
' make the data bits align with the pins SIO0_PIN .. SIO7_PIN - so to save 
' unnecessary instructions, we xplicitly define here whether or not we need 
' to shift data to align with pins:
'
' Define this if bits have to be shifted for I/O (i.e. SIO0_PIN pin > 0) :
'
'#define SHIFT_DATA
'
' XMM Base Address. Catalina currently requires one contiguous block 
' of XMM RAM - Note that this is the internal hardware address, not 
' the address the Catalina XMM Kernel uses:
'
XMM_BASE_ADDRESS = $0000_0000   ' XMM adddressing from 0
'
' XMM RW & RO Base Addresses - Note that these are the addresses used
' by the Catalina XMM Kernel - they typically start AFTER the last
' Hub address:
'
XMM_RW_BASE_ADDRESS = $0000_8000 ' Read-Write Base address
XMM_RO_BASE_ADDRESS = $0004_8000 ' Read-Only Base address
'
' XMM RW & RO Sizes (in bytes):
'
XMM_RW_SIZE = $0002_0000         ' Read-Write Size
XMM_RO_SIZE = $0040_0000         ' Read-Only Size
'
' The following constant determines the number of longs used in the
' cache cog index - it can be reduced (e.g. to 6) if the XMM API 
' is so large it needs more space even in the cache cog (e.g. for 
' QUAD FLASH boards):
'
CACHE_INDEX_LOG2 = 7            ' log2 of entries in cache index
'
'========================== END OF XMM DEFINITIONS =============================
'
