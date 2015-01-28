FROM ubuntu:utopic
MAINTAINER Patrick van Amstel

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu utopic main universe" > /etc/apt/sources.list
RUN apt-get update && apt-get -y install software-properties-common python-software-properties
 
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections 
RUN   add-apt-repository -y ppa:webupd8team/java 
RUN   apt-get update 
RUN   apt-get install -y oracle-java7-installer 
RUN   rm -rf /var/lib/apt/lists/* 
RUN   rm -rf /var/cache/oracle-jdk7-installer

# Define working directory.
WORKDIR /data

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-7-oracle

# Define default command.
CMD ["bash"]



