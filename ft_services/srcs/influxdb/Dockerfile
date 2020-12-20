# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gshona <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/16 18:45:17 by gshona            #+#    #+#              #
#    Updated: 2020/12/20 17:30:53 by gshona           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine

RUN		apk update && apk upgrade
RUN		apk add influxdb 

EXPOSE	8086

COPY	./start.sh /tmp

CMD		["/tmp/start.sh"]
