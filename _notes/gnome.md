---
layout: default
title: GNOME
---

# {{ page.title }}

Keyboard layout
---------------

Open `dconf-editor` and look at `org.gnome.desktop.input-sources`. Mine
currently is set as follows.

    $ gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us+altgr-intl')]"
    $ gsettings set org.gnome.desktop.input-sources xkb-options "['lv3:caps_switch', 'nodeadkeys']"

Compare with [X11](/notes/x11/).

Switching windows
-----------------

GNOME defaults to switching applications instead of windows. In order to
use `<Alt><Tab>` for switching windows make sure the following settings
are set.

    $ gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Super>Tab']"
    $ gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Super>Tab']"
    $ gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
    $ gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Alt>Tab']"

Terminal
--------

Use the dark theme variant (no longer required).

    $ gsettings set org.gnome.Terminal.Legacy.Settings dark-theme true

Allow `F10` to be used in for example `mc`.

    $ gsettings set org.gnome.Terminal.Legacy.Settings menu-accelerator-enabled false


gnome-keyring-daemon
--------------------

*Note: As of GNOME 3.28 this is no longer true.*

The `gnome-keyring-daemon` does not support ED25519 keys, so disable it and use `keychain` to start the default `ssh-agent`.

    $ sudo ln -sf /dev/null /etc/xdg/autostart/gnome-keyring-ssh.desktop
    $ cat >> ~/.bashrc << EOL
    if type keychain &>/dev/null ; then
        if [[ -e "$HOME/.ssh/id_ed25519" ]] ; then
            eval $(keychain --agents ssh --quiet --eval id_ed25519)
        fi
    fi
    EOL
