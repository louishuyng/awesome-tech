helm repo add bitnami https://charts.bitnami.com/bitnami

helm repo update

kubectl create namespace metrics

helm install metrics-server \
    stable/metrics-server \
    --version 2.0.2 \
    --namespace metrics
    --set args={"--kubelet-insecure-tls=true"}

kubectl -n metrics \
    rollout status \
    deployment metrics-server
