---
layout: default
title: Python
---

## {{ page.title }}

### Install to home directory

Install `pip` to your home directory, if you don't have it installed already and can't do this as root:

    $ easy_install --prefix=$HOME/.local/ pip

Using `pip` to install a package to your home directory:

    $ pip install --user tvrenamr
    $ export PATH=$PATH:$HOME/.local/bin

You may also always install to your home directory by creating a
`$HOME/.pip/pip.conf` with the following content:

    [install]
    user = true
