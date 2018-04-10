---
layout: default
title: Anaconda
---

# {{ page.title }}

## Install miniconda in silent mode

    sudo bash miniconda.sh -b -p /opt/miniconda

`-b` denotes batch mode.
`-p` is the prefix for intsallation.

## Load conda system wide

Edit `/etc/profile.d/conda.sh` as follows.
Depending on your configuration, `conda` should be available for both, `bash`
and `zsh`.

    # miniconda
    if [[ -f "/opt/miniconda/etc/profile.d/conda.sh" ]] ; then
        source "/opt/miniconda/etc/profile.d/conda.sh"
    fi
