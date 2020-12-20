# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gshona <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/19 18:41:06 by gshona            #+#    #+#              #
#    Updated: 2020/12/19 18:55:57 by gshona           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine
RUN		apk update && apk upgrade
RUN		apk add openssl vsftpd

RUN openssl req -x509 -nodes -days 30 -newkey rsa:2048 -subj \
"/C=RU/ST=Kazan/L=Kazan/O=gshona/CN=localhost" -keyout \
/etc/ssl/private/gshona.key -out /etc/ssl/certs/gshona.crt
RUN		adduser -D gshona &&  echo "gshona:toor" | chpasswd

EXPOSE	20 21

COPY	./start.sh /tmp
COPY	./vsftpd.conf /etc/vsftpd/vsftpd.conf

CMD		["/tmp/start.sh"]
