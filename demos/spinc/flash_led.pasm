'-------------------------------------------------------------------------------
' LMM PASM program to flash a LED on and off.
'
' This program expects to be called from C as follows:
'
'   Flash_Led(PIN, CLOCKFREQ);
'
' NOTE: The Catalina calling conventions mean that the PIN will be passed in 
'       register 3, and the CLOCKFREQ will be passed in register 2.
'
' NOTE: Some of the comment lines in the code below (such as ' Catalina Code 
'       or ' Catalina Export ) are REQUIRED - they contain instructions to 
'       the Catalina binder.
'
'-------------------------------------------------------------------------------

' Tell the binder what segment to use:
' Catalina Code

DAT ' code segment

' Tell the binder what symbol to use:
' Catalina Export Flash_Led

' Ensure the code is long aligned:
      long ' align long

' The Catalina naming conventions mean that the C symbol 'Flash_Led' will be
' linked to the PASM symbol 'C_F_lash_L_ed':
C_F_lash_L_ed 
      or        dira, r3
      andn      outa, r3
      mov       r0, cnt              
      add       r0, r2
C_Flash_Led_loop                          
      waitcnt   r0, r2   
      xor       outa, r3
      jmp       #JMPA
      long      @C_Flash_Led_loop

' the above code never returns, but this is how we would return from
' this function if we wanted to do so:
      jmp       #RETN

' end
                               
