## Create cluster with volume prometheus conf
```bash
k3d cluster create dev --volume "prometheus-conf.yml:/files/prometheus-conf.yml"
```

## Setup Prometheus
```bash
kubectl create -f prometheus.yml
kubectl rollout status deploy prometheus

kubectl port-forward service/prometheus --address 0.0.0.0 5005:9090
```

## Setup Jenkins
```bash
kubectl apply -f jenkins.yml
kubectl rollout status deploy jenkins

kubectl port-forward service/jenkins 5005:8080 --address 0.0.0.0```
