## Create Taints a Node

```bash
kubectl taint nodes <node-name> <key>=<value>:<taint-effect>
```

### Example

```bash
kubectl taint nodes node1 app=blue:NoSchedule
```

## Types of taint-effect

- `NoSchedule` / which means the pods will not be scheduled on the node,
- `PreferNoSchedule` / which means the system will try to avoid placing a pod on the node, but that is not guaranteed.
- `NoExecute` / which means that new pods will not be scheduled on the node and existing pods on the node, if any, will be evicted if they do not tolerate the taint.

## Remove Taints from a Node

```bash
kubectl taint nodes <node-name> <key>-
```

### Example

```bash
kubectl taint nodes node1 app-
```
