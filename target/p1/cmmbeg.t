' LCC 4.2 for Parallax Propeller
' (Catalina code generator by Ross Higson)
'
CON

#include "Constants.inc"

PUB Base : addr
   addr := @@0 ' Catalina Base Address

' Catalina Import main

CON
'
#include "catalina_compact.inc"
'
DAT
' 
        org   $51
init_B0                        ' must match init_B0 in Catalina_CMM.spin (and
                               ' variants) and LMM_INIT_B0_OFF in 
                               ' Catalina_Common.spin and catbind.c
' 
init_BZ long  @sbrkinit '$51   ' end of code / start of heap
init_PC long  @C_main   '$52   ' the initial PC
'
' seglayout specifies the layout of the segments (0, 1, 2, 3, 4, 5, 6, 8)
'
seglayout
        long  SEGMENT_LAYOUT
'
' segtable contains the start address of each of the segments
'
segtable
        long  @Catalina_Code
        long  @Catalina_Cnst
        long  @Catalina_Init
        long  @Catalina_Data
        long  @Catalina_Ends
        long  @Catalina_RO_Base
        long  @Catalina_RW_Base
        long  @Catalina_RO_Ends
        long  @Catalina_RW_Ends
'
' initial file is catalina_progbeg.s

' Catalina Code
'
DAT ' code segment

 long ' align long
'
' Initial PASM goes here (if any) ...
'
'
' Catalina Init

DAT ' initalized data segment

' Catalina Export errno

 long ' align long

C_errno long 0

' Catalina Code

DAT ' code segment

#ifndef NO_EXIT
' Catalina Export _exit

 long ' align long

C__exit
#ifdef NO_REBOOT
 long I32_JMPA + (@C__exit)<<S32
#else
 word I16B_EXEC
 mov r0,#$80
 clkset r0
#endif
#endif
' end

' Catalina Export _sys_plugin

C__sys_plugin
 word I16B_SYSP
 word I16B_RETN
 long ' align long
' end

#ifndef NO_ARGS

' Catalina Export arg_setup

'
' C_arg_setup : setup argc in r3 and argv in r2
'
C_arg_setup
 long I32_LODA + $7E6C<<S32 ' point to argc address
 word I16A_RDWORD + r3<<D16A + RI<<S16A ' load argc
 word I16A_ADDI + RI<<D16A + 2<<S16A
 word I16A_RDWORD + r2<<D16A + RI<<S16A ' load argv
 word I16B_RETN             ' done
 long ' align long
' end

#endif      
