#!/bin/bash

# altering the core-site configuration
# sed s/HOSTNAME/$HOSTNAME/ /usr/local/hadoop/etc/hadoop/core-site.xml.template > /usr/local/hadoop/etc/hadoop/core-site.xml

/usr/sbin/sshd -D &
bash
#$HADOOP_HOME/bin/hdfs namenode &
#$HADOOP_HOME/bin/yarn resourcemanager &
#$HADOOP_HOME/sbin/mr-jobhistory-daemon.sh start historyserver &
#$SPARK_HOME/sbin/start-all.sh &
