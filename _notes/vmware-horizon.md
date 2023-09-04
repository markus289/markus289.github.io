---
layout: default
title: VMware Horizon
---

## {{ page.title }}

### Create RPM for the Linux client

- [download Linux tarballs](https://www.vmware.com/go/viewclients)
- `VMware-Horizon-Client-2212.1-8.8.1-21219348.x64.tar.gz`
- `VMware-Horizon-Client-Linux-SessionSDK-2212.1-8.8.1-21219348.x64.tar.gz`
- tar xf ... && cd ...
- rm doc/patches/...
- mkdir usr && mv ... usr
- copy `libudev.so.0` from for example `libudev-147-2.73.el6_8.2.x86_64.rpm`
- `fpm -s dir -t rpm -n vmware-horizon-client[-clientsdk] --version 2212.1 .`
