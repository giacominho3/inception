FROM debian:buster

RUN apt update && apt upgrade -y && \
    apt install mariadb-server -y

RUN apt install vim -y
RUN apt install curl -y

COPY conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /etc/scripts
RUN mkdir -p /run/mysqld
RUN chown mysql:mysql /run/mysqld

COPY ./tools/datasetup.sh /etc/scripts
RUN chmod 775 etc/scripts/datasetup.sh

CMD [ "sh", "etc/scripts/datasetup.sh" ]