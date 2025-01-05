There are several variants of essentially the same eLua client/server program  
in this folder. 

Compile them all using by setting CATALINA_DEFINE to specify the propeller
platform and execute the 'build_all' script. For example, to compile them 
for the P2_EDGE:

On Windows:
   set CATALINA_DEFINE=P2_EDGE
   build_all

On Pi OS or Linux:
   export CATALINA_DEFINE=P2_EDGE
   build_all

They can also be compiled individually using Catapult:

On Windows:
   set CATALINA_DEFINE=P2_EDGE
   catapult elua.c
   catapult eluax.c
   catapult eluas.c
   catapult eluafx.c
   catapult eluasx.c

On Pi OS or Linux:
   export CATALINA_DEFINE=P2_EDGE
   catapult elua.c
   catapult eluax.c
   catapult eluas.c
   catapult eluafx.c
   catapult eluasx.c

For full details on eLua and its variants, see the document 'Aloha from Lua'.
