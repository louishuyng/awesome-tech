## Setup
```bash
./setup.sh
```

## Checking Ingress is Running or not
```bash
./check.sh
```

## Demo
```bash
kubectl apply -f deployment.yml
kubectl apply -f demo-ingress.yml

# Wait a few second to all the pods ready

nohup kubectl port-forward -n ingress-nginx service/ingress-nginx-controller 5005:80 --address 0.0.0.0 > /dev/null 2>&1 &

curl -i "http://0.0.0.0:5005/demo/hello"
```
