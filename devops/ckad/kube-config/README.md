By default `kubectl` look config file in ~/.kube/config

## View Config

```bash
kubectl config view
```

## View Config in Different Location

```bash
kubectl config view --kubeconfig=/path/to/config
```

## Change current context

```bash
kubectl config use-context test-user@production
```
