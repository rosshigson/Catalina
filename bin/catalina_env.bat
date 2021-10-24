@echo off
echo.
if "%CATALINA_DEFINE%"==""  (echo CATALINA_DEFINE  = [default]) ELSE (echo CATALINA_DEFINE  = "%CATALINA_DEFINE%")
if "%CATALINA_INCLUDE%"=="" (echo CATALINA_INCLUDE = [default]) ELSE (echo CATALINA_INCLUDE = "%CATALINA_INCLUDE%")
if "%CATALINA_LIBRARY%"=="" (echo CATALINA_LIBRARY = [default]) ELSE (echo CATALINA_LIBRARY = "%CATALINA_LIBRARY%")
if "%CATALINA_TARGET%"==""  (echo CATALINA_TARGET  = [default]) ELSE (echo CATALINA_TARGET  = "%CATALINA_TARGET%")
if "%CATALINA_LCCOPT%"==""  (echo CATALINA_LCCOPT  = [default]) ELSE (echo CATALINA_LCCOPT  = "%CATALINA_LCCOPT%")
if "%CATALINA_TEMPDIR%"=="" (echo CATALINA_TEMPDIR = [default]) ELSE (echo CATALINA_TEMPDIR = "%CATALINA_TEMPDIR%")
if "%LCCDIR%"==""           (echo LCCDIR           = [default]) ELSE (echo LCCDIR           = "%LCCDIR%")
echo.
