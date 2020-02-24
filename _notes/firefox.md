---
layout: default
title: Firefox
---

## {{ page.title }}

### Add-ons

- [I don't care about cookies](https://addons.mozilla.org/firefox/addon/i-dont-care-about-cookies/)
- [uBlock Origin](https://addons.mozilla.org/firefox/addon/ublock-origin/)
- [Vimium-FF](https://addons.mozilla.org/firefox/addon/vimium-ff/)

#### Vimium

Custom key mappings.

    map J nextTab
    map K previousTab

### Maybe Add-ons

- [Add custom search engine](https://addons.mozilla.org/en-US/firefox/addon/add-custom-search-engine/)
- [Autoplay No More](https://addons.mozilla.org/firefox/addon/autoplay-no-more/)
- [Dark Reader](https://addons.mozilla.org/firefox/addon/darkreader/)
- [Google search link fix](https://addons.mozilla.org/firefox/addon/google-search-link-fix/)
- [HTTPS Everywhere](https://addons.mozilla.org/firefox/addon/https-everywhere/)
- [Image Block](https://addons.mozilla.org/en-US/firefox/addon/image-block/)
- [Pinboard Pin](https://addons.mozilla.org/firefox/addon/pinboard-pin/)
- [Youtube's Annotations No More](https://addons.mozilla.org/firefox/addon/youtubes-annotations-no-more/)

### Settings

All settings are applied in `about:config`.

Disable location sharing:

    geo.enabled = false

Disable WebRTC/PeerConnection:

    media.peerconnection.enabled = false

Disable Pocket:

    extensions.pocket.enabled = false

Disable trimming of URLs:

    browser.urlbar.trimURLs = false

Disable popup asking to allow notifications:

    dom.webnotifications.enabled = false

Disable `Enable DRM`-bar:

    browser.eme.ui.enabled = false

#### Firefox on NVIDIA *and* GNOME *and* X11

[Mozilla Bug #1558065](https://bugzilla.mozilla.org/show_bug.cgi?id=1558065#c2)

    layers.acceleration.force-enabled = true
    gfx.webrender.all = true

#### Maybe Settings

Disable menu toggle on pressing the *Alt* key:

    ui.key.menuAccessKeyFocuses = false

Disable WebGL:

    webgl.disabled = true

Enable Resist fingerprinting mode:

    privacy.resistFingerprinting = true

Smaller title bar:

    browser.tabs.drawInTitlebar = true

Disable internal PDF viewer:

    pdfjs.disabled = true

If you don't want to store your history, then you might also want to
disable the cache:

    browser.cache.memory.enable = false
    browser.cache.disk.enable = false
    browser.cache.offline.enable = false

Don't use internal DNS cache, i.e., only use OS cache:

    network.dnsCacheEntries = 0
    network.dnsCacheExpiration = 0
    network.dnsCacheExpirationGracePeriod = 0

Prevent last window from closing the browser (useful for macOS full screen):

    browser.tabs.closeWindowWithLastTab = false

Load new URLs in background:

    browser.tabs.loadDivertedInBackground = true

Disable autoplay of videos:

    media.autoplay.enabled = false
