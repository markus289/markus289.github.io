---
layout: default
title: macOS
---

## {{ page.title }}

### Diable Notifications in Safari

[(Source)](https://apple.stackexchange.com/a/129011)

    defaults write ~/Library/Preferences/com.apple.Safari CanPromptForPushNotifications -boolean NO

### Disable System Integrity Protection

1. Reboot and hold down Command-R to boot into Recovery Mode.
2. Open a Terminal and execute `csrutil disable`.

### Disable Notification Center

*Note: System Integrity Protection needs to be disabled.*

    launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist

### Enable Notification Center

    launchctl load -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist
