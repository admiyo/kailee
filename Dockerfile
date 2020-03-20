FROM fedora:latest
MAINTAINER Adam Young <adam@younglogic.com>

RUN yum install -y R libxml2-devel &&\
    yum update -y &&\
    yum -y clean all

RUN mkdir -p ~/R/x86_64-redhat-linux-gnu-library/3.6
COPY ./ ./
RUN ./install.R
CMD R -e "shiny::runApp('./app.R', port="2112")"
EXPOSE 2112
