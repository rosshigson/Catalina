@echo off
@echo.
@echo Downloading ...
@echo.
payload  XMM %1 
@echo.
@echo BlackCat does not automatically detect the COM port to use for debugging,
@echo so you have to tell it. On most platforms this will be the same as the 
@echo COM port identified above (i.e. by Payload). However, it may be different
@echo on the HYDRA or HYBRID (which debug using the MOUSE port).
@echo.
SET/P COMPORT="Enter the number of the COM port to use for debugging (1..9): "
@echo.
@echo Debugging ...
@echo.
blackcat -P COM%COMPORT% -D %1 

