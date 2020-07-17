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
