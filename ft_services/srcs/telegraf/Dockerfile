FROM	alpine

RUN		apk update && apk upgrade
#RUN		apk add grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache
RUN		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

COPY	./start.sh /tmp
COPY	./telegraf.conf /etc/telegraf/telegraf.conf

CMD		["/tmp/start.sh"]
