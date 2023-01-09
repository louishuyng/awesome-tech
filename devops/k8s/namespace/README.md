## Get All Namespace
```bash
kubectl get ns
```

## Get public Namespace
> The primary reason for kube-public's existence is to provide space where we can create objects that should be visible throughout the whole cluster.
```bash

kubectl --namespace kube-public get all
```

## Get System Namespace
> Almost all the objects and resources Kubernetes needs are running inside kube-system Namespace.

```bash
kubectl --namespace kube-system get all
```
