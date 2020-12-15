FROM alpine

RUN apk update && apk upgrade
RUN apk add mariadb mariadb-client

RUN mkdir /etc/nginx/ssl
RUN echo "root:toor" | chpasswd
RUN adduser -D gshona &&  echo "gshona:toor" | chpasswd

EXPOSE 3306

COPY ./start.sh /tmp
RUN		mkdir /run/nginx
ENTRYPOINT ["/tmp/start.sh"]
