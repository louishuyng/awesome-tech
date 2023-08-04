## Enable Metrics Server

### Minikube

```bash
minikube addons enable metrics-server
```

### Others

```bash
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
```

## Watch Metrics

### For Node

```bash
kubectl top node
```

### For Pod

```bash
kubectl top pod
```
