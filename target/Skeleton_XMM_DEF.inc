{
' This file is a skeleton file that can be used to add XMM support for a
' completely new Propeller platform, or for a memory add-on board to be
' used with multiple Propeller platforms.
'
' The first step is to decide on the Platform or Board name, and the Catalina 
' symbol that will be used to specify it on the command line (using the -C 
' command line option). In this file We will assume the platform is to be 
' called "New_Board", and we will use the symbol NEW_BOARD. 
'
' 1. The first step is to rename this file to be "New_Board_XMM_DEF.inc".
' 
' 2. The next step is to update CFG.inc. Add the following lines 
'    to the first list in CFG.inc, just before the line that says
'    "#elseifdef CUSTOM":
'
'      #elseifdef NEW_BOARD
'      #include "New_Board_XMM_DEF.inc"
'
' 3. Determine if there are any constants in the section below that need
'    to be modified for this board.
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
