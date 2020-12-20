# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gshona <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/16 14:51:54 by gshona            #+#    #+#              #
#    Updated: 2020/12/20 13:49:01 by gshona           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine

RUN		apk update && apk upgrade
RUN		apk add mariadb mariadb-client

RUN		mkdir -p /run/mysqld

RUN		echo "root:toor" | chpasswd
RUN		adduser -D gshona &&  echo "gshona:toor" | chpasswd

EXPOSE	3306

COPY	./start.sh /tmp
COPY	./gshona_db.sql /tmp
COPY	./my.cnf /etc/mysql/my.cnf

ENTRYPOINT ["/tmp/start.sh"]
