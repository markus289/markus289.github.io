---
layout: default
title: Android
---

# {{ page.title }}

## Android Studio

Android Studio uses the `Alt+Enter` keyboard shortcut, but I use this shortcut already in `xmonad`.
You can remap the action in `File -> Settings -> Keymap -> Other -> Show Intention Actions`.

## Turn off pop-up text notifications

[(Source)](https://forums.androidcentral.com/android-5-0-lollipop/462892-can-you-turn-off-pop-up-text-notifications-2.html#post4481154)

    adb shell settings put global heads_up_notifications_enabled 0
