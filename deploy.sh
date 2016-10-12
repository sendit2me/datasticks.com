echo '...Kubernetes Admin UI (Weave Scope)...'
kubectl create -f dashboard.ml/weavescope/weavescope.yaml

echo '...Spark Master...'
kubectl create -f master.ml/spark/2.0.1/master-spark-rc.yaml
kubectl create -f master.ml/spark/2.0.1/master-spark-svc.yaml

echo '...Spark Worker...'
kubectl create -f worker.ml/spark/2.0.1/worker-spark-rc.yaml
kubectl create -f worker.ml/spark/2.0.1/worker-spark-svc.yaml

echo '...Zeppelin...'
kubectl create -f zeppelin.ml/zeppelin-rc.yaml
kubectl create -f zeppelin.ml/zeppelin-svc.yaml

echo '...JupyterHub...'
kubectl create -f jupyterhub.ml/jupyterhub-rc.yaml
kubectl create -f jupyterhub.ml/jupyterhub-svc.yaml

echo '...Apache...'
kubectl create -f apache.ml/apache-rc.yaml
kubectl create -f apache.ml/apache-svc.yaml

echo '...MySql...'
kubectl create -f sql.ml/mysql-rc.yaml
kubectl create -f sql.ml/mysql-svc.yaml

echo '...Airflow Scheduler...'
kubectl create -f scheduler.ml/airflow-rc.yaml
kubectl create -f scheduler.ml/airflow-svc.yaml

echo '...ZooKeeper...'
kubectl create -f zookeeper.ml/zookeeper-rc.yaml
kubectl create -f zookeeper.ml/zookeeper-svc.yaml

echo '...Kafka...'
kubectl create -f stream.ml/kafka-rc.yaml
kubectl create -f stream.ml/kafka-svc.yaml

echo '...Dynomite + Redis...'
kubectl create -f dynomite.ml/dynomite-rc.yaml
kubectl create -f dynomite.ml/dynomite-svc.yaml

echo '...Prediction Serving Layer (JVM-based)...'
kubectl create -f serve.ml/jvm-rc.yaml
kubectl create -f serve.ml/jvm-svc.yaml

echo '...Prediction Serving Layer (TensorFlow-based)...'
kubectl create -f serve.ml/tensorflow-rc.yaml
kubectl create -f serve.ml/tensorflow-svc.yaml
