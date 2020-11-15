@echo off

if NOT "%CATALINA_DEFINE%" == "" goto define_error

if NOT "%1"=="" goto have_parameters
@echo.
@echo ERROR: no PLATFORM specified !
@echo.
@echo usage: build_all PLATFORM [OPTIONS]
@echo.
@echo    where  PLATFORM is HYDRA, HYBRID, RAMBLADE, TRIBLADEPROP, DRACBLADE,
@echo                       DEMO or CUSTOM
@echo    and    OPTIONS are other Catalina options (e.g. CPU_1, HIRES_TV, NTSC)
@echo.
@echo Note: The spinc.exe program must have been built - see build_spinc.bat
@echo.
goto done

:have_parameters

set TMP_LCCDIR=%LCCDIR%
if "%TMP_LCCDIR%"=="" set TMP_LCCDIR=C:\Program Files\Catalina
if EXIST "%TMP_LCCDIR%\bin\catalina_env.bat" goto start
echo.
echo   ERROR: Catalina does not appear to be installed in %TMP_LCCDIR%
echo.
echo   Set the environment variable LCCDIR to where Catalina is installed.
echo.
goto done

:start

set CATALINA_DEFINE=%1 %2 %3 %4 %5 %6 %7 %8 %9

del /q /f *.binary

@echo.
@echo    ===================
@echo    Building SPIN demos
@echo    ===================
@echo.

spinnaker -p -a flash.spin -b
spinc flash.binary -a -n FLASH > flash.h
catalina -lci run_flash.c utilities.c -C LORES_TV -C NO_MOUSE -C NO_ARGS

spinnaker -p -a hello.spin -I "%TMP_LCCDIR%\target" -b 
spinc hello.binary -a -n HELLO > hello.h
catalina run_hello.c utilities.c -lci -C NO_MOUSE -C NO_ARGS

spinnaker -p -a TV_Text_Half_Height_Demo.spin -b
spinc TV_Text_Half_Height_Demo.binary -c -s 200 -n DEMO > demo.c
catalina -lci run_demo.c utilities.c  -C PC

spinnaker -p -a KB_TV.spin -b
spinc KB_TV.binary -c -n KB_TV -s 200 > kb_tv.c
catalina -lc run_kb_tv.c utilities.c -C NO_HMI

spinnaker -p -a TINY_HMI.spin -I "%TMP_LCCDIR%\target" -b -D FULL_LAYER_2
spinc TINY_HMI.binary -t -n TINY_HMI -s 200 > tiny_hmi.c
catalina -lc run_tiny_hmi.c utilities.c -C NO_HMI

@echo.
@echo    ================================
@echo    Building CUSTOM INTERPRETER demo
@echo    ================================
@echo.

spinnaker -p -a PNut_interpreter.spin -b
spinc PNut_interpreter.binary > PNut_interpreter.h

spinnaker -p -a flash.spin -b
spinc flash.binary -a -n FLASH > flash.h
catalina -lci run_PNut.c coginit_PNut.c utilities.c -C LORES_TV -C NO_MOUSE -C NO_ARGS



@echo.
@echo    ======================
@echo    Building COG PASM demo
@echo    ======================
@echo.

spinnaker -p -a flash_led.spin -b -D %1
spinc flash_led.binary > flash_led_array.h
catalina -lc -I. -C NO_HMI test_spinc.c

@echo.
@echo    ======================
@echo    Building LMM PASM demo
@echo    ======================
@echo.

catalina -lc -C NO_HMI test_pasm.c flash_led.obj

@echo.
@echo    ==========================
@echo    Building INLINE PASM demos
@echo    ==========================
@echo.

catalina -lci -y -C NO_HMI test_inline_pasm.c 
catalina -lci -y -C NO_HMI test_inline_pasm_2.c 

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

