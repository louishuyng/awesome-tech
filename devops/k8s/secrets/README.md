## Description
Secrets are almost the same as ConfigMaps. The main difference is that the secret files are created in tmpfs. Kubernetes secrets do not make your system secure. They are only a step towards such a system.

## Create Secret Type Generic
```bash
kubectl create secret \
    generic my-creds \
    --from-literal=username=jdoe \
    --from-literal=password=incognit

kubectl get secret my-creds -o json
```

## Decode the value
```bash
kubectl get secret my-creds \
    -o jsonpath="{.data.username}" \
    | base64 --decode
```

## Apply jenkins yml with secret created before
```bash
kubectl apply -f jenkins.yml

POD_NAME=$(kubectl get pods \
    -l service=jenkins,type=master \
    -o jsonpath="{.items[*].metadata.name}")

kubectl exec -it $POD_NAME -- ls /etc/secrets

kubectl exec -it $POD_NAME -- cat /etc/secrets/jenkins-user
```
