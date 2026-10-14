#!/bin/bash

set -x 
sudo snap install microk8s --channel=1.34-strict/stable
sudo snap alias microk8s.kubectl kubectl
sudo usermod -a -G snap_microk8s $(logname)
mkdir -p /home/$(logname)/.kube
sudo microk8s config > /home/$(logname)/.kube/config
sudo chown -f -R $(logname) /home/$(logname)/.kube

sudo microk8s enable rbac
sudo microk8s enable storage hostpath-storage
sudo microk8s enable metallb:10.99.99.0-10.99.99.100
sudo microk8s status --wait-ready

echo "MicroK8s installation and setup complete. Logging out now, log back in to apply group changes."
