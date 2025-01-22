#!/bin/bash

### token => --token
kubeadm token list | awk '{print $1}' | sed -n 2p

### token-ca-cert-hash => --discovery-token-ca-cert-hash
echo -n sha256: && openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | openssl dgst -sha256 -hex | sed 's/^.* //'
