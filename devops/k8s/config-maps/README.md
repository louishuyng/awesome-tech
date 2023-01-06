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
