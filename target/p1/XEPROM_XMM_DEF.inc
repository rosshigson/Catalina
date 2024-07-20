{
'--------------------------- XMM EEPROM Definitions ----------------------------
'
' This file contains definitions for using EEPROM as XMM. The EEPROM must 
' be larger than 32k to be used for XMM (note that a 64k EEPROM is better 
' used as CMM or LMM, which can be done using just the EEPROM loader). 
'
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
XMM_RW_BASE_ADDRESS = $0000_8000 ' Read-Write Base address (not used)
'
XMM_RO_BASE_ADDRESS = $0000_8000 ' Read-Only Base address
'
' XMM RW & RO Sizes (in bytes):
'
XMM_RW_SIZE = -1                 ' Read-Write Size (not used)
'
' The following symbol is currently used only by the XMM RAM Test program
' (which is not really relevant for executing XMM code from EEPROM) but it 
' may eventually be used elsewhere, so it should be set. It is currently set 
' for a 128k EEPROM:
'
XMM_RO_SIZE = $0002_0000         ' Read-Only Size (for a a 128k EEPROM)
'
' This value determines the size of the cache index:
'
CACHE_INDEX_LOG2 = 7         ' log2 of entries in cache index
'
'========================== END OF XMM DEFINITIONS =============================
'
