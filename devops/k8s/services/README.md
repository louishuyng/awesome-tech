## Exposing a replica set resource
```bash
kubectl expost rs go-demo-2 \
  --name=go-demo-2-svc \
  --target-port=28017 \
  --type=NodePort
