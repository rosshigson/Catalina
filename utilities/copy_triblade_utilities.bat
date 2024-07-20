@echo off
if NOT "%1"=="" goto do_copy
@echo.
@echo ERROR: no DRIVE specified !
@echo.
@echo usage: copy_triblade_utilities D:
@echo.
@echo    where D: is the drive you use to read/write SD cards
@echo.
goto done
:do_copy
@echo on
copy CPU_1_Boot_2.binary  %1BOOT1.2
copy CPU_3_Boot_2.binary  %1BOOT3.2
copy CPU_1_Reset_2.binary %1RESET1.2
copy CPU_3_Reset_2.binary %1RESET3.2
:done
