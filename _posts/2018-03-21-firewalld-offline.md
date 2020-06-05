---
layout: default
title:  "Going offline using firewalld"
date:   2018-03-21 11:08:53 +0000
---

## {{ page.title }}

_Date published: {{ page.date | date: "%F" }}_

There are many options to go offline in Linux.
One option I particually like, is using [firewalld](http://www.firewalld.org/) to block all traffic.

Going offline is easy.

    firewall-cmd --panic-on

Going online is easy, too.

    firewall-cmd --panic-off
