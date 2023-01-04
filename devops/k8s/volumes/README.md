## Create cluster with volume prometheus conf
```bash
k3d cluster create dev --volume "prometheus-conf.yml:/files/prometheus-conf.yml"
```

## Running Prometheus
```bash
kubectl create -f prometheus.yml
kubectl rollout status deploy prometheus

kubectl port-forward service/prometheus --address 0.0.0.0 5005:9090
```
