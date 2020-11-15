{{
'---------------------------------------------------------------
' Catalina_CogCount - Some useful debugging routines, including
'                     a function to count free cogs.  
'
' Version 1.0 - initial version by Ross Higson
'
' Version 3.5 - remove all visual fucntions (to flash LEDs etc)
'               unless the symbol VISUAL_COG_COUNT is defined
'
'---------------------------------------------------------------
}}

CON

#include "CFG.inc"

CON

#ifdef DEBUG_LED_COGCOUNT
  LED_MASK   = |<Common#DEBUG_PIN
#endif

  STACKSIZE  = 4

  BLIP_TIME  = 100
  DIGIT_TIME = 250
  HEX_TIME   = 1000

OBJ
  Common : "Catalina_Common"

#ifdef VISUAL_COG_COUNT

PUB LED_On 
#ifdef DEBUG_LED_COGCOUNT
   dira |= LED_MASK
#ifdef INVERT_DEBUG_LED
   outa &= !LED_MASK
#else
   outa |= LED_MASK
#endif
#endif

PUB LED_Off
#ifdef DEBUG_LED_COGCOUNT
   dira |= LED_MASK
#ifdef INVERT_DEBUG_LED
   outa |= LED_MASK
#else
   outa &= !LED_MASK
#endif
#endif

PUB Wait(ms)

   waitcnt(CLKFREQ/1000*ms + cnt)

PUB LED_Pulse(ms)

   Led_On
   Wait(ms)
   Led_Off

PUB LED_Count(count) | i

  if count == 0
     LED_Pulse(BLIP_TIME)
  else
     repeat i from 1 to count
        LED_Pulse(DIGIT_TIME)
        Wait(DIGIT_TIME)


PUB Flash_Hex (hex_value) | i

   i := 0
   
   repeat 
      hex_value <-= 4
      if (i < 7) and (hex_value & $F == 0)
         i++
      else
         quit

   repeat 
      LED_Count(hex_value & $F)
      Wait(HEX_TIME)
      hex_value <-= 4
      i++
   until i == 8

   Wait(HEX_TIME)

PUB Free_Cog_Count : count | i, bitset

  bitset := Free_Cog_Bits

  repeat i from 0 to 7
     if ((bitset >> i) & 1) == 1
       count++

  return count

PUB Flash_Free_Cog_Count

   Flash_Hex(Free_Cog_Count)

#endif

PRI Occupy_Cog

   repeat 

PUB Free_Cog_Bits : bitset | i, cog, stack[8*STACKSIZE]

  bitset := 0              

  repeat i from 0 to 7
     cog := cognew(Occupy_Cog, @stack[STACKSIZE*i])
     if cog < 0
        ' no more cogs, so ...
        quit
     else
        bitset |= (1<<cog)
        
  repeat i from 0 to 7
     if (bitset & (1<<i)) > 0
       cogstop(i)

  return bitset

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

