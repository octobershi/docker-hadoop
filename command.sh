docker run -tid --name hadoop-master --net hadoop --hostname master \
-p 8042:8042 \
-p 8088:8088 \
-p 19888:19888 \
-p 49707:49707 \
-p 50070:50070 \
-p 50075:50075 \
ipharmacare/hadoop-master:1.0

docker run -tid --name hadoop-slave --net hadoop --hostname slave1 \
-p 8043:8042 \
-p 8089:8088 \
-p 19889:19888 \
-p 49708:49707 \
-p 50071:50070 \
-p 50076:50075 \
ipharmacare/hadoop-slave:1.0