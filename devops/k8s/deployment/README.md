## Create Deployment
```bash
kubectl apply -f db-demo.yml 
```

## Update Image Deployment
```bash
kubectl set image \
  -f db-demo.yml  \
  db=mongo:5 \
  -- record
```
