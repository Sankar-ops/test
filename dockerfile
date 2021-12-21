FROM ubuntu:latest

RUN yum -y install httpd

COPY index.html /var/www/html/

EXPOSE 80