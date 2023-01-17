#!/bin/bash

export BUCKET_NAME=devops23-$(date +%s)

aws s3api create-bucket \
    --bucket $BUCKET_NAME \
    --create-bucket-configuration \
    LocationConstraint=$AWS_DEFAULT_REGION

# Kops will use it to know where we store the state.
export KOPS_STATE_STORE=s3://$BUCKET_NAME
