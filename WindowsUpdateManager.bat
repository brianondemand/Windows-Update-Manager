
@echo off

:menu
echo ==============================================================
echo Windows Update Manager

:options
echo [1] Enable Automatic Windows Updates
echo [2] Disable Automatic Windows Updates
echo [X] Exit

set /p choice="Select an option (1/2/X): "

if "%choice%" == "1" goto enable
if "%choice%" == "2" goto disable
if /i "%choice%" == "X" exit
echo Invalid choice. Please select a valid option.
goto options

:enable
set /p confirm="Are you sure you want to turn on automatic Windows updates? Press Enter to continue or C to cancel: "
if /i "%confirm%" == "C" goto menu

echo Enabling Windows Update Service...
sc config wuauserv start= auto >nul 2>&1
sc start wuauserv >nul 2>&1
echo Windows Update Service has been enabled.
pause
goto menu

:disable
set /p confirm="Are you sure you want to turn off automatic Windows updates? Press Enter to continue or C to cancel: "
if /i "%confirm%" == "C" goto menu

echo Disabling Windows Update Service...
sc stop wuauserv >nul 2>&1
sc config wuauserv start= disabled >nul 2>&1
echo Windows Update Service has been disabled.
pause
goto menu
