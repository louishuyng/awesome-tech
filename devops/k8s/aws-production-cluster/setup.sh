#!/bin/bash

# Create Group
aws iam create-group --group-name kops

# Create Policies
aws iam attach-group-policy \
    --policy-arn arn:aws:iam::aws:policy/AmazonEC2FullAccess \
    --group-name kops

aws iam attach-group-policy \
    --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess \
    --group-name kops

aws iam attach-group-policy \
    --policy-arn arn:aws:iam::aws:policy/AmazonVPCFullAccess \
    --group-name kops

aws iam attach-group-policy \
    --policy-arn arn:aws:iam::aws:policy/IAMFullAccess \
    --group-name kop

# Create User
aws iam create-user \
    --user-name louis

aws iam add-user-to-group \
    --user-name louis \
    --group-name kops

# Generate access key
aws iam create-access-key \
    --user-name kops > kops-cred

export AWS_ACCESS_KEY_ID=$( cat kops-creds | jq -r  '.AccessKey.AccessKeyId')
export AWS_SECRET_ACCESS_KEY=$(cat kops-creds | jq -r  '.AccessKey.SecretAccessKey')

# Setup Availability Zones
export ZONES=$(aws ec2 \
    describe-availability-zones \
    --region $AWS_DEFAULT_REGION \
    | jq -r \
    '.AvailabilityZones[].ZoneName' \
    | tr '\n' ',' | tr -d ' ')

# ZONES=us-east-2a,us-east-2b,us-east-2c
ZONES=${ZONES%?}

echo $ZONE

# Creating SSH Keys
mkdir -p cluster

aws ec2 create-key-pair \
    --key-name devops23 \
    | jq -r '.KeyMaterial' \
    >devops23.pem

chmod 400 devops23.pem

ssh-keygen -y -f devops23.pem > devops23.pu
