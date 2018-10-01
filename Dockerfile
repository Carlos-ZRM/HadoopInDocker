FROM centos:6

RUN yum -y install java-1.8.0-openjdk-devel openssh-server openssh-clients wget &&\
	wget http://www-eu.apache.org/dist/hadoop/common/hadoop-2.6.5/hadoop-2.6.5.tar.gz &&\
	tar xzf hadoop-2.6.5.tar.gz

EXPOSE 50070 50075 50090 8088 9000

COPY entrypoint.sh .

ENTRYPOINT ["/entrypoint.sh"]
