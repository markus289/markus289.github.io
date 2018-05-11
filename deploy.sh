#!/usr/bin/env bash

edo()
{
    CYAN='\033[0;36m'
    NC='\033[0m'
    echo -e " ${CYAN}*${NC} $@" 1>&2
    "$@"
}

eerror()
{
    RED='\033[0;31m'
    NC='\033[0m'
    echo -e " ${RED}**ERROR**${NC} $@"
    exit 1
}

[[ -x $(which bundle) ]] || eerror "'bundle' not in \$PATH"
edo bundle install || eerror "'bundle install' failed"
edo bundle exec jekyll build || eerror "'jekyll build' failed"
edo find _site -type d -exec chmod 755 {} \; || eerror "chmod directories failed"
edo find _site -type f -exec chmod 644 {} \; || eerror "chmod files failed"
[[ -x $(which rsync) ]] || eerorr "'rsync' not in \$PATH"
edo rsync -av --partial --progress --delete _site/ doxy.markus8191.de:/var/www/markus8191.de || eerror "rsync failed"
