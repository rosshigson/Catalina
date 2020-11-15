@echo off

rem this file is used by the batch file used to build LCC under windows

if not %2 == "" goto set_path
echo.
echo usage: set_short_path var_name "long_path"
echo.
goto done
:set_path
@echo %~fs2
SET %1=%~fs2
:done

