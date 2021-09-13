Catalina release 4.8 is a full release. You can install this over an existing
version of Catalina, but it is recommended that you instead uninstall any
previous Catalina release before installing, or install this release to a 
different location. 

If you are installing under Linux, you should execute the following command 
to set your permissions correctly after installing (this command is a script 
in the Catalina bin directory, and may itself need to have its permissions 
manually set to allow execution):

   Set_Linux_Permissions

The following changes have been made since the previous release of Catalina. 
If you have not used a previous release of Catalina, you can ignore the
following list:

RELEASE 4.8

1. Updates to the reference manuals and the command summaries to include the 
   changes made to payload in release 4.7.

2. A bug introduced in release 4.7 when making NATIVE the default memory
   model on the P2 has been fixed.

3. The definition of the PASM() function (used to include inline PASM in C 
   code) has been modified to indicate it can return an int rather than a void.    This prevents Catalina from overwriting return values (i.e. the value 
   present in r0 when the PASM code finishes execution). The new definition is:

      extern int PASM(const char *code);

   This should not make any difference to existing code that does not use the
   return value of the PASM function. New PASM example program called
   test_inline_pasm_3.c and test_inline_pasm_4.c have been added to the 
   examples in the demos\spinc folder to illustrate the use of the return value.

4. Updated the build_all scripts in the demos\spinc folder to only build demo 
   programs appropriate to the propeller type (i.e. 1 or 2).

5. The file flash_led.obj was missing from the demos\spinc folder.
