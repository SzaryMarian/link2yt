@echo off

cd /d "%~dp0"

rem echo "%~nx1"
copy %1 . > nul:
set f=%~nx1
rem echo "%f%"
bash -c './yt.sh "%f%" %2 %3'
rem bash -c './yt.sh "%1" %2 %3'

rem pause
 
