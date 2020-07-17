---
layout: default
title: libvirt
---

## {{ page.title }}

### virt-manager PolicyKit

[(Source)](https://wiki.libvirt.org/page/SSHPolicyKitSetup)
Allow users in the group `wheel` to access libvirt without asking for a
password.

    $ sudoedit /etc/polkit-1/localauthority/50-local.d/50-org.example-libvirt-remote-access.pkla
    [libvirt Management Access]
    Identity=unix-group:wheel
    Action=org.libvirt.unix.manage
    ResultAny=yes
    ResultInactive=yes
    ResultActive=yes

### Default to network bridging

[(Source)](http://blog.leifmadsen.com/blog/2016/12/01/create-network-bridge-with-nmcli-for-libvirt/)
Remove the default network and add a bridging network.
First, create a network bridge, see [systemd](/notes/systemd/), then follow the
steps below.

    virsh net-list [--all]
    virsh net-undefine default
    cat > bridge.xml <<EOF
    <network>
        <name>host-bridge</name>
        <forward mode="bridge"/>
        <bridge name="br0"/>
    </network>
    EOF
    virsh net-define bridge.xml
    virsh net-start host-bridge
    virsh net-autostart host-bridge
