'------------------------ DEBUG SUPPORT CODE ----------------------------------
'
' IMPORTANT NOTE! These procedures are usually loaded into Hub RAM, but they
'                 will use the variables - e.g. hex_value, led_mask, hex_count
'                 etc - that are defined in cog RAM (usually, by the catalina
'                 kernel that runs in cog 0). So if they are called from
'                 another cog, they will overwrite those same locations. The
'                 other catalina kernels define debug variables in these
'                 locations, so that is gnerally ok - but it may not be if the
'                 functions are called from other cogs, such as a plugin!
' 

CON

blip_time = _CLOCKFREQ/20
hex_time  = _CLOCKFREQ/2
flash_time = _CLOCKFREQ/4

DAT


' LED_On - turn LED on
'
LED_On
        or       dirb,led_mask
        andn     outb,led_mask
        ret
'
' LED_Off - turn LED off
'
LED_Off
        or       dirb,led_mask
        or       outb,led_mask
        ret
'
' Flash_LED - flash the LED flash_count times
'
Flash_LED
        cmp      flash_count,#0 wz
   if_z waitx    ##flash_time
   if_z jmp      #done_flash
flash_loop
        call     #LED_On
        waitx    ##flash_time
        call     #LED_Off
        waitx    ##flash_time
        djnz     flash_count,#flash_loop
done_flash
        ret
'
' Blip_LED - flash LED briefly (e.g. used to indicate zero)
'
Blip_LED
        call     #LED_On
        waitx    ##blip_time
        call     #LED_Off
        waitx    ##flash_time
        ret
'
' Flash_Hex - flash the LED to display up to 8 hex digits in hex_value
'
Flash_Hex
        cogid    hex_count
        mov      led_mask,##|<(_DEBUG_PIN-32)
        shl      led_mask,hex_count
        mov      hex_count,#8
digit_loop1
        ' skip leading zeroes
        rol      hex_value,#4
        mov      flash_count,hex_value
        and      flash_count,#$f wz
 if_z   djnz     hex_count,#digit_loop1
        ' if all we have are zeroes, do one blip
        tjnz     hex_count,#digit_loop2
        call     #Blip_LED
        jmp      #done_hex
digit_loop2
        tjnz     flash_count,#do_flash
        ' for zero digits, do one blip
        call     #Blip_LED
        jmp      #do_next
do_flash
        ' for non-zero digits, flash the digit count
        call     #Flash_LED
do_next
        djz      hex_count,#done_hex
        waitx    ##hex_time
        rol      hex_value,#4
        mov      flash_count,hex_value
        and      flash_count,#$f
        jmp      #digit_loop2
done_hex
        waitx    ##hex_time*4
        ret
'
'------------------------ END OF DEBUG SUPPORT CODE ---------------------------
