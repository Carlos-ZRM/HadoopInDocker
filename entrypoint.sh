#!/bin/sh

HA_USER=${HA_USER:-}
HA_PASS=${HA_PASS:-}

chkconfig sshd on
/etc/init.d/sshd start
/etc/init.d/sshd status

adduser $HA_USER -p $HA_PASS



#passwd hadoop
#mkdir -p /home/hadoop/.ssh
touch /home/hadoop/.ssh/authorized_keys
chmod 700 /home/hadoop/.ssh/
chmod 600 /home/hadoop/.ssh/authorized_keys
chown hadoop /home/hadoop/ -R

