#!/bin/bash

KUBERNETES_VERSION="1.31"

### docker/compose
curl -sSL https://get.docker.com | sh
systemctl enable docker
usermod -aG docker $(whoami)
docker --version
systemctl status docker

### kubelet/kubectl/kubeadm
curl -fsSL https://pkgs.k8s.io/core:/stable:/v${KUBERNETES_VERSION}/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v${KUBERNETES_VERSION}/deb/ /" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update
sudo apt install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
kubelet --version
kubectl version
kubeadm version
systemctl enable kubelet
systemctl status kubelet
