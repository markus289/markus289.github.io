---
layout: default
title: CentOS
---

# {{ page.title }}

## Repositories

    # yum-config-manager requires yum-utils
    sudo yum-config-manager --add-repo=https://negativo17.org/repos/epel-multimedia.repo
    sudo rpm -Uvh http://download.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-10.noarch.rpm

## Packages

    yum-utils
    systemd-networkd
    systemd-resolved
