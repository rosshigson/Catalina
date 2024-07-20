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

if exist send.bin goto p2_copy

@echo on   
copy send.binary %1send.bin
copy receive.binary %1receive.bin
@echo off
goto done:

:p2_copy
@echo on   
copy send.bin %1send.bin
copy receive.bin %1receive.bin
@echo off
goto done
   
:done

