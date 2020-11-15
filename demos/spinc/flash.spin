''
'' Simple Spin program to flash the C3 VGA LED on and off once per second.
''
CON

_clkmode        = xtal1 + pll8x
_clkfreq        = 80_000_000
_stack          = 10

LED_PIN         = 16 ' VGA LED  on the C3

VAR
   long bit 
   long count

PUB Flash_Led

  bit := 1<<(LED_PIN - 1)
  dira := bit
  count := cnt + _clkfreq/2  

  repeat
    bit ^= 1<<(LED_PIN - 1)
    outa := bit
    waitcnt(count)
    count += _clkfreq/2
