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
copy time.bin %1time.bin
copy rtc_ex.bin %1rtc_ex.bin
copy ex_time1.bin %1ex_time1.bin
copy ex_time2.bin %1ex_time2.bin

@echo off
goto done
   
:done

