''
'' Simple cog program to flash a LED on and off once per second.
''
'' This program is set up for the Hydra, Hybrid or C3 - you may need 
'' to change the LED pin, the clock mode and clock frequency to suit
'' your own platform.
''
''
CON
#ifdef C3
LED_PIN         = 15 ' VGA LED  on the C3
#else
LED_PIN         = 0  ' Debug LED on the Hydra or Hybrid
#endif

_clkmode        = xtal1 + pll8x
_clkfreq        = 80_000_000
_stack          = 20


PUB Flash_Led
  cognew (@entry, 0)

DAT
              org       0
entry
              or        dira, bit          
              andn      outa, bit
              mov       count,cnt              
              add       count,increment        
loop                          
              waitcnt   count, increment   
              xor       outa, bit
              jmp       #loop
                               
bit           long      |< LED_PIN
count         long      0                  
increment     long      _clkfreq/2      
