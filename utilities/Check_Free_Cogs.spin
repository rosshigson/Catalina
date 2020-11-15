{{
---------------------------------------------------------------
 Check_Free_Cogs - A simple demo of Catalina_Cog_Count  

 Version 1.0 - initial version by Ross Higson

---------------------------------------------------------------
}}
CON
'
' Set these to suit the platform by modifying "Catalina_Common"
' Also, that is now where the PIN definitions for the platform
' are defined. Do not modify these in this file.
'
_clkmode  = Common#CLOCKMODE
_xinfreq  = Common#XTALFREQ
_stack    = Common#STACKSIZE
'
OBJ
  Common   : "Catalina_Common"                          ' Common Definitions
  CogCount : "Catalina_CogCount"

PUB Start : ok | DATA, PAGE, BLOCK, XFER, MAX_LOAD                    

  ' calculate and flash the free cog count
  CogCount.Flash_Free_Cog_Count

  ' do it again to make sure we haven't left anything running
  CogCount.Flash_Free_Cog_Count

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

