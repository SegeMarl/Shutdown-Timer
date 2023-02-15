@echo off
Title Shutdown Timer
echo How many hours untill you want the computer to shutdown?
CHOICE /C 0123456789abc /n /M "[0] [1] [2] [3] [4] [5] [6] [7] [8] [9] 10[a] 11[b] 12[b]"
IF %ERRORLEVEL% EQU 13 set /a H=43200 && goto min
IF %ERRORLEVEL% EQU 12 set /a H=39600 && goto min
IF %ERRORLEVEL% EQU 11 set /a H=36000 && goto min
IF %ERRORLEVEL% EQU 10 set /a H=32400 && goto min
IF %ERRORLEVEL% EQU 9 set /a H=28800 && goto min
IF %ERRORLEVEL% EQU 8 set /a H=25200 && goto min
IF %ERRORLEVEL% EQU 7 set /a H=21600 && goto min
IF %ERRORLEVEL% EQU 6 set /a H=18000 && goto min
IF %ERRORLEVEL% EQU 5 set /a H=14400 && goto min
IF %ERRORLEVEL% EQU 4 set /a H=10800 && goto min
IF %ERRORLEVEL% EQU 3 set /a H=7200 && goto min
IF %ERRORLEVEL% EQU 2 set /a H=3600 && goto min
IF %ERRORLEVEL% EQU 1 set /a H=0 && goto min
:min
echo How many minutes untill you want the computer to shutdown?
CHOICE /C 1234 /n /M "00[1] 15[2] 30[3] 45[4]"
IF %ERRORLEVEL% EQU 4 set M=2700 && goto calc
IF %ERRORLEVEL% EQU 3 set M=1800 && goto calc
IF %ERRORLEVEL% EQU 2 set M=900 && goto calc
IF %ERRORLEVEL% EQU 1 set M=0 && goto calc
:calc
set /A "_totaltime=H+M"

shutdown /s /f /t %_totaltime%

echo You can cancle the shutdown at any point by hitting [C] or close this window with [Q]
CHOICE /C cq /n
IF %ERRORLEVEL% EQU 2 goto exit
IF %ERRORLEVEL% EQU 1 goto end


:end
shutdown /a
Echo Shutdown cancled, have a nice day!
ping localhost -n 5 -w 1 >null
exit

:exit
Echo Have a nice day!
ping localhost -n 5 -w 1 >null
exit
