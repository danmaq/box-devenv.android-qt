@echo off

cd "%~dp0"
./up
pause
vagrant package --base "Android dev-env using Qt"
vagrant destroy -f
pause
rem re-import for test
vagrant box add --name danmaq/openSUSE-42.1-x86_64-Android-Qt-dev-env package.box
