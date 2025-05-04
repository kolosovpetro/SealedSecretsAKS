helm repo add sealed-secrets https://bitnami-labs.github.io/sealed-secrets
helm repo update

helm install sealed-secrets-controller sealed-secrets/sealed-secrets `
    --namespace kube-system `
    --create-namespace

# verify installation

kubectl get pods -n kube-system -l app.kubernetes.io/name=sealed-secrets

# Get public key

kubeseal --fetch-cert --controller-name=sealed-secrets-controller --controller-namespace=kube-system `
| Out-File -FilePath .\pub-cert.pem -Encoding ascii

# Seal the secret

Get-Content .\secret.yaml | kubeseal --cert pub-cert.pem --format yaml | Out-File -FilePath .\sealed-secret.yaml -Encoding ascii

# Deploy sealed secret

kubectl apply -f sealed-secret.yaml

# Validate secret

kubectl get secret mysecret -o yaml
