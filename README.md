![Datasticks Logo](https://s3-us-west-2.amazonaws.com/advancedspark.com/img/datasticks-logo.png)

### The Lightweight, 100% Open Source Alternative for Streaming Analytics, ML, and AI

## Live Demo
* Click [here](http://datasticks.com) for a live, non-secure demo.  

**Note:  Do not load any sensitive data into this environment!**

## Setup Kubernetes Client
* Follow the instructions [here](https://github.com/fluxcapacitor/kubernetes.ml).

## Kuberentes Admin
### Deploy Kubernetes Admin UI (Weave Scope)
```
kubectl create -f dashboard.ml/weavescope/weavescope.yaml
```
* Find the LoadBalancer Host/IP
```
kubectl describe svc weavescope-app
```
## Spark Master
### Deploy Spark Master (ReplicationController + Pod)
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

### Deploy Spark Master (LoadBalancer + Service)
```
kubectl create -f master.ml/spark/2.0.1/master-spark-svc.yaml
```
```
kubectl get svc -w
```
* Find the LoadBalancer Host/IP
```
kubectl describe svc master-spark
```

### Verify Spark Master through Browser
```
http://<SPARK-MASTER-EXTERNAL-IP>:6060
```

### Bash into Spark Master Docker Container
`<pod-name>` is the pod name extension (use `kubectl get pod` to get the full name)
```
kubectl exec master-spark-<pod-name> -it -- bash -il
```

## Spark Worker
### Deploy Spark Worker (ReplicationController + Pod)
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

### Deploy Spark Worker (LoadBalancer + Service)
```
kubectl create -f worker.ml/spark/2.0.1/worker-spark-svc.yaml
```
```
kubectl get svc -w
```
* Find the LoadBalancer Host/IP
```
kubectl describe svc worker-spark
```

### Verify Spark Worker through Browser
```
http://<SPARK-WORKER-EXTERNAL-IP>:6061
```

### Scale Spark Worker through Command Line
```
kubectl scale --replicas=4 rc worker-spark-2-0-1
```

### Scale Spark Worker through Kubernetes Admin UI (Weave Scope)
```
https://<KUBERNETES-ADMIN-UI-WEAVESCOPE-IP>
```

### Perform Rolling Update of Spark Worker (ie. Larger Worker Memory)
* Perform the Rolling Update
```
kubectl rolling-update worker-spark-2-0-1 -f worker.ml/spark/2.0.1/worker-spark-rc-8.yaml
```

### Auto-scale Spark Worker using CPU
```
kubectl autoscale rc worker-spark-2-0-1 --max=4 --cpu-percent=1
```

### Verify Auto-scaling of Spark Worker
```
spark-submit --class org.apache.spark.examples.SparkPi --master spark://spark.datasticks.com:7077 --num-executors 500 --executor-memory 2g --total-executor-cores 2 $SPARK_HOME/examples/jars/spark-examples*.jar 5000
```

## Zeppelin Notebook
### Deploy Zeppelin (ReplicationController + Pod)
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

### Deploy Zeppelin (LoadBalancer + Service)
```
kubectl create -f zeppelin.ml/zeppelin-svc.yaml
```
```
kubectl get svc -w
```
* Find the LoadBalancer Host/IP
```
kubectl describe svc zeppelin-master
```

### Verify Zeppelin Notebook through Browser
```
http://<ZEPPELIN-EXTERNAL-HOST-OR-IP>:3123
```
* Run Example Notebooks!

## Jupyter Notebook
### Deploy JupyterHub (ReplicationController + Pod)
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

### Deploy JupyterHub (LoadBalancer + Service)
```
kubectl create -f jupyterhub.ml/jupyterhub-svc.yaml
```
```
kubectl get svc -w
```
* Find the LoadBalancer Host/IP
```
kubectl describe svc juptyerhub-master
```

### Verify JupterHub Notebook through Browser
```
http://<JUPYTERHUB-EXTERNAL-HOST-OR-IP>:8754
```
* Run Example Notebooks!


## Apache
### Deploy Apache (ReplicationController + Pod)
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

### Deploy Apache (LoadBalancer + Service)
```
kubectl create -f zeppelin.ml/apache-svc.yaml
```
```
kubectl create -f apache.ml/apache-svc.yaml
```
```
kubectl get svc -w
```
* Find the LoadBalancer Host/IP
```
kubectl describe svc apache
```

### Verify Apache through Browser
```
http://<APACHE-EXTERNAL-IP>
```


## MySql
### Deploy MySql (ReplicationController + Pod)
```
kubectl create -f sql.ml/mysql/mysql-rc.yaml
```
* Verify MySql
```
kubectl get rc

kubectl get pod
```
* Check Logs of MySql
```
kubectl logs -f <POD-NAME>

kubectl describe <POD-NAME>
```

### Deploy MySql (LoadBalancer + Service)
```
kubectl create -f sql.ml/mysql/mysql-svc.yaml
```
```
kubectl get svc -w
```
* Find the LoadBalancer Host/IP
```
kubectl describe svc mysql-master
```


## Airflow
### Deploy Airflow (ReplicationController + Pod)
```
kubectl create -f scheduler.ml/airflow-rc.yaml
```
* Verify Airflow
```
kubectl get rc

kubectl get pod
```
* Check Logs of Airflow
```
kubectl logs -f <POD-NAME>

kubectl describe <POD-NAME>
```

### Deploy Airflow (LoadBalancer + Service)
```
kubectl create -f scheduler.ml/airflow-svc.yaml
```
```
kubectl get svc -w
```
* Find the LoadBalancer Host/IP
```
kubectl describe svc airflow
```

### Verify Airflow through Browser
```
http://<AIRFLOW-EXTERNAL-IP>:8080
```


## ZooKeeper
### Deploy ZooKeeper (ReplicationController + Pod)
```
kubectl create -f zookeeper.ml/zookeeper-rc.yaml
```
* Verify ZooKeeper
```
kubectl get rc

kubectl get pod
```
* Check Logs of ZooKeeper
```
kubectl logs -f <POD-NAME>

kubectl describe <POD-NAME>
```

### Deploy ZooKeeper (LoadBalancer + Service)
```
kubectl create -f zeppelin.ml/zookeeper-svc.yaml
```
```
kubectl get svc -w
```
* Find the LoadBalancer Host/IP
```
kubectl describe svc zookeeper
```


## Kafka
### Deploy Kafka (ReplicationController + Pod)
```
kubectl create -f stream.ml/kafka-rc.yaml
```
* Verify Kafka
```
kubectl get rc

kubectl get pod
```
* Check Logs of Kafka
```
kubectl logs -f <POD-NAME>

kubectl describe <POD-NAME>
```

### Deploy Kafka (LoadBalancer + Service)
```
kubectl create -f stream.ml/kafka-svc.yaml
```
```
kubectl get svc -w
```
* Find the LoadBalancer Host/IP
```
kubectl describe svc kafka
```

## Dynomite-Redis Cache
### Deploy Dynomite-Redis (ReplicationController + Pod)
```
kubectl create -f dynomite.ml/dynomite-rc.yaml
```
* Verify Dynomite-Redis
```
kubectl get rc

kubectl get pod
```
* Check Logs of Prediction Serving
```
kubectl logs -f <POD-NAME>

kubectl describe <POD-NAME>
```

### Deploy Dynomite-Redis (LoadBalancer + Service)
```
kubectl create -f dynomite.ml/dynomite-svc.yaml
```
```
kubectl get svc -w
```
* Find the LoadBalancer Host/IP
```
kubectl describe svc dynomite
```


## Prediction Serving Layer (JVM-based)
### Deploy Prediction Serving (ReplicationController + Pod)
```
kubectl create -f serve.ml/jvm-rc.yaml
```
* Verify Prediction Serving
```
kubectl get rc

kubectl get pod
```
* Check Logs of Prediction Serving
```
kubectl logs -f <POD-NAME>

kubectl describe <POD-NAME>
```

### Deploy Prediction Serving (LoadBalancer + Service)
```
kubectl create -f serve.ml/jvm-svc.yaml
```
```
kubectl get svc -w
```
* Find the LoadBalancer Host/IP
```
kubectl describe svc serving-jvm
```


## Prediction Serving Layer (TensorFlow-based)
### Deploy Prediction Serving (ReplicationController + Pod)
```
kubectl create -f serve.ml/tensorflow-rc.yaml
```
* Verify Prediction Serving
```
kubectl get rc

kubectl get pod
```
* Check Logs of Prediction Serving
```
kubectl logs -f <POD-NAME>

kubectl describe <POD-NAME>
```

### Deploy Prediction Serving (LoadBalancer + Service)
```
kubectl create -f serve.ml/tensorflow-svc.yaml
```
```
kubectl get svc -w
```
* Find the LoadBalancer Host/IP
```
kubectl describe svc serving-tensorflow
```
