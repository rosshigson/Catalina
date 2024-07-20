''=============================================================================
'' @file     Catalina_Float32_B_Plugin
'' @target   Propeller
''
'' IEEE 754 compliant 32-bit floating point math routines.
''
'' The original version (Float32Full) is by:
'' @author   Cam Thompson, Micromega Corporation
''
'' Copyright (c) 2006-2007 Parallax, Inc.
'' See end of file for terms of use.
''
'' This version (Catalina_Float32_B_Plugin) was modified for Catalina by:
''     Ross Higson
''
'' @version
'' 1.0 Modified from Float32A (V1.4) for Catalina
'' 1.1 Updated to incorporate Float32A (V1.6) changes.
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
FLOAT_B_START
.t1                     cogid   .t1                     ' get ...
.t2                     shl     .t1,#2                  ' ... our ...
.t3                     add     .t1,PTRA                ' ... registry block entry
.t4                     rdlong  .rqstptr,.t1            ' register ...
.t5                     and     .rqstptr,.Mask24        ' ... this ...
.t6                     mov     .t2,#LMM_FLB            ' ... plugin ...
.t7                     shl     .t2,#24                 ' ... as the ...
.t8                     or      .t2,.rqstptr            ' ... appropriate ...
.t9                     wrlong  .t2,.t1                 ' ... type
.status                 and     .rqstptr,.Mask24        ' set up our request block address
                        jmp     #.doneCommand           ' clear our request block

.getCommand
                        rdlong  .t1, .rqstptr wz        ' wait for command
          if_z          jmp     #.getCommand
          
                        mov     .t2, .t1                ' load .fnumA
                        rdlong  .fnumA, .t2
                        add     .t2, #4          
                        rdlong  .fnumB, .t2             ' load .fnumB

                        shr     .t1, #24 wz             ' get command
                        cmp     .t1, #(CeilCmd>>24)+1 wc ' check for valid command
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
                        call    #._FSpare
                        jmp     #.endCommand
                        call    #._FSpare
                        jmp     #.endCommand
                        call    #._FSpare
                        jmp     #.endCommand
                        call    #._FSpare
                        jmp     #.endCommand
                        call    #._FSpare
                        jmp     #.endCommand
                        call    #._FSpare
                        jmp     #.endCommand
                        call    #._FSpare
                        jmp     #.endCommand
                        call    #._FSpare
                        jmp     #.endCommand
                        call    #._FSpare
                        jmp     #.endCommand
                        call    #._FMod
                        jmp     #.endCommand
                        call    #._ASin
                        jmp     #.endCommand
                        call    #._ACos
                        jmp     #.endCommand
                        call    #._ATan
                        jmp     #.endCommand
                        call    #._ATan2
                        jmp     #.endCommand
                        call    #._Floor
                        jmp     #.endCommand
                        call    #._Ceil
                        jmp     #.endCommand

.returnstatus           mov     .fnumA, .status
                        jmp     #.endcommand

.exitNan1               mov     .fnumA, .NaN            ' unknown command
.endCommand             mov     .t1, .rqstptr           ' return result
                        add     .t1, #4
                        wrlong  .fnumA, .t1
.doneCommand
                        wrlong  .Zero,.rqstptr          ' clear command status
                        jmp     #.getCommand            ' wait for next command

'------------------------------------------------------------------------------


'------------------------------------------------------------------------------
' _FSpare   do nothing!
'------------------------------------------------------------------------------
._FSpare
                        ret

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

._ASin                  mov     .t7, .fnumA             ' save sign
                        andn    .fnumA, .Bit31          ' get absolute value
                        cmps    .fnumA, .One wcz        ' must be <= 1.0
          if_nc_and_nz  mov     .fnumA, .Nan
          if_nc_and_nz  ret
          
                        mov     .t4, .fnumA             ' save x value
                        mov     .t3, #.ASinTable        ' result = Taylor series     
                        call    #.poly

                        call    #._FAddI                ' result = result + pi/2
.pi2                    long    pi / 2.0
                        mov     .t6, .fnumA
                       
                        mov     .fnumA, .t4             ' calculate sqrt(1-x) 
                        xor     .fnumA, .Bit31 
                        call    #._FAddI
                        long    1.0
                        call    #._FSqr

                        mov     .fnumB, .t6             ' result = result * sqrt(1-x)   
                        call    #._FMul
                        xor     .fnumA, .Bit31          ' result = pi/2 - result
                        call    #._FAddI
                        long    pi / 2.0
                        test    .t7, .Bit31 wz          ' if sign, result = -result
          if_nz         xor     .fnumA, .Bit31
                        
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
' _ATan   .fnumA = atan(.fnumA)
'------------------------------------------------------------------------------

._ATan                  mov     .t7, .fnumA             ' save sign
                        andn     .fnumA, .Bit31         ' get absolute value
                        call    #._FAddI                ' x = (x-1) / (x+1)
                        long    1.0
                        mov     .t6, .fnumA
                        call    #._FSubI
                        long    2.0
                        mov     .fnumB, .t6
                        call    #._FDiv        
                        mov     .t6, .fnumA
                        
                        mov     .fnumB, .fnumA          ' x2 = x ** 2
                        call    #._FMul
                        mov     .t4, .fnumA

                        mov     .t3, #.ATanTable        ' result = Taylor series
                        call    #.poly      
                        mov     .fnumB, .t6             ' result = result * x + (pi / 4)
                        call    #._FMul
                        call    #._FAddI
                        long    pi / 4.0
                        test    .t7, .Bit31 wz          ' if sign, result = -result
          if_nz         xor     .fnumA, .Bit31
                        ret

'------------------------------------------------------------------------------
' _ATan2   .fnumA = atan(.fnumA / .fnumB)
'------------------------------------------------------------------------------

._ATan2                 mov     .t8, .fnumA wc          ' bit 31 = sign .fnumA
                        and     .t8, .Bit31               
                        test    .fnumB, .Bit31 wz       ' bit 30 = sign .fnumB
          if_nz         or      .t8, .Bit30
                        andn    .fnumA, .Bit31 wz       ' get |.fnumA|, check for .Zero
          if_z          jmp     #.exit2                 ' if 0 / n, then +0 or -0
                        andn    .fnumB, .Bit31 wz       ' get |.fnumB|, check for .Zero
          if_z          mov     .fnumA, .pi2            ' if n / 0, then pi/2 or -pi/2
          if_z          jmp     #.exit2                 ' x = .fnumA / .fnumB
                        call    #._FDiv

                        call    #._ATan                 ' x = atan(a)
                        test    .t8, .Bit30 wz          ' check signs
          if_z          jmp     #.exit2                 ' if +/+ or +/-, then result = +x or -x
          
                        test    .t8, .Bit31 wz
          if_nz         jmp     #.exit1
          
                        xor     .fnumA, .Bit31          ' if +/-, then result = pi - x 
                        call    #._FAddI
                        long    pi
                        ret                                          

.exit1                  call    #._FSubI                ' if -/-, then result = x - pi 
                        long    pi
                        ret
                            
.exit2                  test    .t8, .Bit31 wz          ' if numerator < 0, then negate
          if_nz         xor     .fnumA, .Bit31
                        ret

'------------------------------------------------------------------------------
' _Floor .fnumA = floor(.fnumA)
' _Ceil .fnumA = ceil(.fnumA)
'------------------------------------------------------------------------------

._Ceil                  mov     .t6, #1                 ' set adjustment value
                        jmp     #.floor2
                        
._Floor                 neg     .t6, #1                 ' set adjustment value

.floor2                 call    #._Unpack               ' unpack variable
          if_c          ret                             ' check for .Nan
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
' _FSqr    .fnumA = sqrt(.fnumA)
' changes: .fnumA, .flagA, .expA, .manA, .t1, .t2, .t3, .t4, .t5 
'------------------------------------------------------------------------------

._FSqr                  call    #._Unpack               ' unpack floating point value
          if_nc         mov     .fnumA, #0              ' set initial result to .Zero
          if_c_or_z     ret                             ' check for .Nan or .Zero
                        test    .flagA, #SignFlag wz    ' check for negative
          if_nz         mov     .fnumA, .Nan            ' yes, then return .Nan                       
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
                        call    #._Pack
                        ret


'------------------------------------------------------------------------------
' ._Frac .fnumA = fractional part of .fnumA
' changes: .fnumA, .flagA, .expA, .manA
'------------------------------------------------------------------------------

._Frac                  call    #._Unpack               ' get fraction
                        test    .expA, .Bit31 wz        ' check for exp < 0 or .Nan
          if_c_or_nz    jmp     #.exit4
                        fle     .expA, #23              ' remove the integer
                        shl     .manA, .expA
                        and     .manA, .Mask29
                        mov     .expA, #0               ' return fraction

.exit4                  call    #._Pack
          _ret_         andn    .fnumA, .Bit31

'------------------------------------------------------------------------------
' _FAdd    .fnumA = .fnumA + .fnumB
' _FAddI   .fnumA = .fnumA + {Float immediate}
' _FSub    .fnumA = .fnumA - .fnumB
' _FSubI   .fnumA = .fnumA - {Float immediate}
' changes: .fnumA, .flagA, .expA, .manA, .fnumB, .flagB, expB, .manB, .t1
'------------------------------------------------------------------------------

._FSubI                 pop     .t1                     ' get the address ...
                        sets    .getB, .t1              ' ... of the immediate operand
                        add     .t1, #1                 ' update return address ...
                        push    .t1                     ' ... to be beyond the operand
.getB                   mov     .fnumB, 0               ' get the immediate operand

._FSub                  xor     .fnumB, .Bit31          ' negate B
                        jmp     #._FAdd                 ' add values                                               

._FAddI                 pop     .t1                     ' get the address ...
                        sets    .getB2, .t1             ' ... of the immediate operand
                        add     .t1, #1                 ' update return address ...
                        push    .t1                     ' ... to be beyond the operand
.getB2                  mov     .fnumB, 0               ' get the immediate operand

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
                        sets    .getB3, .t1             ' ... of the immediate operand
                        add     .t1, #1                 ' update return address ...
                        push    .t1                     ' ... to be beyond the operand
.getB3                  mov     .fnumB, 0               ' get the immediate operand

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
                        sets    .getB4, .t1             ' ... of the immediate operand
                        add     .t1, #1                 ' update return address ...
                        push    .t1                     ' ... to be beyond the operand
.getB4                  mov     .fnumB, 0               ' get the immediate operand

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
' _FCmp    set Z and C flags for .fnumA - .fnumB
' _FCmpI   set Z and C flags for .fnumA - {Float immediate}
' changes: status, .t1
'------------------------------------------------------------------------------

._FCmpI                 pop     .t1                     ' get the address ...
                        sets    .getB4, .t1             ' ... of the immediate operand
                        add     .t1, #1                 ' update return address ...
                        push    .t1                     ' ... to be beyond the operand
.getB4                  mov     .fnumB, 0               ' get the immediate operand

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
                        or     .flagA, #NanFlag
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

'------------------------------------------------------------------------------
' input:   .t3           address of polynomial coefficient table
'          .t4           X value
' output:  .fnumA        result of nth order polynomial calculation
'------------------------------------------------------------------------------

.poly                   mov     .fnumA, #0              ' set initial result to 0
                        sets    .getCnt, .t3            ' get coefficient count 
                        add     .t3, #1
                        nop
.getCnt                 mov     .t5, 0                  
                        and     .t5, #$FF wz            ' restrict table size
          if_z          ret
                        jmp     #.poly3                 ' calculate polynominal value
                        
.poly2                  mov     .fnumB, .t4             ' result = result * X
                        call    #._FMul
                         
.poly3                  sets    .getCoeff, .t3          ' result = result + coefficient[n]
                        add     .t3, #1
                        nop
.getCoeff               mov     .fnumB, 0
                        call    #._FAdd
                        djnz    .t5, #.poly2            ' repeat for all coefficients                        
                        ret


'-------------------- constant values -----------------------------------------

.Zero                   long    0                       ' constants
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

.ASinTable              long    6
                        long    -0.004337769
                        long    0.019349938
                        long    -0.044958886
                        long    0.08787631
                        long    -0.21451236
                        long    0

.ATanTable              long    6
                        long    -0.0117212
                        long    0.05265332
                        long    -0.11643287
                        long    0.19354346
                        long    -0.33262348
                        long    0.99997723


'-------------------- local variables -----------------------------------------

.rqstptr                res     1                       ' my request /reply block address

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

