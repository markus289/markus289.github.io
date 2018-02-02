---
layout: default
title: Debian Linux
---

# {{ page.title }}

Debian `/etc/apt/sources.list` with updates and backports:

    deb http://ftp.debian.org/debian/ wheezy main contrib non-free
    deb-src http://ftp.debian.org/debian/ wheezy main contrib non-free

    deb http://ftp.debian.org/debian/ wheezy-updates main contrib non-free
    deb-src http://ftp.debian.org/debian/ wheezy-updates main contrib non-free

    deb http://ftp.debian.org/debian/ wheezy-backports main contrib non-free
    deb-src http://ftp.debian.org/debian/ wheezy-backports main contrib non-free

    deb http://security.debian.org/ wheezy/updates main contrib non-free
    deb-src http://security.debian.org/ wheezy/updates main contrib non-free

Debian `/etc/apt/apt.conf.d/50unattended-upgrades` with all upgrades:

    Unattended-Upgrade::Origins-Pattern {
            "o=Debian,a=stable";
            "o=Debian,a=stable-updates";
            "o=Debian Backports,a=wheezy-backports";
    };
    Unattended-Upgrade::Mail "root";
    Unattended-Upgrade::Automatic-Reboot "true";

Debian `/etc/apt/apt.conf.d/20auto-upgrades` to enable `unattended-upgrades`:

    APT::Periodic::Update-Package-Lists "1";
    APT::Periodic::Unattended-Upgrade "1";

Debian `/etc/network/interfaces` with a fixed IPv6 address:

    auto lo
    iface lo inet loopback

    allow-hotplug eth0
    iface eth0 inet static
        address 95.211.167.6
        netmask 255.255.255.0
        network 95.211.167.0
        broadcast 95.211.167.255
        gateway 95.211.167.254
    iface eth0 inet6 static
        address 2001:1AF8:4300:A011:0004:bb46:d2d9:a029
        netmask 64
        gateway 2001:1AF8:4300:A011::1

Debian `/etc/network/interfaces` with WiFi without NetworkManager:

    auto lo
    iface lo inet loopback

    allow-hotplug eth0
    iface eth0 inet dhcp

    allow-hotplug wlan0
    iface wlan0 inet dhcp
        wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf
