@echo off
if NOT "%1"=="" goto do_copy
@echo.
@echo ERROR: no DRIVE specified !
@echo.
@echo usage: copy_morpheus_utilities D:
@echo.
@echo    where D: is the drive you use to read/write SD cards
@echo.
goto done
:do_copy
@echo on
copy CPU_2_Boot_1.binary  %1BOOT2.1
copy CPU_2_Reset_1.binary %1RESET2.1
:done
