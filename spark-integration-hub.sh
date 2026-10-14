#!/bin/bash

set -x

./s3-integrator.sh

juju deploy spark-integration-hub-k8s --channel 3/edge hub --trust
sleep 5
juju integrate s3 hub
echo "Spark Integration Hub deployed and integrated with S3."