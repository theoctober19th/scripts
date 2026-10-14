#!/bin/bash

set -x

./microceph.sh

juju deploy s3-integrator --channel 2/edge s3

SECRET_URI=$(juju add-secret s3creds access-key=$S3_ACCESS_KEY secret-key=$S3_SECRET_KEY)
juju grant-secret s3creds s3

juju config s3 endpoint=$S3_SERVER_URL bucket=$S3_BUCKET credentials=$SECRET_URI path=$S3_PATH
echo "S3 integrator configured with the S3 provider."