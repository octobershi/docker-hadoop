#!/bin/bash

# altering the core-site configuration
# sed s/HOSTNAME/$HOSTNAME/ /usr/local/hadoop/etc/hadoop/core-site.xml.template > /usr/local/hadoop/etc/hadoop/core-site.xml

/usr/sbin/sshd -D &
$HADOOP_HOME/bin/hdfs datanode &
$HADOOP_HOME/bin/yarn nodemanager &
$HADOOP_HOME/sbin/mr-jobhistory-daemon.sh start historyserver &
bash