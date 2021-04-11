---
layout: default
title: GNOME
---

## {{ page.title }}

### Keyboard layout

Open `dconf-editor` and look at `org.gnome.desktop.input-sources`. Mine
currently is set as follows.

    $ gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us+altgr-intl')]"
    $ gsettings set org.gnome.desktop.input-sources xkb-options "['lv3:caps_switch']"

Compare with [X11](/notes/x11/).

### Switching windows

GNOME defaults to switching applications instead of windows.
In order to use `<Super><Tab>` for switching windows make sure the following
settings are set.

    $ gsettings set org.gnome.desktop.wm.keybindings switch-applications "[]"
    $ gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "[]"
    $ gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Super>Tab']"
    $ gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Super>Tab']"

### Terminal

Allow `F10` to be used in for example `mc`.
Also available from `gnome-terminals`'s preferences by now.

    $ gsettings set org.gnome.Terminal.Legacy.Settings menu-accelerator-enabled false

### Fractional Scaling

If scaling in display settings only shows up as `100%`, `200%`, etc., but not
`125%`, `150%`, etc., you can try to enable fractional scaling manually.
This only works if you are using a Wayland session, not an X11 session.

    $ gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"

### Disable automatic software updates

This seems to be relevant only for the desktop version of Fedora.
[(Source)](http://vfamilyserver.org/blog/2014/11/disable-background-updates-on-fedora-21-gnome-3-14/)

    $ gsettings set org.gnome.software download-updates false
