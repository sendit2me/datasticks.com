echo '...NetflixOSS Core Components...'
kubectl delete rc netflix

'...MySql...'
kubectl delete rc mysql

echo '...ZooKeeper...'
kubectl delete rc zookeeper

echo '...Redis...'
kubectl delete rc redis 

echo '...Spark Master...'
kubectl delete rc spark-master-2-0-1

echo '...Spark Worker...'
kubectl delete rc spark-worker-2-0-1

echo '...Zeppelin...'
kubectl delete rc zeppelin

echo '...JupyterHub...'
kubectl delete rc jupyterhub

echo '...Airflow Scheduler...'
kubectl delete rc airflow

echo '...Kafka...'
kubectl delete rc kafka

echo '...Dashboard...'
kubectl delete rc weavescope-app
kubectl delete ds weavescope-probe

echo '...NetflixOSS-based Prediction Services...'
kubectl delete rc prediction

echo '...TensorFlow Serving-based Prediction Services...'
kubectl delete rc tensorflow

echo '...Apache...'
kubectl delete rc apache
