# Datasticks:  The Lightweight, Open Source Alternative for Advanced Analytics and Machine Learning
![Datasticks Logo](https://s3-us-west-2.amazonaws.com/advancedspark.com/img/datasticks-logo.png)

## Download Docker for Mac or Windows
```
https://www.docker.com/products/docker
```

## Setup Kubernetes Cluster on Google, AWS, Azure, or On-Premise

## Start and Shell into Docker Container with Kubernetes CLI Installed
* **KUBERNETES_SERVER**:  Host/IP of Kubernetes Cluster
* **KUBERNETES_USERNAME**:  Admin Username of Kubernetes Cluster
* **KUBERNETES_PASSWORD**:  Admin Password of Kubernetes Cluster
* **KUBERNETES_NAMESPACE**:  Your Unique Namespace ID (ie. your username)
```
docker run -it --name=kubernetes --privileged --net=host -e KUBERNETES_SERVER=<KUBERNETES_SERVER> -e KUBERNETES_USERNAME=admin -e KUBERNETES_PASSWORD=<KUBERNETES_PASSWORD> -e KUBERNETES_NAMESPACE=<KUBERNETES_NAMESPACE> fluxcapacitor/kubernetes bash
```

## Set User-Specific Context and Namespace
```
kubectl config set-credentials user --username=$KUBERNETES_USERNAME --password=$KUBERNETES_PASSWORD

kubectl config set-cluster cluster --insecure-skip-tls-verify=true --server=https://$KUBERNETES_SERVER

kubectl create namespace $KUBERNETES_NAMESPACE

kubectl config set-context $KUBERNETES_NAMESPACE --user=user --namespace=$KUBERNETES_NAMESPACE --cluster=cluster

kubectl config use-context $KUBERNETES_NAMESPACE

kubectl config current-context
```

## Explore Kubernetes Cluster
```
kubectl get nodes

kubectl cluster-info

kubectl get pod

kubectl get svc
```

## Explore Kubernetes Dashboard
```
https://<KUBERNETES-CLUSTER-IP>/api/v1/proxy/namespaces/kube-system/services/kubernetes-dashboard/#/workload
```

## Deploy Spark Master (ReplicationController + Pod)
* Create Spark Master
```
git clone https://github.com/fluxcapacitor/master.ml.git
```
```
kubectl create -f master.ml/spark/2.0.1/master-spark-rc.yaml
```

* Verify Spark Master
```
kubectl get rc

kubectl get pod
```

* Check Logs of Spark Master
```
kubectl describe pod <POD-NAME>

kubectl logs -f <POD-NAME>
```

## Deploy Spark Master (LoadBalancer + Service)
```
kubectl create -f master.ml/spark/2.0.1/master-spark-svc.yaml
```
```
kubectl get svc -w
```

## Verify Spark Master through Browser
```
http://<SPARK-MASTER-EXTERNAL-IP>:6060
```

## Bash into Spark Master Docker Container
`<pod-name>` is the pod name extension (use `kubectl get pod` to get the full name)
```
kubectl exec master-spark-<pod-name> -it -- bash -il
```

## Deploy Spark Worker (ReplicationController + Pod)
* Clone the latest `worker.ml` repo
```
git clone https://github.com/fluxcapacitor/worker.ml.git
```

* Create Spark Worker
```
kubectl create -f worker.ml/spark/2.0.1/worker-spark-rc.yaml
```

* Verify Spark Worker
```
kubectl get rc

kubectl get pod
```

* Check Spark Worker Logs
```
kubectl describe pod <POD-NAME>

kubectl logs -f <POD-NAME>
```

## Scale Spark Worker through Command Line
```
kubectl scale --replicas=4 rc worker-spark-2-0-1
```

## Scale Spark Worker through Kubernetes Dashboard
```
https://<KUBERNETES-CLUSTER-IP>/api/v1/proxy/namespaces/kube-system/services/kubernetes-dashboard/#/workload
```

## Auto-scale Spark Worker using CPU
```
kubectl autoscale rc worker-spark-2-0-1 --max=4 --cpu-percent=25
```

## Perform Rolling Update of Spark Worker (ie. Larger Worker Memory)
* Perform the Rolling Update
```
kubectl rolling-update worker-spark-2-0-1 -f worker.ml/spark/2.0.1/worker-spark-rc-8.yaml
```

## Deploy Zeppelin (ReplicationController + Pod)
```
git clone https://github.com/fluxcapacitor/zeppelin.ml.git
```
```
kubectl create -f zeppelin.ml/zeppelin-rc.yaml
```

* Verify Zeppelin
```
kubectl get rc

kubectl get pod
```

* Check Logs of Zeppelin
```
kubectl logs -f <POD-NAME>

kubectl describe <POD-NAME>
```

## Deploy Zeppelin (LoadBalancer + Service)
```
kubectl create -f zeppelin.ml/zeppelin-svc.yaml
```
```
kubectl get svc -w
```

## Verify Zeppelin Notebook
* Navigate Browser...
```
http://<ZEPPELIN-EXTERNAL-IP>:8080
```

* Change Interpreter's Spark Master URL (Upper right, Drop-down, Interpreter)
```
Change value to spark://<SPARK-MASTER-EXTERNAL-IP>:7077
```

* Run Example Notebooks!

## Deploy JupyterHub (ReplicationController + Pod)
```
git clone https://github.com/fluxcapacitor/jupyterhub.ml.git
```
```
kubectl create -f jupyterhub.ml/jupyterhub-rc.yaml
```

* Verify JupyterHub
```
kubectl get rc

kubectl get pod
```

* Check Logs of JupyterHub
```
kubectl logs -f <POD-NAME>

kubectl describe <POD-NAME>
```

## Deploy JupyterHub (LoadBalancer + Service)
```
kubectl create -f jupyterhub.ml/jupyterhub-svc.yaml
```
```
kubectl get svc -w
```

## Verify JupterHub Notebook
* Navigate Browser...
```
http://<JUPYTERHUB-EXTERNAL-IP>:8754
```

* Run Example Notebooks!
