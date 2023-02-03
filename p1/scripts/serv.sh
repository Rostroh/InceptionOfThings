#!/bin/bash
#
# Setup for Control Plane (Master) servers
echo "       ---- uwu ----"

sudo chmod 666  /etc/systemd/system/k3s.service
sed -i 's/server \\/server \\\n\t\t'--no-deploy=\ traefik' \\\n\t\t'--node-ip=192.168.56.110' \\/' /etc/systemd/system/k3s.service
#sed -i 's/server \\/server \\\n\t\t'--no-deploy= traefik' \\\n\t\t'--node-ip=192.168.94.9' \\\n\t\t'--node-external-ip=192.168.1.1' \\/' /etc/systemd/system/k3s.service

#sudo cat /etc/systemd/system/k3s.service.env
#sudo echo -e "\t\t'--node-ip=192.168.94.9'\\" >> /etc/systemd/system/k3s.service
#sudo echo -e "\n\t\t'--no-deploy= traefik' \\ \n\t\t'--node-ip=192.168.94.9'\\" >> /etc/systemd/system/k3s.service
sudo systemctl daemon-reload
sudo systemctl restart k3s.service
#kubectl patch rostrohS -p '{"spec":{"externalIPs":["192.168.0.194"]}}'
#set -euxo pipefail

#MASTER_IP="10.0.0.10"
#NODENAME=$(hostname -s)
#POD_CIDR="192.168.0.0/16"

#kubeadm config images pull

#echo "Preflight Check Passed: Downloaded All Required Images"

#kubeadm init --apiserver-advertise-address="10.0.0.10" --apiserver-cert-extra-sans="10.0.0.10" --pod-network-cidr="192.168.0.0/16" --ignore-preflight-errors Swap

#mkdir -p "$HOME"/.kube
#cp -i /etc/kubernetes/admin.conf "$HOME"/.kube/config
#chown "$(id -u)":"$(id -g)" "$HOME"/.kube/config
