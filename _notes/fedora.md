---
layout: default
title: Fedora Linux
---

## {{ page.title }}

### Using sytemd-networkd

    cat << EOF > /etc/systemd/network/80-dhcp.network
    [Match]
    Name=en* wl*

    [Network]
    DHCP=yes

    [DHCP]
    ClientIdentifier=mac
    EOF
    systemctl disable --now NetworkManager
    systemctl mask NetworkManager
    systemctl enable --now systemd-networkd
    systemctl enable --now systemd-resolved
    ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

### Disable automatic software updates

This seems to be relevant only for the desktop version of Fedora.
[(Source)](http://vfamilyserver.org/blog/2014/11/disable-background-updates-on-fedora-21-gnome-3-14/)

    $ gsettings set org.gnome.software download-updates false

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
