' location $15 is not used on the Propeller
' NOTE: This will fail on DOS or UNIX with a SIGSEGV
10 POKE 15,253
20 PRINT "MEM[15] ="; peek(15);
