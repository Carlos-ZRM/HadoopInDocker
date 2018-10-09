#!/bin/sh

HA_USER=${HA_USER:-}
HA_PASS=${HA_PASS:-}


chkconfig sshd on
/etc/init.d/sshd start
/etc/init.d/sshd status

useradd $HA_USER -p $HA_PASS
su hadoop - -c "ssh-keygen -t rsa -b 4096 -C \"$HA_USER\" -P \"$HA_PASS\" -f \"/home/hadoop/.ssh/id_rsa\""
cat /home/$HA_USER/.ssh/id_rsa.pub >> /home/$HA_USER/.ssh/authorized_keys
chmod 777 /hadoop-2.6.5


while true 
	do
	  sleep 5
  done 	  
