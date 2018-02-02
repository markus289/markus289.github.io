---
layout: default
title: Gurobi
---

# {{ page.title }}

Install
-------

*Note*: Adjust paths and versions according to your needs.

    $ mkdir ~/.gurobi
    $ cd ~/.gurobi
    $ tar xf ~/tmp/gurobi7.5.1_linux64.tar.gz
    $ cd ~/.gurobi/gurobi751/linux64
    $ python3 setup.py install --prefix=$HOME/.local
    $ patchelf --set-rpath ~/.gurobi/gurobi751/linux64/lib ~/.local/lib/python3.6/site-packages/gurobipy/gurobipy.so
    $ cd ~/.gurobi/gurobi751/linux64/bin
    $ ./grbgetkey aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa

Save the license file to `~/.gurobi/gurobi.lic` and `GRB_LICENSE_FILE` to `~/.gurobi/gurobi.lic`.
`GUROBI_HOME` does not neet to be set.

Install using `conda`
---------------------

[(Source)](https://anaconda.org/Gurobi/gurobi)

    $ conda install -c gurobi gurobi

[(Source)](http://www.cvxpy.org/en/latest/install/index.html)

    $ conda install -c cvxgrp cvxpy
