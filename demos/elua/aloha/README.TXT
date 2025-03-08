IMPORTANT: This file discusses only the ALOHA serial extension to eLua. For
details on the WiFi RPC extensions, see the file WIFI.TXT

This folder contains an extension to eLua. ALOHA is a protocol designed to 
support remote procedure calls between propellers, and can be used from Lua
by the addition of a custom version of the eLua dispatcher. 

The protocol is called ALOHA in honour of the original ground-breaking ALOHA 
protocol. 

The ALOHA extensions to eLua are described in the document 'Aloha from Lua'.
See that document for more details.

Compile them all using by executing the 'build_aloha' script. This script 
builds eLua for multiple different platforms, and so no platform should be 
specified either on the command line or using CATALINA_DEFINE. For example:

   unset CATALINA_DEFINE
   build_aloha

The script builds the following binaries for P2_MASTER:

   catapult alua.c
   mv alua.bin master.bin

   catapult aluax.c
   mv aluax.bin masterx.bin

   catapult aluafx.c
   mv aluafx.bin masterfx.bin

and the following binaries for P2_SLAVE:

   catapult alua.c
   mv alua.bin slave.bin

   catapult aluax.c
   mv aluax.bin slavex.bin

   catapult aluafx.c
   mv aluafx.bin slavefx.bin

The 'master' programs must be executed on the P2_MASTER propeller and the 
'slave' programs on the P2_SLAVE propeller. The P2_MASTER propeller should
execute the 'client' and 'remote' as the server, and the P2_SLAVE propeller
should execute 'remote' as the client and the 'server'. For example:

On P2_MASTER:
   masterx client.lux remote.lux

On P2_SLAVE:
   slavex remote.lux slave.lux

Also, mentioned in the 'Aloha from Lua' document is a variant of a slave 
ALOHA server that omits the slave client altogether, called sluafx (in the 
file sluafx.c). This allows the server to execute entirely from Hub RAM if
a local slave client is not required.

When sluafx is used on the slave propeller in conjunction with masterx or 
masterfx on the master propeller, it means both the client and server can be 
executed entirely from Hub RAM, for a significant speed improvement over the 
same program executed from XMM RAM.

Not mentioned in the document are the other possible variants of an ALOHA 
enabled Lua server without a client that execute entirely from Hub RAM.
The main purpose of these variants is to maximize the Hub RAM available to 
the Lua server.

In addition to the sluafx.c server already mentioned, the following variants
are also provided - they differ only in Catapult pragma options:

   sluafix.c  - Similar to sluafx.c, but makes more Hub RAM available by 
                using an integer-only version of the Lua initialization 
                module (i.e. iinit.c instead of xinit.c) which does NOT 
                load the Lua maths module. It also uses an updated version
                of the binser module that does not require the math module. 
                The binary is also linked with the integer version of the 
                extended Catalina library (i.e. -lcix instead of -lcx).
                Lua programs executed using this server can declare and use 
                floating point types and do basic floating point operations, 
                but they cannot use the functions provided by the maths 
                module, nor can they do I/O on any floating point types 
                (e.g. using print).

   sluacx.c   - As sluafx.c but using COMPACT mode. This is slower than
                NATIVE mode but it allows larger Lua programs to be executed 
                from Hub RAM, so it is still faster than an XMM sever.

   sluacix.c  - As sluafix.c but using COMPACT mode.

These variants will be built by the 'build_aloha' script for the P2_SLAVE
propeller (they are only built for execution on 'slave' propellers), or 
they can be built individually using commands such as:

On Windows:
   set CATALINA_DEFINE=P2_SLAVE
   catapult sluafix.c

On Pi OS or Linux:
   export CATALINA_DEFINE=P2_SLAVE
   catapult sluafix.c

As an example of the use of these variants, when the client/server version of 
the Game of Life (in the folder demos/elua/life) is executed with masterfx and
sluafx, it can support a universe of up to 80 columns by 30 rows (edit the
file common.lua and recompile it using 'exec rebuild' on both 'master' and
'slave' Propellers to change the size of the universe):

   On the P2_MASTER:
      masterfx client.lux remote.lux

   On the P2_SLAVE:
      sluafx

When executed using masterfx and sluafix, it can support a universe of up to
80 columns by 40 rows:

   On the P2_MASTER:
      masterfx client.lux remote.lux

   On the P2_SLAVE:
      sluafix

When executed using masterfx and sluacix, it can support a universe of 80 
columns by 60 rows - but will execute more slowly:

   On the P2_MASTER:
      masterfx client.lux remote.lux

   On the P2_SLAVE:
      sluacix

