---
layout: default
title: btrfs
---

# {{ page.title }}

Using a cron job to check the filesystem periodically:

    @weekly /sbin/btrfs scrub start -Bd /
