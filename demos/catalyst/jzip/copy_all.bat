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
copy zork1.dat %1
copy zork2.dat %1
copy zork3.dat %1
@echo off

if exist jzip.bin goto p2_copy
@echo on
copy jzip.binary %1jzip.bin
@echo off
if NOT exist proxy.binary goto done
@echo on
copy proxy.binary %1proxy.bin  
@echo off
goto done

:p2_copy
@echo on
copy jzip.bin %1jzip.bin
@echo off
goto done

:done