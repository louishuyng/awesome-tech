## Check Access

```bash
kubectl auth can-i create pods --namespace=production
```

## Impersonate User

```bash
kubectl auth can-i create pods --namespace=production --as dev-user
```
