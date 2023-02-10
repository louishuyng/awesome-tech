export AWS_DEFAULT_REGION=ap-southeast-1

export NAME=monitoring-demo

mkdir -p cluster

eksctl create cluster \
    -n $NAME \
    -r $AWS_DEFAULT_REGION \
    --kubeconfig cluster/kubecfg-eks \
    --node-type t2.small \
    --nodes-max 9 \
    --nodes-min 3 \
    --asg-access \
    --managed

export KUBECONFIG=$PWD/cluster/kubecfg-eks
