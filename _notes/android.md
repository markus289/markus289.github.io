---
layout: default
title: Android
---

## {{ page.title }}

### Apps

- MuPDF mini: [F-Droid][1] &#124; [Play Store][2]
- NewPipe: [F-Droid][7] &#124; [Homepage][8]
- Notally: [F-Droid][3] &#124; [Play Store][4]
- Pinkt for Pinboard: [GitHub][12] &#124; [Play Store][11]
- RadioDroid: [F-Droid][5] &#124; [Play Store][6]
- VLC: [F-Droid][9] &#124; [Play Store][10]

[1]: https://f-droid.org/en/packages/com.artifex.mupdf.mini.app/
[2]: https://play.google.com/store/apps/details?id=com.artifex.mupdf.mini.app
[3]: https://f-droid.org/en/packages/com.omgodse.notally/
[4]: https://play.google.com/store/apps/details?id=com.omgodse.notally
[5]: https://f-droid.org/en/packages/net.programmierecke.radiodroid2/
[6]: https://play.google.com/store/apps/details?id=net.programmierecke.radiodroid2
[7]: https://f-droid.org/en/packages/org.schabi.newpipe/
[8]: https://newpipe.net/#download
[9]: https://f-droid.org/en/packages/org.videolan.vlc/
[10]: https://play.google.com/store/apps/details?id=org.videolan.vlc
[11]: https://play.google.com/store/apps/details?id=com.fibelatti.pinboard
[12]: https://github.com/fibelatti/pinboard-kotlin

### Android Studio

Android Studio uses the `Alt+Enter` keyboard shortcut, but I use this shortcut already in `xmonad`.
You can remap the action in `File -> Settings -> Keymap -> Other -> Show Intention Actions`.

### Turn off pop-up text notifications

[(Source)](https://forums.androidcentral.com/android-5-0-lollipop/462892-can-you-turn-off-pop-up-text-notifications-2.html#post4481154)

    adb shell settings put global heads_up_notifications_enabled 0

### Use UTC as time zone

[(Source)](https://android.stackexchange.com/questions/45502/how-to-add-timezone-to-world-clock-when-you-dont-know-the-city) You need to be root.

    setprop persist.sys.timezone "UTC"

### Boot into TWRP without flashing

This gives you root for setting the time zone as described above.

    adb reboot bootloader
    fastboot boot twrp.img

### List installed packages

    adb shell pm list packages

### Find package name by version

Sometimes it is difficult to identify the package name, which is different from
the displayed name in the user interface.
In these cases searching for a specific version, which you can find in the apps
information, may identify the package.

    adb shell pm list packages --show-versioncode|grep -P '6.*0.*0.*1.*3'

### Example Package names

- AR-Zone: `com.samsung.android.arzone`
- Bixby: `com.samsung.android.bixby.agent`
- Galaxy Store: `com.sec.android.app.samsungapps`
- Game Launcher: `com.samsung.android.game.gamehome`
- Google Duo: `com.google.android.apps.tachyon`
- SIM-Toolkit: `com.android.stk`
- Telekom App Starter: `de.telekom.tsc`

### Uninstall package for current user

This is useful for packages that otherwise cannot be uninstalled.

    adb shell pm uninstall --user 0 de.telekom.tsc
