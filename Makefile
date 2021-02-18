.PHONY = all

S3_BUCKET=websitestack-rootbucket582453e3-1wona2vvn6yna
CLOUDFRONT_DISTRIBUTION=E26S6WN5JFA0Y3

all:
	bundle config set --local deployment true
	bundle install
	bundle exec jekyll build
	aws s3 sync --delete _site s3://${S3_BUCKET}
	aws cloudfront create-invalidation --distribution-id ${CLOUDFRONT_DISTRIBUTION} --paths "/*"
