echo off
if NOT "%1"=="" goto do_copy
@echo.
@echo ERROR: no DRIVE specified !
@echo.
@echo usage: copy_all D:
@echo.
@echo    where D: is the drive you use to read/write SD cards
@echo.
goto done
:do_copy
@echo on
copy graphics_demo.binary %1graph.bin
copy graphics_demo_2.binary %1graph2.bin
copy graphics_demo_5.binary %1graph5.bin
