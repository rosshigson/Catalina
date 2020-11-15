' Morpheus Loader
'
' Created by Ross Higson, based on the
' Propeller Loader 1.0 (C) 2006 Parallax, Inc
'
'' This object lets a Propeller chip load or control another Propeller chip in
'' the same way a PC normally does - it can shut it down, start it up, or load
'' a new program into RAM or EEPROM.
''
'' To load a program, the program to be loaded into the other Propeller chip
'' can be compiled annd saved as a Binary File This binary file can then be 
'' included using a DAT 'file' command so that it will be resident and its 
'' address can be used in this object.
''
'' The code to call this loader  would look something like this:
''
'' OBJ Loader : "Morpheus_Loader"
''
'' DAT loadme file "loadme.binary"
''
'' PUB LoadPropeller
''
''  Loader.Connect(Loader#PinRES1, loader#LoadRun, @loadme)
''
''
'' This object drives the other Propeller's RESn line, so it is recommended that
'' the other Propeller's BOEn pin be tied high and that its RESn pin be pulled
'' to VSS with a 1M resistor to keep it on ice until showtime.

CON
'
' Commands and errors
'
  #0, Shutdown, LoadRun, ProgramShutdown, ProgramRun, Reset
  #1, ErrorConnect, ErrorVersion, ErrorChecksum, ErrorProgram, ErrorVerify
'
' Morpheus Pins
'
  PinRES2 = 21    ' to load CPU #2, specify this as PinRESn

  PinTx  = 19
  PinRx  = 18

  Version = 1

VAR

  long LFSR, Ver, Echo
  

PUB Connect(PinRESn, Command, CodePtr) : Error

  'RESn low
  outa[PinRESn] := 0            
  dira[PinRESn] := 1
  
  'Tx high (our TX)
  outa[PinTx] := 1             
  dira[PinTx] := 1
  
  'Rx input (our RX)
  dira[PinRx] := 0             

  'RESn high
  outa[PinRESn] := 1            

  if Command <> Reset
  
    'wait 100ms
    waitcnt(clkfreq / 10 + cnt)

    'Communicate (may abort with error code)
    if Error := \Communicate(Command, CodePtr)
      dira[PinRESn] := 0

  'Tx float
  dira[PinTx] := 0
  

PRI Communicate(Command, CodePtr) | ByteCount

  'output calibration pulses
  BitsOut(%01, 2)               

  'send LFSR pattern
  LFSR := "P"                   
  repeat 250
    BitsOut(IterateLFSR, 1)

  'receive and verify LFSR pattern
  repeat 250                   
    if WaitBit(1) <> IterateLFSR
      abort ErrorConnect

  'receive chip version      
  repeat 8
    Ver := WaitBit(1) << 7 + Ver >> 1

  'if version mismatch, shutdown and abort
  if Ver <> Version
    BitsOut(Shutdown, 32)
    abort ErrorVersion

  'send command
  BitsOut(Command, 32)

  'handle command details
  if Command          

    'send long count
    ByteCount := byte[CodePtr][8] | byte[CodePtr][9] << 8
    BitsOut(ByteCount >> 2, 32)

    'send bytes
    repeat ByteCount
      BitsOut(byte[CodePtr++], 8)

    'allow 250ms for positive checksum response
    if WaitBit(25)
      abort ErrorChecksum

    'eeprom program command
    if Command > 1
    
      'allow 5s for positive program response
      if WaitBit(500)
        abort ErrorProgram
        
      'allow 2s for positive verify response
      if WaitBit(200)
        abort ErrorVerify
                

PRI IterateLFSR : Bit

  'get return bit
  Bit := LFSR & 1
  
  'iterate LFSR (8-bit, $B2 taps)
  LFSR := LFSR << 1 | (LFSR >> 7 ^ LFSR >> 5 ^ LFSR >> 4 ^ LFSR >> 1) & 1
  

PRI WaitBit(Hundredths) : Bit | PriorEcho

  repeat Hundredths
  
    'output 1t pulse                        
    BitsOut(1, 1)
    
    'sample bit and echo
    Bit := ina[PinRx]
    PriorEcho := Echo
    
    'output 2t pulse
    BitsOut(0, 1)
    
    'if echo was low, got bit                                      
    if not PriorEcho
      return
      
    'wait 10ms
    waitcnt(clkfreq / 100 + cnt)

  'timeout, abort
  abort ErrorConnect

  
PRI BitsOut(Value, Bits)

  repeat Bits

    if Value & 1
    
      'output '1' (1t pulse)
      outa[PinTx] := 0                        
      Echo := ina[PinRx]
      outa[PinTx] := 1
      
    else
    
      'output '0' (2t pulse)
      outa[PinTx] := 0
      outa[PinTx] := 0
      Echo := ina[PinRx]
      Echo := ina[PinRx]
      outa[PinTx] := 1

    Value >>= 1

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
    
