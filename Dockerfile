FROM ubuntu:14.04
MAINTAINER suthez1 "suthez1@student.op.ac.nz"
RUN apt-get update
RUN apt-get install -y apache2; apt-get install -y openssh-server; apt-get install -y supervisor
RUN cp /etc/supervisor/supervisord.conf /etc/supervisor/conf.d/
EXPOSE 22
EXPOSE 80
RUN /usr/bin/supervisord
RUN echo -e '[supervisord]\nnodaemon=true\n\n [program:sshd]\ncommand=/usr/sbin/sshd -D\n\n [program:apache2]\ncommand=/bin/bash -c "source /etc/apache2/envvars && exec /usr/sbin/apache2 - DFOREGROUND"' >> /etc/supervisor/conf.d/supervisord.conf

