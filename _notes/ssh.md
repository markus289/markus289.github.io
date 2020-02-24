---
layout: default
title: SSH
---

## {{ page.title }}

Force SSH to use `password` authentication:

    $ ssh -o PreferredAuthentications="password" example.com


Force SSH to use `keyboard-interactive` authentication:

    $ ssh -o PreferredAuthentications="keyboard-interactive" example.com

To allow only public key authentication set in `/etc/ssh/sshd_config`:

    PasswordAuthentication no
    ChallengeResponseAuthentication no

Checking that only public key authentication is enabled:

    $ ssh -v example.com
    [...]
    debug1: Authentications that can continue: publickey
    [...]

It is also a good idea to disable the root login in `/etc/ssh/sshd_config`:

    PermitRootLogin no

Connect to a machine without checking or remembering the host key (if
you know you connect to a rescue system for example):

    $ ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no user@host

