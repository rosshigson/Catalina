@echo off
if NOT "%CATALINA_DEFINE%" == "" goto define_error
if NOT "%1"=="" goto start_build
@echo.
@echo ERROR: no PLATFORM specified !
@echo.
@echo usage: build_all PLATFORM [OPTIONS]
@echo.
@echo    where  PLATFORM is HYDRA, HYBRID, RAMBLADE, TRIBLADEPROP, DRACBLADE,
@echo                       DEMO, CUSTOM or P2_EVAL (P2 only) 
@echo    and    OPTIONS are other Catalina options (e.g. CPU_1, HIRES_TV, NTSC)
@echo.
@echo Note: The required options CLOCK and NO_MOUSE are automatically included
@echo       and should not be specified on the command line
@echo.
goto done

:start_build
@echo.
@echo    ====================
@echo    Building Dumbo Basic
@echo    ====================
@echo.

set CATALINA_DEFINE=CLOCK NO_MOUSE %1 %2 %3 %4 %5 %6 %7 %8 %9

set platform=%1
if "%platform:~0,2%"=="P2" goto build_p2

del /q /f *.binary
catalina -O5 -C LARGE dumbo_basic.c tokenizer.c basic.c -o dbasic -lcx -lm
call unset CATALINA_DEFINE
goto done

:build_p2
del /q /f *.bin
catalina -O5 -p2 -C NATIVE dumbo_basic.c tokenizer.c basic.c -o dbasic -lcx -lm
call unset CATALINA_DEFINE
goto done

:define_error
@echo off
@echo.
@echo ERROR: Environment variable CATALINA_DEFINE is set (to %CATALINA_DEFINE%)
@echo.
@echo You must undefine this environment variable before using this batch
@echo file, and instead specify the target and options on the command line.
@echo.

:done

