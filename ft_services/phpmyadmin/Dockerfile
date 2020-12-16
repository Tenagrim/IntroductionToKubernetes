FROM alpine

RUN apk update && apk upgrade
RUN apk add wget php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN mkdir -p /var/www/
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.7/phpMyAdmin-4.9.7-english.tar.gz -O phpmyadmin.tar.gz
RUN tar -xvzf phpmyadmin.tar.gz
RUN mv phpMyAdmin-4.9.7-english/* /var/www/ &&  rm phpmyadmin.tar.gz && rm -rf phpMyAdmin-4.9.7-english
COPY ./srcs/config.inc.php /var/www/

COPY ./start.sh /tmp

CMD ["/tmp/start.sh"]
