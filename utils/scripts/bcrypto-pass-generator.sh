#!/bin/bash -e

ARGOCD_ADMIN_PASS=

# https://github.com/argoproj/argo-helm/blob/07d63255ae19ff1e08a22e71c932f686f8f619ac/charts/argo-cd/values.yaml#L277
htpasswd -nbBC 10 "" ${ARGOCD_ADMIN_PASS} | tr -d ':\n' | sed 's/$2y/$2a/'
