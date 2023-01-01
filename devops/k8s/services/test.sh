#!/bin/bash

kubectl apply -f rs-only-db.yml
kubectl apply -f db-svc.yml

kubectl apply -f rs-only-api.yml
kubectl apply -f api-svc.yml

kubectl get all

nohup kubectl port-forward service/api-svc --address 0.0.0.0 8080:8080 > /dev/null 2>&1 &

# Please wait for a few seconds before executing the next command
# curl -i "http://localhost:8080/demo/hello"
