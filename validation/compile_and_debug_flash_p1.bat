@echo VALIDATING: FLASH %1 %2 %3 %4 %5 %6 %7 %8 %9
@echo VALIDATING: FLASH %1 %2 %3 %4 %5 %6 %7 %8 %9 >>results_blackbox.%1 2>&1
@echo PARAMETERS: FLASH %CATALINA_DEFINE% >>results_blackbox.%1 2>&1
@echo. >>results_blackbox.%1 2>&1
catalina -k -g3 -C FLASH -D NO_INPUT %2.c %3 %4 %5 %6 %7 %8 %9 >>results_blackbox.%1 2>&1
payload FLASH %2 -y -z >>results_blackbox.%1 2>&1
PING localhost -n 2 >NUL
blackbox %2 -L %2_blackbox.lua >>results_blackbox.%1 2>&1
del %2.binary
del %2.debug
del %2.dbg
del %2.lst
