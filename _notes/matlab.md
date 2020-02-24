---
layout: default
title: MATLAB
---

## {{ page.title }}

Disable Tooltip Keybinding:

    >> com.mathworks.desktop.mnemonics.MnemonicsManagers.get.disable

### Getting CVX

[CVX](http://cvxr.com/cvx/) can be installed as follows.

    $ mkdir -p ${HOME}/matlab
    $ cd ${HOME}/matlab
    $ curl -O http://web.cvxr.com/cvx/cvx-a64.tar.gz
    $ tar xf cvx-a64.tar.gz
    $ rm -v cvx-a64.tar.gz
    $ cat >> startup.m <<EOF
    run(fullfile(getenv('HOME'),'/matlab/cvx/cvx_startup.m'))
    EOF
