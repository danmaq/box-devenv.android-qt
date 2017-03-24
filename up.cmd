@echo off

cd "%~dp0"

setlocal
set LC_TEMP=.tmp
set REBOOT="%LC_TEMP%¥.reboot"
if not exist %LC_TEMP% md %LC_TEMP%
if exist %REBOOT% del %REBOOT%
vagrant up --provision

:PROVISION
if not exist %REBOOT% goto PROVISION_COMPLETE
echo ### REBOOT... ###
del %REBOOT%
vagrant reload --provision
goto PROVISION

:PROVISION_COMPLETE
endlocal

timeout /T 10
exit /b 0
