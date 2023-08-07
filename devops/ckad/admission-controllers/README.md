## View enabled admission controllers in cluster

```bash
kube-apiserver -h | grep --enable-admission-plugins
```

## View enabled admission controllers in kudeadm setup

```bash
kubectl exec kube-apiserver-controlplane -n kube-system -- kube-apiserver -h | grep --enable-admission-plugins
```

## Enable Admission Controllers

Admission controllers can be enabled by adding them to the `--enable-admission-plugins` flag in the kube-apiserver manifest file.

## Disable Admission Controllers

Admission controllers can be disabled by removing them from the `--enable-admission-plugins` flag in the kube-apiserver manifest file.

or by adding them to the `--disable-admission-plugins` flag in the kube-apiserver manifest file.
