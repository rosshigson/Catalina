@echo off
@echo.
if "%1"=="" goto no_parameters
set %1=
goto done
:no_parameters
@echo no parameter specified to unset
@echo.
:done
