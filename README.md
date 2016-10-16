![Datasticks Logo](https://s3-us-west-2.amazonaws.com/advancedspark.com/img/datasticks-logo.png)

### The Lightweight, 100% Open Source Alternative for Streaming Analytics, ML, and AI

## Live Demo
* Click [here](http://datasticks.com) for a live, non-secure demo.  

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
git submodule update --recursive --remote
```

## Deploy to Kubernetes Cluster
```
./datasticks-up.sh
```

## Get Apache2 Host/IP
```
kubectl get svc -w
```

## Navigate Browser to Apache2 Host/IP 
```
http://<apache2-host-ip>
```

## Advanced Features and Demos
* [Real-time Topology](http://kuberentes.datasticks.com) of Live Kuberentes Cluster
* [Dynamic Scaling](https://github.com/fluxcapacitor/kubernetes.ml#kubernetes-fu) of Spark Workers
* [Rolling and Blue-Green Deployments](https://github.com/fluxcapacitor/kubernetes.ml#kubernetes-fu) with  Kubernetes
* [Continuous Deploy, Monitor, and Rollback](http://jupyter.datasticks.com) of New Spark ML and TensorFlow AI Models using a Jupyter Notebook
* [Continuous, Incremental Training]() of Spark ML and TensorFlow AI Models from a Kafka Stream using a Jupyter Notebook
* [Highly-scalable, Highly-available Model Serving](http://dashboard.datasticks.com) using Battle-tested NetflixOSS Components

## Support
* Email **help@fluxcapacitor.com** for Support!
