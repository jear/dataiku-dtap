export JAVA_HOME=/opt/jdk1.8.0_211
export JRE_HOME=/opt/jdk1.8.0_211/jre
export PATH=$PATH:/opt/jdk1.8.0_211/bin:/opt/jdk1.8.0_211/jre/bin
export HADOOP_HOME=/opt/hadoop
export PATH=$PATH:$HADOOP_HOME:$HADOOP_HOME/sbin:$HADOOP_HOME/bin
export HADOOP_CLASSPATH=$HADOOP_CLASSPATH:$HADOOP_HOME/lib/:/opt/bluedata/bluedata-dtap.jar


hdfs dfs -ls dtap://TenantStorage/
hdfs dfs -ls dtap://Nantes/
hdfs dfs -ls dtap://Lyon/


hdfs dfs -ls hdfs://hadoop@hadoop2x.jear.co:9000/
hdfs dfs -ls hdfs://hadoop@hadoop3x.jear.co:9000/

