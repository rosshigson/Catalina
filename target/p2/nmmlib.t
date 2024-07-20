'
' This file exists to allow the NMM LUT library code to be compiled and
' then turned into a blob suitable for loading as part of dynamically
' loading a program. This is required because with Multi-Model support,
' the kernel being loaded may require a different LUT library to the
' kernel doing the loading. 
'
' Compile this library and convert it to a blob using commands similar
' to the following:
'
'    p2_asm -I ..\..\target\p2 ..\..\target\p2\nmmlib.t -o nmm
'    spinc -p2 -B2 -n NMM_LUT_LIBRARY nmm.bin >NMM_library.inc
'
' The resulting binary is not a true Catalina P2 binary - it is intended 
' only to allow the LUT library to be extracted using the spinc command.
'

CON

#include "reserve.inc"

CON

SEGMENT_LAYOUT=11 ' NMM memory layout 11 (Code, Cnst, Init, Data)

DAT

' Common Kernel library functions. This code is loaded and started by all
' kernels (static and dynamic) and must fit in the area $300 - $3FF ...

 orgf $300

Catalina_RO_Base
Catalina_Code

LUT_LIBRARY

' include any necessary kernel library functions. This code is loaded and
' executed from the LUT RAM ...

#include "klib.inc"

#include "nmmklib.inc"

#ifdef libthreads
#include "thlib.inc"
#endif

LUT_LIBRARY_END

 fit $400

Catalina_Cnst
Catalina_RO_Ends
Catalina_RW_Base
Catalina_Init
Catalina_Data
Catalina_RW_Ends
Catalina_Ends
C_main

' Include the appropriate NMM Kernel (to define offsets etc) ...

#if defined(libthreads)
#include "nmmtd.t"
#else
#include "nmmd.t"
#endif  
CON


