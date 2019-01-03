FROM ipharmacare/hadoop-base:1.0

COPY bootstrap.sh /
RUN chmod a+x /bootstrap.sh

RUN $HADOOP_PREFIX/bin/hdfs namenode -format
ENTRYPOINT ["/bootstrap.sh"]
