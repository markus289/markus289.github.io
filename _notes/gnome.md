---
layout: default
title: GNOME
---

## {{ page.title }}

### Keyboard layout

Open `dconf-editor` and look at `org.gnome.desktop.input-sources`. Mine
currently is set as follows.

    $ gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us+altgr-intl')]"
    $ gsettings set org.gnome.desktop.input-sources xkb-options "['lv3:caps_switch', 'nodeadkeys']"

Compare with [X11](/notes/x11/).

### Switching windows

GNOME defaults to switching applications instead of windows. In order to
use `<Alt><Tab>` for switching windows make sure the following settings
are set.

    $ gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Super>Tab']"
    $ gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Super>Tab']"
    $ gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
    $ gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Alt>Tab']"

### Terminal

Use the dark theme variant (no longer required).

    $ gsettings set org.gnome.Terminal.Legacy.Settings dark-theme true

Instead of the above, use this with GNOME `3.22`, Debian 9 (Strech).

    $ gsettings set org.gnome.Terminal.Legacy.Settings theme-variant dark

Allow `F10` to be used in for example `mc`.

    $ gsettings set org.gnome.Terminal.Legacy.Settings menu-accelerator-enabled false

### Desktop icons

Desktop icons can be disabled as follows.

    $ gsettings set org.gnome.desktop.background show-desktop-icons false

### Fractional Scaling

If scaling in display settings only shows up as `100%`, `200%`, etc., but not
`125%`, `150%`, etc., you can try to enable fractional scaling manually.
This only works if you are using a Wayland session, not an X11 session.

    $ gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"

### gnome-keyring-daemon

*Note: As of GNOME 3.28 this is no longer required.*

The `gnome-keyring-daemon` does not support ED25519 keys, so disable it and use `keychain` to start the default `ssh-agent`.

    $ sudo ln -sf /dev/null /etc/xdg/autostart/gnome-keyring-ssh.desktop
    $ cat >> ~/.bashrc << EOL
    if type keychain &>/dev/null ; then
        if [[ -e "$HOME/.ssh/id_ed25519" ]] ; then
            eval $(keychain --agents ssh --quiet --eval id_ed25519)
        fi
    fi
    EOL
