FROM jenkins/jenkins:lts-centos
USER root

RUN yum update -y \
    && yum install -y \
    sudo \
    curl\
    libtool-ltdl \
    epel-release \
    git \
    && yum clean all

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

RUN echo lts-centos > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state