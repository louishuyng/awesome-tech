#!/bin/bash
#
kops create cluster \
    --name $NAME \
    --master-count 3 \
    --node-count 1 \
    --node-size t2.small \
    --master-size t2.small \
    --zones $ZONES \
    --master-zones $ZONES \
    --ssh-public-key devops23.pub \
    --networking kubenet \
    --kubernetes-version v1.14.8 \
    --yes

sleep 10000

kops get cluster

kubectl cluster-info

kops validate cluster
