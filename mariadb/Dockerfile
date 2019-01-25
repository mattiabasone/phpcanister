ARG MARIADB_VERSION
FROM mariadb:${MARIADB_VERSION}

ARG HOST_USER_UID

RUN usermod mysql -u ${HOST_USER_UID}
RUN groupmod mysql -g ${HOST_USER_UID}
RUN mkdir -p /var/run/mysqld
RUN chown mysql:mysql /var/run/mysqld

VOLUME /var/lib/mysql

EXPOSE 3306