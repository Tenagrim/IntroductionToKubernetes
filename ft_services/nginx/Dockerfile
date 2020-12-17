# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gshona <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/14 17:28:24 by gshona            #+#    #+#              #
#    Updated: 2020/12/17 18:42:05 by gshona           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

RUN apk update && apk upgrade
RUN apk add nginx openssl openssh supervisor

RUN mkdir /etc/nginx/ssl
RUN echo "root:toor" | chpasswd
RUN adduser -D gshona &&  echo "gshona:toor" | chpasswd
RUN openssl req -x509 -nodes -days 30 -newkey rsa:2048 -subj \
"/C=RU/ST=Kazan/L=Kazan/O=gshona/CN=localhost" -keyout \
/etc/ssl/private/gshona.key -out /etc/ssl/certs/gshona.crt

COPY ./srcs/config_nginx /etc/nginx/conf.d/default.conf
COPY ./srcs/index.html /var/www/localhost/index.html
COPY ./srcs/particles.js /var/www/localhost/particles.js
COPY ./srcs/supervisor.conf /etc/supervisord.conf

RUN ssh-keygen -A

EXPOSE 80 443 22

COPY ./start.sh /tmp
RUN		mkdir /run/nginx
ENTRYPOINT ["/tmp/start.sh"]

