@echo off
@echo.
@echo    ==================================================================
@echo                           *** PLEASE NOTE ***
@echo     These programs use the 'minimal' target, which is pre-configured
@echo     for the QuickStart platform. If you have another platform, you 
@echo     must edit Custom_DEF.inc in the 'minimal' target directory. 
@echo    ==================================================================
@echo.

if NOT "%CATALINA_DEFINE%" == "" goto define_error

if "%LCCDIR%" == "" goto default_target
set CATALINA_TARGET=%LCCDIR%\minimal
goto target_set

:default_target
set CATALINA_TARGET=C:\Program Files\Catalina\minimal

:target_set
set CATALINA_DEFINE=PLUGIN %1 %2 %3 %4 %5 %6 %7 %8 %9

call catalina_env

del /q /f *.binary

@echo.
@echo    =========================
@echo    Building simple_test demo
@echo    =========================
@echo.

catalina -lc simple_test.c generic_plugin.c utilities.c 

@echo.
@echo    ==========================
@echo    Building complex_test demo
@echo    ==========================
@echo.

call build_pasm_tmp_var %CATALINA_DEFINE%
spinnaker -p -a "%CATALINA_TARGET%\Catalina_Plugin.spin" -b -o catalina_plugin %TMP_VAR%
spinc catalina_plugin.binary > plugin_array.h
del /q /f Catalina_Plugin.binary
catalina -lc complex_test.c generic_plugin.c utilities.c

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

