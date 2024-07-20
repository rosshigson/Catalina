{
'--------------------------- Custom XMM Definitions ----------------------------
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
XMM_RO_BASE_ADDRESS = $0010_8000 ' Read-Only Base address
'
' XMM RW & RO Sizes (in bytes):
'
XMM_RW_SIZE = $0010_0000         ' Read-Write Size
XMM_RO_SIZE = $0040_0000         ' Read-Only Size
'
' This value determines the size of the cache index:
'
CACHE_INDEX_LOG2 = 7         ' log2 of entries in cache index
'
'========================== END OF XMM DEFINITIONS =============================
'
