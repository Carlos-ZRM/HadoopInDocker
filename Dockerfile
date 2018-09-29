FROM centos:6

RUN yum -y install java-1.8.0-openjdk-devel openssh-server openssh-clients wget
EXPOSE 50070 50075 50090 8088 9000

COPY entrypoint.sh .

ENTRYPOINT ["/entrypoint.sh"]
