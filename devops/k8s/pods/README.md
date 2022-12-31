## Create DB Pod
```bash
kubectl create -f db.yml
```

## Get Pod With more information

```bash
kubectl get pods -o wide
```

## Get Pod With more information JSON

```bash
kubectl get pods -o json
```

## Get Pod With more information YAML

```bash
kubectl get pods -o yaml
```

## Describe Pod And Check Events

```bash
kubectl describe pod db
```
