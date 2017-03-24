# box-devenv.android-qt

Vagrant box for Android develop environment using Qt.

## System requirements

* macOS sierra
    * should install Virtualbox and Vagrant manually.
* Windows 7 or higher version, __WITHOUT Hyper-V__.
    * Virtualbox and Vagrant are auto install via Chocolatey.

## for Windows Host

* up.cmd: Start vagrant VM and watch reload request from ansible_local.
* setup.cmd: (Recommend for first-run) Run up.cmd before install Chocolatey, Virtualbox, and Vagrant.

## for unix like Host (e.g. macOS)

* up: Start vagrant VM and watch reload request from ansible_local.

## Process

1. Run `zypper patch` and `zypper update`
2. Install desktop (KDE)
3. Install devel_C_C++ and misc tools.
    * git
    * ant
    * yasm
    * libSDL2-devel
4. Install Qt for Android 5.6.x
5. Install Android SDK / NDK
