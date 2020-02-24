---
layout: default
title: badblocks
---

## {{ page.title }}

### Check a hard drive for bad blocks

To check a hard disk for bad blocks run (**Warning**: this deletes the
whole drive):

    $ badblocks -s -w -t random -v /dev/sda

It is also useful to run a *SMART Extended Self Test* on the drive:

    $ smartctl -t long /dev/sda
