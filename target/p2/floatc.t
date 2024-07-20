''=============================================================================
'' @file     Catalina_Float32_C_Plugin
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
'' This version was modified for Catalina by:
''     Ross Higson
''
'' @version
'' 1.0 Modified from Float32Full (V1.4) for Catalina
'' 1.1 Updated to incorporate Float32Full (V1.6) changes.
'' 1.2 Modified for P2.
'' 1.3 Modified to use CORDIC solver (P2 only)
'' 7.4 Modifed to use pins as well as Hub RAM
''=============================================================================

CON

#include <constant.inc>

DAT

'---------------------------
' Assembly language routines
'---------------------------
                        alignl
                        org     0
FLOAT_C_START
.t1                     cogid   .t1                     ' get ...
.rqstptr                shl     .t1,#2                  ' ... our ...
.t2                     add     .t1,PTRA                ' ... registry block entry
.t3                     rdlong  .rqstptr,.t1            ' register ...
.t4                     and     .rqstptr,.Mask24        ' ... this ...
.t5                     mov     .t2,#LMM_FLC            ' ... plugin ...
.t6                     shl     .t2,#24                 ' ... as the ...
.t7                     or      .t2,.rqstptr            ' ... appropriate ...
.t8                     wrlong  .t2,.t1                 ' ... type
.t9                     and     .rqstptr,.Mask24        ' set up our request block address
#ifdef FLOAT_PINS
.fnumA                  wrpin   #FLOAT_PIN_MODE,#FLOAT_CMD_PIN
.flagA                  wrpin   #FLOAT_PIN_MODE,#FLOAT_RSP_PIN
.expA                   wrpin   #FLOAT_PIN_MODE,#FLOAT_AVAL_PIN
.manA                   wrpin   #FLOAT_PIN_MODE,#FLOAT_BVAL_PIN
.fnumB                  dirh    #FLOAT_RSP_PIN          ' response pin is output
#endif
.pincmd                 jmp     #.doneCommand           ' clear our request block

.getCommand
#ifdef FLOAT_PINS
                        testp   #FLOAT_CMD_PIN wc
          if_nc         jmp     #.getHubCmd
                        mov     .pincmd, #1             ' indicate pin command
                        rdpin   .fnumA, #FLOAT_AVAL_PIN
                        rdpin   .fnumB, #FLOAT_BVAL_PIN
                        rdpin   .t1, #FLOAT_CMD_PIN
                        cmp     .t1,#0 wz
          if_z          jmp     #.exitNan1 
          if_nz         jmp     #.do_cmd
#endif
.getHubCmd              rdlong  .t1, .rqstptr wz        ' wait for command
          if_z          jmp     #.getCommand
                        mov     .pincmd, #0             ' indicate hub command         
                        mov     .t2, .t1                ' load .fnumA
                        rdlong  .fnumA, .t2
                        add     .t2, #4          
                        rdlong  .fnumB, .t2             ' load .fnumB

                        shr     .t1, #24 wz             ' get command
                        cmp     .t1, #(CeilCmd>>24)+1 wc ' check for valid command
          if_z_or_nc    jmp     #.exitNan1 
.do_cmd                 add     .t1, #.cmdTable-1 
                        alts    .t1
                        mov     .t1, 0-0
                        call    .t1                     ' call command routine
                        jmp     #.endCommand

.cmdTable               long    ._FAdd                  ' command dispatch table
                        long    ._FSub
                        long    ._FMul
                        long    ._FDiv
                        long    ._FFloat
                        long    ._FTrunc
                        long    ._FRound
                        long    ._FSqr
                        long    ._FCmp
                        long    ._Sin
                        long    ._Cos
                        long    ._Tan
                        long    ._Log
                        long    ._Log10
                        long    ._Exp
                        long    ._Exp10
                        long    ._Pow
                        long    ._Frac
                        long    ._FMod
                        long    ._ASin
                        long    ._ACos
                        long    ._ATan
                        long    ._ATan2
                        long    ._Floor
                        long    ._Ceil

#ifdef FLOAT_PINS

.exitNan1               mov     .fnumA, .NaN            ' unknown command
.endCommand             cmp     .pincmd,#0 wz           ' pin command?
          if_z          mov     .t1, .rqstptr           ' no - return result
          if_z          add     .t1, #4
          if_z          wrlong  .fnumA, .t1
          if_nz         wxpin   .fnumA,#FLOAT_RSP_PIN   ' yes - pin response
          if_nz         jmp     #.getCommand

#else

.exitNan1               mov     .fnumA, .NaN            ' unknown command
.endCommand             mov     .t1, .rqstptr           ' return result
                        add     .t1, #4
                        wrlong  .fnumA, .t1
#endif

.doneCommand
                        wrlong  #0,.rqstptr             ' clear command status
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
                        call    #._Pack  
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
                        call    #._Pack 
                        ret

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
                        call    #._Pack                        
                        ret

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
                        call    #._Pack                 ' pack and exit
                        ret

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
          
                        test    .expA, #1 wz            ' if odd exponent, shift mantissa 
          if_z          shl     .manA, #1
                        sar     .expA, #1               ' get exponent of root
          if_nz         add     .expA, #1               ' if odd expononent, subtract 1
                        sub     .expA, #23
                        mov     .t1,.expA
                        mov     .t2,#0
                        rol     .manA,#16
                        mov     .t2,.manA
                        and     .t2,##$0000FFFF
                        and     .manA,##$FFFF0000
                        qsqrt   .manA, .t2
                        getqx   .fnumA
                        call    #._FFloat
                        call    #._Unpack
                        add     .expA,.t1
                        call    #._Pack
                        ret

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

.exit1                  mov     .fnumA, #1             ' if .fnumA > .fnumB, .t1 = 1
          if_c          neg     .fnumA, .fnumA         ' if .fnumA < .fnumB, .t1 = -1
          if_z          mov     .fnumA, #0             ' if .fnumA = .fnumB, .t1 = 0
                        ret

'------------------------------------------------------------------------------
' _Sin     .fnumA = sin(.fnumA)
' _Cos     .fnumA = cos(.fnumA)
' changes: .fnumA, .flagA, .expA, .manA, .fnumB, .flagB, .expB, .manB
' changes: .t1, .t2, .t3, .t4, .t5, .t6
'------------------------------------------------------------------------------

._Cos                   mov     .t5, #1
                        jmp     #._Sin_Cos
._Sin                   mov     .t5, #0
._Sin_Cos               mov     .t6, .fnumA             ' save original angle
                        call    #._FMulI                ' convert to 
                        long    2670176.699
                        call    #._FTrunc               ' ... degrees
                        shl     .fnumA, #8
                        cmp     .fnumA, .NaN wz         ' check for Nan
          if_z          ret
                        mov     .fnumB, .Mask24         ' .Mask24 = 16777215
                        qrotate .fnumB, .fnumA
                        cmp     .t5, #0 wz
          if_z          getqy   .fnumA                  ' sin
          if_nz         getqx   .fnumA                  ' cos
                        call    #._FFloat
                        call    #._FDivI
                        long    16777215.0
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
                        qlog    .manA
                        getqx   .manA
                        and     .manA, ##$7FFFFFF
                        shl     .manA, #2
                        mov     .expA, #0
                        call    #._Pack
                        mov     .fnumB, .fnumA
                        mov     .fnumA, .t5             ' convert exponent to float         
                        call    #._FFloat
                        call    #._FAdd                 ' result = exponent + fraction                               
                        ret

.exitNan2   _ret_       mov     .fnumA, .NaN            ' return Nan

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
                        neg     .expA, .expA
                        add     .expA, #2
                        shr     .manA, .expA
                        or      .manA, ##$F0000000
                        qexp    .manA
                        getqx   .fnumA
                        call    #._FFloat
                        call    #._Unpack
                        sub     .expA, #30
                        add     .expA, .t4
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
._Underflow
          _ret_         mov     .fnumA, #0
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
          
.pow1     _ret_         mov     .fnumA, .NaN            ' return Nan

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
          if_c_or_nz    jmp     #.exit2
                        fle     .expA, #23              ' remove the integer
                        shl     .manA, .expA    
                        and     .manA, .Mask29
                        mov     .expA, #0               ' return fraction

.exit2                  call    #._Pack
          _ret_         andn    .fnumA, .Bit31

'------------------------------------------------------------------------------
' _FMod .fnumA = .fnumA mod .fnumB
'------------------------------------------------------------------------------

._FMod                  mov     .t4, .fnumA             ' save .fnumA
                        mov     .t5, .fnumB             ' save .fnumB
                        call    #._FDiv                 ' a - float(fix(a/b)) * b
                        call    #._FTrunc
                        call    #._FFloat
                        mov     .fnumB, .t5
                        call    #._FMul
                        or      .fnumA, .Bit31
                        mov     .fnumB, .t4
                        andn    .fnumB, .Bit31
                        call    #._FAdd
                        test    .t4, .Bit31 wz          ' if a < 0, set sign
          if_nz         or      .fnumA, .Bit31
                        ret

'------------------------------------------------------------------------------
' _ASin   .fnumA = asin(.fnumA)
'------------------------------------------------------------------------------

._ASin
                        mov     .t7, .fnumA
                        andn    .fnumA, .Bit31          ' get absolute value
                        cmps    .fnumA, .One wcz        ' must be <= 1.0
          if_nc_and_nz  mov     .fnumA, .NaN
          if_nc_and_nz  ret
                        mov     .fnumA, .t7
                        call    #._FAddI                ' calculate (1+x)*(1-x)
                        long    1.0
                        mov     .t6, .fnumA
                        mov     .fnumA,.One
                        mov     .fnumB,.t7
                        call    #._FSub
                        mov     .fnumB, .t6
                        call    #._FMul        
                        call    #._FSqr                 ' calculate sqrt((1+x)*(1-x))
                        mov     .fnumB,.fnumA
                        mov     .fnumA,.t7
                        call    #._ATan2                ' x = ATan2(x,sqrt((1+x)*(1-x)))
                        ret

'------------------------------------------------------------------------------
' _ACos   .fnumA = acos(.fnumA)
'------------------------------------------------------------------------------

._ACos                  call    #._ASin                 ' result = pi/2 - asin(x)
                        xor     .fnumA, .Bit31
                        call    #._FAddI
                        long    pi / 2.0
                        ret

'------------------------------------------------------------------------------
' _ATan    .fnumA = atan(.fnumA)
' _ATan2   .fnumA = atan(.fnumA / .fnumB)
'------------------------------------------------------------------------------

._ATan
                        mov     .fnumB,.One
._ATan2
                        call    #._Unpack2
                        sub     .expA, .expB         ' difference in exponents = amount to shift
                        cmps    .expA, #0 wc
          if_nc         shr     .manB, .expA
          if_c          neg     .expA, .expA
          if_c          shr     .manA, .expA
                        test    .flagA, #SignFlag wz    ' check for negative
          if_nz         neg     .manA, .manA
                        test    .flagB, #SignFlag wz    ' check for negative
          if_nz         neg     .manB, .manB
                        qvector .manB, .manA
                        getqy   .fnumA
                        call    #._FFloat
                        call    #._FDivI
                        long    683565234.9
                        ret

'------------------------------------------------------------------------------
' _Floor .fnumA = floor(.fnumA)
' _Ceil .fnumA = ceil(.fnumA)
'------------------------------------------------------------------------------

._Ceil                  mov     .t6, #1                 ' set adjustment value
                        jmp     #.floor2
                        
._Floor                 neg     .t6, #1                 ' set adjustment value

.floor2                 call    #._Unpack               ' unpack variable
          if_c          ret                             ' check for .NaN
                        cmps     .expA, #23 wc          ' check for no fraction
          if_nc         ret              

                        mov     .t4, .fnumA             ' get integer value 
                        call    #._FTrunc
                        mov     .t5, .fnumA
                        xor     .fnumA, .t6
                        test    .fnumA, .Bit31 wz
          if_nz         jmp     #.exit3

                        mov     .fnumA, .t4             ' get fraction  
                        call    #._Frac

                        or      .fnumA, .fnumA wz
          if_nz         add     .t5, .t6                ' if non-.Zero, then adjust

.exit3                  mov     .fnumA, .t5             ' convert integer to float 
                        call    #._FFloat                
                        ret

'------------------------------------------------------------------------------
' input:   .fnumA        32-bit floating point value
'          .fnumB        32-bit floating point value 
' output:  .flagA        .fnumA flag bits (NaN, Infinity, Zero, Sign)
'          .expA         .fnumA exponent (no bias)
'          .manA         .fnumA mantissa (aligned to bit 29)
'          .flagB        .fnumB flag bits (NaN, Infinity, Zero, Sign)
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
' output:  .flagA        .fnumA flag bits (NaN, Infinity, Zero, Sign)
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
                        mov     .fnumA, .NaN            ' no, then return NaN
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
' input:   .flagA        .fnumA flag bits (NaN, Infinity, Zero, Sign)
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
.Bit29                  long    $2000_0000
.Bit31                  long    $8000_0000

'-------------------- local variables -----------------------------------------

#ifndef FLOAT_PINS
.fnumA                  long    0                       ' floating point A value
.flagA                  long    0
.expA                   long    0
.manA                   long    0
.fnumB                  long    0                       ' floating point B value
#endif
.flagB                  long    0
.expB                   long    0
.manB                   long    0

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

