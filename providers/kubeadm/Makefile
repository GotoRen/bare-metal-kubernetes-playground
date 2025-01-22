KUBEADM=kubeadm
KUBECTL=kubectl
JOURNALCTL=journalctl



reset: ## WARNING: kubeadm cluster reset
	sudo ${KUBEADM} reset

kubeconfig-print-default: ## kubeconfig default manifests
	${KUBEADM} config print init-defaults

show-context: ## show context
	${KUBECTL} config get-contexts

show-cluster: ## show cluster
	${KUBECTL} config get-clusters

listen: ## show the listening port
	sudo lsof -i -P

show-containerd-ps: ## show containerd ps
	sudo crictl --runtime-endpoint unix:///var/run/containerd/containerd.sock ps -a

logs: ## show kubelet logs
	journalctl -xe | grep kubelet

show-etcd-version: ## show etcd version
	etcdctl --version

show-containerd-version: ## show containerd version
	${KUBECTL} get nodes -o wide --no-headers | awk '{print $1,$12}' | sed -e "s/containerd:\/\///g"

show-kube-manifest: ## show kubeadm kubeconfig manifests
	find /etc/kubernetes/manifests -type f -print0 | xargs -0 more | cat



# Makefile config
#===============================================================
help: ## Display this help screen
	echo "Usage: make [task]\n\nTasks:"
	perl -nle 'printf("    \033[33m%-30s\033[0m %s\n",$$1,$$2) if /^([a-zA-Z0-9_\/-]*?):(?:.+?## )?(.*?)$$/' $(MAKEFILE_LIST)

.SILENT: help

.PHONY: $(shell egrep -o '^(\._)?[a-z_-]+:' $(MAKEFILE_LIST) | sed 's/://')
