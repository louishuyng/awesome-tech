## Create Config Map
> Notes that from file could use for multiple file or folder
```bash
kubectl create cm my-config --from-file prometheus-conf.yml

# Example multiple file
kubectl create cm my-config \
  --from-file prometheus-conf.yml
  --from-file prometheus.yml

# Example folder
kubectl create cm my-config --from-file folder

kubectl create -f alpine.yml

kubectl exec -it alpine -- ls /etc/config
```

## Create Config Map Using Literals
```bash
kubectl create cm my-config \
    --from-literal=something=else \
    --from-literal=weather=sunny

kubectl exec -it alpine -- ls /etc/config/something
```

## Create Config Map From Env File
```bash
``kubectl create cm my-config \
    --from-env-file=my-env-file.yml

kubectl get cm my-config -o yam`
