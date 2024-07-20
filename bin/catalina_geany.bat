@echo off
if NOT "%LCCDIR%"=="" goto lccdir_defined
   set LCCDIR=%CD%
   call use_catalina
:lccdir_defined
rem check if LCCDIR is already in our path
for %%p in (catalina_env.bat) do set "catpath=%%~$PATH:p"
if not defined catpath (
   rem The path to catalina_env.bat doesn't exist in PATH variable, so:
   call use_catalina
)
if exist "%1.geany" goto found_project_file

start "Geany" "%LCCDIR%"\catalina_geany\bin\geany.exe %1 %2 %3 %4 %5 %6 %7 %8 %9
goto done

:found_project_file
start "Geany" "%LCCDIR%"\catalina_geany\bin\geany.exe %1.geany %2 %3 %4 %5 %6 %7 %8 %9

:done
