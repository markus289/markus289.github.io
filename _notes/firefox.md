---
layout: default
title: Firefox
---

# {{ page.title }}

## Add-ons

- [Autoplay No More](https://addons.mozilla.org/firefox/addon/autoplay-no-more/)
- [Google search link fix](https://addons.mozilla.org/firefox/addon/google-search-link-fix/)
- [HTTPS Everywhere](https://addons.mozilla.org/firefox/addon/https-everywhere/)
- [I don't care about cookies](https://addons.mozilla.org/firefox/addon/i-dont-care-about-cookies/)
- [MultiPass](https://addons.mozilla.org/firefox/addon/multipass/)
- [NoScript](https://addons.mozilla.org/firefox/addon/noscript/)
- [Pinboard Pin](https://addons.mozilla.org/firefox/addon/pinboard-pin/)
- [uBlock Origin](https://addons.mozilla.org/firefox/addon/ublock-origin/)
- [Vimium-FF](https://addons.mozilla.org/firefox/addon/vimium-ff/)
- [Youtube's Annotations No More](https://addons.mozilla.org/firefox/addon/youtubes-annotations-no-more/)

## Show all cookies

    chrome://browser/content/preferences/cookies.xul

## Settings

All settings are applied in `about:config`.

New Window opens the New Tab page:

    browser.startup.homepage = about:newtab

Disable location sharing:

    geo.enabled = false

Disable WebRTC/PeerConnection:

    media.peerconnection.enabled = false

Disable Pocket:

    extensions.pocket.enabled = false

Don't use internal DNS cache, i.e., only use OS cache:

    network.dnsCacheExpiration = 0
    network.dnsCacheExpirationGracePeriod = 0

Disable trimming of URLs:

    browser.urlbar.trimURLs = false

Disable popup asking to allow notifications:

    dom.webnotifications.enabled = false

Disable menu toggle on pressing the *Alt* key:

    ui.key.menuAccessKeyFocuses = false

Disable the delay for the *Ok* button from the download dialog:

    security.dialog_enable_delay = 0

### Maybe Settings

Disable internal PDF viewer:

    pdfjs.disabled = true

If you don't want to store your history, then you might also want to
disable the cache:

    browser.cache.memory.enable = false
    browser.cache.disk.enable = false
    browser.cache.offline.enable = false

Prevent last window from closing the browser (useful for macOS full screen):

    browser.tabs.closeWindowWithLastTab = false

Load new URLs in background:

    browser.tabs.loadDivertedInBackground = true

Disable autoplay of videos:

    media.autoplay.enabled = false

