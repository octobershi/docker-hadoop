FROM ipharmacare/spark-base:1.0

COPY hdfs-site.xml ${HADOOP_HOME}/etc/hadoop/
COPY yarn-site.xml ${HADOOP_HOME}/etc/hadoop/
COPY bootstrap.sh /
RUN chmod a+x /bootstrap.sh

RUN $HADOOP_PREFIX/bin/hdfs namenode -format
ENTRYPOINT ["/bootstrap.sh"]
