FROM centos:7
MAINTAINER yshi
COPY jdk-8u191-linux-x64.rpm /
RUN yum clean all && \
	yum update -y && \
    yum upgrade -y && \
    yum install -y wget nmap tree which lsof net-tools openssl openssh-clients openssh-server && \
    yum localinstall -y jdk-8u191-linux-x64.rpm && \
    yum -y clean all

RUN rm /jdk-8u191-linux-x64.rpm
ENV JAVA_HOME=/usr/java/default

COPY hadoop-2.9.2.tar.gz .
COPY spark-2.4.0-bin-hadoop2.7.tgz .

RUN tar -xzf hadoop-2.9.2.tar.gz && \
	rm hadoop-2.9.2.tar.gz && \
	mv hadoop-2.9.2 hadoop

RUN tar -xzf spark-2.4.0-bin-hadoop2.7.tgz && \
	rm spark-2.4.0-bin-hadoop2.7.tgz && \
	mv spark-2.4.0-bin-hadoop2.7 spark

RUN mkdir -p /pid \
			 /data/dfs/name \
			 /data/dfs/data \
			 /data/tmp \
			 /data/yarn/local_dir \
			 /data/yarn/log_dir

ENV HADOOP_HOME=/hadoop
ENV HADOOP_PREFIX=${HADOOP_HOME} \
	HADOOP_COMMON_HOME=${HADOOP_HOME} \
	HADOOP_HDFS_HOME=${HADOOP_HOME} \
	HADOOP_MAPRED_HOME=${HADOOP_HOME} \
	HADOOP_LIBEXEC_DIR=${HADOOP_HOME}/libexec \
	HADOOP_YARN_HOME=${HADOOP_HOME} \
	HADOOP_CONF_DIR=${HADOOP_HOME}/etc/hadoop \
	YARN_CONF_DIR=${HADOOP_HOME}/etc/hadoop \
	SPARK_HOME=/spark \
	HADOOP_PID_DIR=/pid \
	ARN_PID_DIR=/pid

ENV PATH /spark/bin:/spark/sbin:/hadoop/bin:/hadoop/sbin:$PATH

COPY hdfs-site.xml ${HADOOP_HOME}/etc/hadoop/
COPY core-site.xml ${HADOOP_HOME}/etc/hadoop/
COPY mapred-site.xml ${HADOOP_HOME}/etc/hadoop/
COPY yarn-site.xml ${HADOOP_HOME}/etc/hadoop/
COPY slaves ${HADOOP_HOME}/etc/hadoop/
COPY slaves ${SPARK_HOME}/conf/
COPY spark-env.sh ${SPARK_HOME}/conf/
RUN sed -i '/^export JAVA_HOME/ s:.*:export JAVA_HOME=/usr/java/default:' $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh

# Hdfs ports
EXPOSE 50010 50020 50070 50075 50090 8020 9000
# Mapred ports
EXPOSE 10020 19888
# Spark ports
EXPOSE 7077
#Yarn ports
EXPOSE 8030 8031 8032 8033 8040 8042 8088
#Other ports
EXPOSE 49707 2122 22

RUN ssh-keygen -q -N '' -t rsa -f /etc/ssh/ssh_host_rsa_key && \
	ssh-keygen -q -N '' -t rsa -f /root/.ssh/id_rsa && \
	#echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config && \
	#sed -i "s/PasswordAuthentication yes/PasswordAuthentication no/g" /etc/ssh/sshd_config && \
	cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
COPY ssh_config /root/.ssh/config
RUN chmod 600 /root/.ssh/config
