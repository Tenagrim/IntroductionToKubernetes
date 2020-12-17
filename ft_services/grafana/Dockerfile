# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gshona <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/16 19:02:08 by gshona            #+#    #+#              #
#    Updated: 2020/12/17 15:23:59 by gshona           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine

RUN		apk update && apk upgrade
RUN		apk add grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache
RUN		mkdir -p /var/log/grafana && mkdir -p /var/lib/grafana/dashboards

EXPOSE	3000

COPY	./start.sh /tmp
COPY	./grafana.ini /etc/grafana.ini
COPY	./grafana.db /usr/share/grafana/data/grafana.db
COPY	./my_dashboard.json /var/lib/grafana/dashboards/my_dashboard.json
COPY	./test_dashboard.json /var/lib/grafana/dashboards/test_dashboard.json

CMD		["/tmp/start.sh"]
