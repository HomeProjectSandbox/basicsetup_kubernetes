#Testing kube-prometheus-stack

first (setup kubeconfig and kubectl!!!)

[ref](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack)  
kube-prometheus-stack will install additional dep charts (prometheus + grafana)

Installation:  (`make install`)
```
#get helm repos
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm repo update
```

install
```
helm install [RELEASE_NAME] prometheus-community/kube-prometheus-stack
```

uninstall:
```
helm uninstall [RELEASE_NAME]
```

```
helm repo add grafana https://grafana.github.io/helm-charts
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update 

helm search repo prometheus-community
helm show values prometheus-community/kube-prometheus-stack
...

helm create monitoring

`helm install <release-name> . --namespace <namespace> --create-namespace`  
`helm install monitor . --namespace monitoring --create-namespace`  
```

testing:
```
kubectl port-forward svc/monitor-kube-prometheus-st-prometheus 9090:9090 -n monitoring

k port-forward svc/monitor-grafana 3000:80 -n monitoring

# to get username and pv: 
k get secrets -n monitoring monitor-grafana -o yaml

```

konfigure service monitor: https://www.stackgenie.io/service-monitoring-using-prometheus-with-kube-prometheus-stack/