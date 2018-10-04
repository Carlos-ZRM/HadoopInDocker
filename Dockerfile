FROM centos:6

RUN yum install -y openssh-server openssh-clients wget &&\
	wget http://www-eu.apache.org/dist/hadoop/common/hadoop-2.6.5/hadoop-2.6.5.tar.gz&&\
	wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-x64.tar.gz" -P /opt/ &&\
	tar xzf /opt/jdk-8u181-linux-x64.tar.gz &&\
	tar xzf hadoop-2.6.5.tar.gz
ENV  JAVA_HOME=/opt/jdk1.8.0_181 \
	JRE_HOME=/opt/jdk1.8.0_181/jre \
	PATH=$PATH:/opt/jdk1.8.0_181/bin:/opt/jdk1.8.0_181/jre/bin

EXPOSE 50070 50075 50090 8088 9000 

COPY entrypoint.sh .
#java-1.8.0-openjdk-devel
ENTRYPOINT ["/entrypoint.sh"]
