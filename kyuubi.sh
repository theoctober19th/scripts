#!/bin/bash

set -x

./s3-integrator.sh
./spark-integration-hub.sh

juju deploy kyuubi-k8s --channel 3.5/edge kyuubi --trust
sleep 5
juju integrate kyuubi:spark-service-account hub

echo "Kyuubi deployed and integrated with Integration Hub."