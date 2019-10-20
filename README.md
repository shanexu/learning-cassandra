# Learning Cassandra

## init

``` shell
wget -c http://mirror.metrocast.net/apache/cassandra/3.11.4/apache-cassandra-3.11.4-bin.tar.gz
vagrant up
```

## start

for each node(node1, node2, node3) ```vagrant ssh node?```
``` shell
cd cassandra
./bin/cassandra -p cassandra.pid
./bin/cqlsh 172.16.0.101 -u cassandra -p cassandra
```


