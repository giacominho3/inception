FROM alpine:3.17.5

RUN apk update &&  apk add mysql && apk add mysql-client


RUN mkdir /run/mysqld
#COPY conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

#RUN mkdir -p /etc/scripts
#RUN mkdir -p /run/mysqld
#RUN chown mysql:mysql /run/mysqld

COPY ./tools/datasetup.sh /usr/local/bin/
#RUN chmod 775 etc/scripts/datasetup.sh

EXPOSE 3306

ENTRYPOINT [ "/bin/sh", "/usr/local/bin/datasetup.sh" ]
