# Sealed Secrets in AKS

## Flow

- Install `kubeseal` CLI
- Install `sealed-secrets` HELM chart
- Create `secret.yaml` file (do not commit it)
- Fetch public key from AKS using `kubeseal --fetch-cert`
- Encrypt (seal) secret file by using `kubeseal` CLI
- Deploy `encrypted-secret.yaml` to AKS
- Safely commit `encrypted-secret.yaml` to repository

## Installation (Windows)

- https://community.chocolatey.org/packages/sealed-secrets#install
- choco install sealed-secrets -y


## Installation HELM

- helm repo add sealed-secrets https://bitnami-labs.github.io/sealed-secrets
- helm repo update
- helm install sealed-secrets-controller sealed-secrets/sealed-secrets --namespace kube-system --create-namespace
