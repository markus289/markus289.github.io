#!/usr/bin/env bash

REMOTE_HOST=FIXME
REMOTE_DIRECTORY=/var/www/fixme

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

edo bundle config set --local path vendor/bundle
edo bundle install
edo bundle exec jekyll build
edo find _site -type d -exec chmod 755 {} \;
edo find _site -type f -exec chmod 644 {} \;

if [ ${HOSTNAME} = $(echo ${REMOTE_HOST}|cut -d '.' -f 1) ]; then
    edo rsync -av --partial --progress --delete _site/ ${REMOTE_DIRECTORY}
    edo chmod -R go-rwx ${REMOTE_DIRECTORY}
    edo setfacl -Rm u:nginx:rX ${REMOTE_DIRECTORY}
else
    edo rsync -av --partial --progress --delete _site/ ${REMOTE_HOST}:${REMOTE_DIRECTORY}
    edo ssh ${REMOTE_HOST} chmod -R go-rwx ${REMOTE_DIRECTORY}
    edo ssh ${REMOTE_HOST} setfacl -Rm u:nginx:rX ${REMOTE_DIRECTORY}
fi
