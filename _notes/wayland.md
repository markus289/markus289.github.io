---
layout: default
title: Wayland
---

## {{ page.title }}

### Electron

[(Source)](https://github.com/signalapp/Signal-Desktop/issues/5869#issuecomment-1240607666)

Electron applications like Visual Studio Code or Signal may render blurry on
Wayland if scaling is enabled. The following two options may be used to resolve
this issue.

    --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform=wayland
