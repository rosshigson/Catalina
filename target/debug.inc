{{
'-------------------------------------------------------------------------------
' debug.inc - contains PASM routines useful for debugging
'
' Version 2.9 - initital version by Ross Higson.
' 
'-------------------------------------------------------------------------------
'
'    Copyright 2009 Ross Higson
'
'    This file is part of the Catalina Target Package.
'
'    The Catalina Target Package is free software: you can redistribute 
'    it and/or modify it under the terms of the GNU Lesser General Public 
'    License as published by the Free Software Foundation, either version 
'    3 of the License, or (at your option) any later version.
'
'    The Catalina Target Package is distributed in the hope that it will
'    be useful, but WITHOUT ANY WARRANTY; without even the implied warranty
'    of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  
'    See the GNU Lesser General Public License for more details.
'
'    You should have received a copy of the GNU Lesser General Public 
'    License along with the Catalina Target Package.  If not, see 
'    <http://www.gnu.org/licenses/>.
'
'------------------------------------------------------------------------------
}}
'
' LED_On - turn LED on
'
LED_On
        or     dira,led_mask
#ifdef C3
        andn   outa,led_mask
#else
        or     outa,led_mask
#endif        
'
LED_On_ret
        ret
'
' LED_Off - turn LED off
'
LED_Off
        or     dira,led_mask
#ifdef C3
        or     outa,led_mask
#else
        andn   outa,led_mask
#endif        
'
LED_Off_ret
        ret
'
' Flash_LED - flash the LED flash_count times
'
Flash_LED
        cmp      flash_count,#0 wz
 if_z   jmp      #:led_off
:flash_loop
        call     #LED_On
        mov      flash_wait,cnt
        add      flash_wait,flash_time
        waitcnt  flash_wait,#0
        call     #LED_Off
        mov      flash_wait,cnt
        add      flash_wait,flash_time
        waitcnt  flash_wait,#0
        djnz     flash_count,#:flash_loop
:led_off
        call     #LED_Off
'
Flash_LED_ret
        ret

flash_time
        long     20_000_000
flash_count
        long     $0
flash_wait
        long     $0
'
' Flash_Hex - flash the LED to display up to 8 hex digits in hex_value
'
Flash_Hex
        mov      hex_count,#8
:digit_loop1
        rol      hex_value,#4
        mov      flash_count,hex_value
        and      flash_count,#$f wz
 if_z   djnz     hex_count,#:digit_loop1
        tjz      hex_count,#LED_Blip
:digit_loop2
        tjnz     flash_count,#:do_flash
        ' for zero, do a quick 'blip'
        call     #LED_On
        mov      hex_wait,cnt
        add      hex_wait,blip_time
        waitcnt  hex_wait,#0
        call     #LED_Off
        jmp      #:do_next
:do_flash
        call     #Flash_LED
:do_next
        mov      hex_wait,cnt
        add      hex_wait,hex_time
        waitcnt  hex_wait,#0
        rol      hex_value,#4
        mov      flash_count,hex_value
        and      flash_count,#$f
        djnz     hex_count,#:digit_loop2
        jmp      #LED_Done
LED_Blip
        call     #LED_On
        mov      hex_wait,cnt
        add      hex_wait,blip_time
        waitcnt  hex_wait,#0
        call     #LED_Off
LED_Done
        mov      hex_wait,cnt
        add      hex_wait,hex_time
        waitcnt  hex_wait,#0
Flash_Hex_ret
        ret
'
led_mask
        long     |< Common#DEBUG_PIN
'
hex_value
        long     $0
hex_wait
        long     $0
hex_count
        long     $0
blip_time
        long     8_000_000
hex_time
        long     80_000_000
'
