{
'------------------------- FLASHPOINT XMM Definitions --------------------------
}
'============================= XMM DEFINITIONS =================================
'
' Check that either the SUPERQUAD or RAMPAGE has been specified:
'
#ifndef SUPERQUAD
#ifndef RAMPAGE
#error : SUPERQUAD OR RAMPAGE MUST BE SPECIFIED
#endif
#endif
'
'=========================== SUPERQUAD XMM DEFINITIONS =========================
'
#ifdef SUPERQUAD
'
' Check that the SUPERQUAD and the RAMPAGE have not BOTH been specified:
'
#ifdef RAMPAGE
#error : SUPERQUAD AND RAMPAGE CANNOT BOTH BE SPECIFIED
#endif
'
' SUPERQUAD Specific Definitions:
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
XMM_RO_BASE_ADDRESS = $0000_8000 ' Read-Only Base address
'
' XMM RW & RO Sizes (in bytes):
'
XMM_RW_SIZE = $0000_0000         ' Read-Write Size (RamPage has no ram)
XMM_RO_SIZE = $0020_0000         ' Read-Only Size
'
' SUPERQUAD QUAD SPI RAM Definitions (NOTE you also need to set the symbols 
' defined below these pin definitions to appropriate values): 
'
QSPI_VDD    = 15                ' PIN (SUPERQUAD) - see below to enable
QSPI_CEN    = 14                ' PIN (SUPERQUAD)
QSPI_SCK    = 13                ' PIN (SUPERQUAD)
QSPI_SIO3   = 12                ' PIN (SUPERQUAD) \
QSPI_SIO2   = 11                ' PIN (SUPERQUAD)  | MUST BE CONTIGUOUS
QSPI_SIO1   = 10                 ' PIN (SUPERQUAD)  |  (and see below)
QSPI_SIO0   = 9                 ' PIN (SUPERQUAD) /
QSPI_VSS    = 8                 ' PIN (SUPERQUAD) - see below to enable
SSPI_SI     = QSPI_SIO0         ' PIN (SUPERQUAD)
SSPI_SO     = QSPI_SIO1         ' PIN (SUPERQUAD)
'
' Define this symbol for the SUPERQUAD, since it does not include any SRAM:
'
#ifndef NO_RAM
#define NO_RAM
#endif
'
' Check for LARGE mode (which is not supported by the SuperQuad):
'
#ifdef LARGE
#error : LARGE MEMORY MODE NOT SUPPORTED BY THE SUPERQUAD
#endif
'
' Check for SMALL mode (which requires FLASH on the SuperQuad)
'
#ifdef SMALL
#ifndef FLASH
#error : SMALL MEMORY REQUIRES FLASH ON THE SUPERQUAD
#endif
#endif

'
' Define this if QSPI_SIO0 is the highest numbered pin amongst SIO0 .. SI03
'
'#ifndef QUAD_BITS_REVERSED
'#define QUAD_BITS_REVERSED
'#endif
'
' Define this to enable applying power to the QSPI_VDD & QSPI_VSS Pins 
' (i.e. if they are connected to Propeller pins, and not directly to the
' appropriate power rails):
'
#ifndef QUAD_POWER_PINS
#define QUAD_POWER_PINS
#endif
'
' Since Homespun has no general "#if" capability, we cannot tell whether
' or not we have to shift bits left or right to make the nibbles align
' with the pins QSPI_SIO0 .. QSPI_SIO3 when outputting data - so we have 
' to explicitly define whether or not we need to shift each nibble left 
' or right (but since the lower nibble would never have to be shifted 
' right, we only have three possibilities to worry about):
'
' Define this symbol if the lower nibble has to be 
' shifted LEFT for output (i.e. lowest SIO pin is > 0) :
'
#ifndef QUAD_LOWER_NIBBLE_LEFT
#define QUAD_LOWER_NIBBLE_LEFT
#endif
'
' Define this symbol the upper nibble has to be 
' shifted LEFT for output (i.e. lowest SIO pin is > 4) :
'
#ifndef QUAD_UPPER_NIBBLE_LEFT
#define QUAD_UPPER_NIBBLE_LEFT
#endif
'
' Define this symbol if the upper nibble has to be 
' shifted RIGHT for output (i.e. lowest SIO pin is < 4) :
'
'#ifndef QUAD_UPPER_NIBBLE_RIGHT
'#define QUAD_UPPER_NIBBLE_RIGHT
'#endif
'
' The following constant determines the number of longs used in the
' cache cog index - it can be reduced (e.g. to 6) if the XMM API 
' is so large it needs more space even in the cache cog (e.g. for 
' QUAD FLASH boards):
'
CACHE_INDEX_LOG2 = 6            ' log2 of entries in cache index
'
#endif
'
'============================ RAMPAGE XMM DEFINITIONS ==========================
'
#ifdef RAMPAGE
'
' Check that the SUPERQUAD and the RAMPAGE have not BOTH been specified:
'
#ifdef SUPERQUAD
#error : SUPERQUAD AND RAMPAGE CANNOT BOTH BE SPECIFIED
#endif
'
' RAMPAGE Specific Definitions:
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
XMM_RO_SIZE = $0020_0000         ' Read-Only Size
'
' RAMPAGE QUAD SPI RAM Definitions (NOTE you also need to set the symbols 
' defined below these pin definitions to appropriate values): 
'
QSPI_VDD    = 15                 ' PIN (RAMPAGE) - see below to enable
QSPI_CEN    = 14                 ' PIN (RAMPAGE)
QSPI_SCK    = 13                 ' PIN (RAMPAGE)
QSPI_SIO3   = 9                  ' PIN (RAMPAGE) \
QSPI_SIO2   = 10                 ' PIN (RAMPAGE)  | MUST BE CONTIGUOUS
QSPI_SIO1   = 11                 ' PIN (RAMPAGE)  |  (and see below)
QSPI_SIO0   = 12                 ' PIN (RAMPAGE) /
QSPI_RSCK   = 8                  ' PIN (RAMPAGE)
QSPI_RCEN   = 7                  ' PIN (RAMPAGE)
QSPI_VSS    = 6                  ' PIN (RAMPAGE) - see below to enable
SSPI_SI     = QSPI_SIO0          ' PIN (RAMPAGE)
SSPI_SO     = QSPI_SIO1          ' PIN (RAMPAGE)

'
' Define this if QSPI_SIO0 is the highest numbered pin amongst SIO0 .. SI03
'
#ifndef QUAD_BITS_REVERSED
#define QUAD_BITS_REVERSED
#endif
'
' Define this to enable applying power to the QSPI_VDD & QSPI_VSS Pins
' (i.e. if they are connected to Propeller pins, and not directly to the
' appropriate power rails):
'
#ifndef QUAD_POWER_PINS
#define QUAD_POWER_PINS
#endif
'
' Since Homespun has no general "#if" capability, we cannot tell whether
' or not we have to shift bits left or right to make the nibbles align
' with the pins QSPI_SIO0 .. QSPI_SIO3 when outputting data - so we have 
' to explicitly define whether or not we need to shift each nibble left 
' or right (but since the lower nibble would never have to be shifted 
' right, we only have three possibilities to worry about):
'
' Define this symbol if the lower nibble has to be 
' shifted LEFT for output (i.e. lowest SIO pin is > 0) :
'
#ifndef QUAD_LOWER_NIBBLE_LEFT
#define QUAD_LOWER_NIBBLE_LEFT
#endif
'
' Define this symbol the upper nibble has to be 
' shifted LEFT for output (i.e. lowest SIO pin is > 4) :
'
#ifndef QUAD_UPPER_NIBBLE_LEFT
#define QUAD_UPPER_NIBBLE_LEFT
#endif
'
' Define this symbol if the upper nibble has to be 
' shifted RIGHT for output (i.e. lowest SIO pin is < 4) :
'
'#ifndef QUAD_UPPER_NIBBLE_RIGHT
'#define QUAD_UPPER_NIBBLE_RIGHT
'#endif
'
' The following constant determines the number of longs used in the
' cache cog index - it can be reduced (e.g. to 6) if the XMM API 
' is so large it needs more space even in the cache cog (e.g. for 
' QUAD FLASH boards):
'
CACHE_INDEX_LOG2 = 6            ' log2 of entries in cache index
'
#endif
'
'========================== END OF XMM DEFINITIONS =============================
'
