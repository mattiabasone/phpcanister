ARG HOST_USER_UID
ARG MYSQL_VERSION

FROM mysql:${MYSQL_VERSION}

RUN usermod -u ${HOST_USER_UID} mysql
RUN mkdir -p /var/run/mysqld
RUN chown mysql:mysql /var/run/mysqld

VOLUME /var/lib/mysql