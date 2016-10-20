echo '...NetflixOSS Core Components...'
kubectl delete rc netflix

echo '...MySql...'
kubectl delete rc mysql-master

echo '...ZooKeeper...'
kubectl delete rc zookeeper

echo '...Redis...'
kubectl delete rc redis-master

echo '...Spark Master...'
kubectl delete rc spark-master-2-0-1

echo '...Spark Worker...'
kubectl delete rc spark-worker-2-0-1

echo '...Hive Metastore...'
kubectl delete rc metastore

echo '...Zeppelin...'
kubectl delete rc zeppelin-master

echo '...JupyterHub...'
kubectl delete rc jupyterhub-master

echo '...Airflow Scheduler...'
kubectl delete rc airflow

echo '...Presto Master...'
kubectl delete rc presto-master

echo '...Presto Worker...'
kubectl delete rc presto-worker

echo '...Presto AirPal...'
kubectl delete rc airpal

echo '...Kafka...'
kubectl delete rc kafka-0-10

echo '...Dashboard...'
kubectl delete rc weavescope-app
kubectl delete ds weavescope-probe

echo '...NetflixOSS-based Prediction Services...'
kubectl delete rc prediction

echo '...TensorFlow Serving-based Prediction Services...'
kubectl delete rc tensorflow

echo '...Cassandra...'
kubectl delete rc cassandra

echo '...Apache...'
kubectl delete rc apache
