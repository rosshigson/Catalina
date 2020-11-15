''
'' KB_TV - a simple Spin-based HMI for demonstrating C integration
''
CON

' define the HMI commands

KEY_WAIT   = 1
KEY_READY  = 2
PUT_CHR    = 3
PUT_STR    = 4

DAT

welcome_msg BYTE "Welcome to Spin",13,0

VAR

   long command       ' command will be written here
   long data          ' data for command will be written/returned here

OBJ
 
kbd : "Keyboard"
scr : "TV_Text"

PUB Start

   kbd.Start (26, 27)   ' pin numbers for C3 keyboard
   scr.Start (12)       ' pin numbers for C3 TV output

   data := 0
   command := 0

   scr.str(@welcome_msg)
         
   repeat

      case command

         KEY_WAIT:
            data := kbd.newkey
            command := 0

         KEY_READY:
            if kbd.gotkey
               data := 1
            else
               data := -1
            command := 0 

         PUT_CHR:
            scr.out(data)
           command := 0

         PUT_STR:
            scr.str(data)
            command := 0

   until command < 0
   
   scr.stop
   kbd.stop
  
