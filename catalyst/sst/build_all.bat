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
@echo note: The required options CLOCK and NO_MOUSE are automatically included
@echo       and should not be specified on the command line
@echo.
goto done

:start_build
@echo.
@echo    =========================
@echo    Building Super Start Trek
@echo    =========================
@echo.

set CATALINA_DEFINE=CLOCK NO_MOUSE %1 %2 %3 %4 %5 %6 %7 %8 %9

set platform=%1
if "%platform:~0,2%"=="P2" goto p2_build

del /q /f *.binary
@echo on
catalina sst.c ai.c battle.c catalina.c events.c finish.c moving.c planets.c reports.c setup.c -lcx -C LARGE -lma
@echo off
call unset CATALINA_DEFINE
goto done

:p2_build
del /q /f *.bin
@echo on
catalina -p2 -C NATIVE sst.c ai.c battle.c catalina.c events.c finish.c moving.c planets.c reports.c setup.c -lcx -lma
@echo off
call unset CATALINA_DEFINE
goto done

:define_error
@echo.
@echo ERROR: Environment variable CATALINA_DEFINE is set (to %CATALINA_DEFINE%)
@echo.
@echo You must undefine this environment variable before using this 
@echo batch file, and instead specify the target on the command line.
@echo.

:done

