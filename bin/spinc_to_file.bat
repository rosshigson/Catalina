@echo off
rem
rem This script just calls spinc, but does the redirection using the
rem first parameter as the name of the output file - this is intended
rem for use within Code::Blocks, which does not support redirection 
rem in the pre/post build steps
rem
spinc %2 %3 %4 %5 %6 %7 %8 %9 > %1
