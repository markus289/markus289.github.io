---
layout: default
title: Fedora Linux
---

## {{ page.title }}

### Minimal install of GNOME

First, get a list of required packages.

    $ dnf group info "GNOME Desktop Environment"

Second, take a look at weak depencies.

    $ dnf install ${PACKAGES}

Third, install packages you want to install.

    $ dnf --setopt=install_weak_deps=False install ${PACKAGES} pinentry-gtk

### Building RPM packages

Download sources for a SPEC file.

    spectool -g mypackage.spec

Setting up the chroot environment.

    mock -r fedora-33-x86_64 --init

Building and copying the SRPMs from the SPEC files.

    mock -r fedora-33-x86_64 --buildsrpm --spec mypackage.spec --sources .
    cp /var/lib/mock/fedora-33-x86_64/result/*.src.rpm ~/SRPMS/

Building the RPM packages.

    mock -r fedora-33-x86_64 --rebuild --chain --continue ~/SRPMS/*.src.rpm
