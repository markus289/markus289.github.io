---
layout: default
title: Let's Encrypt
---

## {{ page.title }}

### Certificate management

#### Create an account

    certbot register --email letsencrypt@domain.tld

#### Apply and receive a certificate using webroot plugin

See below for an nginx configuration.

    certbot certonly --agree-tos --webroot -w /var/www/certbot -d some.domain.tld

Apply for a certificate containing more domains by adding `-d other.domain.tld` to the end.

#### List certificates

    certbot certificates

#### Renew certificates

    certbot renew

#### Delete a certificate

    certbot delete --cert-name some.domain.tld

### nginx configuration for initial certificate generation

    server {
        listen 80 default_server;
        listen [::]:80 default_server;
        server_name some.domain.tld;

        location /.well-known {
            alias /var/www/certbot/.well-known;
        }

        root /var/www/some/directory;
    }

### Automatic renewal using a systemd timer

`/etc/systemd/system/letsencrypt-renew.service`

    [Unit]
    Description=Renew Let's Encrypt certificates

    [Service]
    Type=oneshot
    ExecStart=/usr/bin/certbot renew

`/etc/systemd/system/letsencrypt-renew.timer`

    [Unit]
    Description=Daily renewal of Let's Encrypt's certificates

    [Timer]
    # once a day, at 2AM
    OnCalendar=*-*-* 02:00:00
    # Be kind to the Let's Encrypt servers: add a random delay of 0–3600 seconds
    RandomizedDelaySec=3600
    Persistent=true

    [Install]
    WantedBy=timers.target

Start, enable and list the timer.

    systemctl start letsencrypt-renew.timer
    systemctl enable letsencrypt-renew.timer
    systemctl list-timers
