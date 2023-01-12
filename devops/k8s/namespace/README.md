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

## Create New Namespace
```bash
kubectl create ns testing

kubectl config set-context testing \
  --namespace testing \
  --cluster k3d-test \
  --user admin@k3d-test

kubectl config view
```

## Context Switch
```bash
kubectl config use-context testing
```

## Communicate between namespace
> DNS Entry Format: <service-name>.<namespace-name>.svc.cluster.local
```bash
kubectl exec -it test -- apk add -U curl

kubectl exec -it test -- curl \
    "http://go-demo-2-api.testing:8080/demo/hello
```

## Delete namespace
> we delete the testing Namespace, all the objects and the resources running inside it will be removed as well. (cascading effect)
```bash
kubectl delete ns testing
```
