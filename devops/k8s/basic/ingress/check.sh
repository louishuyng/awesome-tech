#!/bin/bash

kubectl get pods -n ingress-nginx | grep ingres


nohup kubectl port-forward -n ingress-nginx service/ingress-nginx-controller 5005:80 --address 0.0.0.0 > /dev/null 2>&1 &

curl -i "0.0.0.0:5005/healthz"
