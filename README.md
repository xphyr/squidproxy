# Simple Squid proxy setup for OpenShift Deployment

## Target deployments based on taints

```
oc adm taint nodes <node1> site-name=site1:NoExecute
oc adm taint nodes <node2> site-name=site2:NoExecute
```
