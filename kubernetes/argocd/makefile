install:
	helm repo add argo https://argoproj.github.io/argo-helm
	helm repo update

check:
	kubectl config view --minify

install_mychart:
	cd myargo && helm dependency update
	cd myargo && helm dependency build
	cd myargo && helm install myargo . --namespace argocd --create-namespace


uninstall_mychart:
	cd myargo && helm uninstall myargo -n argocd