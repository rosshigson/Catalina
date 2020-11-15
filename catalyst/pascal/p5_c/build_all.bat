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
goto done

:start_build
@echo.
@echo    ==================
@echo    Building Pascal P5
@echo    ==================
@echo.
set CATALINA_DEFINE=%1 %2 %3 %4 %5 %6 %7 %8 %9

set platform=%1
if NOT "%platform:~0,2%"=="P2" goto p1_build

@echo on
catalina -p2 catalina_pcom.c -lcx -I..\ptoc ..\ptoc\paslib.c ..\ptoc\set.c ..\ptoc\io.c -C NATIVE -lma -o pcom
catalina -p2 catalina_pint.c -lcx -I..\ptoc ..\ptoc\paslib.c ..\ptoc\set.c ..\ptoc\io.c -C NATIVE -lma -o pint
goto build_done

:p1_build
@echo on
catalina catalina_pcom.c -lcx -I..\ptoc ..\ptoc\paslib.c ..\ptoc\set.c ..\ptoc\io.c -C LARGE -lma -o pcom
catalina catalina_pint.c -lcx -I..\ptoc ..\ptoc\paslib.c ..\ptoc\set.c ..\ptoc\io.c -C LARGE -lma -o pint

:build_done
call unset CATALINA_DEFINE
@echo off
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

