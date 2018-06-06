---
layout: default
title: Gurobi
---

# {{ page.title }}

Install
-------

*Note*: Adjust paths and versions according to your needs.

    $ mkdir -p ~/.gurobi
    $ cd ~/.gurobi
    $ curl -O http://packages.gurobi.com/8.0/gurobi8.0.0_linux64.tar.gz
    $ tar xf gurobi8.0.0_linux64.tar.gz
    $ rm -v gurobi8.0.0_linux64.tar.gz
    $ cd ~/.gurobi/gurobi800/linux64
    $ python3 setup.py install --prefix=$HOME/.local
    $ patchelf --set-rpath ~/.gurobi/gurobi800/linux64/lib ~/.local/lib/python3.6/site-packages/gurobipy/gurobipy.so

Getting a License
-----------------

    $ cd ~/.gurobi/gurobi800/linux64/bin
    $ ./grbgetkey aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa

Save the license file to `~/.gurobi/gurobi.lic` and set `GRB_LICENSE_FILE` to `~/.gurobi/gurobi.lic`.
`GUROBI_HOME` does not neet to be set.

Install using `conda`
---------------------

[(Source)](https://anaconda.org/Gurobi/gurobi)

    $ conda install -c gurobi gurobi

[(Source)](http://www.cvxpy.org/en/latest/install/index.html)

    $ conda install -c cvxgrp cvxpy
