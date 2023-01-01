#!/bin/bash
#
kubectl create -f full.yml

kubectl get -f full.yml

nohup kubectl port-forward service/go-demo-2-api --address 0.0.0.0  5005:8080 > /dev/null 2>&1 &

# Please wait for a few seconds before running the following command
# curl -i "0.0.0.0:5005/demo/hello
