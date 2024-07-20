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
copy basic.h %1
copy basic.c %1
copy tokens.h %1
copy tokens.c %1
copy dbasic.c %1

copy startrek.bas %1
copy UT-trek.bas %1
copy trek15.bas %1
copy eliza.bas %1
copy poker.bas %1
copy blackjck.bas %1
@echo off

if exist dbasic.bin goto p2_copy

@echo on
copy dbasic.binary %1dbasic.bin
@echo off
if NOT exist proxy.binary goto done
@echo on
copy proxy.binary %1proxy.bin  
@echo off
goto done

:p2_copy
@echo on
copy dbasic.bin %1dbasic.bin
@echo off
goto done

:done
