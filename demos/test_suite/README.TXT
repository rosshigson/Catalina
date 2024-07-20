This directory contains a simple test suite, plus couple of Lua scripts to 
test payload's Lua scripting facilty, which can be used to verify the output
of programs that use the serial HMI.

To build the programs, simply use the build_all script, specifying the 
platform. For example:

   build_all P2_EVAL
or
   build_all C3 COMPACT

The following program executables will built: 

   test_lua   - a compiled version of a simple test program, intended to
                be used with test_lua.lua. To execute it, use a payload
                command like:

                   payload test_lua -L test_lua.lua

   test_suite - a compiled version of a more comples test program, 
                intended to be used with test_suite.lua. To execute
                it, use a payload command like:

                   payload test_suite -L test_suite.lua


