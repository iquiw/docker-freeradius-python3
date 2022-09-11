FROM ubuntu:22.04

ENV FREERADIUS_MYSQL_SERVER=mysql \
    FREERADIUS_MYSQL_PORT=3306 \
    FREERADIUS_MYSQL_USER=root \
    FREERADIUS_MYSQL_PASSWORD= \
    FREERADIUS_MYSQL_DATABASE=radius

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends freeradius-mysql freeradius-python3 freeradius-utils && \
    rm -f /etc/freeradius/3.0/sites-enabled/default && \
    rm -rf /var/lib/apt/lists/*

COPY docker-entrypoint.sh /
COPY mods-available/sql /etc/freeradius/3.0/mods-enabled/sql
COPY sites-available/default /etc/freeradius/3.0/sites-enabled/default

RUN chmod 640 /etc/freeradius/3.0/sites-enabled/default && \
    cd /etc/freeradius/3.0/mods-enabled && \
    chmod 640 sql && \
    ln -s ../mods-available/sqlippool .

CMD ["/usr/sbin/freeradius", "-X"]

ENTRYPOINT ["/docker-entrypoint.sh"]
