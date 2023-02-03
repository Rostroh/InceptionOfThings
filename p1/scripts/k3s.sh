#!/bin/bash

KUBERNETES_VERSION="1.25.5-00"

echo "           -----install curl----"
apt install -qq curl -y

echo "            ----install k3s-----"
curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION=v1.19.5+k3s1 K3S_KUBECONFIG_MODE="644" sh -
#
echo "         ----install transport----"
#apt-get update && apt-get install -y apt-transport-https curl
#curl -s https://package.cloud.google.com/apt/doc/apt-key.gpg | apt-key -
sudo apt-get update && sudo apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
sudo apt-get update
sudo apt-get install -y kubelet #kubectkubeadm kubectl
#sudo apt-mark hold kubelet kubeadm kubectl

#apt install -y kubeadm="$KUBERNETES_VERSION"
echo "k3s installed"
