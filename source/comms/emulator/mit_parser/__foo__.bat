@echo off
echo Processing %1 ...
sortstr < %1 | cutcom > %1bl
echo ... Processed
