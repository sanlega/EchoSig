FROM mysql:latest

COPY ./data.sql /docker-entrypoint-initdb.d/
ENV MYSQL_ROOT_PASSWORD=pass
ENV MYSQL_DATABASE=echoSigDataBase

CMD ["mysqld"]
