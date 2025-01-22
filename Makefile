SHELL=sh
KUBECTL=kubectl



all: plugin-install

# Environment
#===============================================================
.PHONY: plugin-install
plugin-install: ## Install asdf plugins
	@$(SHELL) ./utils/scripts/plugin.sh



# Kubernetes
#===============================================================
.PHONY: get-all-resource
get-all-resource:
	$(KUBECTL) get "$(kubectl api-resources --namespaced=true --verbs=list -o name | tr "\n" "," | sed -e 's/,$//')"



# Makefile config
#===============================================================
help: ## Display this help screen
	echo "Usage: make [task]\n\nTasks:"
	perl -nle 'printf("    \033[33m%-30s\033[0m %s\n",$$1,$$2) if /^([a-zA-Z0-9_\/-]*?):(?:.+?## )?(.*?)$$/' $(MAKEFILE_LIST)

.SILENT: help

.PHONY: $(shell egrep -o '^(\._)?[a-z_-]+:' $(MAKEFILE_LIST) | sed 's/://')
