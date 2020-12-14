# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gshona <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/14 17:28:24 by gshona            #+#    #+#              #
#    Updated: 2020/12/14 20:24:09 by gshona           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine
RUN apk update && apk upgrade
RUN apk add nginx openssl openssh supervisor

# Ssl
RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 30 -newkey rsa:2048 -subj \
"/C=RU/ST=Kazan/L=Kazan/O=gshona/CN=localhost" -keyout \
/etc/ssl/private/gshona.key -out /etc/ssl/certs/gshona.crt

# Nginx
COPY ./srcs/config_nginx /etc/nginx/conf.d/default.conf

EXPOSE 80 443

# Run
COPY ./start.sh /tmp
RUN		mkdir /run/nginx
#CMD ["sh /start.sh"]
ENTRYPOINT ["/tmp/start.sh"]

