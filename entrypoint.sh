#!/bin/sh

HA_USER=${HA_USER:-}
HA_PASS=${HA_PASS:-}

chkconfig sshd on
/etc/init.d/sshd start
/etc/init.d/sshd status

echo "uno"
useradd $HA_USER -p $HA_PASS
#su - $HA_USER
pwd
su hadoop - -c "ssh-keygen -t rsa -b 4096 -C \"$HA_USER\" -P \"$HA_PASS\" -f \"/home/hadoop/.ssh/id_rsa\""

#ssh-keygen -t rsa -b 4096 -C $HA_USER  -P $HA_PASS
echo dos
cat /home/hadoop/.ssh/id_rsa.pub >> /home/hadoop/.ssh/authorized_keys
echo tres

mv /hadoop-2.6.5 /home/hadoop/hadoop/

#ssh-keygen -t rsa -b 4096 -C "your_email@example.com" -f "/home/hadoop/.ssh/id_rsa" -P "hadoop"
#passwd hadoop
#mkdir -p /home/hadoop/.ssh
#touch /home/hadoop/.ssh/authorized_keys
#chmod 700 /home/hadoop/.ssh/
#chmod 600 /home/hadoop/.ssh/authorized_keys
#chown hadoop /home/hadoop/ -R
