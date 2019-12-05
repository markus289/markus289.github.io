---
layout: default
title: Exherbo Linux
---

# {{ page.title }}

## Binary packages

[(Source)](https://www.clever-cloud.com/blog/engineering/2012/12/20/knowing-your-system---part-5---source-based-distributions-the-binary-way/)
There shall be two systems, one building packages, the other one using them.

Both machines should use the same options for all packages, i.e.,
`/etc/paludis/options.conf` should be equal on both machines.

### Setting up the build host

`/etc/paludis/bashrc` shall contain `CFLAGS` that are suitable for both, the
build host and the client.

    CHOST="x86_64-pc-linux-gnu"
    x86_64_pc_linux_gnu_CFLAGS="-march=silvermont -mtune=intel -O2 -pipe"
    x86_64_pc_linux_gnu_CXXFLAGS="-march=silvermont -mtune=intel -O2 -pipe"

Check the native architecture with `gcc` on both machines if in doubt.
[(Source)](https://stackoverflow.com/questions/5470257/how-to-see-which-flags-march-native-will-activate)

    gcc -march=native -E -v - </dev/null 2>&1 | grep cc1

Create the `pbin` repository on the file system.

    mkdir -p /var/db/paludis/repositories/pbin/{metadata,packages,profiles}
    echo 'pbin' > /var/db/paludis/repositories/pbin/profiles/repo_name
    echo 'masters = arbor' > /var/db/paludis/repositories/pbin/metadata/layout.conf
    touch /var/db/paludis/repositories/pbin/profiles/options.conf
    touch /var/db/paludis/repositories/pbin/metadata/categories.conf
    chown -R paludisbuild:paludisbuild /var/db/paludis/repositories/pbin
    chmod -R g+w /var/db/paludis/repositories/pbin
    mkdir -p /var/cache/paludis/pbin
    chown -R paludisbuild:paludisbuild /var/cache/paludis/pbin
    chmod -R g+w /var/cache/paludis/pbin

Create `/etc/paludis/repositories/pbin.conf`, adjust `domain.tld`.

    format = e
    location = /var/db/paludis/repositories/pbin
    distdir = /var/cache/paludis/pbin
    binary_distdir = /var/cache/paludis/pbin
    binary_destination = true
    binary_keywords_filter = amd64 ~amd64
    binary_uri_prefix = https://pbin.domain.tld/
    tool_prefix = x86_64-pc-linux-gnu-
    importance = -10

The binary files shall be served by `nginx`, while the repository shall be
synced with `rsync`.
You may want to do it in a different manner, e.g., serving the repository using
`git`.

Install `nginx`.
Use something similar to the following in `/etc/nginx/nginx.conf`.

    server {
        listen 443 ssl;
        listen [::]:443 ssl;
        server_name  pbin.domain.tld;
        ssl_certificate /etc/letsencrypt/live/pbin.domain.tld/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/pbin.domain.tld/privkey.pem;
        location / {
            root /var/cache/paludis/pbin;
        }
    }

Install `rsync`.
Use something similar to the following in `/etc/rsyncd.conf`.

    [pbin]
        path = /var/db/paludis/repositories/pbin
        comment = Exherbo pbin repo
        list = no

This completes the setup of the build host.

### Setting up the client

The client only needs to know about the repository.
This is done by creating `/etc/paludis/repositories/pbin.conf`.

    format = e
    location = ${root}/var/db/paludis/repositories/pbin
    sync = rsync://pbin.domain.tld/pbin
    tool_prefix = x86_64-pc-linux-gnu-
    importance = -10

This completes the setup of the client.

### Building and using binary packages

On the build host, binary packages can be build as follows.

    cave resolve mypackage --via-binary '*/*' --one-binary-per-slot

On the client, the binary package can be used as follows.
Don't forget to sync before trying to use the binary repository.

    cave resolve mypackage --promote-binaries if-same
