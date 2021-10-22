@echo off
if EXIST %1 goto do_copy
@echo.
@echo ERROR: invalid destination specified !
@echo.
@echo usage: copy_all X:
@echo.
@echo    where X: is the drive you use to read/write SD cards
@echo.
@echo or:    copy_all dir
@echo.        
@echo    where dir is the directory you want to copy to
@echo.
goto done

:do_copy
@echo on   
copy *.pas %1
copy *.p5 %1
@echo off

if exist pcom.bin goto p2_copy

@echo on
copy pcom.binary %1pcom.bin
copy pint.binary %1pint.bin
@echo off
if NOT exist proxy.binary goto done
@echo on
copy proxy.binary %1proxy.bin  
@echo off
goto done

:p2_copy
@echo on
copy pcom.bin %1pcom.bin
copy pint.bin %1pint.bin
@echo off
goto done

:done
