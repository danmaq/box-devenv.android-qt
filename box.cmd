@echo off

cd "%~dp0"
vagrant destroy -f
./up

vagrant ssh -c "curl -f https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub -o ~/.ssh/authorized_keys"
vagrant halt
vagrant package --base "Android dev-env using Qt"
vagrant destroy -f

pause
rem re-import for test
vagrant box add --name danmaq/openSUSE-42.1-x86_64-Android-Qt-dev-env package.box
