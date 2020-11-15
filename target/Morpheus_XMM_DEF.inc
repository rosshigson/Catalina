{
'--------------------------- MORPHEUS XMM Definitions --------------------------
}
'
'============================= XMM DEFINITIONS =================================
'
'
' XMM Base Address. Catalina currently requires one contiguous block 
' of XMM RAM - Note that this is the internal hardware address, not 
' the address the Catalina XMM Kernel uses:
'
XMM_BASE_ADDRESS = $0038_0000   ' We use the shadow RAM address so that the 512Kb on the 
                                ' Morpheus board is contiguous with the RAM on MEM+ - just  
                                ' make sure the address of MEM+ RAM starts at $400000!
                                '
'XMM_BASE_ADDRESS = $0040_0000   ' If you do not have the 512Kb installed on Morpheus, just
                                 ' set XMM_BASE to the base of MEM+ RAM (e.g. $400000)
'
#ifdef CPU_1
'
' XMM RW & RO Base Addresses - Note that these are the addresses used
' by the Catalina XMM Kernel - they typically start AFTER the last
' Hub address:
'
XMM_RW_BASE_ADDRESS = $0000_8000 ' Read-Write Base address
XMM_RO_BASE_ADDRESS = $0001_8000 ' Read-Only Base address
'
' XMM RW & RO Sizes (in bytes):
'
XMM_RW_SIZE = $0000_8000         ' Read-Write Size
XMM_RO_SIZE = $0010_0000         ' Read-Only Size
'
#elseifdef CPU_2
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
XMM_RW_SIZE = $0028_0000         ' Read-Write Size
XMM_RO_SIZE = -1                 ' Read-Only Size
'
#else
#error : CPU_1 or CPU_2 MUST BE SPECIFIED
#endif
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
