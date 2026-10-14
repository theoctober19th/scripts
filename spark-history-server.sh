#!/bin/bash

set -x

./s3-integrator.sh

juju deploy spark-history-server-k8s --channel 3/edge hserver --trust
sleep 5
juju integrate s3 hserver
echo "Spark History Server deployed and integrated with S3."