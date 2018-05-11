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
On macOS you may add this to `/etc/zprofile`.

    # miniconda
    [[ -n ${NO_SYSTEM_CONDA} || -f ~/.hushlogin ]] && _profile_hushlogin=1

    if [[ -z $_profile_hushlogin && -f /opt/miniconda/etc/profile.d/conda.sh ]]; then
            source /opt/miniconda/etc/profile.d/conda.sh
        fi
    fi

    unset _profile_hushlogin

If some user does not want to use the system provided Anaconda, then he may add this to `~/.zshenv`.

    NO_SYSTEM_CONDA=1
