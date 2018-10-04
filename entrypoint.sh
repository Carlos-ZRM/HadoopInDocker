#!/bin/sh

HA_USER=${HA_USER:-}
HA_PASS=${HA_PASS:-}

export HADOOP_HOME= "/home/"$HA_USER"/hadoop"
export HADOOP_INSTALL=$HADOOP_HOME
export HADOOP_MAPRED_HOME=$HADOOP_HOME
export HADOOP_COMMON_HOME=$HADOOP_HOME
export HADOOP_HDFS_HOME=$HADOOP_HOME
export YARN_HOME=$HADOOP_HOME
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
export PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin
export JAVA_HOME="/usr/lib/jvm/jre-1.8.0-openjdk.x86_64/"


chkconfig sshd on
/etc/init.d/sshd start
/etc/init.d/sshd status

echo "uno"
useradd $HA_USER -p $HA_PASS
#su - $HA_USER
su hadoop - -c "ssh-keygen -t rsa -b 4096 -C \"$HA_USER\" -P \"$HA_PASS\" -f \"/home/hadoop/.ssh/id_rsa\""
cat /home/$HA_USER/.ssh/id_rsa.pub >> /home/$HA_USER/.ssh/authorized_keys
#chmod 777 /home/hadoop/.ssh/authorized_keys
#mv /hadoop-2.6.5 /home/hadoop/hadoop/
chmod 777 /hadoop-2.6.5


while true 
	do
	  sleep 5
  done 	  
#ssh-keygen -t rsa -b 4096 -C "your_email@example.com" -f "/home/hadoop/.ssh/id_rsa" -P "hadoop"
#passwd hadoop
#mkdir -p /home/hadoop/.ssh
#touch /home/hadoop/.ssh/authorized_keys
#chmod 700 /home/hadoop/.ssh/
#chmod 600 /home/hadoop/.ssh/authorized_keys
#chown hadoop /home/hadoop/ -R
