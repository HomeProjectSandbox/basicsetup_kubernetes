# Install argocd

setup:
https://medium.com/@wadexu007/mastering-argocd-installation-github-integration-and-rbac-configuration-for-seamless-continuous-627674c3d747


testing:
```
export KUBECONFIG=<path>    #/dummy/dummy/new-config.yaml
kind create cluster

```


```
helm repo add argo https://argoproj.github.io/argo-helm


kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```


but declarativ setup:
https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/


```
#after port forward the corresponding service
#username: admin
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo

#login with argocd cli:
argocd login localhost:8080 --username admin

#to change pw
argocd account update-password
```


## Github Integration
create token: what can check kubernetes chart repo and config repo
resource owner is org
expiration -> 366 day (cen be regenerated on github)


read only permissions

access only selected repos:
https://github.com/HomeProjectSandbox/basicsetup_kubernetes_config
https://github.com/HomeProjectSandbox/basicsetup_kubernetes



after that we can create secrets:
```
apiVersion: v1
kind: Secret
metadata:
  name: private-repo-chart
  namespace: argocd
  labels:
    argocd.argoproj.io/secret-type: repository
stringData:
  type: git
  url: <your github url>
  password: <your token>
  username: <your github user>
  project: my-project

...
# other secrets
```


```
k port-forward -n argocd svc/myargo-argocd-server 8080:80

```