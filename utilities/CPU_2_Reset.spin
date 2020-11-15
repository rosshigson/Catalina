{{
''
'' Program to allow Morpheus CPU 1, to control CPU #2
'' i.e. shutdown, reset, load into RAM or load into EEPROM.
''
'' Note: It takes about 10 or 12 seconds to load a program -
'' longer if it is to be programmed into EEPROM.
''
}}
CON
  _clkmode = xtal1 + pll16x
  _xinfreq = 5_000_000

'
' Cpus available:
'
CPU_2           = Loader#PinRES2
'
' The command to send:
'
Shutdown        = Loader#Shutdown          ' just shutdown     
LoadRun         = Loader#LoadRun           ' load program into RAM and execute
ProgramShutdown = Loader#ProgramShutdown   ' load program into EEPROM and shutdown
ProgramRun      = Loader#ProgramRun        ' load program into EEPROM and execute
Reset           = Loader#Reset             ' don't load, just reset 
'
' The possible error conditions:
'

ErrorConnect    = Loader#ErrorConnect    
ErrorVersion    = Loader#ErrorVersion    
ErrorChecksum   = Loader#ErrorChecksum   
ErrorProgram    = Loader#ErrorProgram    
ErrorVerify     = Loader#ErrorVerify     

OBJ

  Loader : "Morpheus_Loader"
 
PUB CpuCommand

  Loader.Connect(CPU_2, Reset, 0)

  Reboot  