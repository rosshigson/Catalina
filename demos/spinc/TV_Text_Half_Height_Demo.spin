{{

┌──────────────────────────────────────────┐
│ TV_Text_Half_Height_Demo V1.0            │
│ Author: <Jim Bagley>                     │               
│ Copyright (c) 2009 Jim Bagley            │               
│ See end of file for terms of use.        │                
└──────────────────────────────────────────┘

Demo to show how to start the TV_Text_Half_Height object

}}


CON

  _clkmode = xtal1 + pll16x
  _xinfreq = 5_000_000

VAR
  LONG am_i_first
  BYTE am_i_second

OBJ

  text : "TV_Text_Half_Height"
  

PUB start | i,j
  text.start(12,0,1,40,30)
  repeat i from 0 to 28
    text.ink(i&7)    
    text.str(string("40 Columns by 30 Rows NTSC, using ROM :)"))
  text.ink(i&7)    
  text.str(string("40 Columns by 30 Rows NTSC, using ROM:)"))

  text.inkblock(5,2,30,11,1)

  repeat

{{
┌──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
│                                                   TERMS OF USE: MIT License                                                  │                                                            
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation    │ 
│files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy,    │
│modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software│
│is furnished to do so, subject to the following conditions:                                                                   │
│                                                                                                                              │
│The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.│
│                                                                                                                              │
│THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE          │
│WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR         │
│COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,   │
│ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.                         │
└──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
}}   