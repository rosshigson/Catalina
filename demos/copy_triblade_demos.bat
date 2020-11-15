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
@echo on
copy ..\demos\othello_1.binary %1OTHELLO.1
copy ..\demos\startrek_1.binary %1STARTREK.1
copy ..\demos\othello_pc_2.binary %1OTHELLO.2
copy ..\demos\test_suite_pc_2.binary %1TEST.2
copy ..\demos\test_fs_2.binary %1TEST_FS.2
copy ..\demos\startrek_2.binary %1STARTREK.2
copy ..\demos\lisp_2.binary %1LISP.2
copy ..\demos\test_3.binary %1TEST.3
:done
