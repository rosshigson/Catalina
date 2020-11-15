''
'' Simple PASM program to flash a LED on and off once per second (assuming
'' the clock is 180Mhz). 
''
'' By default, uses pin 56 (suitable for the P2_EVAL board)
''
CON

LED_PIN = 56 ' LED on P2_EVAL Pin 56

DAT
              org       0
entry
              or        dirb, bit          
              andn      outb, bit
              getct     count              
loop                          
              addct1    count,increment        
              waitct1
              xor       outb, bit
              jmp       #loop
                               
bit           long      |< (LED_PIN - 32)
count         long      0                  
increment     long      180_000_000/2      
