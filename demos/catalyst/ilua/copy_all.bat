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
copy /y ilua.lua %1ilua.lua
copy /y _rc.lua %1_rc.lua
copy /y ihelp.lua %1ihelp.lua
xcopy /e /q /r /y repl\ %1repl\

@echo off
goto done
   
:done

