FROM centos:6

RUN yum -y install java-1.8.0-openjdk-deve
COPY entrypoint.sh .
#ENTRYPOINT["\entrypoin.sh"]
