FROM gettyimages/spark:2.2.0-hadoop-2.7

MAINTAINER Gibran Otazo "gibran@entropy.tech"

ADD java-8-debian.list /etc/apt/sources.list.d/.
RUN apt-key adv --keyserver keyserver.ubuntu.com:80 --recv-keys EEA14886
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \
  &&   apt-get update && apt-get install -y oracle-java8-installer oracle-java8-set-default \
  &&   rm -rf /var/cache/oracle-jdk8-installer

RUN apt-get update \
 && apt-get install -y git nano apt-transport-https

# Scala Installation
RUN wget www.scala-lang.org/files/archive/scala-2.11.8.deb
RUN dpkg -i scala-2.11.8.deb

# sbt Installation
RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
RUN apt-get update
RUN apt-get install -y sbt

RUN mkdir MyApp
ADD MyApp /usr/spark-2.2.0/MyApp
RUN cd MyApp && sbt package
