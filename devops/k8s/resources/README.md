## Limits
A limit represents the amount of resources that a container should not pass. The assumption is that we define limits as upper boundaries which, when reached, indicate that something went wrong, as well as a way to guard our resources from being overtaken by a single rogue container due to memory leaks or similar problems.

If a container is restartable, Kubernetes will restart a container that exceeds its memory limit. Otherwise, it might terminate it. Bear in mind that a terminated container will be recreated if it belongs to a Pod (as all Kubernetes-controlled containers do).

Unlike memory, CPU limits never result in termination or restarts. Instead, a container will not be allowed to consume more than the CPU limit for an extended period.

## Requests
Requests represent the expected resource utilization. They are used by Kubernetes to decide where to place Pods depending on actual resource utilization of the nodes that form the cluster.

If a container exceeds its memory requests, the Pod it resides in might be evicted if a node runs out of memory. Such eviction usually results in the Pod being scheduled on a different node, as long as there is one with enough available memory.

If a Pod cannot be scheduled to any of the nodes due to lack of available resources, it enters the pending state waiting until resources on one of the nodes are freed, or a new node is added to the cluster.

## Query Metrics Server
```bash
kubectl --namespace kube-system  get pod # check that metrics-server is running
kubectl top pods # Simple query of metrics-server
```

## Define Resource Default and Limitations within a Namespace
```bash
kubectl create ns test

kubectl --namespace test create \
    -f limit-range.yml \
    --save-config --record

kubectl describe namespace test
```

## Resource Quotas
```bash
kubectl create ns dev

kubectl create \
    -f dev.yml \
    --record --save-config

kubectl --namespace dev describe \
    quota dev
```

## Types of Quotas

### 1. Compute resource quotas
> Compute resource quotas limit the total sum of the compute resources. They are as follows:

|Resource Name | Description |
|- | - |
| cpu | Across all pods in a non-terminal state, the sum of CPU requests cannot exceed this value.|
limits.cpu | Across all pods in a non-terminal state, the sum of CPU limits cannot exceed this value.|
limits.memory | Across all pods in a non-terminal state, the sum of memory limits cannot exceed this value.|
memory | Across all pods in a non-terminal state, the sum of memory requests cannot exceed this value.|
requests.cpu | Across all pods in a non-terminal state, the sum of CPU requests cannot exceed this value.|
requests.memory | Across all pods in a non-terminal state, the sum of memory requests cannot exceed this value.|

### 2. Storage resource quotas
> Storage resource quotas limit the total sum of the storage resources. We did not yet explore storage (beyond a few local examples) so you might want to keep the list that follows for future reference:

|Resource Name | Description|
| - | - |
|requests.storage | Across all persistent volume claims, the sum of storage requests cannot exceed this value.|
persistentvolumeclaims | The total number of persistent volume claims that can exist in the namespace.|
|[PREFIX]/requests.storage | Across all persistent volume claims associated with the storage-class-name, the sum of storage requests cannot exceed this value.|
|[PREFIX]/persistentvolumeclaims | Across all persistent volume claims associated with the storage-class-name, the total number of persistent volume claims that can exist in the namespace.|
|requests.ephemeral-storage | Across all pods in the namespace, the sum of local ephemeral storage requests cannot exceed this value.|
|limits.ephemeral-storage | Across all pods in the namespace, the sum of local ephemeral storage limits cannot exceed this value.|

📝 **Please note that [PREFIX] should be replaced with <storage-class-name>.storageclass.storage.k8s.io.**

### 3. Object count quotas
Object count quotas limit the number of objects of a given type. They are as follows:

|Resource Name | Description|
| - | - |
|configmaps | The total number of config maps that can exist in the namespace.|
|persistentvolumeclaims | The total number of persistent volume claims that can exist in the namespace.|
|pods | The total number of pods in a non-terminal state that can exist in the namespace. A pod is in a terminal state if status.phase in (Failed, Succeeded) is true.|
|replicationcontrollers | The total number of replication controllers that can exist in the namespace.|
|resourcequotas | The total number of resource quotas that can exist in the namespace.|
|services | The total number of services that can exist in the namespace.|
|services.loadbalancers | The total number of services of type load balancer that can exist in the namespace.|
|services.nodeports | The total number of services of type node port that can exist in the namespace.|
|secrets | The total number of secrets that can exist in the namespace.|
