#!/bin/bash

set -x

sudo snap install juju --channel 3.6/stable
mkdir -p /home/$(logname)/.local/share/juju
sudo chown -f -R $(logname) /home/$(logname)/.local/share/juju

juju bootstrap microk8s k8s
juju add-model $(logname)

sudo snap install terraform --classic
sudo snap install charmcraft --classic
sudo apt install tox -y
sudo snap install yq

sudo snap install jhack
sudo snap connect jhack:dot-local-share-juju snapd

echo "Juju installation and setup complete."