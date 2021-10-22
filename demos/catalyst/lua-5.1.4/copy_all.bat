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
copy test\hello.lua %1hello.lua
copy test\factorial.lua %1fact.lua
copy test\sort.lua %1sort.lua
copy test\fib.lua %1fib.lua
@echo off

if exist src\lua.bin goto p2_copy

@echo on
copy src\lua.binary %1lua.bin
copy src\luac.binary %1luac.bin
@echo off
if NOT exist src\proxy.binary goto done
@echo on
copy src\proxy.binary %1proxy.bin  
@echo off
goto done

:p2_copy
@echo on
copy src\lua.bin %1lua.bin
copy src\luac.bin %1luac.bin
@echo off
goto done

:done
