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

[(Source)](https://github.com/electron/electron/blob/main/docs/api/environment-variables.md#electron_ozone_platform_hint-linux)

Starting with [Electron 28](https://github.com/electron/electron/commit/58fd8825d224c855cc8290f0a9985c21d4f3c326),
the following environment variable enables Wayland support for all Electron
applications, i.e., there is no need to edit each `.desktop` file separately.

    ELECTRON_OZONE_PLATFORM_HINT=auto && export ELECTRON_OZONE_PLATFORM_HINT

### Mozilla

Set the following environment variable to prefer Wayland.

    MOZ_ENABLE_WAYLAND=1 && export MOZ_ENABLE_WAYLAND

Note, the variable has to be `unset` in order to disable it.
Setting it to `0` does not work.
