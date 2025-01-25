# bare-metal-kubernetes-playground

```shell
### ArgoCD 初期パスワード
$ kubectl -n argocd get secret/argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
```
