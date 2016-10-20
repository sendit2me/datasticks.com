![Datasticks Logo](https://s3-us-west-2.amazonaws.com/advancedspark.com/img/datasticks-logo.png)

### The Lightweight, 100% Open Source Alternative for Streaming Analytics, ML, and AI

## Live Demo
* Click [here](http://datasticks.com) for a live demo.  

**Note:  Do not load any sensitive data into this environment!**

## Related Projects
* Click [here](https://github.com/fluxcapacitor/pipeline) for a related project used for workshops

## Setup Kubernetes Cluster
* Follow the instructions [here](https://github.com/fluxcapacitor/kubernetes.ml#setup-a-new-kubernetes-cluster).

## Setup Kubernetes Client CLI
* Follow the instructions [here](https://github.com/fluxcapacitor/kubernetes.ml#install-kubernetes-client).

## Clone this Repo including Submodules
```
git clone --recursive https://github.com/fluxcapacitor/datasticks.com
```

## Pull Latest Tips of Submodules
```
cd datasticks.com

git submodule update --recursive --remote && git pull --recurse-submodules
```

## Deploy Datasticks to Kubernetes Cluster
```
./datasticks-up.sh
```

## Get all Service Host/IPs
```
kubectl get svc -w
```

## (Optional) Setup Friendly CNAMEs in DNS Pointing to Service Host/IPs above
* ie. AWS Route53 REST API, GoDaddy API, etc

## Navigate Browser to Apache Host/IP from Above
```
http://<apache-host-ip>
```

## Advanced Features and Demos
### Real-time Topology View of Live Kuberentes Cluster
```
kubectl describe svc weavescope-app
```
```
https://<KUBERNETES-ADMIN-UI-WEAVESCOPE-HOST-IP>
```
* Note: You can manually scale Spark Workers through WeaveScope

### Manually Scale Spark Workers
```
kubectl scale --replicas=4 rc spark-worker-2-0-1
```

### `bash` into Live Docker Container
```
kubectl get pod
```
```
kubectl exec <pod-name> -it -- bash -il
```
* Note: You can manually `bash` into live Docker containers through WeaveScope


### Auto-scale Spark Workers based on CPU Utilization
```
kubectl autoscale rc spark-worker-2-0-1 --max=4 --cpu-percent=50
```

### Rolling Update of JupyterHub to Increase `spark.max.cores` and `spark.executor.memory`
```
kubectl rolling-update jupyterhub-master -f jupyterhub-rc-2cores-2gb.yaml
```

### Continuous Deploy, Monitor, and Rollback New Spark ML and TensorFlow AI Models 
```
TODO:  Link to jupyter notebook
```

### Continuous, Incremental Training of Spark ML and TensorFlow AI Models from Kafka
```
TODO:  Link to jupyter noteook
```

### Highly-scalable, Highly-available Model Serving using Battle-tested NetflixOSS Components
```
TODO:  Link to Hystrix/Turbine dashboard 
```

## Support
* Email **help@fluxcapacitor.com** for Support!
