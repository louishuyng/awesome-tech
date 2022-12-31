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
kubectl describe -f db.yml
```

## Exec Container inside pod

```bash
kubectl exec -it db -- sh
```

## Watch Log Db

```bash
kubectl logs -f db
```

## Delete Log

```bash
kubectl delete pod db
kubectl delete -f db.yml
```
