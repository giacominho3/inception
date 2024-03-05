FROM debian:buster

RUN apt update && apt upgrade -y && \
    apt install mariadb-server -y

RUN apt install vim -y
RUN apt install curl -y

COPY conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /etc/scripts

COPY ./tools/datasetup.sh /etc/scripts
# CMD ["./datasetup.sh"]