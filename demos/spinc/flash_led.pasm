'-------------------------------------------------------------------------------
' PASM function to flash a LED on and off.
' 
' This PASM will work in both LMM mode (TINY) or in CMM mode (COMPACT).
'
' This function expects to be called from C as follows:
'
'   Flash_Led(PIN, CLOCKFREQ);
'
' NOTE: The Catalina calling conventions mean that the PIN will be passed in 
'       register 3, and the CLOCKFREQ will be passed in register 2.
'
' NOTE: Some of the comment lines in the code below (such as ' Catalina Code 
'       ' Catalina Export or ' end) are REQUIRED - they contain instructions 
'       to the Catalina binder.
'
'-------------------------------------------------------------------------------

' Tell the binder what segment to use:
' Catalina Code

DAT ' code segment

' Tell the binder what symbol to use:
' Catalina Export Flash_Led

' Ensure the code is long aligned:
      alignl

' Spin/PASM compilers are not case sensitive but C is, so the Catalina 
' naming convention is that not only are C identifiers prefixed with "C_"
' when compiled to PASM, but each capital letter in the identifier has
' "_" appended. This means that the C identifier "Flash_Led" will equate 
' to the PASM identifier "C_F_lash_L_ed":

C_F_lash_L_ed

' We need to use slightly different PASM code in TINY and COMPACT mode. 
' In COMPACT mode we normally execute COMPACT PASM. but we can choose to
' execute "pure" PASM instructions if we introduce them using:
'   word I16B_EXEC
'   alignl
' and terminate them using:
'   jmp #EXEC_STOP
'
' However, we need to use COMPACT PASM or TINY PASM to execute kernel 
' primitives, such as jumps, function calls and Hub RAM access:

#ifdef COMPACT
      word      I16B_EXEC               ' enter "pure" PASM mode
      alignl
#endif
      mov       r1, #1
      shl       r1, r3 
      or        dira, r1
      andn      outa, r1
      mov       r0, cnt              
      add       r0, r2
#ifdef COMPACT
      jmp       #EXEC_STOP             ' return to COMPACT PASM mode
#endif

C_Flash_Led_loop                          
#ifdef COMPACT
      word      I16B_EXEC              ' enter "pure" PASM mode
      alignl
#endif
      waitcnt   r0, r2   
      xor       outa, r1
#ifdef COMPACT
      jmp       #EXEC_STOP             ' return to COMPACT PASM mode for jump
      long      I32_JMPA + @C_Flash_Led_loop<<S32   ' COMPACT jump primitive

' the above code never returns, but this is how 
' to return from this function in COMPACT mode:
      word I16B_RETN                   ' COMPACT primitive for return
#else
      jmp       #JMPA                  ' TINY ... 
      long      @C_Flash_Led_loop      ' ... jump primitive

' the above code never returns, but this is how  
' to return from this function in TINY mode:
      jmp       #RETN                  ' TINY primitive for return
#endif

' Ensure any subsequent code is long aligned:
      alignl

' end
                               
