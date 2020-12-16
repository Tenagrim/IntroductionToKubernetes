FROM alpine

RUN apk update && apk upgrade
RUN apk add wget php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

EXPOSE 5050
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz
RUN mv wordpress /var/www && rm latest.tar.gz
RUN ls /var/www
COPY  ./srcs/wp-config.php /var/www/

COPY ./start.sh /tmp

CMD ["/tmp/start.sh"]
