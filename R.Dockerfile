FROM fedora:latest
MAINTAINER Adam Young <adam@younglogic.com>

RUN yum install -y R &&\
    yum update -y &&\
    yum -y clean all

RUN mkdir -p ~/R/x86_64-redhat-linux-gnu-library/3.6
COPY ./install.R ./
RUN ./install.R

