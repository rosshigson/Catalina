{
  Test for 4 port serial driver - just types "Hello, World" until
  a character is received - then echoes characters repeatedly until 
  none is received within the specified timeout period.

  Change PORT from 0 .. 3 to select the port to test.
  Change RXPIN, TXPIN or BAUD to configure the port.

  Compile with a command like:

    spinnaker -L "C:\Program Files (x86)\Catalina\target" -D S4_SPIN test_s4.spin
}
CON
  _clkmode  = Common#CLOCKMODE
  _xinfreq  = Common#XTALFREQ
  _stack    = Common#STACKSIZE

  PORT     = 0
  RX       = 31
  TX       = 30
  BAUDRATE = 115200
  TIMEOUT  = 1000 ' ms

OBJ
  Common : "Catalina_Common"
  S4     : "Catalina_FullDuplexSerial4FC"
  
PUB Main | ch

  Common.InitializeRegistry

  S4.Setup
  S4.AddPort(PORT,RX,TX,-1,-1,0,0,BAUDRATE)
  S4.Start

  repeat
    S4.strln(PORT, string("Hello, World!",10))
    ch := s4.rxtime(PORT,TIMEOUT)
    if ch > 0
       repeat 
         s4.tx(PORT, ch)
         ch := s4.rxtime(PORT,TIMEOUT)
       until ch < 0
       s4.tx(PORT, 10)
              
