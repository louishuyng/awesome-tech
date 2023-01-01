#!/bin/bash

kubectl delete -f rs-only-db.yml
kubectl delete -f db-svc.yml

kubectl delete -f rs-only-api.yml
kubectl delete -f api-svc.yml
