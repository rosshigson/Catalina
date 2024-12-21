''
'' Simple PASM program to flash a LED on and off once per second (assuming
'' the clock is 180Mhz - but note that this code does not set the clock 
'' because it assumes the code will be loaded by a Catalina progrm that
'' has already done so. If is it compiled and loaded manually, the clock 
'' will be set to the default RCFAST mode, which is 20Mhz - this means it 
'' will flash the LED on and off once every 9 seconds). 
''
'' By default, uses pin 56 (suitable for the P2_EVAL board). 
'' On the P2_EDGE it should be changed to use pin 38.
''
CON

LED_PIN = 56 ' LED on P2_EVAL is pin 56 - change to 38 for P2_EDGE

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
