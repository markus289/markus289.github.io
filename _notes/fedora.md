---
layout: default
title: Fedora Linux
---

## {{ page.title }}

### virt-manager PolicyKit

[(Source)](https://wiki.libvirt.org/page/SSHPolicyKitSetup)

    $ sudoedit /etc/polkit-1/localauthority/50-local.d/50-org.example-libvirt-remote-access.pkla
    [libvirt Management Access]
    Identity=unix-group:wheel
    Action=org.libvirt.unix.manage
    ResultAny=yes
    ResultInactive=yes
    ResultActive=yes

### Minimal install of GNOME

First, get a list of required packages.

    $ dnf group info "GNOME Desktop Environment"

Second, take a look at weak depencies.

    $ dnf install ${PACKAGES}

Third, install packages you want to install.

    $ dnf --setopt=install_weak_deps=False install ${PACKAGES} pinentry-gtk
