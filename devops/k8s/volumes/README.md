## Create cluster with volume prometheus conf
```bash
k3d cluster create dev --volume "prometheus-conf.yml:/files/prometheus-conf.yml"
```
