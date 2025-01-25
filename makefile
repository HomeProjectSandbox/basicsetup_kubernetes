create_cluster:
	@bash -c ' \
	read -p "Did you change the KUBECONFIG default path? [Y/n]: " b; \
	if [ "$$b" = "n" ]; then \
		echo "Aborting..."; \
		exit 1; \
	elif [ "$$b" != "Y" ] && [ "$$b" != "y" ]; then \
		echo "Invalid input. Expected [Y/n]."; \
		exit 1; \
	fi; \
	echo "Continuing with KUBECONFIG changes...";'
	kind create cluster --config=kubernetes/kind/clusterconfig.yaml

delete_cluster:
	kind delete cluster --name app-1-cluster

install_app:
	helm install myapp kubernetes/webapp_chart/basicsetup_webapp_monitoring --namespace app --create-namespace

