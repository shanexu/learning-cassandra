#!/bin/bash

apt-get update && apt install -y python

sudo -u vagrant -i bash - <<"EOF"
tar xzf /vagrant/jdk-8u231-linux-x64.tar.gz
ln -s jdk1.8.0_231 jdk
tar xzf /vagrant/apache-cassandra-3.11.4-bin.tar.gz
ln -s apache-cassandra-3.11.4 cassandra
cp /vagrant/cassandra-rackdc.properties cassandra/conf/
echo 'export JAVA_HOME=$HOME/jdk' >> .profile
echo 'PATH=$JAVA_HOME/bin:$PATH' >> .profile
EOF

IP=$1
SEEDS=$2

cat /vagrant/cassandra.yaml | sed 's/${IP}/'${IP}'/g' | sed 's/${SEEDS}/'${SEEDS}'/g' > /home/vagrant/cassandra/conf/cassandra.yaml

