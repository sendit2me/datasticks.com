![Datasticks Logo](https://s3-us-west-2.amazonaws.com/advancedspark.com/img/datasticks-logo.png)

### The Lightweight, 100% Open Source Alternative for Advanced Analytics and Machine Learning

## Live Demo
* Click [here](http://datasticks.com) for a live, non-secure demo.  

**Note:  Do not load any sensitive data into this environment!**

## Setup Kubernetes Client
* Follow the instructions [here](https://github.com/fluxcapacitor/kubernetes.ml).

## Deploy Weave Scope 
```
git clone https://github.com/fluxcapacitor/dashboard.ml.git
```
```
kubectl create -f dashboard.ml/weavescope/weavescope.yaml
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

## Deploy Spark Worker (LoadBalancer + Service)
```
kubectl create -f worker.ml/spark/2.0.1/worker-spark-svc.yaml
```
```
kubectl get svc -w
```

## Verify Spark Worker through Browser
```
http://<SPARK-WORKER-EXTERNAL-IP>:6061
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
kubectl autoscale rc worker-spark-2-0-1 --max=4 --cpu-percent=1
```

## Verify Auto-scaling
```
spark-submit --class org.apache.spark.examples.SparkPi --master spark://spark.datasticks.com:7077 --num-executors 500 --executor-memory 2g --total-executor-cores 2 $SPARK_HOME/examples/jars/spark-examples*.jar 5000
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
http://<ZEPPELIN-EXTERNAL-IP>:3123
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

## Deploy Apache (ReplicationController + Pod)
```
git clone https://github.com/fluxcapacitor/apache.ml.git
```
```
kubectl create -f apache.ml/apache-rc.yaml
```

* Verify Apache
```
kubectl get rc

kubectl get pod
```

* Check Logs of Apache
```
kubectl logs -f <POD-NAME>

kubectl describe <POD-NAME>
```

## Deploy Apache (LoadBalancer + Service)
```
kubectl create -f apache.ml/apache-svc.yaml
```
```
kubectl get svc -w
```

## Verify JupterHub Notebook
* Navigate Browser...
```
http://<JUPYTERHUB-EXTERNAL-IP>:8754
```
