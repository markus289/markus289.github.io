---
layout: default
title: xdg
---

## {{ page.title }}

### Check the filetype

    $ xdg-mime query filetype this.txt
    text/plain

    $ xdg-mime query filetype that.pdf
    application/pdf

    $ xdg-mime query filetype $PWD
    inode/directory

### Show the default application

    $ xdg-mime query default text/plain 
    gvim.desktop

### Change the default application

    $ xdg-mime default Thunar.desktop inode/directory

### Set default browser

    $ xdg-settings get default-web-browser
    google-chrome.desktop
    $ xdg-settings set default-web-browser firefox.desktop
