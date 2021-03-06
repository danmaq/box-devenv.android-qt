# [danmaq/openSUSE-42.1-x86_64-Android-Qt-dev-env](https://atlas.hashicorp.com/danmaq/boxes/openSUSE-42.1-x86_64-Android-Qt-dev-env)

Vagrant box for Android develop environment using Qt.

* openSUSE Leap 42.1 (from opensuse/openSUSE-42.1-x86_64 1.0.1)
* patterns-openSUSE-devel_C_C++
* Qt 5.6
* Android SDK (API 21)
* Android NDK r10e

## Usage

```
mkdir dev
cd dev
vagrant init danmaq/openSUSE-42.1-x86_64-Android-Qt-dev-env
vagrant up
```

## System requirements

* Virtualbox available PC
    * macOS sierra
        * should install Virtualbox and Vagrant manually.
    * Windows 7 or higher version, __WITHOUT Hyper-V__.
        * Virtualbox and Vagrant are auto install via Chocolatey. (run `setup.cmd`)

## Description

### for Windows Host

* setup.cmd: (Recommend for first-run) Run `up.cmd` before install Chocolatey, Virtualbox, and Vagrant.
* up.cmd: Start vagrant VM and watch reload request from ansible_local.
* box.cmd: Run `up.cmd` and export vagrant box.

### for unix like Host (e.g. macOS)

* up: Start vagrant VM and watch reload request from ansible_local.
* box: Run `up` and export vagrant box.

## Process overview

1. Vagrant up from opensuse/openSUSE-42.1-x86_64. (version 1.0.1)
2. Install Ansible. (via ansible_local)
3. Run `zypper patch` and `zypper update`.
4. Install KDE Desktop. (KDE Plasma 5.5.x)
5. Install pattern devel_C_C++.
6. Install Android SDK NDK (r10e).
    * dest: ~/android-ndk-r10e
7. Install Android SDK (API 21).
    * dest: ~/android-sdk-linux
8. Install Qt 5.6.2 for Android.
    * dest: ~/Qt5.6.2
