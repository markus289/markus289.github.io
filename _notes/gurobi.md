---
layout: default
title: Gurobi
---

## {{ page.title }}

### Install

*Note*: Adjust paths and versions according to your needs.

    $ mkdir -p ~/.gurobi
    $ cd ~/.gurobi
    $ curl -O https://packages.gurobi.com/9.1/gurobi9.1.2_linux64.tar.gz
    $ tar xf gurobi9.1.2_linux64.tar.gz
    $ rm -v gurobi9.1.2_linux64.tar.gz
    $ cd ~/.gurobi/gurobi912/linux64
    $ python3.9 setup.py install --prefix=$HOME/.local
    $ patchelf --set-rpath ~/.gurobi/gurobi912/linux64/lib ~/.local/lib/python3.9/site-packages/gurobipy/gurobipy.so

### Getting a License

    $ cd ~/.gurobi/gurobi912/linux64/bin
    $ ./grbgetkey aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa

Save the license file to `~/.gurobi/gurobi.lic` and set `GRB_LICENSE_FILE` to `~/.gurobi/gurobi.lic`.
`GUROBI_HOME` does not neet to be set.

### Install using `conda`

[(Source)](https://anaconda.org/gurobi/gurobi)

    $ conda install -c gurobi gurobi

[(Source)](https://www.cvxpy.org/install/index.html)

    $ conda install -c cvxgrp cvxpy
