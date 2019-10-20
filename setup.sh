#!/bin/bash

apt-get update
apt install -y python2.7-minimal openjdk-8-jdk-headless
echo "JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> /etc/environment

sudo -u vagrant -i bash - <<"EOF"
tar xzf /vagrant/apache-cassandra-3.11.4-bin.tar.gz
ln -s apache-cassandra-3.11.4 cassandra
cp /vagrant/cassandra-rackdc.properties cassandra/conf/
mkdir cassandra/logs
EOF

IP=$1
SEEDS=$2

cat /vagrant/cassandra.yaml | sed 's/${IP}/'${IP}'/g' | sed 's/${SEEDS}/'${SEEDS}'/g' > /home/vagrant/cassandra/conf/cassandra.yaml

