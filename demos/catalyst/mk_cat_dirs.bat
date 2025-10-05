@echo off
if EXIST %1 goto do_mk_dirs
@echo.
@echo ERROR: invalid destination specified!
@echo.
@echo usage: mk_p2_dirs X:
@echo.
@echo    where X: is the drive you use to read/write SD cards
@echo.
@echo or:    mk_p2_dirs dir
@echo.        
@echo    where dir is the directory you want to make the directories in
@echo.
goto done

:do_mk_dirs
rmdir "%1\tmp"
mkdir "%1\tmp"
rmdir "%1\include"
mkdir "%1\include"
rmdir "%1\lib\"
mkdir "%1\lib\"
rmdir "%1\lib\p2"
mkdir "%1\lib\p2"
rmdir "%1\lib\p2\lmm"
mkdir "%1\lib\p2\lmm"
rmdir "%1\lib\p2\cmm"
mkdir "%1\lib\p2\cmm"
rmdir "%1\lib\p2\nmm"
mkdir "%1\lib\p2\nmm"
rmdir "%1\lib\p2\xmm"
mkdir "%1\lib\p2\xmm"
rmdir "%1\target"
mkdir "%1\target"
rmdir "%1\target\p2"
mkdir "%1\target\p2"

:done
