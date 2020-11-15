{
'----------------- Parallax Propeller Memory Card XMM Definitions --------------
}
'============================= XMM DEFINITIONS =================================
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
XMM_RO_BASE_ADDRESS = $0002_8000 ' Read-Only Base address
'
' XMM RW & RO Sizes (in bytes):
'
XMM_RW_SIZE = $0002_0000         ' Read-Write Size
XMM_RO_SIZE = $0040_0000         ' Read-Only Size
'
' The following constant determines the number of longs used in the
' cache cog index - it can be reduced (e.g. to 6 or 5) if the XMM API 
' is so large it needs more space even in the cache cog (e.g. for 
' QUAD FLASH boards):
'
CACHE_INDEX_LOG2 = 6            ' log2 of entries in cache index
'
' PMC QUAD SPI RAM Definitions (NOTE you also need to set the symbols 
' defined below these pin definitions to appropriate values): 
'
QSPI_VDD    = -1                ' PIN (PMC) - see below to enable
QSPI_VSS    = -1                ' PIN (PMC) - see below to enable
'
QSPI_CLK    = 7                 ' PIN (PMC) Common Clock
QSPI_SCEN   = 6                 ' PIN (PMC) SRAM Chip Enable
QSPI_FCEN   = 5                 ' PIN (PMC) FLASH Chip Enable
QSPI_SDCEN  = 4                 ' PIN (PMC) SD Card Chip Enable
'
QSPI_SIO3   = 3                 ' PIN (PMC) \
QSPI_SIO2   = 2                 ' PIN (PMC)  | MUST BE CONTIGUOUS
QSPI_SIO1   = 1                 ' PIN (PMC)  | AND IN THIS ORDER 
QSPI_SIO0   = 0                 ' PIN (PMC) /
'
SSPI_SI     = QSPI_SIO0         ' PIN (PMC)
SSPI_SO     = QSPI_SIO1         ' PIN (PMC)
'
XMM_DEBUG_PIN = 23              ' PIN (PMC) Used only for debugging
'
' Define this to enable applying power to the QSPI_VDD & QSPI_VSS Pins 
' (i.e. if they are connected to Propeller pins, and not directly to the
' appropriate power rails):
'
'#ifndef QUAD_POWER_PINS
'#define QUAD_POWER_PINS
'#endif
'
' Since Homespun/Openspin have no general "#if" capability, we cannot tell 
' whether or not we have to shift bits left or right to make the nibbles align
' with the pins QSPI_SIO0 .. QSPI_SIO3 when outputting data - so we have 
' to explicitly define whether or not we need to shift each nibble left 
' or right (but since the lower nibble would never have to be shifted 
' right, we only have three possibilities to worry about):
'
' Define this symbol if the lower nibble has to be 
' shifted LEFT for output (i.e. QSPI_SIO0 is > 0):
'
'#ifndef QUAD_LOWER_NIBBLE_LEFT
'#define QUAD_LOWER_NIBBLE_LEFT
'#endif
'
' Define this symbol the upper nibble has to be 
' shifted LEFT for output (i.e. QSPI_SIO0 is > 4):
'
'#ifndef QUAD_UPPER_NIBBLE_LEFT
'#define QUAD_UPPER_NIBBLE_LEFT
'#endif
'
' Define this symbol if the upper nibble has to be 
' shifted RIGHT for output (i.e. QSPI_SIO0 is < 4):
'
#ifndef QUAD_UPPER_NIBBLE_RIGHT
#define QUAD_UPPER_NIBBLE_RIGHT
#endif
'
'========================== END OF XMM DEFINITIONS =============================
'
