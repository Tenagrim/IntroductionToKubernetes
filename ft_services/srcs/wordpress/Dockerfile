# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gshona <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/16 18:45:15 by gshona            #+#    #+#              #
#    Updated: 2020/12/21 13:45:50 by gshona           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine

RUN		apk update && apk upgrade
RUN		apk add wget supervisor nginx php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session openssl

EXPOSE	5050
RUN openssl req -x509 -nodes -days 30 -newkey rsa:2048 -subj \
"/C=RU/ST=Kazan/L=Kazan/O=gshona/CN=localhost" -keyout \
/etc/ssl/private/gshona.key -out /etc/ssl/certs/gshona.crt

RUN		wget https://wordpress.org/latest.tar.gz
RUN		tar -xvzf latest.tar.gz
RUN		mkdir -p /run/nginx
RUN		mv wordpress /var/www/localhost && rm latest.tar.gz
RUN		ls /var/www
COPY	./srcs/wp-config.php /var/www/localhost/wordpress

#COPY	./start.sh /tmp
RUN		mkdir -p /etc/supervisor.d
COPY	./srcs/supervisor.conf /etc/supervisor.d/supervisor.ini
COPY	./srcs/config_nginx /etc/nginx/conf.d/default.conf

#CMD		["/tmp/start.sh"]
ENTRYPOINT /usr/bin/supervisord
