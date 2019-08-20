---
layout: default
title: Fedora Linux
---

# {{ page.title }}

Using sytemd-networkd
---------------------

    cat << EOF > /etc/systemd/network/80-dhcp.network
    [Match]
    Name=en* wl*

    [Network]
    DHCP=yes

    [DHCP]
    ClientIdentifier=mac
    EOF
    systemctl disable network
    systemctl disable NetworkManager
    dnf remove NetworkManager
    systemctl enable systemd-networkd
    systemctl enable systemd-resolved
    ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf

Third party repositories
------------------------

    dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
    dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
    dnf config-manager --add-repo=http://negativo17.org/repos/fedora-multimedia.repo
    dnf config-manager --add-repo=http://negativo17.org/repos/fedora-spotify.repo
    dnf copr enable sergiomb/google-drive-ocamlfuse

Public key for google-chrome-<...>.rpm is not installed
-------------------------------------------------------

[(Source)](https://ask.fedoraproject.org/en/question/56695/public-key-for-google-chrome-unstable-versionrpm-is-not-installed/)

    $ sudo rpm --import https://dl-ssl.google.com/linux/linux_signing_key.pub

Disable automatic software updates
----------------------------------

This seems to be relevant only for the desktop version of Fedora.
[(Source)](http://vfamilyserver.org/blog/2014/11/disable-background-updates-on-fedora-21-gnome-3-14/)

    $ gsettings set org.gnome.software download-updates false

virt-manager PolicyKit
----------------------

[(Source)](https://wiki.libvirt.org/page/SSHPolicyKitSetup)

    $ sudoedit /etc/polkit-1/localauthority/50-local.d/50-org.example-libvirt-remote-access.pkla
    [libvirt Management Access]
    Identity=unix-group:wheel
    Action=org.libvirt.unix.manage
    ResultAny=yes
    ResultInactive=yes
    ResultActive=yes
