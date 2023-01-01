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

## Create Zero Deployment
```bash
kubectl apply -f zero-down-time.yml 
```

## Demo Zero Deployment
#### Set image

```bash
kubectl set image -f zero-down-time.yml api=vfarcic/go-demo-2:2.0 --record
```

#### Check rollout status

```bash
kubectl rollout status -w -f zero-down-time.yml
```

#### Check events

```bash
kubectl describe -f zero-down-time.yml
```

#### View rollout history

```bash
kubectl rollout history -f zero-down-time.yml
```
