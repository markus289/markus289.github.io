#!/usr/bin/env bash

edo()
{
    CYAN='\033[0;36m'
    NC='\033[0m'
    echo -e " ${CYAN}*${NC} $@" 1>&2
    "$@"
}

edo bundle install
edo bundle exec jekyll build
edo find _site -type d -exec chmod 755 {} \;
edo find _site -type f -exec chmod 644 {} \;
edo rsync -av --partial --progress --delete _site/ doxy.markus8191.de:/var/www/markus8191.de
