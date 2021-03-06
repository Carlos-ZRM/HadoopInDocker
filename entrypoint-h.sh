#!/bin/sh

HA_USER=${HA_USER:-}
HA_PASS=${HA_PASS:-}


echo 1

chkconfig sshd on
/etc/init.d/sshd start
/etc/init.d/sshd status

echo 2
yes $HA_PASS | useradd -M -d /opt/hadoop/ $HA_USER
chown -R $HA_USER:$HA_USER /opt/hadoop/

echo 3
su hadoop - -c "ssh-keygen -t rsa -b 4096 -C \"$HA_USER\" -P \"$HA_PASS\" -f \"/home/hadoop/.ssh/id_rsa\""
cat /home/$HA_USER/.ssh/id_rsa.pub >> /home/$HA_USER/.ssh/authorized_keys

echo 44
ssh-copy-id master.hadoop.lan




while true 
	do
	  sleep 5
  done 	  
