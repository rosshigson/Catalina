@echo off

SET PORT=%1
if "%PORT%" == "" (
  SET PORT=COM11
)

SET BAUD=%2

if "%BAUD%" == "" (
  SET BAUD=230400
)

putty -serial %PORT% -sercfg %BAUD%,8,n,1,N
