install:
	helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
	helm repo update

install_mychart:
	cd monitoringPrometheusStack && helm dependency update
	cd monitoringPrometheusStack && helm dependency build
	cd monitoringPrometheusStack && helm install monitor . --namespace monitoring --create-namespace

uninstall_mychart:
	cd monitoringPrometheusStack && helm uninstall monitor -n monitoring