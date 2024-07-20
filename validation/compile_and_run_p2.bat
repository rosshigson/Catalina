@echo VALIDATING: %1 %2 %3 %4 %5 %6 %7 %8 %9
@echo VALIDATING: %1 %2 %3 %4 %5 %6 %7 %8 %9 >>results_serial.%1 2>&1
@echo PARAMETERS: %CATALINA_DEFINE%  >>results_serial.%1 2>&1
@echo. >>results_serial.%1 2>&1
catalina -p2 -k -y %2.c %3 %4 %5 %6 %7 %8 %9 >>results_serial.%1 2>&1
payload %2 -y -L %2.lua >>results_serial.%1 2>&1
del %2.bin
del %2.lst
