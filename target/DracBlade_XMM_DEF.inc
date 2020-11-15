{
'--------------------------- DRACBLADE XMM Definitions -------------------------
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
XMM_RO_BASE_ADDRESS = $0000_8000 ' Read-Only Base address (same as Read-Write)
'
' XMM RW & RO Sizes (in bytes):
'
XMM_RW_SIZE = $0008_0000         ' Read-Write Size
XMM_RO_SIZE = -1                 ' Read-Only Size
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
