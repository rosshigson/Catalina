{
' Demonstration SPIN program to access the Catalyst command line.
'
' There are three main functions provided by Catalyst_Arguments:
'
'    init(@buffer)  - initialize the arguments in the buffer
'    argc           - return the number of arguments.
'    argv(n)        - return a pointer to argument n.
'
' The demo program should be saved on an SD Card (e.g. as DEMO.BIN) and then
' invoked from within Catalyst. For example:
'
'    demo "hello, world !!!" arg_2 arg_3
'
' If this program is started by other any other means, the result
' of argc will be zero.
'
' MAKE SURE TO ADJUST THE CLOCK SPEED, PIN NUMBERS 
' AND KB AND TV/CGA DRIVERS TO SUIT YOUR PLATFORM
'
}
CON

_stack    = 50

' C3
'{
_clkmode  = xtal1 + pll16x
_xinfreq  = 5_000_000  

TV_PIN    = 12
KB_PIN    = 26
'}

' HYBRID
{
_clkmode  = xtal1 + pll16x
_xinfreq  = 6_000_000  

TV_PIN    = 24
KB_PIN    = 12
}

' DRACBLADE
{
_clkmode  = xtal1 + pll16x
_xinfreq  = 5_000_000  

TV_PIN    = 16
KB_PIN    = 26
}

 
VAR
 
  LONG Arguments[arg#MAX_LONGS] ' 1200 bytes
 
OBJ
  ' The following object MUST be included:
  
  arg : "Catalyst_Arguments"

  ' The following objects are included for the demo only:
  
' tv  : "VGA_Text" ' DRACBLADE
  tv  : "TV_Text"  ' HYBRID
  
  kbd : "comboKeyboard"
 
PUB Start | i

   ' The following MUST be called before any other function:
   arg.init(@Arguments) 
 
   ' The following is a simple demo program that prints out the arguments:
   tv.start(TV_PIN)
   kbd.start(KB_PIN)
   
   tv.str(string("Catalyst SPIN Test Program",13))
   tv.str(string("Argc = "))
   tv.dec(arg.argc)
   tv.out(13)
   
   if arg.argc > 0
     repeat i from 0 to arg.argc - 1
       tv.str(string("Argv["))
       tv.dec(i)
       tv.str(string("] = "))
       tv.str(arg.argv(i))
       tv.out(13)

   tv.str(string(13,"Press any key to continue ..."))
   kbd.getkey
   reboot

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

