#!/bin/bash

tar xvzf /vagrant/jdk-8u231-linux-x64.tar.gz
ln -s jdk1.8.0_231 jdk
tar xvzf /vagrant/apache-cassandra-3.11.4-bin.tar.gz
ln -s apache-cassandra-3.11.4 cassandra
cp /vagrant/cassandra_$(hostname).yaml cassandra/conf/cassandra.yaml
cp /vagrant/cassandra-rackdc.properties cassandra/conf/

echo 'export JAVA_HOME=$HOME/jdk
export PATH=$JAVA_HOME/bin:$PATH' >> $HOME/.profile

