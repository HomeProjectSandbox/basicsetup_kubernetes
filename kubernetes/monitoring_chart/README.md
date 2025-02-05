```
helm repo add grafana https://grafana.github.io/helm-charts
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update 

helm search repo prometheus-community
helm show values prometheus-community/prometheus
...

helm create monitoring

`helm install <release-name> . --namespace <namespace> --create-namespace`  
`helm install monitor . --namespace monitoring --create-namespace`  
```