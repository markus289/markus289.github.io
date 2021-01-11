---
layout: default
title: Anaconda
---

## {{ page.title }}

### Install conda on Fedora Linux

    # dnf install conda

There is no need to follow any of the following.

### Install miniconda in silent mode

[Miniconda](https://docs.conda.io/en/latest/miniconda.html)

    # curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
    # bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/miniconda

`-b` denotes batch mode.
`-p` is the prefix for installation.

### Load conda system wide

Edit `/etc/profile.d/conda.sh` as follows.
Depending on your configuration, `conda` should be available for both, `bash`
and `zsh`.
On macOS you may add this to `/etc/zprofile`.

    # miniconda
    [[ -n ${NO_SYSTEM_CONDA} || -f ~/.hushlogin ]] && _profile_hushlogin=1

    if [[ -z $_profile_hushlogin && -f /opt/miniconda/etc/profile.d/conda.sh ]]; then
        source /opt/miniconda/etc/profile.d/conda.sh
    fi

    unset _profile_hushlogin

If some user does not want to use the system provided Anaconda, then he may add this to `~/.zshenv`.

    NO_SYSTEM_CONDA=1

### Periodically update miniconda base install

Create `/etc/systemd/system/conda-update.service` as follows.

    [Unit]
    Description=Miniconda update (oneshot)
    Wants=network-online.target

    [Service]
    Type=oneshot
    ExecStart=/opt/miniconda/bin/conda update -n base --all -y

Create `/etc/systemd/system/conda-update.timer` as follows.

    [Unit]
    Description=Daily update of Miniconda

    [Timer]
    OnBootSec=1h
    OnUnitInactiveSec=1d
    RandomizedDelaySec=5m
    AccuracySec=1s

    [Install]
    WantedBy=timers.target

Enable and start the timer.

    # systemctl enable conda-update.timer
    # systemctl start conda-update.timer

Status can be checked with `systemctl` and `journalctl`.

    # systemctl list-timers [--all]
    # journalctl -u conda-update
