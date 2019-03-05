#!/usr/bin/env bash

REMOTE_HOST=host.markus9445.com
REMOTE_DIRECTORY=/var/www/markus9445.com

edo()
{
    CYAN='\033[0;36m'
    NC='\033[0m'
    echo -e " ${CYAN}*${NC} $@" 1>&2
    "$@" || exit 1
}

eerror()
{
    RED='\033[0;31m'
    NC='\033[0m'
    echo -e " ${RED}**ERROR**${NC} $@"
    exit 1
}

for p in bundle find rsync ssh ; do
    if ! hash ${p} 2>/dev/null; then
        eerror "'${p}' not in \$PATH"
    fi
done

unset p

edo bundle install --path vendor/bundle
edo bundle exec jekyll build
edo find _site -type d -exec chmod 755 {} \;
edo find _site -type f -exec chmod 644 {} \;
edo rsync -av --partial --progress --delete _site/ ${REMOTE_HOST}:${REMOTE_DIRECTORY}
edo ssh ${REMOTE_HOST} chmod -R go-rwx ${REMOTE_DIRECTORY}
edo ssh ${REMOTE_HOST} setfacl -Rm u:nginx:rX ${REMOTE_DIRECTORY}
