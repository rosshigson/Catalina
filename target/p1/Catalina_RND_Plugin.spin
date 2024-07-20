{{
''=============================================================================
''
'' Catalina_RND_Plugin - Implement a Random Number Generator for Catalina.
''
''
'' Implemented for Catalina by:
''     Ross Higson, based on "Real Random v1.2" by Chip Gracey
''
'' History:
''   1.0 - Initial version
''
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Background and Detail:                                                                                         │
│                                                                                                                │
│ A real random number is impossible to generate within a closed digital system. This is because there are no    │
│ reliably-random states within such a system at power-up, and after power-up, it behaves deterministically.     │
│ Random values can only be 'earned' by measuring something outside of the digital system.                       │                                                                           
│                                                                                                                │
│ In your programming, you might have used 'var?' to generate a pseudo-random sequence, but found the same       │
│ pattern playing every time you ran your program. You might have then used 'cnt' to 'randomly' seed the 'var'.  │
│ As long as you kept downloading to RAM, you saw consistently 'random' results. At some point, you probably     │
│ downloaded to EEPROM to set your project free. But what happened nearly every time you powered it up? You were │
│ probably dismayed to discover the same sequence playing each time! The problem was that 'cnt' was always       │
│ powering-up with the same initial value and you were then sampling it at a constant offset. This can make you  │
│ wonder, "Where's the end to this madness? And will I ever find true randomness?".                              │                                                              
│                                                                                                                │
│ In order to have real random numbers, either some external random signal must be input, or some analog system  │
│ must be used to generate random noise which can be measured. We're in luck here, because it turns out that the │
│ Propeller does have sufficiently-analog subsystems which can be exploited for this purpose -- each cog's CTR   │
│ PLLs. These can be exercised internally to good effect, without any I/O activity.                              │                                                                   
│                                                                                                                │
│ This object sets up a cog's CTRA PLL to run at the main clock's frequency. It then uses a pseudo-random        │
│ sequencer to modulate the PLL's target phase. The PLL responds by speeding up and slowing down in a an endless │
│ effort to lock. This results in very unpredictable frequency jitter which is fed back into the sequencer to    │
│ keep the bit salad tossing. The final output is a truly-random 32-bit unbiased value that is fully updated     │
│ every ~100us, with new bits rotated in every ~3us. This value can be sampled by your application whenever a    │ 
│ random number is needed.                                                                                       │
│                                                                                                                │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤

''=============================================================================
}}

CON

LMM_RND        = common#LMM_RND

#include "Constants.inc"

OBJ
   common : "Catalina_Common"

PUB Setup

'' nothing to do here
   
PUB Start : cog

'' start RND plugin in a new cog
'' returns false (zero) if no cog available, or cog number + 1

  cog := cognew(@entry, Common#REGISTRY) 

  if cog => 0
    ' wait till we know it has registered
    
    repeat until (long[Common#REGISTRY][cog] & $FF000000) <> $FF000000
      ' loop until plugin has registered
 
  cog += 1

DAT
                        org
entry
                        cogid   t1                      ' get ...
                        shl     t1,#2                   ' ... our ...
                        add     t1,par                  ' ... registry block entry
                        rdlong  rqstptr,t1              ' register ...
                        and     rqstptr,Mask24          ' ... this ...
                        wrlong  Zero,rqstptr            ' ... plugin ...
                        mov     t2,#LMM_RND             ' ... as ...
                        shl     t2,#24                  ' ... the ...
                        or      t2,rqstptr              ' ... appropriate ...
                        wrlong  t2,t1                   ' ... type
                        mov     randptr,rqstptr         ' calculate address ...
                        add     randptr,#4              ' ... to write random numbers
                        wrlong  Zero,randptr            ' set random number to zero (invalid first random!)
     
                        movi    ctra,#%00001_111        'set ctra to internal pll mode, select x16 tap
                        movi    frqa,#$020              'set frqa to system clock frequency / 16
                        movi    vcfg,#$040              'set vcfg to discrete output, but without pins
                        mov     vscl,#70                'set vscl to 70 pixel clocks per waitvid

                        mov     t1,#32

:twobits                waitvid 0,0                     'wait for next 70-pixel mark ± jitter time
                        test    phsa,#%10111    wc      'pseudo-randomly sequence phase to induce jitter
                        rcr     phsa,#1                 '(c holds random bit #1)
                        add     phsa,cnt                'mix PLL jitter back into phase 

                        rcl     par,#1          wz, nr  'transfer c into nz (par shadow register = 0)
                        djnz    t1,#:morebits           'done 32 bits?
                        wrlong  _random_value,randptr   'yes - write random value to registry
                        mov     t1,#32               'start count again

:morebits               waitvid 0,0                     'wait for next 70-pixel mark ± jitter time           
                        test    phsa,#%10111    wc      'pseudo-randomly sequence phase to induce jitter        
                        rcr     phsa,#1                 '(c holds random bit #2)                                                        
                        add     phsa,cnt                'mix PLL jitter back into phase                    

        if_z_eq_c       rcl     _random_value,#1        'only allow different bits (removes bias)
                        jmp     #:twobits               'get next two bits


'-------------------- constant values -----------------------------------------

Zero                    long    0                       ' constants
Mask24                  long    $00FF_FFFF

'-------------------- local variables -----------------------------------------

t1                      long    0
t2                      long    0
rqstptr                 long    0                       ' request block address
randptr                 long    0                       ' address to write random numbers
_random_value           long    0

                        fit     $1f0
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

