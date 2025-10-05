@echo off

pushd %LCCDIR%\source\cake
call build_all %*
popd
