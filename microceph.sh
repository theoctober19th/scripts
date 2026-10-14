#!/bin/bash

set -x

sudo snap install microceph
sudo microceph cluster bootstrap
sudo microceph disk add loop,1G,3
sudo microceph enable rgw
sudo microceph.radosgw-admin user create \
    --uid test --display-name test \
    --access-key=foo --secret-key=bar

IP=$(ip -4 -j route get 2.2.2.2 | jq -r '.[] | .prefsrc')
export S3_SERVER_URL=http://$IP
export S3_ACCESS_KEY=foo
export S3_SECRET_KEY=bar
export S3_BUCKET="spark-tutorial"
export S3_CA_BUNDLE_PATH=""
export S3_PATH="spark-events"

echo "S3_SERVER_URL: $S3_SERVER_URL"
echo "S3_ACCESS_KEY: $S3_ACCESS_KEY"
echo "S3_SECRET_KEY: $S3_SECRET_KEY"
echo "S3_BUCKET: $S3_BUCKET"
echo "S3_CA_BUNDLE_PATH: $S3_CA_BUNDLE_PATH"
echo "S3_PATH: $S3_PATH"
