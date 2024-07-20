''=============================================================================
'' @file     Catalina_Float32_A_Plugin
'' @target   Propeller
''
'' IEEE 754 compliant 32-bit floating point math routines.
''
'' The original version (Float32A) is by:
'' @author   Cam Thompson, Micromega Corporation
''
'' Copyright (c) 2006-2007 Parallax, Inc.
'' See end of file for terms of use.       
''
'' This version (Catalina_Float32_A_Plugin) was modified for Catalina by:
''     Ross Higson
''
'' @version
'' 1.0 Modified from Float32Full (V1.4) for Catalina
'' 1.1 Updated to incorporate Float32Full (V1.6) changes.
'' 1.2 Modified for P2.
''=============================================================================

CON

#include <constant.inc>

DAT

'---------------------------
' Assembly language routines
'---------------------------
                        alignl
                        org     0
FLOAT_A_START
.t1                     cogid   .t1                     ' get ...
.rqstptr                shl     .t1,#2                  ' ... our ...
.t2                     add     .t1,PTRA                ' ... registry block entry
.t3                     rdlong  .rqstptr,.t1            ' register ...
.t4                     and     .rqstptr,.Mask24        ' ... this ...
.t5                     mov     .t2,#LMM_FLA            ' ... plugin ...
.t6                     shl     .t2,#24                 ' ... as the ...
.t7                     or      .t2,.rqstptr            ' ... appropriate ...
.t8                     wrlong  .t2,.t1                 ' ... type
.t9                     and     .rqstptr,.Mask24        ' set up our request block address
.status                 jmp     #.doneCommand           ' clear our request block

.getCommand
                        rdlong  .t1, .rqstptr wz        ' wait for command
          if_z          jmp     #.getCommand
          
                        mov     .t2, .t1                ' load .fnumA
                        rdlong  .fnumA, .t2
                        add     .t2, #4          
                        rdlong  .fnumB, .t2             ' load .fnumB

                        shr     .t1, #24 wz             ' get command
                        cmp     .t1, #(FracCmd>>24)+1 wc ' check for valid command
          if_z_or_nc    jmp     #.exitNan1 
                        shl     .t1, #1
                        add     .t1, #.cmdTable-2 
                        jmp     .t1                     ' jump to command

.cmdTable               call    #._FAdd                 ' command dispatch table
                        jmp     #.endCommand
                        call    #._FSub
                        jmp     #.endCommand
                        call    #._FMul
                        jmp     #.endCommand
                        call    #._FDiv
                        jmp     #.endCommand
                        call    #._FFloat
                        jmp     #.endCommand
                        call    #._FTrunc
                        jmp     #.endCommand
                        call    #._FRound
                        jmp     #.endCommand
                        call    #._FSqr
                        jmp     #.endCommand
                        call    #._FCmp
                        jmp     #.returnstatus
                        call    #._Sin
                        jmp     #.endCommand
                        call    #._Cos
                        jmp     #.endCommand
                        call    #._Tan
                        jmp     #.endCommand
                        call    #._Log
                        jmp     #.endCommand
                        call    #._Log10
                        jmp     #.endCommand
                        call    #._Exp
                        jmp     #.endCommand
                        call    #._Exp10
                        jmp     #.endCommand
                        call    #._Pow
                        jmp     #.endCommand
                        call    #._Frac
                        jmp     #.endCommand

.returnstatus           mov     .fnumA, .status
                        jmp     #.endcommand

.exitNan1               mov     .fnumA, .NaN            ' unknown command
.endCommand             mov     .t1, .rqstptr           ' return result
                        add     .t1, #4
                        wrlong  .fnumA, .t1
.doneCommand
                        wrlong  #0,.rqstptr          ' clear command status
                        jmp     #.getCommand            ' wait for next command

'------------------------------------------------------------------------------
' _FAdd    .fnumA = .fnumA + .fnumB
' _FAddI   .fnumA = .fnumA + {Float immediate}
' _FSub    .fnumA = .fnumA - .fnumB
' changes: .fnumA, .flagA, .expA, .manA, .fnumB, .flagB, .expB, .manB, .t1
'------------------------------------------------------------------------------

._FSub                  xor     .fnumB, .Bit31          ' negate B
                        jmp     #._FAdd                 ' add values                                               

._FAddI                 pop     .t1                     ' get the address ...
                        sets    .getB, .t1              ' ... of the immediate operand
                        add     .t1, #1                 ' update return address ...
                        push    .t1                     ' ... to be beyond the operand
.getB                   mov     .fnumB, 0               ' get the immediate operand

._FAdd                  call    #._Unpack2              ' unpack two variables                    
          if_c_or_z     ret                             ' check for Nan or B = 0

                        test    .flagA, #SignFlag wz    ' negate A mantissa if negative
          if_nz         neg     .manA, .manA
                        test    .flagB, #SignFlag wz    ' negate B mantissa if negative
          if_nz         neg     .manB, .manB

                        mov     .t1, .expA              ' align mantissas
                        sub     .t1, .expB
                        abs     .t1, .t1
                        fle     .t1, #31
                        cmps    .expA, .expB wcz
          if_nz_and_nc  sar     .manB, .t1
          if_nz_and_c   sar     .manA, .t1
          if_nz_and_c   mov     .expA, .expB        

                        add     .manA, .manB            ' add the two mantissas
                        cmps    .manA, #0 wc            ' set sign of result
          if_c          or      .flagA, #SignFlag
          if_nc         andn    .flagA, #SignFlag
                        abs     .manA, .manA            ' pack result and exit
._Pack_ret              call    #._Pack  
                        ret      

'------------------------------------------------------------------------------
' _FMul    .fnumA = .fnumA * .fnumB
' _FMulI   .fnumA = .fnumA * {Float immediate}
' changes: .fnumA, .flagA, .expA, .manA, .fnumB, .flagB, .expB, .manB, .t1, .t2
'------------------------------------------------------------------------------

._FMulI                 pop     .t1                     ' get the address ...
                        sets    .getB2, .t1             ' ... of the immediate operand
                        add     .t1, #1                 ' update return address ...
                        push    .t1                     ' ... to be beyond the operand
.getB2                  mov     .fnumB, 0               ' get the immediate operand

._FMul                  call    #._Unpack2              ' unpack two variables
          if_nc         jmp     #.FMul2                 ' multiply if neither is NaN
                        cmp     .expA, #255 wz          ' NaN, so check for fNumA = Inf
          if_z          jmp     #.FMul1                 ' yes - return Inf
                        cmp     .expB, #255 wz          ' no - check for fNumB = Inf
          if_nz         ret                             ' no - return NaN
.Fmul1                  mov     .fnumA, .Inf            ' yes, fnumA or fnumB is Inf, so return Inf
                        xor     .flagA, .flagB          ' 
                        test    .flagA, #SignFlag wz
          if_nz         or      .fnumA, .Bit31
                        ret                             
.FMul2                  xor     .flagA, .flagB          ' get sign of result
                        add     .expA, .expB            ' add exponents
                        qmul    .manA, .manB
                        getqy   .t1
                        shl     .t1, #3                 ' justify result and exit
                        mov     .manA, .t1                        
                        jmp     #._Pack_ret

'------------------------------------------------------------------------------
' _FDiv    .fnumA = .fnumA / .fnumB
' _FDivI   .fnumA = .fnumA / {Float immediate}
' changes: .fnumA, .flagA, .expA, .manA, .fnumB, .flagB, .expB, .manB, .t1, .t2
'------------------------------------------------------------------------------

._FDivI                 pop     .t1                     ' get the address ...
                        sets    .getB3, .t1             ' ... of the immediate operand
                        add     .t1, #1                 ' update return address ...
                        push    .t1                     ' ... to be beyond the operand
.getB3                  mov     .fnumB, 0               ' get the immediate operand

._FDiv                  call    #._Unpack2              ' unpack two variables
          if_c_or_z     mov     .fnumA, .NaN            ' check for Nan or divide by 0
          if_c_or_z     ret     
        
                        xor     .flagA, .flagB          ' get sign of result
                        sub     .expA, .expB            ' subtract exponents
                        shr     .manA, #1
                        setq    .manA
                        qdiv    #0, .manB
                        getqx   .manA
                        shr     .manA, #2
                        jmp     #._Pack_ret

'------------------------------------------------------------------------------
' _FFloat  .fnumA = float(.fnumA)
' changes: .fnumA, .flagA, .expA, .manA
'------------------------------------------------------------------------------
         
._FFloat                mov     .flagA, .fnumA          ' get integer value
                        mov     .fnumA, #0              ' set initial result to Zero
                        abs     .manA, .flagA wz        ' get absolute value of integer
          if_z          ret                             ' if Zero, exit
                        shr     .flagA, #31             ' set sign flag
                        mov     .expA, #31              ' set initial value for exponent
.normalize2             shl     .manA, #1 wc            ' normalize the mantissa 
          if_nc         sub     .expA, #1               ' adjust exponent
          if_nc         jmp     #.normalize2
                        rcr     .manA, #1               ' justify mantissa
                        shr     .manA, #2
                        jmp     #._Pack_ret

'------------------------------------------------------------------------------
' _FTrunc  .fnumA = fix(.fnumA)
' _FRound  .fnumA = fix(round(.fnumA))
' changes: .fnumA, .flagA, .expA, .manA, .t1 
'------------------------------------------------------------------------------

._FTrunc                mov     .t1, #0                 ' set for no rounding
                        jmp     #.fix

._FRound                mov     .t1, #1                 ' set for rounding

.fix                    call    #._Unpack               ' unpack floating point value
          if_c          ret                             ' check for Nan
                        shl     .manA, #2               ' left justify mantissa 
                        mov     .fnumA, #0              ' initialize result to Zero
                        neg     .expA, .expA            ' adjust for exponent value
                        add     .expA, #31 wz
                        cmps    .expA, #33 wc
          if_nc_or_z    ret
                        sub     .expA, #1
                        shr     .manA, .expA
                        cmp     .t1, #0 wz              ' nz if we are rounding
          if_nz         add     .manA, .t1              ' round up 1/2 lsb   
                        shr     .manA, #1
                        test    .flagA, #SignFlag wz    ' check sign and exit
          _ret_         sumnz   .fnumA, .manA
                                  
'------------------------------------------------------------------------------
' _FSqr    .fnumA = sqrt(.fnumA)
' changes: .fnumA, .flagA, .expA, .manA, .t1, .t2, .t3, .t4, .t5 
'------------------------------------------------------------------------------

._FSqr                  call    #._Unpack               ' unpack floating point value
          if_nc         mov     .fnumA, #0              ' set initial result to Zero
          if_c_or_z     ret                             ' check for Nan or Zero
                        test    .flagA, #SignFlag wz    ' check for negative
          if_nz         mov     .fnumA, .NaN            ' yes, then return Nan                       
          if_nz         ret
          
                        test    .expA, #1 wz            ' if even exponent, shift mantissa 
          if_z          shr     .manA, #1
                        sar     .expA, #1               ' get exponent of root
                        mov     .t1, .Bit30             ' set root value to $4000_0000                ' 
                        mov     .t2, #31                ' get loop counter

.sqrt                   or      .fnumA, .t1             ' blend partial root into result
                        mov     .t3, #32                ' loop counter for multiply
                        mov     .t4, #0
                        mov     .t5, .fnumA
                        shr     .t5, #1 wc              ' get initial multiplier bit
                        
.multiply if_c          add     .t4, .fnumA wc          ' 32x32 bit multiply
                        rcr     .t4, #1 wc
                        rcr     .t5, #1 wc
                        djnz    .t3, #.multiply

                        cmps    .manA, .t4 wc           ' if too large remove partial root
          if_c          xor     .fnumA, .t1
                        shr     .t1, #1                 ' shift partial root
                        djnz    .t2, #.sqrt             ' continue for all bits
                        
                        mov     .manA, .fnumA           ' store new mantissa value and exit
                        shr     .manA, #1
                        jmp     #._Pack_ret

'------------------------------------------------------------------------------
' _FCmp    set Z and C flags for .fnumA - .fnumB
' changes: status, .t1
'------------------------------------------------------------------------------

._FCmp                  mov     .t1, .fnumA             ' compare signs
                        xor     .t1, .fnumB
                        and     .t1, .Bit31 wz
          if_z          jmp     #.cmp1                  ' same, then compare magnitude
          
                        mov     .t1, .fnumA             ' check for +0 or -0 
                        or      .t1, .fnumB
                        andn    .t1, .Bit31 wcz        
          if_z          jmp     #.exit1
                    
                        test    .fnumA, .Bit31 wc       ' compare signs
                        jmp     #.exit1

.cmp1                   test    .fnumA, .Bit31 wz       ' check signs
          if_nz         jmp     #.cmp2
                        cmp     .fnumA, .fnumB wcz
                        jmp     #.exit1

.cmp2                   cmp     .fnumB, .fnumA wcz      ' reverse test if negative

.exit1                  mov     .status, #1             ' if .fnumA > .fnumB, .t1 = 1
          if_c          neg     .status, .status        ' if .fnumA < .fnumB, .t1 = -1
          if_z          mov     .status, #0             ' if .fnumA = .fnumB, .t1 = 0
                        ret

'------------------------------------------------------------------------------
' _Sin     .fnumA = sin(.fnumA)
' _Cos     .fnumA = cos(.fnumA)
' changes: .fnumA, .flagA, .expA, .manA, .fnumB, .flagB, .expB, .manB
' changes: .t1, .t2, .t3, .t4, .t5, .t6
'------------------------------------------------------------------------------

._Cos                   call    #._FAddI                ' cos(x) = sin(x + pi/2)
                        long    pi / 2.0

._Sin                   mov     .t6, .fnumA             ' save original angle
                        call    #._FDivI                ' reduce angle to 0 to 2pi
                        long    2.0 * pi
                        call    #._FTrunc
                        cmp     .fnumA, .NaN wz         ' check for Nan
          if_z          ret               
                        call    #._FFloat
                        call    #._FMulI
                        long    2.0 * pi
                        mov     .fnumB, .fnumA
                        mov     .fnumA, .t6
                        call    #._FSub
                        test    .fnumA, .Bit31 wz
          if_z          jmp     #.sin1
                        call    #._FAddI
                        long    2.0 * pi

.sin1                   call    #._FMulI                ' convert to 13 bit integer plus fraction
                        long    8192.0 / (2.0 * pi)
                        mov     .t5, .fnumA             ' get fraction
                        call    #._Frac
                        mov     .t4, .fnumA
                        mov     .fnumA, .t5             ' get integer
                        call    #._FTrunc                        

                        test    .fnumA, .Sin_90 wc      ' set C flag for quandrant 2 or 4
                        test    .fnumA, .Sin_180 wz     ' set Z flag for quandrant 3 or 4
                        and     .fnumA, .Bits11
                        negc    .fnumA, .fnumA          ' if quandrant 2 or 4, negate offset
                        add     .fnumA, .SineTable      ' combine offset ...
          if_c          add     .fnumA, .SineSize       ' ... with sine table address
                        shl     .fnumA, #1              ' get table offset

                        rdword  .t2, .fnumA             ' get first table value
                        negnz   .t2, .t2                ' if quandrant 3 or 4, negate
          if_nc         add     .fnumA, #2              ' get second table value  
          if_c          sub     .fnumA, #2
                        rdword  .t3, .fnumA
                        negnz   .t3, .t3                ' if quandrant 3 or 4, negate

                        mov     .fnumA, .t2             ' result = float(value1)
                        call    #._FFloat
                        mov     .fnumB, .t4 wz          ' exit if no fraction
          if_z          jmp     #.sin2

                        mov     .t5, .fnumA             ' interpolate the fractional value 
                        mov     .fnumA, .t3
                        sub     .fnumA, .t2
                        call    #._FFloat 
                        call    #._FMul
                        mov     .fnumB, .t5
                        call    #._FAdd

.sin2                   call    #._FDivI                ' set range from -1.0 to 1.0 and exit
                        long    65535.0
                        ret

'------------------------------------------------------------------------------
' _Tan   .fnumA = tan(.fnumA)
' changes: .fnumA, .flagA, .expA, .manA, .fnumB, .flagB, .expB, .manB
' changes: .t1, .t2, .t3, .t4, .t5, .t6, .t7, .t8
'------------------------------------------------------------------------------

._Tan                   mov     .t7, .fnumA             ' tan(x) = sin(x) / cos(x)
                        call    #._Cos
                        mov     .t8, .fnumA
                        mov     .fnumA, .t7    
                        call    #._Sin
                        mov     .fnumB, .t8
                        call    #._FDiv
                        ret

'------------------------------------------------------------------------------
' _Log     .fnumA = log (base e) .fnumA
' _Log10   .fnumA = log (base 10) .fnumA
' _Log2    .fnumA = log (base 2) .fnumA
' changes: .fnumA, .flagA, .expA, .manA, .fnumB, .flagB, .expB, .manB, .t1, .t2, .t3, .t5
'------------------------------------------------------------------------------

._Log                   call    #._Log2                 ' log base e
                        call    #._FDivI
                        long    1.442695041
                        ret

._Log10
                        call    #._Log2                 ' log base 10
                        call    #._FDivI
                        long    3.321928095
                        ret

._Log2                  call    #._Unpack               ' unpack variable 
          if_z_or_c     jmp     #.exitNan2              ' if Nan or <= 0, return Nan   
                        test    .flagA, #SignFlag wz              
          if_nz         jmp     #.exitNan2
                      
                        mov     .t5, .expA              ' save exponent                                                
                        mov     .t1, .manA              ' get first 11 bits of fraction
                        shr     .t1, #17                ' get table offset
                        and     .t1, .TableMask
                        add     .t1, .LogTable          ' get table address
                        call    #.float18Bits           ' remainder = lower 18 bits 
                        mov     .t2, .fnumA
                        mov     .t9, .LogTable          ' get table address
                        call    #.loadTable             ' get fraction from log table
                        mov     .fnumB, .fnumA
                        mov     .fnumA, .t5             ' convert exponent to float         
                        call    #._FFloat
                        call    #._FAdd                 ' result = exponent + fraction                               
                        ret

.exitNan2               mov     .fnumA, .NaN            ' return Nan
                        ret

'------------------------------------------------------------------------------
' _Exp     .fnumA = e ** .fnumA
' _Exp10   .fnumA = 10 ** .fnumA
' _Exp2    .fnumA = 2 ** .fnumA
' changes: .fnumA, .flagA, .expA, .manA, .fnumB, .flagB, .expB, .manB
' changes: .t1, .t2, .t3, .t4, .t5
'------------------------------------------------------------------------------

._Exp                   call    #._FMulI                ' e ** fnum
                        long    1.442695041
                        jmp     #._Exp2

._Exp10                 call    #._FMulI                ' 10 ** fnum
                        long    3.321928095

._Exp2                  call    #._Unpack               ' unpack variable                    
          if_c          ret                             ' check for Nan
          if_z          mov     .fnumA, .One            ' if 0, return 1.0
          if_z          ret

                        mov     .t5, .fnumA             ' save sign value
                        call    #._FTrunc               ' get positive integer
                        abs     .t4, .fnumA
                        mov     .fnumA, .t5
                        call    #._Frac                 ' get fraction
                        call    #._Unpack
                        neg     .expA, .expA            ' get first 11 bits of fraction
                        shr     .manA, .expA
                        mov     .t1, .manA              ' 
                        shr     .t1, #17                ' get table offset
                        and     .t1, .TableMask
                        add     .t1, .ALogTable         ' get table address
                        call    #.float18Bits           ' remainder = lower 18 bits 
                        mov     .t2, .fnumA
                        mov     .t9, .ALogTable         ' get table address
                        call    #.loadTable             ' get fraction from log table                  
                        call    #._FAddI                ' add 1.0
                        long    1.0
                        call    #._Unpack               ' align fraction
                        add     .expA, .t4              ' add integer to exponent  
                        test    .t5, .Bit31 wz          ' check if negative
          if_nz         cmp     .expA, #150 wc
          if_nz_and_nc  jmp     #._Underflow
                        call    #._Pack

                        test    .t5, .Bit31 wz          ' check if negative
          if_z          ret
                        mov     .fnumB, .fnumA          ' yes, then invert
                        mov     .fnumA, .One
                        call    #._FDiv
                        ret
._Underflow             mov     .fnumA, #0
                        ret

'------------------------------------------------------------------------------
' _Pow     .fnumA = .fnumA raised to power .fnumB
' changes: .fnumA, .flagA, .expA, .manA, .fnumB, .flagB, .expB, .manB
'          .t1, .t2, .t3, .t5, .t6, .t7
'------------------------------------------------------------------------------

._Pow                   test    .fnumB, .NaN wz         ' check exponent
          if_z          mov     .fnumA, .One            ' if exponent=0, set base to 1.0
          
                        mov     .t7, .fnumA wc          ' save sign of result
          if_nc         jmp     #.pow3                  ' check sign of base

                        mov     .fnumA, .fnumB          ' check exponent
                        call    #._Unpack
                        mov     .fnumA, .t7             ' restore base
          if_z          jmp     #.pow2                  ' check for exponent = 0
          
                        test    .expA, .Bit31 wz        ' if exponent < 0, return Nan
          if_nz         jmp     #.pow1

                        fle     .expA, #23              ' check if exponent = integer
                        shl     .manA, .expA
                        mov     .t9, .manA    
                        and     .t9, .Mask29 wz                         
          if_z          jmp     #.pow2                  ' yes, then check if odd
          
.pow1                   mov     .fnumA, .NaN            ' return Nan
                        ret

.pow2                   test    .manA, .Bit29 wz        ' if odd, then negate result
          if_z          andn    .t7, .Bit31

.pow3                   test    .fnumB, .Bit31 wc       ' check sign of exponent
                        andn    .fnumA, .Bit31 wz       ' get |.fnumA|
          if_z_and_c    jmp     #.pow1                  ' if 0^-n, return Nan
          if_z          ret                             ' if 0^+n, return Zero

                        mov     .t6, .fnumB             ' save power
                        call    #._Log2                 ' get log of base
                        mov     .fnumB, .t6             ' multiply by power
                        call    #._FMul
                        call    #._Exp2                 ' get result      

                        test    .t7, .Bit31 wz          ' check for negative
          if_nz         xor     .fnumA, .Bit31
                        ret

'------------------------------------------------------------------------------
' ._Frac .fnumA = fractional part of .fnumA
' changes: .fnumA, .flagA, .expA, .manA
'------------------------------------------------------------------------------

._Frac                  call    #._Unpack               ' get fraction
                        test    .expA, .Bit31 wz        ' check for exp < 0 or Nan
          if_c_or_nz    jmp     #.exit3
                        fle     .expA, #23              ' remove the integer
                        shl     .manA, .expA    
                        and     .manA, .Mask29
                        mov     .expA, #0               ' return fraction

.exit3                  call    #._Pack
          _ret_         andn    .fnumA, .Bit31

'------------------------------------------------------------------------------
' input:   .t1           table address (long)
'          .t2           remainder (float) 
'          .t9           table start address (long) 
' output:  .fnumA        interpolated table value (float)
' changes: .fnumA, .flagA, .expA, .manA, .fnumB, .t1, .t2, .t3
'------------------------------------------------------------------------------

.loadTable              rdword  .t3, .t1                ' .t3 = first table value
                        cmp     .t2, #0 wz              ' if remainder = 0, skip interpolation
          if_z          mov     .t1, #0
          if_z          jmp     #.load2

                        add     .t1, #2                 ' load second table value
                        sub     .t9, .t1
                        neg     .t9
                        test    .t9, .TableMask wz      ' check for end of table
          if_z          mov     .t1, .Bit16             ' .t1 = second table value
          if_nz         rdword  .t1, .t1
                        sub     .t1, .t3                ' .t1 = .t1 - .t3

.load2                  mov     .manA, .t3              ' convert .t3 to float
                        call    #.float16Bits
                        mov     .t3, .fnumA           
                        mov     .manA, .t1              ' convert .t1 to float
                        call    #.float16Bits
                        mov     .fnumB, .t2             ' .t1 = .t1 * remainder
                        call    #._FMul
                        mov     .fnumB, .t3             ' result = .t1 + .t3
                        call    #._FAdd
                        ret

.float18Bits            shl     .manA, #14              ' float lower 18 bits
                        jmp     #.floatBits
.float16Bits            shl     .manA, #16              ' float lower 16 bits
.floatBits              shr     .manA, #3               ' align to bit 29
                        mov     .flagA, #0              ' convert table value to float 
                        mov     .expA, #0
                        call    #._Pack                 ' pack and exit
                        ret

'------------------------------------------------------------------------------
' input:   .fnumA        32-bit floating point value
'          .fnumB        32-bit floating point value 
' output:  .flagA        .fnumA flag bits (.NaN, Infinity, .Zero, Sign)
'          .expA         .fnumA exponent (no bias)
'          .manA         .fnumA mantissa (aligned to bit 29)
'          .flagB        .fnumB flag bits (.NaN, Infinity, .Zero, Sign)
'          .expB         .fnumB exponent (no bias)
'          .manB         .fnumB mantissa (aligned to bit 29)
'          C flag       set if .fnumA or .fnumB is Nan
'          Z flag       set if .fnumB is Zero
' changes: .fnumA, .flagA, .expA, .manA, .fnumB, .flagB, .expB, .manB, .t1
'------------------------------------------------------------------------------

._Unpack2               mov     .t1, .fnumA             ' save A
                        mov     .fnumA, .fnumB          ' unpack B to A
                        call    #._Unpack

                        mov     .fnumB, .fnumA          ' save B variables
                        mov     .flagB, .flagA
                        mov     .expB, .expA
                        mov     .manB, .manA

                        mov     .fnumA, .t1             ' unpack A
                        call    #._Unpack
          if_nc         test    .flagB, #NanFlag wz
          if_nc_and_nz  modc    _set wc
          _ret_         cmp     .manB, #0 wz            ' set Z flag                      

'------------------------------------------------------------------------------
' input:   .fnumA        32-bit floating point value 
' output:  .flagA        .fnumA flag bits (.NaN, Infinity, .Zero, Sign)
'          .expA         .fnumA exponent (no bias)
'          .manA         .fnumA mantissa (aligned to bit 29)
'          C flag       set if .fnumA is Nan
'          Z flag       set if .fnumA is Zero
' changes: .fnumA, .flagA, .expA, .manA
'------------------------------------------------------------------------------

._Unpack                mov     .flagA, .fnumA          ' get sign
                        shr     .flagA, #31
                        mov     .manA, .fnumA           ' get mantissa
                        and     .manA, .Mask23
                        mov     .expA, .fnumA           ' get exponent
                        shl     .expA, #1
                        shr     .expA, #24 wz
          if_z          jmp     #.ZeroSubnormal         ' check for Zero or subnormal
                        cmp     .expA, #255 wz          ' check if finite
          if_nz         jmp     #.finite
                        mov     .fnumA, .NaN            ' no, then return Nan
                        or      .flagA, #NanFlag
                        jmp     #.exit5        

.ZeroSubnormal          mov     .t9, .manA
                        or      .t9, .expA wz           ' check for Zero
          if_nz         jmp     #.subnorm
                        or      .flagA, #ZeroFlag       ' yes, then set Zero flag
                        neg     .expA, #150             ' set exponent and exit
                        jmp     #.exit5
                                 
.subnorm                shl     .manA, #7               ' fix justification for subnormals  
.subnorm2               test    .manA, .Bit29 wz
          if_nz         jmp     #.exit4
                        shl     .manA, #1
                        sub     .expA, #1
                        jmp     #.subnorm2

.finite                 shl     .manA, #6               ' justify mantissa to bit 29
                        or      .manA, .Bit29           ' add leading .One bit
                        
.exit4                  sub     .expA, #127             ' remove bias from exponent
.exit5                  test    .flagA, #NanFlag wc     ' set C flag
          _ret_         cmp     .manA, #0 wz            ' set Z flag

'------------------------------------------------------------------------------
' input:   .flagA        .fnumA flag bits (.NaN, Infinity, .Zero, Sign)
'          .expA         .fnumA exponent (no bias)
'          .manA         .fnumA mantissa (aligned to bit 29)
' output:  .fnumA        32-bit floating point value
' changes: .fnumA, .flagA, .expA, .manA 
'------------------------------------------------------------------------------

._Pack                  cmp     .manA, #0 wz            ' check for Zero                                        
          if_z          mov     .expA, #0
          if_z          jmp     #.exit6

.normalize1             shl     .manA, #1 wc            ' normalize the mantissa 
          if_nc         sub     .expA, #1               ' adjust exponent
          if_nc         jmp     #.normalize1
                      
                        add     .expA, #2               ' adjust exponent
                        add     .manA, #$100 wc         ' round up by 1/2 lsb
          if_c          add     .expA, #1

                        add     .expA, #127             ' add bias to exponent
                        fges    .expA, .Minus23
                        fles    .expA, #255
 
                        cmps    .expA, #1 wc            ' check for subnormals
          if_nc         jmp     #.exit6

.subnormal              or      .manA, #1               ' adjust mantissa
                        ror     .manA, #1

                        neg     .expA, .expA
                        shr     .manA, .expA
                        mov     .expA, #0               ' biased exponent = 0

.exit6                  mov     .fnumA, .manA           ' bits 22:0 mantissa
                        shr     .fnumA, #9
                        mov     .t9, .expA
                        shl     .t9, #23
                        and     .fnumA, .Mask23
                        or      .fnumA, .t9             ' bits 23:30 exponent
                        shl     .flagA, #31
          _ret_         or      .fnumA, .flagA          ' bit 31 sign            

'-------------------- constant values -----------------------------------------

.One                    long    $3F80_0000
.NaN                    long    $7FFF_FFFF
.Inf                    long    $7F80_0000
.Minus23                long    -23
.Mask23                 long    $007F_FFFF
.Mask24                 long    $00FF_FFFF
.Mask29                 long    $1FFF_FFFF
.Bit16                  long    $0001_0000
.Bit29                  long    $2000_0000
.Bit30                  long    $4000_0000
.Bit31                  long    $8000_0000
.LogTable               long    @LOG_TABLE
.ALogTable              long    @ALOG_TABLE
.TableMask              long    $0FFE
.SineTable              long    @SINE_TABLE >> 1
.SineSize               long    $0800
.Bits11                 long    $07FF
.Sin_90                 long    $0800
.Sin_180                long    $1000

'-------------------- local variables -----------------------------------------

.fnumA                  res     1                       ' floating point A value
.flagA                  res     1
.expA                   res     1
.manA                   res     1

.fnumB                  res     1                       ' floating point B value
.flagB                  res     1
.expB                   res     1
.manB                   res     1

                        fit     $1f8
{{
                            TERMS OF USE: MIT License 

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
}}

