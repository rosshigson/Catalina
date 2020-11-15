@echo off
@echo.
SET/P COMPORT="Enter the COM port to use (1..9) for debugging: "
@echo.
@echo Debugging ...
@echo.
blackcat -P COM%COMPORT% -D %1 

