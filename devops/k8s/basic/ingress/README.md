## Diagram
![image](./ingress-create-sequence-diagram.png)
![image](./ingress-demo-flow-diagram.png)

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
kubectl apply -f devops-toolkit-ingress.yml
kubectl apply -f default-ingress.yml

# Wait a few second to all the pods ready
nohup kubectl port-forward -n ingress-nginx service/ingress-nginx-controller 5005:80 --address 0.0.0.0 > /dev/null 2>&1 &

curl -i "http://0.0.0.0:5005/demo/hello" # Go to api service
curl -I -H "Host: devopstoolkitseries.com" "http://0.0.0.0:5005" # Go to devops-toolkit service
curl -I  "http://0.0.0.0:5005/something" # Default go to devops-toolkit service
