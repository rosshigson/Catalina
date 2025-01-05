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
rmdir "%1\tmp"
mkdir "%1\tmp"
rmdir "%1\bin"
mkdir "%1\bin"
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
mkdir "%1\lib\p2\nmm"
rmdir "%1\lib\p2\nmm"
mkdir "%1\lib\p2\xmm"
rmdir "%1\lib\p2\xmm"
rmdir "%1\target"
mkdir "%1\target"
mkdir "%1\target\p2"
copy catalina.lua "%1\bin\catalina.lua"
copy cat_env.lua "%1\bin\cat_env.lua"
copy source\lcc\build\cpp.bin "%1\bin\"
copy source\lcc\build\spp.bin "%1\bin\"
copy source\lcc\build\rcc.bin "%1\bin\"
copy source\catalina\bcc.bin  "%1\bin\"
copy source\catalina\binstats.bin  "%1\bin\"
copy source\catalina\binbuild.bin  "%1\bin\"
copy source\catalina\pstrip.bin  "%1\bin\"
copy source\catalina\spinc.bin  "%1\bin\"
copy source\p2asm_src\p2asm.bin "%1\bin\"
xcopy /s /y include\ "%1\include\"
xcopy /s /y target\p2\ "%1\target\p2\"
rem note that we do not copy the versions of the library built
rem specifically for Catalina, since they are built to use PSRAM.
xcopy /s /y "%LCCDIR%\lib\p2\lmm\" "%1\lib\p2\lmm\"
xcopy /s /y "%LCCDIR%\lib\p2\cmm\" "%1\lib\p2\cmm\"
xcopy /s /y "%LCCDIR%\lib\p2\nmm\" "%1\lib\p2\nmm\"
xcopy /s /y "%LCCDIR%\lib\p2\xmm\" "%1\lib\p2\xmm\"
copy CATALINA.TXT "%1\CATALINA.TXT"
copy pintest.c "%1\pintest.c"
copy station.c "%1\station.c"
copy intrrpt.c "%1\intrrpt.c"
copy psram.c "%1\psram.c"
copy "%LCCDIR%"\demos\hello_world.c "%1\hello.c"
copy "%LCCDIR%"\demos\my_func.c "%1\my_func.c"
copy "%LCCDIR%"\demos\my_prog.c "%1\my_prog.c"
copy "%LCCDIR%"\demos\multithread\dining_philosophers.c "%1\diners.c"
copy "%LCCDIR%"\demos\games\othello.c "%1\othello.c"
copy "%LCCDIR%"\demos\games\startrek.c "%1\startrek.c"
copy "%LCCDIR%"\demos\games\chimaera.h "%1\chimaera.h"
copy "%LCCDIR%"\demos\games\chimaera.c "%1\chimaera.c"
copy "%LCCDIR%"\demos\lua\lhello.c "%1\lhello.c"
copy "%LCCDIR%"\demos\lua\linit.c "%1\linit.c"

:done
