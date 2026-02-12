FROM debian:bookworm

RUN apt update && apt install -y mariadb-server && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
COPY tools/init-db.sh /usr/local/bin/init-db.sh
COPY conf/my.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod +x /usr/local/bin/init-db.sh
EXPOSE 3306
ENTRYPOINT ["init-db.sh"]

