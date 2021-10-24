{
  Test for 4 port serial driver - just types "Hello, World" until
  a character is received - then echoes characters repeatedly until 
  none is received within the specified timeout period.

  Change PORT from 0 .. 3 to select the port to test.
  Change RXPIN, TXPIN or BAUD to configure the port.

  Compile with a command like:

    spinnaker -L "C:\Program Files (x86)\Catalina\target" -D TTY_SPIN test_tty.spin
}
CON

  _clkmode  = Common#CLOCKMODE
  _xinfreq  = Common#XTALFREQ
  _stack    = Common#STACKSIZE

  TIMEOUT  = 1000 ' ms

OBJ
  Common : "Catalina_Common"
  TTY    : "Catalina_FullDuplexSerial"
  
PUB Main | ch

  Common.InitializeRegistry

  TTY.Setup
  TTY.Start

  repeat
    TTY.str(string("Hello, World!",10))
    ch := TTY.rxtime(TIMEOUT)
    if ch > 0
       repeat 
         TTY.tx(ch)
         ch := TTY.rxtime(TIMEOUT)
       until ch < 0
       TTY.tx(10)
              
