@echo off

whoami /groups | find "High Mandatory Level" > NUL
if not errorlevel 1 goto RUN
cd "%~dp0"
echo You must elevate to administrator mode, because continue setup.
powershell -Command Start-Process -Verb runas "%~n0"
exit /b %errorlevel%
:RUN

echo.
echo ===[ INSTALL Chocolatey ]==========================================
@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
RefreshEnv

echo.
echo ===[ INSTALL Virtualbox ]==========================================
cinst -y virtualbox -params '"/NoDesktopShortcut"'

echo.
echo ===[ INSTALL Vagrant ]=============================================
cinst -y vagrant

echo.
echo ### Continue to up.cmd. Return to standard user mode. ###
setlocal
set TASK=%RANDOM%
schtasks /Create /TN %TASK% /TR "%~dp0up.cmd" /SC ONCE /ST 00:00
schtasks /Run /TN %TASK%
schtasks /Delete /F /TN %TASK%
endlocal

timeout /T 10
exit /b 0
