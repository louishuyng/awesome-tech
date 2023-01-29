## Diagram
### Core Components
![image](./core-components-of-cluster.png)

### Update
![image](./update-cluster.png)
> The kops update command applies all the changes to the cluster at once. That can result in downtime.

> The kops rolling-update command intends to apply the changes without downtime. 
It would apply them to one server at the time so that most of the servers are always running. In parallel, Kubernetes would be rescheduling the Pods that were running on the servers that were brought down.


### Update Process
![image](./update-process.png) 
1. Kops retrieved the desired state from the S3 bucket.
2. Kops sent requests to AWS API to change the values of the workers ASG.
3. AWS modified the values of the workers ASG by increasing them by 1.
4. ASG created a new EC2 instance to comply with the new sizing.
5. Protokube installed Kubelet and Docker and created the manifest file with the list of Pods.
6. Kubelet read the manifest file and run the container that forms the kube-proxy Pod (the only Pod on the worker nodes).
7. Kubelet sent a request to the kube-apiserver (through the dns-controller) to register the new node and join it to the cluster. The information about the new node is stored in etcd.s.png)

### Accessing the Cluster
![image](./load-balance-behind-k8s-api-server.svg)

#### Create ingress nginx load balancer for workers
```bash
kubectl create \
          -f https://raw.githubusercontent.com/kubernetes/kops/master/addons/ingress-nginx/v1.6.0.yaml

CLUSTER_DNS=$(aws elb \
    describe-load-balancers | jq -r \
    ".LoadBalancerDescriptions[] \
    | select(.DNSName \
    | contains (\"api-devops23\") \
    | not).DNSName")
# Send request from client
curl -i "http://$CLUSTER_DNS/demo/hello"
```

![image](./load-balance-workers.svg)
