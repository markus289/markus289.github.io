#!/usr/bin/env bash

S3_BUCKET=websitestack-rootbucket582453e3-1wona2vvn6yna
CLOUDFRONT_DISTRIBUTION=E26S6WN5JFA0Y3

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

for p in aws bundle ; do
    if ! hash ${p} 2>/dev/null; then
        eerror "'${p}' not in \$PATH"
    fi
done

unset p

edo bundle config set --local deployment true
edo bundle install
edo bundle exec jekyll build
edo aws s3 sync --delete _site s3://${S3_BUCKET}
edo aws cloudfront create-invalidation --distribution-id ${CLOUDFRONT_DISTRIBUTION} --paths "/*"
