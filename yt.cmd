@echo off

cd
echo %~dp0
cd /d "%~dp0"
cd
bash -c './yt.sh "%1" %2 %3'

pause
 
