@echo off
if NOT "%1"=="" goto do_copy
@echo.
@echo ERROR: no DRIVE specified !
@echo.
@echo usage: copy_triblade_proxy_demos D:
@echo.
@echo    where D: is the drive you use to read/write SD cards
@echo.
goto done
:do_copy
REM
REM copy all clients and servers to SD Card (using DOS 8.3 file names)
REM
@echo on
copy test_1_client_2.binary %1T1_C.2
copy test_1_server_1.binary %1T1_S.1

copy test_2_client_1.binary %1T2_C.1
copy test_2_server_2.binary %1T2_S.2
:done
