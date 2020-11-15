{{
''
'' Program to allow TriBladeProp CPU #2, to control either
'' CPU #1 or CPU #3 - i.e. shutdown, reset, load into RAM
'' or load into EEPROM.
''
'' Note: It takes about 10 or 12 seconds to load a program -
'' longer if it is to be programmed into EEPROM.
''
}}
CON
  _clkmode = xtal1 + pll16x
  _xinfreq = 5_000_000

'
' CPUs available:
'
CPU_1           = Loader#PinRES1
CPU_3           = Loader#PinRES3
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

  Loader : "TriBladeProp_Loader"
 
DAT

  loadme file "Generic_SIO_Loader_3.binary"  ' <---- program to be loaded

PUB CpuCommand

  Loader.Connect(CPU_3, LoadRun, @loadme)

  Reboot  