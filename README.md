    # dataiku-dtap


    wget http://mirrors.ircam.fr/pub/apache/hadoop/common/hadoop-3.2.1/hadoop-3.2.1.tar.gz

    cd /opt/
    sudo tar zxf /home/bluedata/hadoop-3.2.1.tar.gz
    sudo ln -s /opt/hadoop-3.2.1/ /opt/hadoop

    [bluedata@bluedata-16 ~]$ tail -6 /home/bluedata/.bashrc
    # User specific aliases and functions
    export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.222.b10-0.el7_6.x86_64/jre
    export HADOOP_HOME=/opt/hadoop
    export PATH=$PATH:$HADOOP_HOME:$HADOOP_HOME/sbin:$HADOOP_HOME/bin
    export HADOOP_CLASSPATH=$HADOOP_CLASSPATH:$HADOOP_HOME/lib/:/opt/bluedata/bluedata-dtap.jar

    sudo mv /opt/hadoop/etc/hadoop/core-site.xml /opt/hadoop/etc/hadoop/core-site.xml.bak
    sudo mv /opt/hadoop/etc/hadoop/hadoop-env.sh /opt/hadoop/etc/hadoop/hadoop-env.sh.bak
    sudo mv /opt/hadoop/etc/hadoop/hdfs-site.xml /opt/hadoop/etc/hadoop/hdfs-site.xml.bak
    sudo mv /opt/hadoop/etc/hadoop/log4j.properties /opt/hadoop/etc/hadoop/log4j.properties.bak

    git clone https://github.com/jear/dataiku-dtap
    sudo cp dataiku-dtap/hadoop-conf/core-site.xml /opt/hadoop/etc/hadoop/core-site.xml 
    sudo cp dataiku-dtap/hadoop-conf/hadoop-env.sh /opt/hadoop/etc/hadoop/hadoop-env.sh 
    sudo cp dataiku-dtap/hadoop-conf/hdfs-site.xml /opt/hadoop/etc/hadoop/hdfs-site.xml 
    sudo cp dataiku-dtap/hadoop-conf/log4j.properties /opt/hadoop/etc/hadoop/log4j.properties 

    # Test dtap
    hdfs dfs -ls hdfs://hadoop@hadoop2x.jear.co:9000/user/
    hdfs dfs -ls hdfs://hadoop@hadoop3x.jear.co:9000/user/
    hdfs dfs -ls dtap://TenantStorage/
    hdfs dfs -ls dtap://Nantes/user/
    hdfs dfs -ls dtap://Lyon/user/


    mv ~/data/bin/env-default.sh cp ~/data/bin/env-default.sh.bak
    echo “export PATH=$PATH:/opt/hadoop/bin” >> ~/data/bin/env-default.sh

    mv dataiku-dss-5.1.5/lib/ivy/common-run/guava-18.0.jar ~/common-run-guava-18.0.jar
    mv dataiku-dss-5.1.5/lib/ivy/backend-run/guava-18.0.jar ~/backend-run-guava-18.0.jar
    
    # Now test from Dataiku UI

    cd ~/data
    ./bin/dss stop
    ./bin/dssadmin install-hadoop-integration
    ./bin/dss start
    ./bin/dss status


