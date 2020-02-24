---
layout: default
title: Transmission
---

## {{ page.title }}

Use [Mailgun](https://www.mailgun.com/) to send an email on finished torrent.

    #!/bin/bash

    CURL=/usr/bin/curl
    MG_APIKEY="key-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

    ${CURL} --user "api:$MG_APIKEY" \
        https://api.mailgun.net/v3/example.com/messages \
        -F from="machine <root@example.com>" \
        -F to="someone@example.net" \
        -F subject="Download finished" \
        -F text="$TR_TORRENT_NAME" || touch ~/sending_email_failed

Then set this in `~/.config/transmission-daemon/settings.json`:

    "script-torrent-done-filename": "/home/you/.local/bin/<scriptname>.sh"
